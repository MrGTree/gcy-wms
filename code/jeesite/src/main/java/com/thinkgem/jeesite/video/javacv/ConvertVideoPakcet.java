package com.thinkgem.jeesite.video.javacv;


import com.fasterxml.jackson.databind.ObjectMapper;
import com.sensetime.ad.core.StCrowdDensityDetector;
import com.sensetime.ad.core.StFaceException;
import com.sensetime.ad.sdk.StCrowdDensityResult;
import com.sensetime.ad.sdk.StImageFormat;
import com.sensetime.ad.sdk.StPointF;
import com.thinkgem.jeesite.common.config.Global;
import com.thinkgem.jeesite.common.mapper.JsonMapper;
import com.thinkgem.jeesite.common.utils.SpringContextHolder;
import com.thinkgem.jeesite.common.utils.VideoAnalizyUtils;
import com.thinkgem.jeesite.video.javacv.Entity.CloseMan;
import com.thinkgem.jeesite.video.javacv.Entity.CloseRelation;
import com.thinkgem.jeesite.video.javacv.Entity.Man;
import com.thinkgem.jeesite.video.javacv.Entity.RuleBreak;
import com.thinkgem.jeesite.video.javacv.Entity.UrlMapper;
import com.thinkgem.jeesite.video.javacv.exception.FileNotOpenException;
import com.thinkgem.jeesite.video.javacv.exception.StreamInfoNotFoundException;
import com.thinkgem.jeesite.websocket.WsHandler;
import org.bytedeco.ffmpeg.avcodec.AVCodec;
import org.bytedeco.ffmpeg.avcodec.AVCodecContext;
import org.bytedeco.ffmpeg.avcodec.AVCodecParameters;
import org.bytedeco.ffmpeg.avcodec.AVPacket;
import org.bytedeco.ffmpeg.avformat.AVFormatContext;
import org.bytedeco.ffmpeg.avformat.AVStream;
import org.bytedeco.ffmpeg.avutil.AVDictionary;
import org.bytedeco.ffmpeg.avutil.AVFrame;
import org.bytedeco.ffmpeg.swscale.SwsContext;
import org.bytedeco.javacpp.BytePointer;
import org.bytedeco.javacpp.DoublePointer;
import org.bytedeco.javacv.FFmpegFrameGrabber;
import org.bytedeco.javacv.FFmpegFrameRecorder;
import org.bytedeco.javacv.FrameGrabber.Exception;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.web.socket.TextMessage;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.HashSet;
import java.util.Map;
import java.util.Set;

import static org.bytedeco.ffmpeg.global.avcodec.av_free_packet;
import static org.bytedeco.ffmpeg.global.avcodec.av_packet_unref;
import static org.bytedeco.ffmpeg.global.avcodec.avcodec_alloc_context3;
import static org.bytedeco.ffmpeg.global.avcodec.avcodec_close;
import static org.bytedeco.ffmpeg.global.avcodec.avcodec_find_decoder;
import static org.bytedeco.ffmpeg.global.avcodec.avcodec_open2;
import static org.bytedeco.ffmpeg.global.avcodec.avcodec_parameters_to_context;
import static org.bytedeco.ffmpeg.global.avcodec.avcodec_receive_frame;
import static org.bytedeco.ffmpeg.global.avcodec.avcodec_send_packet;
import static org.bytedeco.ffmpeg.global.avformat.avformat_close_input;
import static org.bytedeco.ffmpeg.global.avformat.avformat_find_stream_info;
import static org.bytedeco.ffmpeg.global.avformat.avformat_open_input;
import static org.bytedeco.ffmpeg.global.avutil.AVMEDIA_TYPE_VIDEO;
import static org.bytedeco.ffmpeg.global.avutil.AV_PIX_FMT_BGR24;
import static org.bytedeco.ffmpeg.global.avutil.av_frame_alloc;
import static org.bytedeco.ffmpeg.global.avutil.av_free;
import static org.bytedeco.ffmpeg.global.avutil.av_image_fill_arrays;
import static org.bytedeco.ffmpeg.global.avutil.av_image_get_buffer_size;
import static org.bytedeco.ffmpeg.global.avutil.av_malloc;
import static org.bytedeco.ffmpeg.global.swscale.SWS_FAST_BILINEAR;
import static org.bytedeco.ffmpeg.global.swscale.sws_freeContext;
import static org.bytedeco.ffmpeg.global.swscale.sws_getContext;
import static org.bytedeco.ffmpeg.global.swscale.sws_scale;

