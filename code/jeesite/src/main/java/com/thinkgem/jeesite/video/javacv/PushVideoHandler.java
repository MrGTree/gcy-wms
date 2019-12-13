package com.thinkgem.jeesite.video.javacv;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

public class PushVideoHandler implements Runnable {

    private Logger logger = LoggerFactory.getLogger(getClass());

    private String rtmpUrl;

    public PushVideoHandler(String rtmpUrl) {
        this.rtmpUrl = rtmpUrl;
    }

    public PushVideoHandler() {
    }

    @Override
    public void run() {
        try {
            HttpMethodPushVideo.pushBreakRuleVideo(rtmpUrl);
        } catch (Exception e) {
            logger.error("fFmpegShellPushVideo.pushBreakRuleVideo:", e);
        }
    }
}
