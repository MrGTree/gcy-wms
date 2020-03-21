package com.thinkgem.jeesite.video.javacv;


import com.thinkgem.jeesite.common.config.Global;
import com.thinkgem.jeesite.video.javacv.Entity.DeskCreamer;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;
import java.time.LocalTime;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;


public class HttpApi {

    private static Logger logger = LoggerFactory.getLogger(HttpApi.class);

    private static String[] ports = null;

    private static int recTime = 0;

    private static String uri = "http://192.168.1.250";

    static {
        if(ports==null || ports.length==0){
            String s = Global.getConfig("video.monitor.deskCamera.port");
            ports = s.split(",");
        }
        if(recTime == 0){
            String recTimeStr = Global.getConfig("video.monitor.deskCamera.recTime");
            logger.warn("获取配置文件录制时长：{}",recTime);
            recTime = Integer.parseInt(recTimeStr.trim());
        }
    }

    public static void sendGet(DeskCreamer dc) throws Exception {
        if(dc==null){
            return;
        }
        //如果上次发送时间距离当前时间小于60（recTime）秒，返回
        long currentTimeMillis = System.currentTimeMillis();
        if(currentTimeMillis <= (Long.parseLong(dc.getLastSendTime()) + recTime*1000)){
            return;
        }else {
            dc.setLastSendTime(String.valueOf(currentTimeMillis));
        }
        BufferedReader br = null;
        try {
            String tempUrl = uri;
            int portSize = ports.length;
            int i = Integer.parseInt(dc.getDeskNo()) % portSize;
            if(dc.getDeskNo().length()==1){
                dc.setDeskNo("0"+dc.getDeskNo());
            }
            tempUrl += ":" + ports[i];
            tempUrl += "/index/api/addStreamProxy?vhost=__defaultVhost__&app=normal";
            tempUrl += "&stream=classroom"+dc.getClassRoom()+"-desktop"+ dc.getDeskNo();
            tempUrl += "&url=rtsp://admin:a1234567@"+dc.getIp();
            tempUrl += "&push_url=''&pull_time=" + recTime;
            tempUrl += "&enable_rtsp=1&enable_rtmp=1&rtp_type=0&secret=035c73f7-bb6b-4889-a715-d9eb2d1925cc";
            URL url = new URL(tempUrl);
            HttpURLConnection connection = (HttpURLConnection) url.openConnection();

            connection.setDoOutput(true); // 设置该连接是可以输出的
            connection.setRequestMethod("GET"); // 设置请求方式
            connection.setRequestProperty("Content-Type", "application/x-www-form-urlencoded; charset=UTF-8");

            br = new BufferedReader(new InputStreamReader(connection.getInputStream(), "utf-8"));
            String line = null;
            StringBuilder result = new StringBuilder();
            while ((line = br.readLine()) != null) { // 读取数据
                result.append(line + "\n");
            }
            connection.disconnect();
            System.out.println(result.toString());
            logger.warn("发送请求url:{}",tempUrl);
        } catch (Exception e) {
            e.printStackTrace();
        }finally {
            br.close();
        }
    }

    public static void main(String[] args) {
        String recTimeStr = Global.getConfig("video.monitor.deskCamera.recTime");
        System.out.println("获取录制时长："+recTimeStr);
        int i = Integer.parseInt(recTimeStr.trim());
        System.out.println(i);
        int hour = LocalTime.now().getHour();
        System.out.println(hour);
        try {
           // sendGet(deskCreamer);
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

}
