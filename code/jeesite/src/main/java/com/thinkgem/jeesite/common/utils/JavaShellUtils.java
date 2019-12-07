package com.thinkgem.jeesite.common.utils;

import java.io.IOException;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

public class JavaShellUtils {

    public static final String pushVideoShellFrom = "/home/software/srs.oschina/trunk/objs/ffmpeg.src/_release/bin/./ffmpeg -i ";
    public static final String pushVideoShell1To = " -vcodec h264 -profile:v baseline -acodec copy -f flv -y ";

    private static Logger logger = LoggerFactory.getLogger(VideoAnalizyUtils.class);

    public static Process execute(String command) {

        Process pro = null;
        Runtime runTime = Runtime.getRuntime();
        if (runTime == null) {
            logger.error("Create runtime false!");
        }
        try {
            logger.info("exec before ------------- ");
            pro = runTime.exec(command);
            logger.info("exec end ------------- ");
        } catch (IOException ex) {
            logger.error("runTime.exec error:{}", ex);
        }
        return pro;
    }
}