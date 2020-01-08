package com.thinkgem.jeesite.video.javacv.Entity;

import lombok.Data;

/**
 * 桌面摄像头类,读取配置文件
 */
public class DeskCreamer {

    private String creamerName;   //天花板摄像头号
    private String deskNo;    //考桌编号
    private String ip;        //桌面摄像头ip
    private float dcX;      //桌面摄像头x坐标
    private float dcY;      //桌面摄像头y坐标

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

    public float getDcX() {
        return dcX;
    }

    public void setDcX(float dcX) {
        this.dcX = dcX;
    }

    public float getDcY() {
        return dcY;
    }

    public void setDcY(float dcY) {
        this.dcY = dcY;
    }

    public DeskCreamer(String creamerName, String deskNo, String ip, float dcX, float dcY) {
        this.creamerName = creamerName;
        this.deskNo = deskNo;
        this.ip = ip;
        this.dcX = dcX;
        this.dcY = dcY;
    }

    public DeskCreamer() {
    }

    @Override
    public String toString() {
        return "DeskCreamer{" +
                "creamerName='" + creamerName + '\'' +
                ", deskNo='" + deskNo + '\'' +
                ", ip='" + ip + '\'' +
                ", dcX=" + dcX +
                ", dcY=" + dcY +
                '}';
    }
}
