package com.thinkgem.jeesite.video.javacv.Entity;

import lombok.Data;

/**
 * 桌面摄像头类,读取配置文件
 */
public class DeskCreamer {

    private String creamerName;   //天花板摄像头号
    private String deskNo;    //考桌编号
    private String ip;        //桌面摄像头ip
    private int dcX;      //桌面摄像头x坐标
    private int dcY;      //桌面摄像头y坐标

    public String getCreamerName() {
        return creamerName;
    }

    public void setCreamerName(String creamerName) {
        this.creamerName = creamerName;
    }

    public String getDeskNo() {
        return deskNo;
    }

    public void setDeskNo(String deskNo) {
        this.deskNo = deskNo;
    }

    public String getIp() {
        return ip;
    }

    public void setIp(String ip) {
        this.ip = ip;
    }

    public int getDcX() {
        return dcX;
    }

    public void setDcX(int dcX) {
        this.dcX = dcX;
    }

    public int getDcY() {
        return dcY;
    }

    public void setDcY(int dcY) {
        this.dcY = dcY;
    }

    public DeskCreamer(String creamerName, String deskNo, String ip, int dcX, int dcY) {
        this.creamerName = creamerName;
        this.deskNo = deskNo;
        this.ip = ip;
        this.dcX = dcX;
        this.dcY = dcY;
    }
}
