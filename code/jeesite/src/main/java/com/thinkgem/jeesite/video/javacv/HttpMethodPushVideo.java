package com.thinkgem.jeesite.video.javacv;


import java.util.HashMap;
import java.util.Map;
import java.util.concurrent.ConcurrentHashMap;

import com.thinkgem.jeesite.common.config.Global;
import com.thinkgem.jeesite.common.utils.SpringContextHolder;
import com.thinkgem.jeesite.common.utils.StringUtils;
import com.thinkgem.jeesite.video.javacv.Entity.PushVideoReturn;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.client.RestTemplate;

public class HttpMethodPushVideo {

    private static Logger logger = LoggerFactory.getLogger(HttpMethodPushVideo.class);

    private static Map<String, Object> requestMap = new ConcurrentHashMap<>(8);

    private static RestTemplate restTemplate = SpringContextHolder.getBean("restTemplate");

    private static String pushVideoUrl = Global.getConfig("video.monitor.push.rule.url");


    static {
        requestMap.put("type", 1);
        requestMap.put("vhost", "__defaultVhost__");
        requestMap.put("app", "normal");
        requestMap.put("wait_for_record", 0);
        requestMap.put("record_time", Global.getPushVideoLong());
        requestMap.put("continue_record", 0);
    }


    public static boolean pushBreakRuleVideo(String rtmpUrl) {
        logger.info("pushBreakRuleVideo go go go  start ");
        //http://127.0.0.1:9088/index/api/startRecord\?type\=1\&vhost\=__defaultVhost__\&app\=normal\&stream\=classroom01-camera01\&wait_for_record\=1\&continue_record\=1\&record_time\=30
        //type	Y	0为hls，1为mp4
        //vhost	Y	虚拟主机，例如__defaultVhost__	string
        //app	Y	应用名，例如 live
        //stream	Y	流id，例如 obs
        //wait_for_record	Y	1代表等待流注册后再录制，置0在流未注册时返回失败	0/1
        //continue_record	Y	流注销时是否继续等待录制还是立即停止录制	0/1
        Map<String, Object> reqMap = new HashMap<>(requestMap);
        reqMap.put("stream", StringUtils.substringAfterLast(rtmpUrl, "/"));
        logger.info("reqMap:{},pushVideoUrl:{}", reqMap, pushVideoUrl);
        ResponseEntity<PushVideoReturn> response = restTemplate.getForEntity(pushVideoUrl, PushVideoReturn.class, reqMap);
        logger.info("response:{}", response);
        if (HttpStatus.OK.equals(response.getStatusCode())) {
            PushVideoReturn body = response.getBody();
            if (body.getResult() == 0) {
                return true;
            }
        }
        logger.info("pushBreakRuleVideo go go go end ");
        return false;
    }

}
