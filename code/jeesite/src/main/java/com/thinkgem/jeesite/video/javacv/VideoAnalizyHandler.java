package com.thinkgem.jeesite.video.javacv;

import com.thinkgem.jeesite.video.javacv.Entity.UrlMapper;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

/**
 * 商户缓存信息更新执行线程
 *
 * @author kfzx-hujy
 * @date 2018/12/1 13:58
 */
public class VideoAnalizyHandler implements Runnable {

    private Logger logger = LoggerFactory.getLogger(getClass());

    /**
     * 平台商户编号
     */
    private UrlMapper urlMapper;

    public VideoAnalizyHandler() {
    }

    public VideoAnalizyHandler(UrlMapper urlMapper) {
        this.urlMapper = urlMapper;
    }

    @Override
    public void run() {
        String threadName = Thread.currentThread().getName();
        logger.debug(threadName + " monitor start update");
        try {
            new ConvertVideoPakcet(urlMapper).from(urlMapper.getInputUrl()).go();
        } catch (Exception e) {
            logger.error(threadName + " monitor fail:" + e.getMessage(), e);
        }
        return;
    }
}

