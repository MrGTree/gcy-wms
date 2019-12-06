package com.thinkgem.jeesite.video.javacv;

import java.util.Map;
import java.util.Set;

import com.thinkgem.jeesite.common.utils.SpringContextHolder;
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
        Map<UrlMapper, ConvertVideoPakcet> convertVideoPakcetMap = SpringContextHolder.getBean("convertVideoPakcetMap");
        ConvertVideoPakcet convertVideoPakcet = convertVideoPakcetMap.get(urlMapper);
        try {
            if (convertVideoPakcet == null) {
                convertVideoPakcet = new ConvertVideoPakcet(urlMapper).from(urlMapper.getInputUrl());
                convertVideoPakcetMap.put(urlMapper, convertVideoPakcet);
            } else {
                convertVideoPakcet.grabber.restart();
            }
        } catch (Exception e) {
            logger.error(threadName + " monitor fail:", e);

            Set<UrlMapper> urlMappers = SpringContextHolder.getBean("urlMapperSet");
            urlMappers.add(urlMapper);
        } finally {
            if (convertVideoPakcet != null) {
                convertVideoPakcet.freeAndClose();
                if (convertVideoPakcet.detector != null) {
                    convertVideoPakcet.detector.release();
                }
                convertVideoPakcet.grabber = null;
            }
            convertVideoPakcetMap.remove(urlMapper);
        }
        convertVideoPakcet.go();
    }
}

