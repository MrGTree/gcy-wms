package com.thinkgem.jeesite.video.javacv;

import com.thinkgem.jeesite.video.javacv.Entity.UrlMapper;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

public class PushVideoHandler implements Runnable {

    private Logger logger = LoggerFactory.getLogger(getClass());

    private UrlMapper urlMapper;

    public PushVideoHandler(UrlMapper urlMapper) {
        this.urlMapper = urlMapper;
    }

    public PushVideoHandler() {
    }

    @Override
    public void run() {
        try {
            HttpMethodPushVideo.pushBreakRuleVideo(urlMapper);
        } catch (Exception e) {
            logger.error("fFmpegShellPushVideo.pushBreakRuleVideo:", e);
        }
    }
}
