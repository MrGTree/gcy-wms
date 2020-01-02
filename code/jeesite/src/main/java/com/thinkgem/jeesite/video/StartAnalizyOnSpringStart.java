package com.thinkgem.jeesite.video;


import java.util.Set;

import static org.bytedeco.ffmpeg.global.avutil.AV_LOG_ERROR;
import static org.bytedeco.ffmpeg.global.avutil.av_log_set_level;
import com.sensetime.ad.sdk.StLibrary;
import com.thinkgem.jeesite.common.config.Global;
import com.thinkgem.jeesite.common.utils.FileUtils;
import com.thinkgem.jeesite.common.utils.SpringContextHolder;
import com.thinkgem.jeesite.common.utils.StringUtils;
import com.thinkgem.jeesite.video.javacv.Entity.UrlMapper;
import com.thinkgem.jeesite.video.javacv.PictureSaveAndSend;
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

            //Physical memory usage is too high: physicalBytes > maxPhysicalBytes
            //https://stackoverflow.com/questions/44598965/physical-memory-usage-is-too-high
            System.loadLibrary(Core.NATIVE_LIBRARY_NAME);
            System.setProperty("org.bytedeco.javacpp.maxphysicalbytes", "0");
            System.setProperty("org.bytedeco.javacpp.maxbytes", "0");
            av_log_set_level(AV_LOG_ERROR);
            int[] retCode = new int[1];
            String lic = FileUtils.readToString(Global.getConfig("video.monitor.license.path"));
            String activeCode = FileUtils.readToString(Global.getConfig("video.monitor.activecode.path"));
            if (StringUtils.isBlank(activeCode)){
                activeCode = StLibrary.onlineActivite("", lic, retCode);
                FileUtils.writeToFile(Global.getConfig("video.monitor.activecode.path"),activeCode,false);
            }
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
                    urlMappers.remove(urlMapper);
                    threadPoolTaskExecutor.execute(new VideoAnalizyHandler(urlMapper));
                }

                threadPoolTaskExecutor.execute(new PictureSaveAndSend());

            }

        }
    }

}
