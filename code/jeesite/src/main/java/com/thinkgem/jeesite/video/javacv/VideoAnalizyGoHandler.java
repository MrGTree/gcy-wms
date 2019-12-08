package com.thinkgem.jeesite.video.javacv;

import com.thinkgem.jeesite.common.utils.SpringContextHolder;
import com.thinkgem.jeesite.video.javacv.Entity.UrlMapper;
import org.bytedeco.javacv.FrameGrabber;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;

import java.util.List;
import java.util.Map;
import java.util.Set;

/**
 * 商户缓存信息更新执行线程
 *
 * @author kfzx-hujy
 * @date 2018/12/1 13:58
 */
public class VideoAnalizyGoHandler implements Runnable {

    private Logger logger = LoggerFactory.getLogger(getClass());

    /**
     * 平台商户编号
     */

    @Autowired
    private RevicedListCollection rc;


    public VideoAnalizyGoHandler() {
    }


    @Override
    public void run() {
        String threadName = Thread.currentThread().getName();
        try {
            List<ConvertVideoPakcet> revicedList = rc.getRevicedList();
            for(ConvertVideoPakcet c : revicedList){
                c.go();
            }
        } catch (Exception e) {
            logger.error(threadName + " monitor go fail:", e);
        }
    }

}

