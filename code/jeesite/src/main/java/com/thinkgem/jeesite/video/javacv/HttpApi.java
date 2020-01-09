package com.thinkgem.jeesite.video.javacv;


import com.thinkgem.jeesite.video.javacv.Entity.DeskCreamer;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;


public class HttpApi {

    private static Logger logger = LoggerFactory.getLogger(HttpApi.class);

    private static final String[] ports = {"9088","9089","9090"};

    private static String uri = "http://192.168.1.250";

    public static void sendGet(DeskCreamer dc) throws Exception {
        try {
            int i = Integer.parseInt(dc.getDeskNo()) % 3;
            uri += ":" + ports[i];
            uri += "/index/api/addStreamProxy?vhost=__defaultVhost__&app=normal";
            uri += "&stream=classroom"+dc.getClassRoom()+"-camera"+dc.getCreamerName();
            uri += "&url=rtsp://admin:a1234567@"+dc.getIp();
            uri += "&push_url=''&pull_time=300&enable_rtsp=1&enable_rtmp=1&rtp_type=0&secret=035c73f7-bb6b-4889-a715-d9eb2d1925cc";
            URL url = new URL(uri);
            HttpURLConnection connection = (HttpURLConnection) url.openConnection();

            connection.setDoOutput(true); // 设置该连接是可以输出的
            connection.setRequestMethod("GET"); // 设置请求方式
            connection.setRequestProperty("Content-Type", "application/x-www-form-urlencoded; charset=UTF-8");

            BufferedReader br = new BufferedReader(new InputStreamReader(connection.getInputStream(), "utf-8"));
            String line = null;
            StringBuilder result = new StringBuilder();
            while ((line = br.readLine()) != null) { // 读取数据
                result.append(line + "\n");
            }
            connection.disconnect();

            System.out.println(result.toString());
            logger.warn("违规ip:{}",dc.getIp());
            logger.error("违规ip:{}",dc.getIp());
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    public static void main(String[] args) {
        DeskCreamer deskCreamer = new DeskCreamer("1","55","192.168.1.65",895,280);
        System.out.println(Integer.parseInt("69")%3);
        try {
           // sendGet(deskCreamer);
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

}
