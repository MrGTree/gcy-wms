package com.thinkgem.jeesite.video.javacv;

import java.io.Serializable;

public class UrlMapper implements Serializable {

    private String inputUrl;
    private String outPutUrl;

    private String camerName;

    public UrlMapper() {
    }

    public UrlMapper(String inputUrl, String outPutUrl, String camerName) {
        this.inputUrl = inputUrl;
        this.outPutUrl = outPutUrl;
        this.camerName = camerName;
    }

    public String getInputUrl() {
        return inputUrl;
    }

    public void setInputUrl(String inputUrl) {
        this.inputUrl = inputUrl;
    }

    public String getOutPutUrl() {
        return outPutUrl;
    }

    public void setOutPutUrl(String outPutUrl) {
        this.outPutUrl = outPutUrl;
    }

    public String getCamerName() {
        return camerName;
    }

    public void setCamerName(String camerName) {
        this.camerName = camerName;
    }

    @Override
    public String toString() {
        return "UrlMapper{" +
                "inputUrl='" + inputUrl + '\'' +
                ", outPutUrl='" + outPutUrl + '\'' +
                ", camerName='" + camerName + '\'' +
                '}';
    }
}
