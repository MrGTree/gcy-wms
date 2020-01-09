package com.thinkgem.jeesite.video.javacv;


import java.awt.image.BufferedImage;
import java.awt.image.DataBufferByte;
import java.io.IOException;
import java.util.Map;
import java.util.Objects;

import static org.bytedeco.ffmpeg.global.avcodec.av_packet_unref;
import static org.bytedeco.ffmpeg.global.avcodec.avcodec_alloc_context3;
import static org.bytedeco.ffmpeg.global.avcodec.avcodec_find_decoder;
import static org.bytedeco.ffmpeg.global.avcodec.avcodec_flush_buffers;
import static org.bytedeco.ffmpeg.global.avcodec.avcodec_free_context;
import static org.bytedeco.ffmpeg.global.avcodec.avcodec_open2;
import static org.bytedeco.ffmpeg.global.avcodec.avcodec_parameters_to_context;
import static org.bytedeco.ffmpeg.global.avcodec.avcodec_receive_frame;
import static org.bytedeco.ffmpeg.global.avcodec.avcodec_send_packet;
import static org.bytedeco.ffmpeg.global.avformat.av_read_frame;
import static org.bytedeco.ffmpeg.global.avformat.avformat_close_input;
import static org.bytedeco.ffmpeg.global.avformat.avformat_find_stream_info;
import static org.bytedeco.ffmpeg.global.avformat.avformat_network_init;
import static org.bytedeco.ffmpeg.global.avformat.avformat_open_input;
import static org.bytedeco.ffmpeg.global.avutil.AVMEDIA_TYPE_VIDEO;
import static org.bytedeco.ffmpeg.global.avutil.AV_PIX_FMT_BGR24;
import static org.bytedeco.ffmpeg.global.avutil.av_dict_free;
import static org.bytedeco.ffmpeg.global.avutil.av_dict_set;
import static org.bytedeco.ffmpeg.global.avutil.av_frame_alloc;
import static org.bytedeco.ffmpeg.global.avutil.av_frame_free;
import static org.bytedeco.ffmpeg.global.avutil.av_free;
import static org.bytedeco.ffmpeg.global.avutil.av_image_fill_arrays;
import static org.bytedeco.ffmpeg.global.avutil.av_image_get_buffer_size;
import static org.bytedeco.ffmpeg.global.avutil.av_malloc;
import static org.bytedeco.ffmpeg.global.swscale.SWS_FAST_BILINEAR;
import static org.bytedeco.ffmpeg.global.swscale.sws_freeContext;
import static org.bytedeco.ffmpeg.global.swscale.sws_getContext;
import static org.bytedeco.ffmpeg.global.swscale.sws_scale;
import com.sensetime.ad.core.StCrowdDensityDetector;
import com.sensetime.ad.core.StFaceException;
import com.sensetime.ad.sdk.StCrowdDensityResult;
import com.sensetime.ad.sdk.StImageFormat;
import com.thinkgem.jeesite.common.config.Global;
import com.thinkgem.jeesite.common.utils.SpringContextHolder;
import com.thinkgem.jeesite.common.utils.VideoAnalizyUtils;
import com.thinkgem.jeesite.video.javacv.Entity.UrlMapper;
import com.thinkgem.jeesite.video.javacv.exception.FileNotOpenException;
import com.thinkgem.jeesite.video.javacv.exception.StreamInfoNotFoundException;
import net.coobird.thumbnailator.Thumbnails;
import org.bytedeco.ffmpeg.avcodec.AVCodec;
import org.bytedeco.ffmpeg.avcodec.AVCodecContext;
import org.bytedeco.ffmpeg.avcodec.AVCodecParameters;
import org.bytedeco.ffmpeg.avcodec.AVPacket;
import org.bytedeco.ffmpeg.avformat.AVFormatContext;
import org.bytedeco.ffmpeg.avformat.AVInputFormat;
import org.bytedeco.ffmpeg.avformat.AVStream;
import org.bytedeco.ffmpeg.avutil.AVDictionary;
import org.bytedeco.ffmpeg.avutil.AVFrame;
import org.bytedeco.ffmpeg.avutil.AVRational;
import org.bytedeco.ffmpeg.swscale.SwsContext;
import org.bytedeco.javacpp.BytePointer;
import org.bytedeco.javacpp.DoublePointer;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

/**
 *  * rtsp转rtmp（转封装方式）
 *  * @author eguid
 *  
 */
