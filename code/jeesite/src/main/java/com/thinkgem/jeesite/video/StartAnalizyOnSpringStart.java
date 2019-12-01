package com.thinkgem.jeesite.video;


import java.util.Set;

import com.sensetime.ad.sdk.StLibrary;
import com.thinkgem.jeesite.common.config.Global;
import com.thinkgem.jeesite.common.utils.FileUtils;
import com.thinkgem.jeesite.common.utils.SpringContextHolder;
import com.thinkgem.jeesite.video.javacv.Entity.UrlMapper;
import com.thinkgem.jeesite.video.javacv.VideoAnalizyHandler;
import org.apache.commons.collections.CollectionUtils;
import org.opencv.core.Core;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.ApplicationContext;
import org.springframework.context.ApplicationListener;
import org.springframework.context.event.ContextRefreshedEvent;
import org.springframework.scheduling.concurrent.ThreadPoolTaskExecutor;
import org.springframework.stereotype.Component;

/**
 * 项目启动时就开启线程分析视频是否违规
 */
@Component
public class StartAnalizyOnSpringStart implements ApplicationListener<ContextRefreshedEvent> {

    private Logger logger = LoggerFactory.getLogger(getClass());

    @Autowired
    private ThreadPoolTaskExecutor threadPoolTaskExecutor;

    @Override
    public void onApplicationEvent(ContextRefreshedEvent event) {
        ApplicationContext applicationContext = event.getApplicationContext();
        ApplicationContext parent = applicationContext.getParent();
        //表示是Spring容易创建时
        if (parent == null) {

            System.loadLibrary(Core.NATIVE_LIBRARY_NAME);

            int[] retCode = new int[1];
            String lic = FileUtils.readToString(Global.getConfig("video.monitor.license.path"));
            String activeCode = StLibrary.onlineActivite("", lic, retCode);
            if (retCode[0] != 0) {
                logger.error("get online activation code failed, rc = " + retCode[0]);
            }
            retCode[0] = StLibrary.addLic("", lic, activeCode);
            if (retCode[0] != 0) {
                logger.error("add lic failed, rc = " + retCode[0]);
            }

            //服务器启动的时候，获取路径
            Set<UrlMapper> urlMappers = SpringContextHolder.getBean("urlMapperSet");
            if (CollectionUtils.isNotEmpty(urlMappers)) {

                // 每个用一个线程处理
                for (UrlMapper urlMapper : urlMappers) {
                    threadPoolTaskExecutor.execute(new VideoAnalizyHandler(urlMapper));
                }

            }

        }
    }

}
