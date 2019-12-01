package com.thinkgem.jeesite.video.javacv;

import java.util.Date;

import static com.thinkgem.jeesite.common.config.Global.MESSAGE_TYPE_1;
import com.sensetime.ad.sdk.StCrowdDensityResult;
import com.thinkgem.jeesite.common.mapper.JsonMapper;
import com.thinkgem.jeesite.common.utils.DateUtils;
import com.thinkgem.jeesite.common.utils.SpringContextHolder;
import com.thinkgem.jeesite.video.javacv.Entity.Man;
import com.thinkgem.jeesite.video.javacv.Entity.MessageSend;
import com.thinkgem.jeesite.video.javacv.Entity.RuleBreak;
import com.thinkgem.jeesite.websocket.WsHandler;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.web.socket.TextMessage;

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
        logger.debug("{} BreakRulePushMessage start ", threadName);

        //保存图片
//            Mat image1 = new Mat(crowdResult.getWidth(),crowdResult.getHeight(), CvType.CV_8UC1);
//            image1.put(0,0,bytes);
//
//            Mat colorMat = VideoAnalizyUtils.visualize_dmap(image1, crowdResult);
//
//            String date = DateUtils.formatDateTime(new Date());
//            String fileName = camerName + "_" + date + "_" + IdGen.uuid();
//
//            logger.debug("{} BreakRulePushMessage save image ",threadName);
//            Imgcodecs.imwrite(Global.getImagePath() + fileName, colorMat);
        //推送通知
        Date date = new Date();
        RuleBreak ruleBreak = new RuleBreak(width, height, manOut, manIn, camerName);
        MessageSend messageSend = new MessageSend();
        messageSend.setCurrentTime(DateUtils.formatDateTime(date));
        messageSend.setMessageType(MESSAGE_TYPE_1);
        messageSend.setMessageValue(ruleBreak);
        SpringContextHolder.getBean(WsHandler.class).sendMessageToUsers(new TextMessage(JsonMapper.getInstance().toJson(messageSend)));

        logger.debug("{} BreakRulePushMessage end ", threadName);
    }
}
