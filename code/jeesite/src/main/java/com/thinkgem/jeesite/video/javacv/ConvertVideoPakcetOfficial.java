package com.thinkgem.jeesite.video.javacv;


import com.sensetime.ad.core.StCrowdDensityDetector;
import com.sensetime.ad.core.StFaceException;
import com.sensetime.ad.sdk.StCrowdDensityResult;
import com.sensetime.ad.sdk.StImageFormat;
import com.thinkgem.jeesite.common.config.Global;
import com.thinkgem.jeesite.common.mapper.JsonMapper;
import com.thinkgem.jeesite.common.utils.SpringContextHolder;
import com.thinkgem.jeesite.common.utils.VideoAnalizyUtils;
import com.thinkgem.jeesite.video.javacv.Entity.CloseRelation;
import com.thinkgem.jeesite.video.javacv.Entity.Man;
import com.thinkgem.jeesite.video.javacv.Entity.UrlMapper;
import org.bytedeco.javacv.FFmpegFrameGrabber;
import org.bytedeco.javacv.Frame;
import org.bytedeco.javacv.FrameGrabber;
import org.bytedeco.javacv.FrameGrabber.Exception;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import java.nio.ByteBuffer;
import java.util.HashMap;
import java.util.Map;
import java.util.Set;

/**
 *  * rtsp转rtmp（转封装方式）
 *  * @author
 * <p>
 * office  7min 4.2G 250 cpu
 *  
 */
public class ConvertVideoPakcetOfficial {

    private Logger logger = LoggerFactory.getLogger(getClass());

    FFmpegFrameGrabber grabber = null;
    int width = -1, height = -1;


    private UrlMapper urlMapper;
    private Float useScore;
    private Float tooCloseValue;
    protected long framerate;
    private long videoLength;

    StCrowdDensityDetector detector;


    public ConvertVideoPakcetOfficial() {
    }

    public ConvertVideoPakcetOfficial(UrlMapper urlMapper) {
        this.urlMapper = urlMapper;
    }

    private String modelPath;

    {
        modelPath = Global.getModelPath();
        tooCloseValue = Global.getTooCloseValue();
        useScore = Global.getUseScore();
        videoLength = Global.getPushVideoLong();
        try {
            detector = new StCrowdDensityDetector(modelPath);
        } catch (StFaceException e) {
            logger.error("new StCrowdDensityDetector", e);
        }
    }


    /**
     * free all struct
     */
    public void freeAndClose() {
        if (grabber != null) {
            try {
                grabber.stop();
                grabber.release();
                grabber.close();
                grabber = null;
            } catch (Exception e) {
                logger.error("{}stop grabber error:", urlMapper.getInputUrl(), e);
            }
        }
    }

    /**
     *   * 选择视频源
     *   * @param src
     *   * @author eguid
     *   * @throws Exception
     *  
     */
    public ConvertVideoPakcetOfficial from(String src) throws Exception {
        logger.debug("monitor from url:{}" + src);
        // 采集/抓取器
        grabber = new FFmpegFrameGrabber(src);
        if (hasRTSP(src)) {
            grabber.setOption("rtsp_transport", "tcp");
        }
        grabber.setOption("fflags","nobuffer");
        grabber.start();// 开始之后ffmpeg会采集视频信息，之后就可以获取音视频信息
        if (width < 0 || height < 0) {
            width = grabber.getImageWidth();
            height = grabber.getImageHeight();
        }
        //RGB 图片模式
        grabber.setImageMode(FrameGrabber.ImageMode.GRAY);
        framerate = new Double(grabber.getVideoFrameRate()).longValue();
        // 视频参数
        logger.debug("{} ,width is {},heigth is {}", src, width, height);
        Map<UrlMapper, ConvertVideoPakcetOfficial> convertVideoPakcetMap = SpringContextHolder.getBean("convertVideoPakcetMap");
        convertVideoPakcetMap.put(urlMapper, this);
        return this;
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
    public ConvertVideoPakcetOfficial go() {
        long err_index = 0;//采集或推流导致的错误次数
        //连续五次没有采集到帧则认为视频采集结束，程序错误次数超过1次即中断程序
        logger.debug("analizy go go go go ");
        //分析时违规记录
        HashMap<Man, CloseRelation> closeRelationMap = new HashMap<>();

        long no_frame_index = 0;
        long pktCount = 0;
        //for循环获取视频帧
        for (; err_index < 5; ) {
            if (no_frame_index > 40) {
                logger.error("{},no_frame_index:{},grabber.restart", no_frame_index, urlMapper.getInputUrl());
                try {
                    grabber.restart();
                    logger.info("{},grabber.restart ", urlMapper.getInputUrl());
                    no_frame_index = 0;
                } catch (Exception e) {
                    err_index++;
                    logger.error("analizy video error :" + e);
                }
            }
            //获取分析开始，总时间需要一秒
            try {
                grabber.trigger();
                grabber.flush();
                //没有解码的音视频帧
                Frame imageFrame = grabber.grabImage();
                if (imageFrame == null || imageFrame.image.length <= 0 || imageFrame.image[0] == null) {
                    //空包记录次数跳过
                    no_frame_index++;
                    logger.debug("analizy no_frame_index is:{}", no_frame_index);
                    continue;
                }
                ByteBuffer imagebuffer = (ByteBuffer) imageFrame.image[0];
                imagebuffer.flip();
                //6 根据缓冲区的数据长度创建相应大小的byte数组，接收缓冲区的数据
                byte[] bytes = new byte[imagebuffer.remaining()];
                //7 接收缓冲区数据
                imagebuffer.get(bytes);
                //把需要解码的视频帧送进解码器
                logger.info("closeRelationMap---------->{}", closeRelationMap);
                StCrowdDensityResult crowdResult = detector.track(bytes, StImageFormat.ST_PIX_FMT_BGR888, width, height);
                logger.info("track success.crowdResult.Width:{},Height:{},Number of People:{},Number of keypoints:{},keypoints:{}", crowdResult.getWidth(), crowdResult.getHeight(), crowdResult.getNumberOfPeople(), crowdResult.getKeypointCount(), JsonMapper.getInstance().toJson(crowdResult.getKeypoints()));
                //大与两个人
                if (crowdResult != null && 1 < crowdResult.getNumberOfPeople()) {
                    if (VideoAnalizyUtils.judgeVideo(VideoAnalizyUtils.crowdResultToManList(crowdResult, urlMapper, useScore), closeRelationMap, tooCloseValue, urlMapper, width, height, bytes, crowdResult,width,height)) {
                        pktCount = (videoLength * framerate);
                    } else {
                        pktCount = framerate;
                    }
                } else {
                    pktCount = framerate;

                }
                while (pktCount > 0) {
                    grabber.grabImage();
                    pktCount--;
                }
            } catch (Exception e) {
                err_index++;
                logger.error("analizy video error :" + e);
            } catch (StFaceException e) {
                err_index++;
                logger.error("analizy video error :" + e);
            } finally {

            }
            logger.info("analizy one second end ");
        }
        logger.info("{}go loop finish !!!,err_index:{},no_frame_index:{}", urlMapper.getInputUrl(), err_index, no_frame_index);
        Set<UrlMapper> urlMappers = SpringContextHolder.getBean("urlMapperSet");
        urlMappers.add(urlMapper);
        return this;
    }


}
