package com.thinkgem.jeesite.common.utils;

import com.sensetime.ad.sdk.StCrowdDensityResult;
import com.sensetime.ad.sdk.StPointF;
import com.thinkgem.jeesite.video.javacv.BreakRulePushMessage;
import com.thinkgem.jeesite.video.javacv.Entity.CloseMan;
import com.thinkgem.jeesite.video.javacv.Entity.CloseRelation;
import com.thinkgem.jeesite.video.javacv.Entity.Man;
import com.thinkgem.jeesite.video.javacv.Entity.UrlMapper;
import com.thinkgem.jeesite.video.javacv.Entity.VideoToPicture;
import com.thinkgem.jeesite.video.javacv.PictureSaveAndSend;
import com.thinkgem.jeesite.video.javacv.PushVideoHandler;
import org.apache.commons.collections.CollectionUtils;
import org.opencv.core.Core;
import org.opencv.core.Mat;
import org.opencv.core.Point;
import org.opencv.core.Scalar;
import org.opencv.imgproc.Imgproc;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.scheduling.concurrent.ThreadPoolTaskExecutor;

import java.util.ArrayList;
import java.util.HashSet;
import java.util.List;
import java.util.Map;
import java.util.Objects;
import java.util.Set;

import static org.opencv.core.Core.addWeighted;
import static org.opencv.core.CvType.CV_32F;
import static org.opencv.core.CvType.CV_8UC3;
import static org.opencv.imgproc.Imgproc.COLORMAP_JET;
import static org.opencv.imgproc.Imgproc.FONT_HERSHEY_SIMPLEX;

/**
 * @author liuji
 * @create 2019-11-28 18:39
 */
public class VideoAnalizyUtils {

    private static Logger logger = LoggerFactory.getLogger(VideoAnalizyUtils.class);

    private static ThreadPoolTaskExecutor threadPoolTaskExecutor = SpringContextHolder.getBean("threadPoolTaskExecutor");

    private static Set<VideoToPicture> videoToPictureSet = SpringContextHolder.getBean("pakcetSet");

    private static final Scalar white = new Scalar(255, 255, 255);//白色
    private static final Scalar red = new Scalar(0, 0, 255);//红色
    private static final Scalar blue = new Scalar(255, 0, 0);//蓝色

    public  static  volatile  boolean pictureThreadOpen = false;


    public static List<Man> crowdResultToManList(StCrowdDensityResult crowdResult, UrlMapper urlMapper, Float useScore) {
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
        return manList;
    }

    public static boolean judgeVideo(List<Man> manList, Map<Man, CloseRelation> closeRelationMap, Float tooCloseValue, UrlMapper urlMapper, int width, int height, byte[] bytes, StCrowdDensityResult crowdResult) {
        if (manList == null || manList.isEmpty()) {
            return false;
        }
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
                                    logger.error("analizy break the rule !!!WARNING! camera {} this man {} too close with {} last {} ,distance is {}", urlMapper.getCamerName(), manOut, manIn, time + 1, distance);
                                    threadPoolTaskExecutor.execute(new BreakRulePushMessage(width, height, manOut, manIn, urlMapper.getCamerName(), bytes, crowdResult));
                                    threadPoolTaskExecutor.execute(new PushVideoHandler(urlMapper));
                                    //清空map
                                    closeRelationMap.clear();
                                    return true;
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
        return false;
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

    public static Mat visualize_dmap(Mat ori_img, StCrowdDensityResult crowd_result, Man manIn, Man manOut) {
        Mat dmap = null;
        Mat color_dmap = null;
        Mat base_img = null;
        try {
            dmap = new Mat(crowd_result.getHeight(), crowd_result.getWidth(), CV_32F);
            dmap.put(0, 0, crowd_result.getDensityMap());
            // normalize dmap
            Core.MinMaxLocResult minMaxLoc = Core.minMaxLoc(dmap);
            dmap = dmap.mul(dmap, 1 / minMaxLoc.maxVal);
            dmap.convertTo(dmap, CV_8UC3, 255);
            // gen color map and resize
            color_dmap = new Mat();
            Imgproc.applyColorMap(dmap, color_dmap, COLORMAP_JET);
            Imgproc.resize(color_dmap, color_dmap, ori_img.size());
            // add weight for visualize
            Mat vis_dmap = new Mat(ori_img.rows(), ori_img.cols(), ori_img.type());
            base_img = ori_img.clone();

            float alpha = 0.5f;
            addWeighted(color_dmap, alpha, base_img, 1 - alpha, 0, vis_dmap);

            // draw keypoint
            StPointF[] pts = crowd_result.getKeypoints();
            for (int i = 0; i < crowd_result.getKeypointCount(); ++i) {
                Imgproc.circle(
                        vis_dmap,
                        new Point(pts[i].x, pts[i].y),
                        3, white, -1);
                Imgproc.putText(vis_dmap, String.format("%.2f", crowd_result.getPointsScore()[i]),
                        new Point(pts[i].x, pts[i].y - 5),
                        FONT_HERSHEY_SIMPLEX, 1, blue,
                        2, 8, false);
            }
            if (Objects.nonNull(manIn)) {
                Imgproc.circle(vis_dmap, new Point(manIn.getX(), manIn.getY()), 3, red, -1);
            }
            if (Objects.nonNull(manOut)) {
                Imgproc.circle(vis_dmap, new Point(manOut.getX(), manOut.getY()), 3, red, -1);
            }
            logger.info("visualize_dmap ... end ....");
            return vis_dmap;
        } finally {
            if (dmap != null) {
                dmap.release();
                dmap = null;
            }
            if (color_dmap != null) {
                color_dmap.release();
                color_dmap = null;
            }
            if (base_img != null) {
                base_img.release();
                base_img = null;
            }
        }
    }

    public static void getPictureAndSend(int width, int height, String camerName, byte[] bytes, StCrowdDensityResult crowdResult) {
        videoToPictureSet.add(new VideoToPicture(width, height, camerName, bytes, crowdResult));
        if (!pictureThreadOpen){
            logger.error("pictureThreadOpen -------------,camerName:{}",camerName);
            threadPoolTaskExecutor.execute(new PictureSaveAndSend());
            pictureThreadOpen = true;
        }
    }
}
