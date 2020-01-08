package com.thinkgem.jeesite.video.javacv;

import com.thinkgem.jeesite.common.utils.SpringContextHolder;
import com.thinkgem.jeesite.video.javacv.Entity.DeskCreamer;
import org.apache.ibatis.thread.PropertiesUtil;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.context.annotation.Configuration;

import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Properties;


/**
 *
 *  提供静态方法，传入坐标，找到最近的那个摄像头，返回
 *
 */
public class DeskCreamerUtil {

    private static Map<String,List<DeskCreamer>> map = SpringContextHolder.getBean("deskCreamerMapList");

    public static DeskCreamer calcAndGetDeskCreamer(String creamerName, float x , float y){
        List<DeskCreamer> deskCreamers = map.get(creamerName);
        DeskCreamer minDistDC = getMinDistDC(deskCreamers, x, y);
        return minDistDC;
    }

    private static DeskCreamer getMinDistDC(List<DeskCreamer> deskCreamers, float x , float y){

        double minDistanct = 99999d;
        DeskCreamer lastestDc = null;

        for(DeskCreamer dc : deskCreamers){
            double distance = Math.sqrt(Math.pow((dc.getDcX() - x), 2) + Math.pow((dc.getDcY() - y), 2));
            if(distance<=minDistanct){
                lastestDc = dc;
                minDistanct =  distance;
            }
        }
        return lastestDc;

    }

}
