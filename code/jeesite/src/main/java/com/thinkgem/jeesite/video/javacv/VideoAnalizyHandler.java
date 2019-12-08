package com.thinkgem.jeesite.video.javacv;

import java.util.*;

import com.thinkgem.jeesite.common.utils.SpringContextHolder;
import com.thinkgem.jeesite.video.javacv.Entity.UrlMapper;
import org.bytedeco.javacv.FrameGrabber;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;

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

    @Autowired
    private RevicedListCollection rc;

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
        Map<UrlMapper, ConvertVideoPakcet> convertVideoPakcetMap = SpringContextHolder.getBean("convertVideoPakcetMap");
        ConvertVideoPakcet convertVideoPakcet = convertVideoPakcetMap.get(urlMapper);
        logger.debug("convertVideoPakcetMap : {}", convertVideoPakcetMap);
        logger.debug("convertVideoPakcet : {}", convertVideoPakcet);
        try {
            if (convertVideoPakcet == null || convertVideoPakcet.grabber == null) {
                convertVideoPakcet = new ConvertVideoPakcet(urlMapper).from(urlMapper.getInputUrl());
                rc.setRevicedList(convertVideoPakcet);
                logger.debug("new ConvertVideoPakcet end");
            } else {
                convertVideoPakcet.grabber.restart();
                logger.debug("new ConvertVideoPakcet grabber restart");
            }
            //convertVideoPakcet.go();
        } catch (Exception e) {
            logger.error(threadName + " monitor fail:", e);

            Set<UrlMapper> urlMappers = SpringContextHolder.getBean("urlMapperSet");
            urlMappers.add(urlMapper);
            convertVideoPakcetMap.remove(urlMapper);
        } finally {
            if (convertVideoPakcet != null) {
                if (convertVideoPakcet.grabber != null) {
                    try {
                        convertVideoPakcet.grabber.stop();
                        convertVideoPakcet.grabber.close();
                        convertVideoPakcet.grabber.release();
                    } catch (FrameGrabber.Exception e) {
                        logger.error("convertVideoPakcet.grabber.stop :", e);
                    }
                }
                if (convertVideoPakcet.detector !=null){
                    convertVideoPakcet.detector.release();
                }
                convertVideoPakcet.grabber = null;
            }
        }
    }

}

