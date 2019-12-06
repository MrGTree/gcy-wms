package com.thinkgem.jeesite.video.javacv;

import java.io.IOException;
import java.util.ArrayList;

import static org.bytedeco.ffmpeg.global.avcodec.av_free_packet;
import static org.bytedeco.ffmpeg.global.avutil.AV_LOG_DEBUG;
import static org.bytedeco.ffmpeg.global.avutil.av_log_set_level;
import com.thinkgem.jeesite.common.config.Global;
import org.bytedeco.ffmpeg.avcodec.AVPacket;
import org.bytedeco.javacv.FFmpegFrameGrabber;
import org.bytedeco.javacv.FFmpegFrameRecorder;
import org.bytedeco.javacv.FrameGrabber;
import org.bytedeco.javacv.FrameRecorder;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

public class PushBreakRuleVideo {

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

    // 音频参数
    // 想要录制音频，这三个参数必须有：audioChannels > 0 && audioBitrate > 0 && sampleRate > 0
    private int audioChannels;
    private int audioBitrate;
    private int sampleRate;


    /**
     *   * 选择视频源
     *   * @param src
     *   * @author eguid
     *   * @throws Exception
     *  
     */
    public PushBreakRuleVideo from(String src) throws FrameGrabber.Exception {
        // 采集/抓取器
        logger.info("PushBreakRuleVideo  grabber go go go ");
        grabber = new FFmpegFrameGrabber(src);
        if (hasRTSP(src)) {
            grabber.setOption("rtsp_transport", "tcp");
        }
//        grabber.setOption("buffer_size", "1024000");
        grabber.start();// 开始之后ffmpeg会采集视频信息，之后就可以获取音视频信息
        if (width < 0 || height < 0) {
            width = grabber.getImageWidth();
            height = grabber.getImageHeight();
        }
        // 视频参数
        audiocodecid = grabber.getAudioCodec();
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
        return this;
    }

    /**
     *   * 选择输出
     *   * @param out
     *   * @author eguid
     *   * @throws IOException
     *  
     */
    public PushBreakRuleVideo to(String out) throws IOException {
        // 录制/推流器
        logger.info("PushBreakRuleVideo record go go go ");
        record = new FFmpegFrameRecorder(out, 1280, 720,0);
        //record = FFmpegFrameRecorder.createDefault(out);
//        record.setVideoOption("crf", "18");
//        record.setVideoOption("tune", "zerolatency");
//        record.setVideoOption("preset", "ultrafast");
//        record.setGopSize(20);
//        record.setAspectRatio(16.0/9.0);
////        record.setFrameRate(framerate);
//        record.setVideoBitrate(200000);
////
////        record.setAudioChannels(audioChannels);
////        record.setAudioBitrate(audioBitrate);
////        record.setSampleRate(sampleRate);
////        AVFormatContext fc = null;
//
//        record.setFormat("mp4");
//        record.setFrameRate(30);
//        record.setPixelFormat(AV_PIX_FMT_YUVJ420P);
//        //AV_PIX_FMT_YUVJ420P
//        record.setVideoCodec(AV_CODEC_ID_H264);
//        record.setVideoQuality(10);
//        record.setSampleRate(48000);
////        record.setSampleFormat(AV_SAMPLE_FMT_FLTP);
////        record.setAudioCodec(AV_CODEC_ID_AAC);
//        record.setAudioQuality(0);
//        logger.error("record:{}");
////        //rtmp和flv
////        if (hasRTMPFLV(out)) {
////            // 封装格式flv，并使用h264和aac编码
////            record.setFormat("flv");
////            record.setVideoCodec(AV_CODEC_ID_H264);
////            record.setAudioCodec(AV_CODEC_ID_AAC);
////            if (hasRTMPFLV(out)) {
////                fc = grabber.getFormatContext();
////            }
////        } else if (hasMP4(out)) {//MP4
////            record.setFormat("mp4");
////            record.setVideoCodec(AV_CODEC_ID_H264);
////            record.setAudioCodec(AV_CODEC_ID_AAC);
////        }
        av_log_set_level(AV_LOG_DEBUG);
        record.start(grabber.getFormatContext());
        return this;
    }

    public void releaseAll() throws FrameRecorder.Exception, FrameGrabber.Exception {
        record.stop();
        record.release();
        grabber.stop();
        grabber.release();
    }

    /*
     * 是否包含rtmp或flv
     */
    private boolean hasRTMPFLV(String str) {
        return str.indexOf("rtmp") > -1 || str.indexOf("flv") > 0;
    }

    /*
     * 是否包含mp4
     */
    private boolean hasMP4(String str) {
        return str.indexOf("mp4") > 0;
    }

    /*
     * 是否包含rtsp
     */
    private boolean hasRTSP(String str) {
        return str.indexOf("rtsp") > -1;
    }

    /**
     *   * 转封装
     *   * @author eguid
     *   * @throws IOException
     *  
     */
    public PushBreakRuleVideo go() throws IOException {
        logger.info("PushBreakRuleVideo AVPacket go go go");
        long err_index = 0;// 采集或推流失败次数
        long now = System.currentTimeMillis();
        long starttime = now;
        long duration = 1000 * Global.getPushVideoLong();
        for (; (now - starttime) <= duration; now = System.currentTimeMillis()) {
            AVPacket pkt = null;
            try {
                //没有解码的音视频帧
                pkt = grabber.grabPacket();
                if (pkt == null || pkt.size() <= 0 || pkt.data() == null) {// 采集空包结束
                    if (err_index > 3) {// 超过三次则终止录制
                        break;
                    }
                    err_index++;
                    continue;
                }
                record.recordPacket(pkt);
            } catch (FrameGrabber.Exception e) {// 推流失败
                releaseAll();
                logger.error("PushBreakRuleVideo go error", e);
                throw e;
            } catch (IOException e) {
                releaseAll();
                logger.error("PushBreakRuleVideo go error", e);
                throw e;
            } finally {
                av_free_packet(pkt);
                pkt = null;
            }
        }
        releaseAll();
        logger.info("record pushVideo go go go end");
        return this;
    }


    public static void main(String[] args) throws IOException {
        ArrayList<String> strings = new ArrayList<>();
        strings.add("1");
        for (;;){
            try {
                if (strings.contains("1")){
                    strings.remove("1");
                    new PushBreakRuleVideo().from("rtmp://112.74.62.129:1935/normal/classroom01-camera01").to("rtmp://112.74.62.129:11935/violation-rule?vhost=violation-rule-record/classroom01-camera02 ").go();
                }
            }catch (Exception e){
                strings.add("1");
                e.printStackTrace();
            }
        }

    }

}