/**
 *  * rtsp转rtmp（转封装方式）
 *  * @author eguid
 *  
 */
public class ConvertVideoPakcet {

    private Logger logger = LoggerFactory.getLogger(getClass());

    FFmpegFrameGrabber grabber = null;
    FFmpegFrameRecorder record = null;
    int width = -1, height = -1;
    int i = 1;

    // 视频参数
    protected int audiocodecid;
    protected int codecid;
    protected double framerate;// 帧率
    protected int bitrate;// 比特率

    private UrlMapper urlMapper;

    private Long pushVideoLong;

    private Float useScore;

    private Float tooCloseValue;

    public ConvertVideoPakcet() {
    }

    public ConvertVideoPakcet(UrlMapper urlMapper) {
        this.urlMapper = urlMapper;
    }

    // 音频参数
    // 想要录制音频，这三个参数必须有：audioChannels > 0 && audioBitrate > 0 && sampleRate > 0
    private int audioChannels;
    private int audioBitrate;
    private int sampleRate;

    private String modelPath;


    private StCrowdDensityDetector detector;

    {
        modelPath = Global.getModelPath();
        tooCloseValue = Global.getTooCloseValue();
        pushVideoLong = Global.getPushVideoLong();
        useScore = Global.getUseScore();
        try {
            detector = new StCrowdDensityDetector(modelPath);
        } catch (StFaceException e) {
            logger.error(" new StCrowdDensityDetector error " + e);
        }
    }

    private AVFormatContext pFormatCtx;//视频格式上下文
    private int videoStreamIndex;//视频流所在的通道
    private AVCodecContext pCodecCtx;//编解码上下文
    private SwsContext sws_ctx;//图像缩放和像素格式转换上下文
    private AVFrame outFrameRGB;//用于存储转换后的RGB像素数据，默认转换成RGB
    private AVPacket packet;//临时的未解码的视频帧数据
    private AVFrame pFrame;//临时的视频帧解码后的图像像素数据，默认yuv420

    /**
     *   * 选择视频源
     *   * @param src
     *   * @author eguid
     *   * @throws Exception
     *  
     */


    public ConvertVideoPakcet from(String src) throws Exception {
        logger.debug("monitor from url:{}" + src);
        // 采集/抓取器
        grabber = new FFmpegFrameGrabber(src);
//        if (src.indexOf("rtsp") >= 0) {
        grabber.setOption("rtsp_transport", "tcp");
//        }
        grabber.start();// 开始之后ffmpeg会采集视频信息，之后就可以获取音视频信息
        if (width < 0 || height < 0) {
            width = grabber.getImageWidth();
            height = grabber.getImageHeight();
        }
        // 视频参数
        audiocodecid = grabber.getAudioCodec();
        logger.debug("{} audiocodecid is {}", src, audiocodecid);
        codecid = grabber.getVideoCodec();
        framerate = grabber.getVideoFrameRate();// 帧率
        bitrate = grabber.getVideoBitrate();// 比特率
        // 音频参数
        // 想要录制音频，这三个参数必须有：audioChannels > 0 && audioBitrate > 0 && sampleRate > 0
        audioChannels = grabber.getAudioChannels();
        audioBitrate = grabber.getAudioBitrate();
        if (audioBitrate < 1) {
            audioBitrate = 128 * 1000;// 默认音频比特率
        }
        initGrabber(src,AV_PIX_FMT_BGR24);
        return this;
    }

