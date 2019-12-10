package com.thinkgem.jeesite.video.javacv;

import com.sensetime.ad.sdk.StCrowdDensityResult;
import com.thinkgem.jeesite.common.config.Global;
import com.thinkgem.jeesite.common.mapper.JsonMapper;
import com.thinkgem.jeesite.common.utils.DateUtils;
import com.thinkgem.jeesite.common.utils.IdGen;
import com.thinkgem.jeesite.common.utils.SpringContextHolder;
import com.thinkgem.jeesite.common.utils.VideoAnalizyUtils;
import com.thinkgem.jeesite.video.javacv.Entity.Man;
import com.thinkgem.jeesite.video.javacv.Entity.MessageSend;
import com.thinkgem.jeesite.video.javacv.Entity.RuleBreak;
import com.thinkgem.jeesite.websocket.WsHandler;
import org.opencv.core.CvType;
import org.opencv.core.Mat;
import org.opencv.imgcodecs.Imgcodecs;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.web.socket.TextMessage;

import java.util.Date;

import static com.thinkgem.jeesite.common.config.Global.MESSAGE_TYPE_1;

/**
 * 另起线程通知和保存图片信息
 */
public class BreakRulePushMessage implements Runnable {

    private Logger logger = LoggerFactory.getLogger(getClass());

    private int width;
    private int height;
    private Man manOut;
    private Man manIn;
    private String camerName;
    private byte[] bytes;
    private StCrowdDensityResult crowdResult;

    public BreakRulePushMessage(int width, int height, Man manOut, Man manIn, String camerName, byte[] bytes, StCrowdDensityResult crowdResult) {
        this.width = width;
        this.height = height;
        this.manOut = manOut;
        this.manIn = manIn;
        this.camerName = camerName;
        this.bytes = bytes;
        this.crowdResult = crowdResult;
    }

    public BreakRulePushMessage() {
    }

    @Override
    public void run() {

        String threadName = Thread.currentThread().getName();
        logger.debug("{} BreakRulePushMessage start ,camerName:{}", threadName, camerName);
        Date date = new Date();
        Mat image1 = null;
        Mat colorMat = null;
        try {
            //保存图片
            image1 = new Mat(height, width, CvType.CV_8UC3);
            image1.put(0, 0, bytes);
            colorMat = VideoAnalizyUtils.visualize_dmap(image1, crowdResult,manIn,manOut);
            String dateStr = DateUtils.getDate("yyyy-MM-dd-HH:mm:ss");
            String fileName = Global.getImagePath() + camerName + "_" + dateStr + "_" + IdGen.uuid() + ".jpg";
            Imgcodecs.imwrite(fileName, colorMat);
            logger.info("save image success,camerName:{},fileName:{}", camerName, fileName);
        } catch (Exception e) {
            logger.error("{} save image fail:", camerName, e);
        } finally {
            if (image1 != null) {
                image1.release();
                image1=null;
            }
            if (colorMat != null){
                colorMat.release();
                colorMat=null;
            }
        }

        try {
            //推送通知
            RuleBreak ruleBreak = new RuleBreak(width, height, manOut, manIn, camerName);
            MessageSend messageSend = new MessageSend();
            messageSend.setCurrentTime(DateUtils.formatDateTime(date));
            messageSend.setMessageType(MESSAGE_TYPE_1);
            messageSend.setMessageValue(ruleBreak);
            SpringContextHolder.getBean(WsHandler.class).sendMessageToUsers(new TextMessage(JsonMapper.getInstance().toJson(messageSend)));
        } catch (Exception e) {
            logger.error("{} send message fail:", camerName, e);
        }
        logger.debug("{} BreakRulePushMessage end ,camerName:{}", threadName, camerName);
        return;
    }
}
