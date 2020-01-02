package com.thinkgem.jeesite.video.javacv;

import java.util.Date;
import java.util.HashMap;
import java.util.Map;
import java.util.Set;

import com.thinkgem.jeesite.common.config.Global;
import com.thinkgem.jeesite.common.mapper.JsonMapper;
import com.thinkgem.jeesite.common.utils.DateUtils;
import com.thinkgem.jeesite.common.utils.IdGen;
import com.thinkgem.jeesite.common.utils.SpringContextHolder;
import com.thinkgem.jeesite.common.utils.VideoAnalizyUtils;
import com.thinkgem.jeesite.video.javacv.Entity.VideoToPicture;
import com.thinkgem.jeesite.websocket.WsPictureHandler;
import org.opencv.core.CvType;
import org.opencv.core.Mat;
import org.opencv.imgcodecs.Imgcodecs;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.web.socket.TextMessage;

/**
 * 另起线程通知和保存图片信息
 */
public class PictureSaveAndSend implements Runnable {

    private Logger logger = LoggerFactory.getLogger(getClass());

    private Set<VideoToPicture> videoToPictureSet = SpringContextHolder.getBean("pakcetSet");

    @Override
    public void run() {
        while (true) {
            for (VideoToPicture videoToPicture : videoToPictureSet) {
                videoToPictureSet.remove(videoToPicture);
                String threadName = Thread.currentThread().getName();
                logger.debug("{} PictureSaveAndSend start ,camerName:{}", threadName, videoToPicture.getCamerName());
                Date date = new Date();
                Mat image1 = null;
                Mat colorMat = null;
                String fileName = "";
                try {
                    //保存图片
                    image1 = new Mat(videoToPicture.getHeight(), videoToPicture.getWidth(), CvType.CV_8UC3);
                    image1.put(0, 0, videoToPicture.getBytes());
                    colorMat = VideoAnalizyUtils.visualize_dmap(image1, videoToPicture.getCrowdResult(), null, null);
                    String dateStr = DateUtils.getDate("yyyy-MM-dd-HH:mm:ss");
                    fileName = Global.getNormalImagePath() + videoToPicture.getCamerName() + "_" + dateStr + "_" + IdGen.uuid() + ".jpg";
                    Imgcodecs.imwrite(fileName, colorMat);
                    logger.info("save image success,camerName:{},fileName:{}", videoToPicture.getCamerName(), fileName);
                } catch (Exception e) {
                    logger.error("{} save image fail:", videoToPicture.getCamerName(), e);
                } finally {
                    if (image1 != null) {
                        image1.release();
                        image1 = null;
                    }
                    if (colorMat != null) {
                        colorMat.release();
                        colorMat = null;
                    }
                }

                try {
                    //推送通知
                    Map<String, Object> messageSend = new HashMap<>();
                    messageSend.put("imageUrl", Global.getNormalUrlImagePath() + fileName);
                    SpringContextHolder.getBean(WsPictureHandler.class).sendMessageToCameraUsers(new TextMessage(JsonMapper.getInstance().toJson(messageSend)), videoToPicture.getCamerName());
                } catch (Exception e) {
                    logger.error("{} send message fail:", videoToPicture.getCamerName(), e);
                }
                logger.debug("{} BreakRulePushMessage end ,camerName:{}", threadName, videoToPicture.getCamerName());
            }
        }

    }
}
