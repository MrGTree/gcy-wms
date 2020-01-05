package com.thinkgem.jeesite.video.javacv;


import com.fasterxml.jackson.databind.ObjectMapper;
import com.thinkgem.jeesite.video.javacv.Entity.DeskCreamer;

import java.io.BufferedOutputStream;
import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.io.PrintWriter;
import java.net.HttpURLConnection;
import java.net.URL;


public class HttpApi {

    private static String uri = "http://127.0.0.1:9088/index/api/addStreamProxy?vhost=__defaultVhost__&app=normal";

    public static void sendGet(DeskCreamer dc) throws Exception {
        try {
            uri += "&stream=creamerName"+dc.getCreamerName()+"-desktop"+dc.getDeskNo();
            uri += "&url=rtsp://admin:Hz45933869@"+dc.getIp();
            uri += "&pull_time=300&enable_rtsp=1&enable_rtmp=1&rtp_type=0&secret=035c73f7-bb6b-4889-a715-d9eb2d1925cc";
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
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    public static void main(String[] args) {
        DeskCreamer deskCreamer = new DeskCreamer("1","55","192.168.1.65",895,280);
        try {
            sendGet(deskCreamer);
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

}