    /**
     * free all struct
     */
    private void freeAndClose() {
        av_packet_unref(packet);// Free the packet that was allocated by av_read_frame

        av_free(pFrame);// Free the YUV frame
        av_free(outFrameRGB);// Free the RGB image

        sws_freeContext(sws_ctx);//Free SwsContext
        avcodec_close(pCodecCtx);// Close the codec
        avformat_close_input(pFormatCtx);// Close the video file
    }

    /**
     * 开始转码之前的一些初始化操作
     * @param url
     * @param fmt
     * @return
     */
    private boolean initGrabber(String url,int fmt) {

        // Open video file
        pFormatCtx=openInput(url);

        // Find video info
        findStreamInfo(pFormatCtx,null);

        // Find a video stream
        videoStreamIndex=findVideoStreamIndex(pFormatCtx);

        // Find the decoder for the video stream
        pCodecCtx= findAndOpenCodec(pFormatCtx,videoStreamIndex);

        //set image size
        width = pCodecCtx.width();
        height = pCodecCtx.height();


        //scaling/conversion operations by using sws_scale().
        DoublePointer param=null;
        sws_ctx = sws_getContext(width, height, pCodecCtx.pix_fmt(), width, height,fmt, SWS_FAST_BILINEAR, null, null, param);

        packet = new AVPacket();

        // Allocate video frame
        pFrame = av_frame_alloc();

        // Allocate an AVFrame structure
        outFrameRGB = av_frame_alloc();
        outFrameRGB.width(width);
        outFrameRGB.height(height);
        outFrameRGB.format(fmt);

        return true;
    }

    /**
     * 打开视频流
     * @param url -url
     * @return
     * @throws
     */
    protected AVFormatContext openInput(String url) throws FileNotOpenException {
        AVFormatContext pFormatCtx = new AVFormatContext(null);
        if(avformat_open_input(pFormatCtx, url, null, null)==0) {
            return pFormatCtx;
        }
        throw new FileNotOpenException("Didn't open video file");
    }

    /**
     * 查找视频通道
     * @return
     */
    protected int findVideoStreamIndex(AVFormatContext formatCtx) {
        int size=formatCtx.nb_streams();
        for (int i = 0; i < size; i++) {
            AVStream stream=formatCtx.streams(i);
            AVCodecParameters codec=stream.codecpar();
            int type=codec.codec_type();
            if (type == AVMEDIA_TYPE_VIDEO) {
                return i;
            }
        }
        return -1;
    }

    /**
     * 检索流信息（rtsp/rtmp检索时间过长问题解决）
     * @return
     */
    protected AVFormatContext findStreamInfo(AVFormatContext formatCtx,AVDictionary options) throws StreamInfoNotFoundException {
        if (avformat_find_stream_info(formatCtx, options==null?(AVDictionary)null:options)>= 0) {
            return formatCtx;
        }
        throw new StreamInfoNotFoundException("Didn't retrieve stream information");
    }

    /**
     * 查找并尝试打开解码器
     *
     * @return
     */
    protected AVCodecContext findAndOpenCodec(AVFormatContext formatCtx, int videoStreamIndex) {
        // Find codec param
        AVCodecParameters codecParameters = findVideoParameters(formatCtx, videoStreamIndex);

        // Find the decoder for the video stream
        AVCodec codec = avcodec_find_decoder(codecParameters.codec_id());

        if (codec == null) {
            System.err.println("Codec not found!");
            throw new RuntimeException("Codec not found!");
        }
        AVDictionary optionsDict = null;
        AVCodecContext codecCtx = avcodec_alloc_context3(codec);

        //convert to codecContext
        if (avcodec_parameters_to_context(codecCtx, codecParameters) < 0) {
            System.err.println("Could not convert parameter to codecContext!");
            throw new RuntimeException("Could not convert parameter to codecContext!"); // Could not open codec
        }

        // Open codec
        if (avcodec_open2(codecCtx, codec, optionsDict) < 0) {
            System.err.println("Could not open codec!");
            throw new RuntimeException("Could not open codec!"); // Could not open codec
        }

        return codecCtx;
    }

