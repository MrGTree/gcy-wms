package com.thinkgem.jeesite.video.javacv;

import static com.thinkgem.jeesite.common.utils.JavaShellUtils.pushVideoShell1To;
import static com.thinkgem.jeesite.common.utils.JavaShellUtils.pushVideoShellFrom;
import com.thinkgem.jeesite.common.config.Global;
import com.thinkgem.jeesite.common.utils.JavaShellUtils;
import com.thinkgem.jeesite.video.javacv.Entity.UrlMapper;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

public class FFmpegShellPushVideo {

    private UrlMapper urlMapper;

    private static Logger logger = LoggerFactory.getLogger(FFmpegShellPushVideo.class);

    public FFmpegShellPushVideo(UrlMapper urlMapper) {
        this.urlMapper = urlMapper;
    }

    public FFmpegShellPushVideo() {
    }

    public void pushBreakRuleVideo() {
        logger.info("pushBreakRuleVideo go go go  start ");
        Process execute = null;
        try {
            String s = pushVideoShellFrom + urlMapper.getInputUrl() + pushVideoShell1To + urlMapper.getOutPutUrl();
            execute = JavaShellUtils.execute(s);
            Thread.sleep(1000 * Global.getPushVideoLong());
        } catch (InterruptedException e) {
            logger.info("FFmpegShellPushVideo pushBreakRuleVideo sleep error :" + e);
            Thread.currentThread().interrupt();
        } finally {
            if (execute != null) {
                execute.destroy();
            }
        }
        logger.info("pushBreakRuleVideo go go go end ");
    }
}