public class ConvertVideoPakcetPicture {

    private Logger logger = LoggerFactory.getLogger(getClass());

    int width = -1, height = -1;

    private UrlMapper urlMapper;
    protected long framerate;// 帧率
    public volatile boolean cameraOpen = true;


    public ConvertVideoPakcetPicture() {
    }

    public ConvertVideoPakcetPicture(UrlMapper urlMapper) {
        this.urlMapper = urlMapper;
    }

    private String modelPath;


    StCrowdDensityDetector detector;

    {
        avformat_network_init();
        modelPath = Global.getModelPath();
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
    private AVFrame pFrame;//临时的视频帧解码后的图像像素数据，默认yuv420

    private AVPacket pkt;

    /**
     *   * 选择视频源
     *   * @param src
     *   * @author eguid
     *   * @throws Exception
     *  
     */
    public ConvertVideoPakcetPicture from(String src) {
        logger.debug("monitor from url:{}" + src);
        // 采集/抓取器
        initGrabber(src, AV_PIX_FMT_BGR24);
        logger.error("{} audiocodecid is {},width is {},heigth is {},framerate is {}", src, width, height);
        Map<String, ConvertVideoPakcetPicture> convertVideoPakcetMap = SpringContextHolder.getBean("ConvertVideoPakcetPictureMap");
        convertVideoPakcetMap.put(urlMapper.getCamerName(), this);
        return this;
    }

    /*
     * 是否包含rtsp
     */
    private boolean hasRTSP(String str) {
        return str.indexOf("rtsp") > -1;
    }

    /**
     * free all struct
     */
    public void freeAndClose() {
        if (Objects.nonNull(pCodecCtx)) {
            avcodec_free_context(pCodecCtx);// Close the codec
            pCodecCtx.close();
        }
        if (Objects.nonNull(sws_ctx)) {
            sws_freeContext(sws_ctx);//Free SwsContext
            sws_ctx.close();
        }
        if (Objects.nonNull(pFormatCtx)) {
            avformat_close_input(pFormatCtx);// Close the video file
            pFormatCtx.close();
        }
    }

    /**
     * 开始转码之前的一些初始化操作
     *
     * @param url
     * @param fmt
     * @return
     */
    private boolean initGrabber(String url, int fmt) {

        // Open video file
        pFormatCtx = openInput(url);

        // Find video info
        findStreamInfo(pFormatCtx, null);

        // Find a video stream
        videoStreamIndex = findVideoStreamIndex(pFormatCtx);

        // Find the decoder for the video stream
        pCodecCtx = findAndOpenCodec(pFormatCtx, videoStreamIndex);

        //set image size
        width = pCodecCtx.width();
        height = pCodecCtx.height();

        pkt = new AVPacket();

        //scaling/conversion operations by using sws_scale().
        DoublePointer param = null;
        sws_ctx = sws_getContext(width, height, pCodecCtx.pix_fmt(), width, height, AV_PIX_FMT_BGR24, SWS_FAST_BILINEAR, null, null, param);

        return true;
    }

    /**
     * 打开视频流
     *
     * @param url -url
     * @return
     * @throws
     */
    protected AVFormatContext openInput(String url) throws FileNotOpenException {
        AVFormatContext pFormatCtx = new AVFormatContext(null);
        AVInputFormat f = null;
        int ret;
        AVDictionary options = new AVDictionary(null);
        av_dict_set(options, "fflags", "nobuffer", 0);
        if (hasRTSP(url)) {
            av_dict_set(options, "rtsp_transport", "tcp", 0);
        }
        if ((ret = avformat_open_input(pFormatCtx, url, f, options)) < 0) {
            av_dict_set(options, "pixel_format", null, 0);
            if ((ret = avformat_open_input(pFormatCtx, url, f, options)) < 0) {
                throw new FileNotOpenException("avformat_open_input() error " + ret + ": Could not open input \"" + url + "\". (Has setFormat() been called?)");
            }
        }
        pFormatCtx.probesize(20000000);
        pFormatCtx.max_analyze_duration(2000);
        av_dict_free(options);
        return pFormatCtx;
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
     * 检索流信息（rtsp/rtmp检索时间过长问题解决）
     *
     * @return
     */
    protected AVFormatContext findStreamInfo(AVFormatContext formatCtx, AVDictionary options) throws StreamInfoNotFoundException {
        if (avformat_find_stream_info(formatCtx, options == null ? (AVDictionary) null : options) >= 0) {
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
            AVRational r = stream.avg_frame_rate();
            if (r.num() == 0 && r.den() == 0) {
                r = stream.r_frame_rate();
            }
            framerate = new Double(r.num() / r.den()).longValue();

            r.close();
            AVCodecParameters codecParam = stream.codecpar();
            return codecParam;
        }
        //if no stream,throws Excetion.
        throw new RuntimeException("Didn't open video file");
    }

    /**
     *   * 转封装
     *   * @author eguid
     *   * @throws IOException
     *  
     */


    public ConvertVideoPakcetPicture go() throws StFaceException, IOException {
        logger.error("analizy go go go go ");
        //分析时违规记录
        long no_frame_index = 0;
        //for循环获取视频帧
        while ( cameraOpen && av_read_frame(pFormatCtx, pkt) == 0) {
            // Is this a packet from the video stream?
            long start = System.currentTimeMillis();
            if (pkt.stream_index() == videoStreamIndex) {
                if (pkt == null || pkt.size() <= 0 || pkt.data() == null) {
                    //空包记录次数跳过
                    av_packet_unref(pkt);
                    if (no_frame_index > 40) {
                        break;
                    } else {
                        no_frame_index++;
                        logger.debug("analizy no_frame_index is:{}", no_frame_index);
                        continue;
                    }
                }
                logger.info("packet one second picture........");
                if (avcodec_send_packet(pCodecCtx, pkt) == 0) {
                    //Send video packet to be decoding
                    //Receive decoded video frame
                    pFrame = av_frame_alloc();
                    // Allocate an AVFrame structure
                    if (avcodec_receive_frame(pCodecCtx, pFrame) == 0) {
                        //Sucesss.
                        outFrameRGB = av_frame_alloc();
                        outFrameRGB.width(width);
                        outFrameRGB.height(height);
                        outFrameRGB.format(AV_PIX_FMT_BGR24);
                        // Determine required buffer size and allocate buffer
                        BytePointer buffer = new BytePointer(av_malloc(av_image_get_buffer_size(AV_PIX_FMT_BGR24, width, height, 1)));
                        // Assign appropriate parts of buffer to image planes in pFrameRGB.
                        av_image_fill_arrays(outFrameRGB.data(), outFrameRGB.linesize(), buffer, AV_PIX_FMT_BGR24, width, height, 1);
                        // Convert the image from its native format to BGR
                        sws_scale(sws_ctx, pFrame.data(), pFrame.linesize(), 0, height, outFrameRGB.data(), outFrameRGB.linesize());
                        //Convert BGR to ByteBuffer
                        byte[] bytes = saveFrame(outFrameRGB, width, height);
                        av_free(buffer);//free buffer
                        //获取分析这一视频帧图片
                        logger.error("ready sendPicture.....");
                        if (bytes != null && bytes.length > 0) {
                            BufferedImage bufferedImage = VideoAnalizyUtils.BGR2BufferedImage(bytes, width, height);
                            BufferedImage image = Thumbnails.of(bufferedImage).sourceRegion((int) urlMapper.getMinX(), (int) urlMapper.getMinY(), (int) urlMapper.getMaxX() - (int) urlMapper.getMinX(), (int) urlMapper.getMaxY() - (int) urlMapper.getMinY()).size(width, height).keepAspectRatio(true).asBufferedImage();
                            byte[] data = ((DataBufferByte) image.getData().getDataBuffer()).getData();
                            StCrowdDensityResult crowdResult = detector.track(data, StImageFormat.ST_PIX_FMT_BGR888, image.getWidth(), image.getHeight());
                            VideoAnalizyUtils.sendPicture(image.getWidth(), image.getHeight(), urlMapper.getCamerName(), data, crowdResult,urlMapper, width, height);
                            while ((System.currentTimeMillis() - start) < 999){
                                av_packet_unref(pkt);
                                pFormatCtx.flush_packets();
                                av_read_frame(pFormatCtx, pkt);
                            }
                        }
                        //大与两个人
                        av_frame_free(outFrameRGB);
                    }
                    av_frame_free(pFrame);
                    avcodec_flush_buffers(pCodecCtx);
                }
            }
            av_packet_unref(pkt);
            pFormatCtx.flush_packets();
        }
        logger.error("{}go loop finish !!!,cameraOpen:{}", urlMapper.getInputUrl(), cameraOpen);
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
