package com.thinkgem.jeesite.video.javacv.Entity;

import com.sensetime.ad.sdk.StCrowdDensityResult;

import java.util.Arrays;
import java.util.Objects;

public class VideoToPicture {

    private int width;
    private int height;
    private String camerName;
    private byte[] bytes;
    private StCrowdDensityResult crowdResult;

    public VideoToPicture() {
    }

    public VideoToPicture(int width, int height, String camerName, byte[] bytes, StCrowdDensityResult crowdResult) {
        this.width = width;
        this.height = height;
        this.camerName = camerName;
        this.bytes = bytes;
        this.crowdResult = crowdResult;
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

    public String getCamerName() {
        return camerName;
    }

    public void setCamerName(String camerName) {
        this.camerName = camerName;
    }

    public byte[] getBytes() {
        return bytes;
    }

    public void setBytes(byte[] bytes) {
        this.bytes = bytes;
    }

    public StCrowdDensityResult getCrowdResult() {
        return crowdResult;
    }

    public void setCrowdResult(StCrowdDensityResult crowdResult) {
        this.crowdResult = crowdResult;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;
        VideoToPicture that = (VideoToPicture) o;
        return width == that.width &&
                height == that.height &&
                Objects.equals(camerName, that.camerName) &&
                Arrays.equals(bytes, that.bytes) &&
                Objects.equals(crowdResult, that.crowdResult);
    }

    @Override
    public int hashCode() {
        int result = Objects.hash(width, height, camerName, crowdResult);
        result = 31 * result + Arrays.hashCode(bytes);
        return result;
    }

    @Override
    public String toString() {
        return "VideoToPicture{" +
                "width=" + width +
                ", height=" + height +
                ", camerName='" + camerName + '\'' +
                ", bytes=" + Arrays.toString(bytes) +
                ", crowdResult=" + crowdResult +
                '}';
    }
}