    /**
     * 指定视频帧位置获取对应视频帧
     *
     * @return
     */
    protected AVCodecParameters findVideoParameters(AVFormatContext formatCtx, int videoStreamIndex) throws RuntimeException {
        if (videoStreamIndex >= 0) {
            // Get a pointer to the codec context for the video stream
            AVStream stream = formatCtx.streams(videoStreamIndex);
//			AVCodecContext pCodecCtx = stream.codec();
            AVCodecParameters codecParam = stream.codecpar();
            return codecParam;
        }
        //if no stream,throws Excetion.
        throw new RuntimeException("Didn't open video file");
    }

    /**
     *   * 选择输出
     *   * @param out
     *   * @author eguid
     *   * @throws IOException
     *  
     */

    public ConvertVideoPakcet to(String out) throws IOException {
        // 录制/推流器
        logger.debug("monitor push video start--->{}", out);
        record = new FFmpegFrameRecorder(out, width, height);
        record.setVideoOption("crf", "18");
        record.setGopSize(2);
        record.setFrameRate(framerate);
        record.setVideoBitrate(bitrate);

        record.setAudioChannels(audioChannels);
        record.setAudioBitrate(audioBitrate);
        record.setSampleRate(sampleRate);
        AVFormatContext fc = null;
        if (out.indexOf("rtmp") >= 0 || out.indexOf("flv") > 0) {
            // 封装格式flv
            record.setFormat("mp4");
            record.setAudioCodecName("aac");
            record.setVideoCodec(codecid);
            fc = grabber.getFormatContext();
        }
        record.start(fc);
        logger.debug("record.start");
        return this;
    }

    /**
     *   * 转封装
     *   * @author eguid
     *   * @throws IOException
     *  
     */


