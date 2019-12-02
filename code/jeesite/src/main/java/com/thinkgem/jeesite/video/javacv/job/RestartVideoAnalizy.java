package com.thinkgem.jeesite.video.javacv.job;

import java.util.Set;

import com.thinkgem.jeesite.common.utils.SpringContextHolder;
import com.thinkgem.jeesite.video.javacv.Entity.UrlMapper;
import com.thinkgem.jeesite.video.javacv.VideoAnalizyHandler;
import org.apache.commons.collections.CollectionUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Lazy;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.scheduling.concurrent.ThreadPoolTaskExecutor;
import org.springframework.stereotype.Service;

@Service
@Lazy(value = false)
public class RestartVideoAnalizy {

    private Logger logger = LoggerFactory.getLogger(getClass());

    @Autowired
    private ThreadPoolTaskExecutor threadPoolTaskExecutor;

    @Scheduled(cron = "0/5 * * * * ?")
    public void startVideoAnalizy(){
        Set<UrlMapper> urlMappers = SpringContextHolder.getBean("urlMapperSet");
        logger.debug("startVideoAnalizy run urlMapple:{}",urlMappers);

        if (CollectionUtils.isNotEmpty(urlMappers)) {
            for (UrlMapper urlMapper : urlMappers) {
                urlMappers.remove(urlMapper);
                threadPoolTaskExecutor.execute(new VideoAnalizyHandler(urlMapper));
            }

        }

    }


}
