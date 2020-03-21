package com.thinkgem.jeesite.video.javacv.Entity;

import com.sensetime.ad.sdk.StPointF;
import lombok.Data;

import java.time.LocalDateTime;
import java.util.List;

/**
 * 桌面摄像头类,读取配置文件
 */
public class DeskCreamer {

    private String classRoom;     //教室号
    private String creamerName;   //桌面摄像头号
    private String deskNo;    //考桌编号
    private String ip;        //桌面摄像头ip
    private String lastSendTime; //上次发送时间戳
    private String topLine;  //范围线
    private List<StPointF> range; //范围
    private String resolution; //分辨率

    public String getClassRoom() {
        return classRoom;
    }

    public void setClassRoom(String classRoom) {
        this.classRoom = classRoom;
    }

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

    public String getLastSendTime() {
        return lastSendTime;
    }

    public void setLastSendTime(String lastSendTime) {
        this.lastSendTime = lastSendTime;
    }

    public String getTopLine() {
        return topLine;
    }

    public void setTopLine(String topLine) {
        this.topLine = topLine;
    }

    public List<StPointF> getRange() {
        return range;
    }

    public void setRange(List<StPointF> range) {
        this.range = range;
    }

    public String getResolution() {
        return resolution;
    }

    public void setResolution(String resolution) {
        this.resolution = resolution;
    }

    public DeskCreamer() {
    }

    @Override
    public String toString() {
        return "DeskCreamer{" +
                "classRoom='" + classRoom + '\'' +
                ", creamerName='" + creamerName + '\'' +
                ", deskNo='" + deskNo + '\'' +
                ", ip='" + ip + '\'' +
                ", lastSendTime='" + lastSendTime + '\'' +
                ", topLine='" + topLine + '\'' +
                ", range=" + range +
                ", resolution='" + resolution + '\'' +
                '}';
    }
}
