package com.thinkgem.jeesite.video.javacv;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

public class PushVideoHandler implements Runnable {

    private Logger logger = LoggerFactory.getLogger(getClass());

    private FFmpegShellPushVideo fFmpegShellPushVideo;

    public PushVideoHandler(FFmpegShellPushVideo fFmpegShellPushVideo) {
        this.fFmpegShellPushVideo = fFmpegShellPushVideo;
    }

    public PushVideoHandler() {
    }


    @Override
    public void run() {
        try {
            fFmpegShellPushVideo.pushBreakRuleVideo();
        } catch (Exception e) {
            logger.error("fFmpegShellPushVideo.pushBreakRuleVideo:", e);
        }
    }
}
