package com.thinkgem.jeesite.video.javacv;

import com.thinkgem.jeesite.video.javacv.Entity.UrlMapper;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

/**
 * 另起线程通知和保存图片信息
 */
public class PictureSaveAndSend implements Runnable {

    private Logger logger = LoggerFactory.getLogger(getClass());

    private UrlMapper urlMapper;

    public PictureSaveAndSend(UrlMapper urlMapper) {
        this.urlMapper = urlMapper;
    }

    public PictureSaveAndSend() {
    }

    @Override
    public void run() {
        ConvertVideoPakcetPicture ConvertVideoPakcetPicture = null;
        try {
            ConvertVideoPakcetPicture = new ConvertVideoPakcetPicture(urlMapper).from(urlMapper.getInputUrl()).go();
        } catch (Exception e) {
            logger.error("PictureSaveAndSend", e);
        } finally {
            if (ConvertVideoPakcetPicture != null) {
                ConvertVideoPakcetPicture.freeAndClose();
                if (ConvertVideoPakcetPicture.detector != null) {
                    ConvertVideoPakcetPicture.detector.release();
                }
            }
        }
    }
}
