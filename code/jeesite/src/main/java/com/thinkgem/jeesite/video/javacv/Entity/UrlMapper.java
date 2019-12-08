package com.thinkgem.jeesite.video.javacv.Entity;

import java.io.Serializable;
import java.util.Objects;

import com.thinkgem.jeesite.common.mapper.JsonMapper;

public class UrlMapper implements Serializable {

    private String inputUrl;
    private String outPutUrl;

    private float maxX;

    private float minX;

    private float minY;

    private float maxY;


    private String camerName;

    public UrlMapper() {
    }

    public UrlMapper(String inputUrl, String outPutUrl, float maxX, float minX, float minY, float maxY, String camerName) {
        this.inputUrl = inputUrl;
        this.outPutUrl = outPutUrl;
        this.maxX = maxX;
        this.minX = minX;
        this.minY = minY;
        this.maxY = maxY;
        this.camerName = camerName;
    }

    public UrlMapper(String inputUrl, String outPutUrl, String camerName) {
        this.inputUrl = inputUrl;
        this.outPutUrl = outPutUrl;
        this.camerName = camerName;
    }

    public float getMaxX() {
        return maxX;
    }

    public void setMaxX(float maxX) {
        this.maxX = maxX;
    }

    public float getMinX() {
        return minX;
    }

    public void setMinX(float minX) {
        this.minX = minX;
    }

    public float getMinY() {
        return minY;
    }

    public void setMinY(float minY) {
        this.minY = minY;
    }

    public float getMaxY() {
        return maxY;
    }

    public void setMaxY(float maxY) {
        this.maxY = maxY;
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
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;
        UrlMapper urlMapper = (UrlMapper) o;
        return Objects.equals(inputUrl, urlMapper.inputUrl) &&
                Objects.equals(outPutUrl, urlMapper.outPutUrl) &&
                Objects.equals(camerName, urlMapper.camerName);
    }

    @Override
    public int hashCode() {
        return Objects.hash(inputUrl, outPutUrl, camerName);
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