    public ConvertVideoPakcet go() throws StFaceException, InterruptedException {
        long err_index = 0;//采集或推流导致的错误次数
        //连续五次没有采集到帧则认为视频采集结束，程序错误次数超过1次即中断程序

        logger.debug("analizy go go go go ");

        Set<UrlMapper> urlMappers = SpringContextHolder.getBean("urlMapperSet");
        urlMappers.remove(urlMapper);

        // Determine required buffer size and allocate buffer
        BytePointer buffer = new BytePointer(av_malloc(av_image_get_buffer_size(AV_PIX_FMT_BGR24, width, height, 1)));

        // Assign appropriate parts of buffer to image planes in pFrameRGB.
        av_image_fill_arrays(outFrameRGB.data(), outFrameRGB.linesize(), buffer, AV_PIX_FMT_BGR24, width, height, 1);

        //分析时违规记录
        HashMap<Man, CloseRelation> closeRelationMap = new HashMap<>();

        //for循环获取视频帧
        for (int no_frame_index = 0; no_frame_index < 5 || err_index > 1; ) {
            //获取分析开始，总时间需要一秒
            long startTime = System.currentTimeMillis();
            AVPacket pkt = null;
            try {
                //没有解码的音视频帧
                pkt = grabber.grabPacket();
                if (pkt == null || pkt.size() <= 0 || pkt.data() == null) {
                    //空包记录次数跳过
                    no_frame_index++;
                    continue;
                }
                if (pkt.stream_index() == videoStreamIndex) {
                    //把需要解码的视频帧送进解码器
                    logger.error("closeRelationMap---------->{}",closeRelationMap);
                    //Send video packet to be decoding
                    if (avcodec_send_packet(pCodecCtx, pkt) == 0) {
                        //Receive decoded video frame
                        if (avcodec_receive_frame(pCodecCtx, pFrame) == 0) {
                            //Sucesss.
                            // Convert the image from its native format to BGR
                            sws_scale(sws_ctx, pFrame.data(), pFrame.linesize(), 0, height, outFrameRGB.data(), outFrameRGB.linesize());
                            //Convert BGR to ByteBuffer
                            byte[] bytes = saveFrame(outFrameRGB, width, height);

                            av_free_packet(pkt);
                            //获取分析这一视频帧图片
                            StCrowdDensityResult crowdResult = detector.track(bytes, StImageFormat.ST_PIX_FMT_BGR888, width, height);

                            logger.info("track success.crowdResult.Width:{},Height:{},Number of People:{},Number of keypoints:{},keypoints:{}", crowdResult.getWidth(),crowdResult.getHeight(),crowdResult.getNumberOfPeople(),crowdResult.getKeypointCount(), JsonMapper.getInstance().toJson(crowdResult.getKeypoints()));
                            //大与两个人
                            if (crowdResult != null && 2 < crowdResult.getNumberOfPeople()) {
                                StPointF[] keypoints = crowdResult.getKeypoints();
                                //初始化有效的manList
                                ArrayList<Man> manList = new ArrayList<>();
                                if (keypoints != null && keypoints.length > 1) {
                                    for (int j = 0; j < keypoints.length; j++) {
                                        float[] pointsScore = crowdResult.getPointsScore();
                                        float score = pointsScore[j];
                                        if (score > useScore) {
                                            manList.add(new Man(keypoints[i].x, keypoints[j].y));
                                        }
                                    }
                                }
                                //初始结束，循环分析
                                manLoop:
                                for (Man manOut : manList) {
                                    for (Man manIn : manList) {
                                        double distance = Math.sqrt(Math.pow(manOut.getX() - manIn.getX(), 2) + Math.pow(manOut.getY() - manIn.getY(), 2));
                                        if (distance == 0) {
                                            continue;
                                        }

                                        CloseRelation closeRelation = null;
                                        Man key = null;
                                        if (closeRelationMap.size() > 0) {
                                            for (Map.Entry<Man, CloseRelation> manCloseRelationEntry : closeRelationMap.entrySet()) {
                                                key = manCloseRelationEntry.getKey();
                                                if (manOut.equals(key)) {
                                                    closeRelation = manCloseRelationEntry.getValue();
                                                    break;
                                                }
                                            }
                                        }

                                        //距离小于 200 像素
                                        if (distance < tooCloseValue) {
                                            if (closeRelation != null) {
                                                Set<CloseMan> closeManSet = closeRelation.getCloseManSet();
                                                if (closeManSet != null && !closeManSet.isEmpty()) {
                                                    CloseMan closeManOn = VideoAnalizyUtils.getCloseMan(closeManSet, manIn);
                                                    if (closeManOn == null) {
                                                        CloseMan closeMan = new CloseMan(1, manIn, true);
                                                        closeManSet.add(closeMan);
                                                        continue;
                                                    } else {
                                                        Man man = closeManOn.getMan();
                                                        int time = closeManOn.getTime();
                                                        if (time >= 6) {
                                                            //违规了，发流等待 5 分钟 manOut + " | " + man + "|" + time + "|" + distance
                                                            logger.error("analizy break the rule !!!WARNING! this man {} too close with {} last {} ,distance is {}",manOut,manIn,time +1 ,distance);
                                                            RuleBreak ruleBreak = new RuleBreak(manOut, manIn, urlMapper.getCamerName());
                                                            ObjectMapper objectMapper = new ObjectMapper();
                                                            SpringContextHolder.getBean(WsHandler.class).sendMessageToUsers(new TextMessage(objectMapper.writeValueAsString(ruleBreak)));
                                                            new ConvertVideoPakcet(urlMapper).from(urlMapper.getInputUrl()).to(urlMapper.getOutPutUrl()).pushVideo();
                                                            //清空map
                                                            closeRelationMap.clear();
                                                            break manLoop;
                                                        } else {
                                                            //时间小了
                                                            if (closeManOn.isCurrentInc()) {
                                                                continue;
                                                            }
                                                            closeManOn.setCurrentInc(true);
                                                            closeManSet.remove(closeManOn);
                                                            CloseMan closeMan1 = new CloseMan(time + 1, manIn);
                                                            closeMan1.setCurrentInc(true);//此次增长标记
                                                            closeManSet.add(closeMan1);
                                                            continue;
                                                        }
                                                    }
                                                } else {
                                                    Set<CloseMan> closeManNewSet = new HashSet<>();
                                                    CloseMan closeMan = new CloseMan(1, manIn, true);
                                                    closeManNewSet.add(closeMan);
                                                    continue;
                                                }
                                            } else {
                                                Set<CloseMan> closeManNewSet = new HashSet<>();
                                                CloseMan closeMan = new CloseMan(1, manIn, true);
                                                closeManNewSet.add(closeMan);
                                                CloseRelation closeRelation1 = new CloseRelation(manOut, closeManNewSet);
                                                closeRelationMap.put(manOut, closeRelation1);
                                                continue;
                                            }
                                        } else {
                                            //不违规，清数据
                                            if (closeRelation == null) {
                                                continue;
                                            } else {
                                                Set<CloseMan> closeManSet = closeRelation.getCloseManSet();
                                                if (closeManSet == null || closeManSet.isEmpty()) {
                                                    closeRelationMap.remove(key);
                                                    continue;
                                                } else {
                                                    CloseMan closeMan = VideoAnalizyUtils.getCloseMan(closeManSet, manIn);
                                                    if (closeMan == null) {
                                                        continue;
                                                    } else {
                                                        closeManSet.remove(closeMan);
                                                    }
                                                }

                                            }


                                        }
                                    }


                                }
                                //循环判断结束，准备下一秒数据
                                if (closeRelationMap != null && !closeRelationMap.isEmpty()) {
                                    //这一秒的计步结束，初始化
                                    for (Map.Entry<Man, CloseRelation> manCloseRelationEntry : closeRelationMap.entrySet()) {
                                        CloseRelation value = manCloseRelationEntry.getValue();
                                        Set<CloseMan> closeManSet = value.getCloseManSet();
                                        if (closeManSet != null && !closeManSet.isEmpty()) {
                                            for (CloseMan closeMan : closeManSet) {
                                                closeMan.setCurrentInc(false);
                                            }
                                        }
                                    }
                                }
                            }

                        }
                    }
                }
            } catch (Exception e) {
                err_index++;
                logger.error("analizy video error" + e);
            } catch (IOException e) {
                err_index++;
                logger.error("analizy video error" + e);
            }
            //获取单个视频帧结束
            long endTime = System.currentTimeMillis();
            long timeSleep = 1000 - (endTime - startTime);
            if (timeSleep > 0) {
                Thread.sleep(timeSleep);
            }
        }

        if (detector != null) {
            detector.release();
        }
        return this;
    }


