package com.thinkgem.jeesite.video.javacv;


import org.apache.commons.collections.CollectionUtils;
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
import org.bytedeco.javacv.Java2DFrameConverter;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.HashSet;
import java.util.Map;
import java.util.Set;

import static org.bytedeco.ffmpeg.global.avcodec.av_free_packet;
import static org.bytedeco.ffmpeg.global.avcodec.avcodec_alloc_context3;
import static org.bytedeco.ffmpeg.global.avcodec.avcodec_find_decoder;
import static org.bytedeco.ffmpeg.global.avcodec.avcodec_open2;
import static org.bytedeco.ffmpeg.global.avcodec.avcodec_parameters_to_context;
import static org.bytedeco.ffmpeg.global.avcodec.avcodec_receive_frame;
import static org.bytedeco.ffmpeg.global.avcodec.avcodec_send_packet;
import static org.bytedeco.ffmpeg.global.avformat.avformat_find_stream_info;
import static org.bytedeco.ffmpeg.global.avformat.avformat_open_input;
import static org.bytedeco.ffmpeg.global.avutil.AVMEDIA_TYPE_VIDEO;
import static org.bytedeco.ffmpeg.global.avutil.av_frame_alloc;
import static org.bytedeco.ffmpeg.global.avutil.av_image_fill_arrays;
import static org.bytedeco.ffmpeg.global.avutil.av_image_get_buffer_size;
import static org.bytedeco.ffmpeg.global.avutil.av_malloc;
import static org.bytedeco.ffmpeg.global.swscale.SWS_FAST_BILINEAR;
import static org.bytedeco.ffmpeg.global.swscale.sws_getContext;
import static org.bytedeco.ffmpeg.global.swscale.sws_scale;

/**
 *  * rtsp转rtmp（转封装方式）
 *  * @author eguid
 *  
 */
public class ConvertVideoPakcet {
    FFmpegFrameGrabber grabber = null;
    FFmpegFrameRecorder record = null;
    int width = -1, height = -1;
    int i = 1;

    // 视频参数
    protected int audiocodecid;
    protected int codecid;
    protected double framerate;// 帧率
    protected int bitrate;// 比特率

    // 音频参数
    // 想要录制音频，这三个参数必须有：audioChannels > 0 && audioBitrate > 0 && sampleRate > 0
    private int audioChannels;
    private int audioBitrate;
    private int sampleRate;

    private static final String LICENSE_PATH = "/root/Desktop/models/license.lic";
    private static final String MODEL_PATH = "/root/Desktop/models/M_Crowd_Keypoint_1.0.0.model";

    private Java2DFrameConverter javaconverter = new Java2DFrameConverter();

//    private StCrowdDensityDetector detector;
//
//    {
//        try {
//            detector = new StCrowdDensityDetector(MODEL_PATH);
//        } catch (StFaceException e) {
//            e.printStackTrace();
//        }
//    }

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
        System.err.println("音频编码：" + audiocodecid);
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

        pFormatCtx = new AVFormatContext(null);
        avformat_open_input(pFormatCtx, src, null, null);
        AVDictionary options = null;
        avformat_find_stream_info(pFormatCtx, options == null ? (AVDictionary) null : options);
        videoStreamIndex = findVideoStreamIndex(pFormatCtx);

        // Find the decoder for the video stream
        pCodecCtx = findAndOpenCodec(pFormatCtx, videoStreamIndex);

        DoublePointer param = null;
        sws_ctx = sws_getContext(width, height, pCodecCtx.pix_fmt(), width, height, 0, SWS_FAST_BILINEAR, null, null, param);

        // Allocate video frame
        pFrame = av_frame_alloc();

        // Allocate an AVFrame structure
        outFrameRGB = av_frame_alloc();
        outFrameRGB.width(width);
        outFrameRGB.height(height);
        outFrameRGB.format(0);


