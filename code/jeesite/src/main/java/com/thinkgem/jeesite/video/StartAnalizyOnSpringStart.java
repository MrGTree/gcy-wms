package com.thinkgem.jeesite.video;


import com.thinkgem.jeesite.common.utils.SpringContextHolder;
import com.thinkgem.jeesite.video.javacv.UrlMapper;
import com.thinkgem.jeesite.video.javacv.VideoAnalizyHandler;
import org.apache.commons.collections.CollectionUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.context.ApplicationContext;
import org.springframework.context.ApplicationListener;
import org.springframework.context.event.ContextRefreshedEvent;
import org.springframework.stereotype.Component;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.util.Set;
import java.util.concurrent.ExecutorService;
import java.util.concurrent.Executors;

/**
 * 项目启动时就开启线程分析视频是否违规
 */
@Component
public class StartAnalizyOnSpringStart implements ApplicationListener<ContextRefreshedEvent> {

    private Logger logger = LoggerFactory.getLogger(getClass());

    @Override
    public void onApplicationEvent(ContextRefreshedEvent event) {
        ApplicationContext applicationContext = event.getApplicationContext();
        ApplicationContext parent = applicationContext.getParent();
        //表示是Spring容易创建时
        if (parent == null) {
            //服务器启动的时候，获取路径

            Set<UrlMapper> urlMappers = SpringContextHolder.getBean("urlMapperSet");
            if (CollectionUtils.isNotEmpty(urlMappers)) {

//                    int[] retCode = new int[1];
//                    String lic = readToString(Global.getConfig("video.monitor.LICENSE_PATH"));
//                    String activeCode = StLibrary.onlineActivite("", lic, retCode);
//                    if (retCode[0] != 0) {
//                        logger.error("get online activation code failed, rc = " + retCode[0]);
//                        return;
//                    }
//                    retCode[0] = StLibrary.addLic("", lic, activeCode);
//                    if (retCode[0] != 0) {
//                        logger.error("add lic failed, rc = " + retCode[0]);
//                        return;
//                    }

                // 允许创建程数
                int nThreads = 16;
                // 定义固定数量线程池
                ExecutorService pool = Executors.newFixedThreadPool(urlMappers.size());

                // 每个用一个线程处理
                for (UrlMapper urlMapper : urlMappers) {
                    pool.execute(new VideoAnalizyHandler(urlMapper));
                }

                pool.shutdown();

            }

        }
    }


    public static String readToString(String fileName) {
        String encoding = "UTF-8";
        File file = new File(fileName);
        long filelength = file.length();
        byte[] filecontent = new byte[(int) filelength];
        try {
            FileInputStream in = new FileInputStream(file);
            in.read(filecontent);
            in.close();
        } catch (FileNotFoundException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }
        try {
            return new String(filecontent, encoding);
        } catch (UnsupportedEncodingException e) {
            System.err.println("The OS does not support " + encoding);
            e.printStackTrace();
            return null;
        }
    }
}
