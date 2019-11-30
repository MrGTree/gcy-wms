package com.thinkgem.jeesite.video.javacv.Entity;

import java.io.Serializable;

/**
 * @author liuji
 * @create 2019-11-27 11:31
 */
public class RuleBreak implements Serializable {

    private int width;
    private  int height;
    private Man manOut;
    private Man manIn;
    private String camerName;

    public RuleBreak() {
    }

    public RuleBreak(Man manOut, Man manIn, String camerName) {
        this.manOut = manOut;
        this.manIn = manIn;
        this.camerName = camerName;
    }

    public Man getManOut() {
        return manOut;
    }

    public void setManOut(Man manOut) {
        this.manOut = manOut;
    }

    public Man getManIn() {
        return manIn;
    }

    public void setManIn(Man manIn) {
        this.manIn = manIn;
    }

    public String getCamerName() {
        return camerName;
    }

    public void setCamerName(String camerName) {
        this.camerName = camerName;
    }

    public RuleBreak(int width, int height, Man manOut, Man manIn, String camerName) {
        this.width = width;
        this.height = height;
        this.manOut = manOut;
        this.manIn = manIn;
        this.camerName = camerName;
    }

    public int getWidth() {
        return width;
    }

    public void setWidth(int width) {
        this.width = width;
    }

    public int getHeight() {
        return height;
    }

    public void setHeight(int height) {
        this.height = height;
    }

    @Override
    public String toString() {
        return "RuleBreak{" +
                "width=" + width +
                ", height=" + height +
                ", manOut=" + manOut +
                ", manIn=" + manIn +
                ", camerName='" + camerName + '\'' +
                '}';
    }
}