        return this;
    }

    /**
     * 查找视频通道
     *
     * @return
     */
    protected int findVideoStreamIndex(AVFormatContext formatCtx) {
        int size = formatCtx.nb_streams();
        for (int i = 0; i < size; i++) {
            AVStream stream = formatCtx.streams(i);
            AVCodecParameters codec = stream.codecpar();
            int type = codec.codec_type();
            if (type == AVMEDIA_TYPE_VIDEO) {
                return i;
            }
        }
        return -1;
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
            record.setFormat("flv");
            record.setAudioCodecName("aac");
            record.setVideoCodec(codecid);
            fc = grabber.getFormatContext();
        }
        record.start(fc);
        System.out.println("record.start");
        return this;
    }

    /**
     *   * 转封装
     *   * @author eguid
     *   * @throws IOException
     *  
     */


    public ConvertVideoPakcet go() throws IOException, InterruptedException {
        long err_index = 0;//采集或推流导致的错误次数
        //连续五次没有采集到帧则认为视频采集结束，程序错误次数超过1次即中断程序

        System.out.println("record go");

        // Determine required buffer size and allocate buffer
        BytePointer buffer = new BytePointer(av_malloc(av_image_get_buffer_size(0, width, height, 1)));

        // Assign appropriate parts of buffer to image planes in pFrameRGB.
        av_image_fill_arrays(outFrameRGB.data(), outFrameRGB.linesize(), buffer, 0, width, height, 1);


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

                if (pkt.stream_index() == videoStreamIndex) {
                    //把需要解码的视频帧送进解码器
                    //Send video packet to be decoding
                    if (avcodec_send_packet(pCodecCtx, pkt) == 0) {
                        //Receive decoded video frame
                        if (avcodec_receive_frame(pCodecCtx, pFrame) == 0) {
                            //Sucesss.
                            // Convert the image from its native format to BGR
                            sws_scale(sws_ctx, pFrame.data(), pFrame.linesize(), 0, height, outFrameRGB.data(), outFrameRGB.linesize());
                            //Convert BGR to ByteBuffer
                            byte[] bytes = saveFrame(outFrameRGB, width, height);
//                            try {
//                                StCrowdDensityResult crowdResult = detector.track(bytes, StImageFormat.ST_PIX_FMT_BGR888, width, height);
//                                if (4 < crowdResult.getNumberOfPeople() ){
//                                    record.start();
//                                    err_index += (record.recordPacket(pkt) ? 0 : 1);//如果失败err_index自增1
                            av_free_packet(pkt);
                            System.out.println("go = " + true);
                            if (true) {
                                new ConvertVideoPakcet().from("rtmp://www.fourhu.xyz:1935/live/livestream").to("rtmp://www.fourhu.xyz/violation-rule?vhost=violation-rule-record/classroom01-camera01").pushVideo();
                            } else {
                            }
//                                }else {
//                                    record.flush();
//                                    record.stop();
//                                    System.out.println("too litter Number of People: " + crowdResult.getNumberOfPeople());
//                                }
//                            } catch (StFaceException e) {
//                                e.printStackTrace();
//                            }

                        }
                    }
                }

//                BufferedImage buffImg=javaconverter.convert(grabber.grab());
//                if(buffImg != null ){
//                    byte[] data  =  ((DataBufferByte)buffImg.getData().getDataBuffer()).getData();
//
//                    try {
//                        StCrowdDensityResult crowdResult = detector.track(data, StImageFormat.ST_PIX_FMT_BGR888, buffImg.getWidth(), buffImg.getHeight());
//
//                        if (4 < crowdResult.getNumberOfPeople() ){
                //不需要编码直接把音视频帧推出去
//                            err_index += (record.recordPacket(pkt) ? 0 : 1);//如果失败err_index自增1
//                            av_free_packet(pkt);
//                        }else {
//                            System.out.println("too litter Number of People: " + crowdResult.getNumberOfPeople());
////                            record.flush();
//                        }
//
//                    } catch (StFaceException e) {
//                        e.printStackTrace();
//                    }
//                }
//                 opencv_imgcodecs.cvSaveImage("hello"+i +".jpg", converter.convert(grabber.grab()));//来保存图片
            } catch (Exception e) {//推流失败
                err_index++;
            } catch (IOException e) {
                err_index++;
            }
        }

