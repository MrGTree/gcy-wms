package com.thinkgem.jeesite.video.javacv;


import java.nio.ByteBuffer;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.HashSet;
import java.util.Map;
import java.util.Set;

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
import com.thinkgem.jeesite.video.javacv.Entity.UrlMapper;
import org.bytedeco.javacv.FFmpegFrameGrabber;
import org.bytedeco.javacv.Frame;
import org.bytedeco.javacv.FrameGrabber;
import org.bytedeco.javacv.FrameGrabber.Exception;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.scheduling.concurrent.ThreadPoolTaskExecutor;

/**
 *  * rtsp转rtmp（转封装方式）
 *  * @author
 *
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
    protected long framerateL = 25;
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
        grabber.start();// 开始之后ffmpeg会采集视频信息，之后就可以获取音视频信息
        if (width < 0 || height < 0) {
            width = grabber.getImageWidth();
            height = grabber.getImageHeight();
        }
        //RGB 图片模式
        grabber.setImageMode(FrameGrabber.ImageMode.GRAY);
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
            long pktCount = framerateL;
            try {
                grabber.trigger();
                grabber.flush();
                while (pktCount > 0) {
                    grabber.grabImage();
                    pktCount--;
                }
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
                    StPointF[] keypoints = crowdResult.getKeypoints();
                    //初始化有效的manList
                    ArrayList<Man> manList = new ArrayList<>();
                    if (keypoints != null && keypoints.length > 1) {
                        for (int j = 0; j < keypoints.length; j++) {
                            float[] pointsScore = crowdResult.getPointsScore();
                            float score = pointsScore[j];
                            if (score >= useScore && urlMapper.getMinX() <= keypoints[j].x && keypoints[j].x <= urlMapper.getMaxX() &&
                                    urlMapper.getMinY() <= keypoints[j].y && keypoints[j].y <= urlMapper.getMaxY()) {
                                manList.add(new Man(keypoints[j].x, keypoints[j].y));
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
                                            int time = closeManOn.getTime();
                                            if (time >= 6) {
                                                //违规了，发流等待 5 分钟 manOut + " | " + man + "|" + time + "|" + distance
                                                logger.error("analizy break the rule !!!WARNING! this man {} too close with {} last {} ,distance is {}", manOut, manIn, time + 1, distance);
                                                //另起线程推消息,存图片
                                                ((ThreadPoolTaskExecutor) SpringContextHolder.getBean("threadPoolTaskExecutor")).execute(new BreakRulePushMessage(width, height, manOut, manIn, urlMapper.getCamerName(), bytes, crowdResult));
                                                //另起线程，录制视频
                                                ((ThreadPoolTaskExecutor) SpringContextHolder.getBean("threadPoolTaskExecutor")).execute(new PushVideoHandler(urlMapper));
                                                //清空map
                                                closeRelationMap.clear();
                                                //轮空跑
                                                long pushPktCount = videoLength * framerateL;
                                                while (pushPktCount > 0) {
                                                    grabber.grabImage();
                                                    pushPktCount--;
                                                }
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
                                            continue;
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