    public ConvertVideoPakcet pushVideo() throws IOException {
        long err_index = 0;//采集或推流导致的错误次数
        //连续五次没有采集到帧则认为视频采集结束，程序错误次数超过1次即中断程序

        logger.info("record pushVideo start");

        long startTime = System.currentTimeMillis();
        long endTime;
        for (int no_frame_index = 0; no_frame_index < 5 || err_index > 1; ) {
            AVPacket pkt = null;
            try {
                //没有解码的音视频帧
                pkt = grabber.grabPacket();
                if (pkt == null || pkt.size() <= 0 || pkt.data() == null) {
                    //空包记录次数跳过
                    no_frame_index++;
                    continue;
                }

                err_index += (record.recordPacket(pkt) ? 0 : 1);//如果失败err_index自增1
                av_free_packet(pkt);
                endTime = System.currentTimeMillis();
                if ((endTime - startTime) > 1000 * pushVideoLong) {
                    record.stop();
                    record.release();
                    grabber.stop();
                    grabber.release();
                    freeAndClose();
                    logger.info("record pushVideo end");
                    return this;
                }
            } catch (Exception e) {//推流失败
                err_index++;
                logger.error("pushVideo fail " + e);
            } catch (IOException e) {
                err_index++;
                logger.error("pushVideo fail " + e);
            }
        }
        return this;
    }


    public byte[] saveFrame(AVFrame frameRGB, int width, int height) {
        BytePointer data = frameRGB.data(0);
        int size = width * height * 3;
        //复制虚拟机外内存数据到java虚拟机中，因为这个方法之后会清理内存
        byte[] bytes = new byte[size];
        data.position(0).limit(size).get(bytes, 0, size);
        return bytes;
    }

}