//        if (detector != null) {
//            detector.release();
//        }
        return this;
    }


    public ConvertVideoPakcet pushVideo() throws IOException {
        long err_index = 0;//采集或推流导致的错误次数
        //连续五次没有采集到帧则认为视频采集结束，程序错误次数超过1次即中断程序

        System.out.println("record pushVideo start");

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
                if ((endTime - startTime) > 1000 * 60) {
                    record.stop();
                    record.release();
                    System.out.println("record pushVideo end");
                    return this;
                }

//                 opencv_imgcodecs.cvSaveImage("hello"+i +".jpg", converter.convert(grabber.grab()));//来保存图片
            } catch (Exception e) {//推流失败
                err_index++;
            } catch (IOException e) {
                err_index++;
            }
        }

//        if (detector != null) {
//            detector.release();
//        }
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

    public static void main(String[] args) throws Exception, IOException, InterruptedException {
//        int[] retCode = new int[1];
//        String lic = readToString(LICENSE_PATH);
//        String activeCode = StLibrary.onlineActivite("", lic, retCode);
//        if (retCode[0] != 0) {
//            System.out.println("get online activation code failed, rc = " + retCode[0]);
//            return;
//        }
//        retCode[0] = StLibrary.addLic("", lic, activeCode);
//        if (retCode[0] != 0) {
//            System.out.println("add lic failed, rc = " + retCode[0]);
//            return;
//        }

        //new ConvertVideoPakcet().from("rtmp://www.fourhu.xyz:1935/live/livestream").go();

        Man man1 = new Man(800, 800);
        Man man2 = new Man(10, 10);
        Man man3 = new Man(100, 130);

        ArrayList<Man> manList = new ArrayList<>();
        manList.add(man1);
        manList.add(man2);
        manList.add(man3);
        HashMap<Man, CloseRelation> closeRelationMap = new HashMap<>();

        for (; ; ) {
            long startTime = System.currentTimeMillis();

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
                            }
                        }
                    }

                    //距离小于 200 像素
                    if (distance < 200) {
                        if (closeRelation != null) {
                            Set<CloseMan> closeManSet = closeRelation.getCloseManSet();
                            if (closeManSet != null && !closeManSet.isEmpty()) {
                                CloseMan closeManOn = getCloseMan(closeManSet, manIn);
                                Man man = closeManOn.getMan();
                                int time = closeManOn.getTime();
                                if (time >= 6) {
                                    //违规了，发流等待 3 分钟
                                    System.out.println(manOut + " | " + man + "|" + time + "|" + distance);
                                    //清空map
                                    closeRelationMap.clear();
                                    break manLoop;
                                } else {
                                    //时间小了
                                    closeManSet.remove(closeManOn);
                                    CloseMan closeMan1 = new CloseMan(time + 1, manIn);
                                    closeManSet.add(closeMan1);
                                    continue;
                                }
                            } else {
                                Set<CloseMan> closeManNewSet = new HashSet<>();
                                CloseMan closeMan = new CloseMan(1, manIn);
                                closeManNewSet.add(closeMan);
                                continue;
                            }
                        } else {
                            Set<CloseMan> closeManNewSet = new HashSet<>();
                            CloseMan closeMan = new CloseMan(1, manIn);
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
                                CloseMan closeMan = getCloseMan(closeManSet, manIn);
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


            long endTime = System.currentTimeMillis();
            //1000 - (endTime - startTime)
            Thread.sleep(1000);
        }
    }

    public static CloseMan getCloseMan(Set<CloseMan> closeManSet, Man manIn) {
        if (CollectionUtils.isEmpty(closeManSet)) {
            return null;
        }
        for (CloseMan closeMan : closeManSet) {
            Man man = closeMan.getMan();
            if (man.equals(manIn)) {
                return closeMan;
            }
        }
        return null;
    }


    public static String readToString(String fileName) {
        String encoding = "UTF-8";
        File file = new File(fileName);
        long filelength = file.length();
        byte[] filecontent = new byte[(int) filelength];
        try {
            FileInputStream in = new FileInputStream(file);
            in.read(filecontent);
            in.close();
        } catch (FileNotFoundException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }
        try {
            return new String(filecontent, encoding);
        } catch (UnsupportedEncodingException e) {
            System.err.println("The OS does not support " + encoding);
            e.printStackTrace();
            return null;
        }
    }
}
