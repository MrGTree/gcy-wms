package com.thinkgem.jeesite.video.javacv;

import java.io.Serializable;

/**
 * @author liuji
 * @create 2019-11-27 11:31
 */
public class RuleBreak implements Serializable {

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

    @Override
    public String toString() {
        return "RuleBreak{" +
                "manOut=" + manOut +
                ", manIn=" + manIn +
                ", camerName='" + camerName + '\'' +
                '}';
    }
}
