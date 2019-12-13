package com.thinkgem.jeesite.video.javacv.Entity;

public class PushVideoReturn {

    private int code;
    private int result;

    public PushVideoReturn(int code, int result) {
        this.code = code;
        this.result = result;
    }

    public PushVideoReturn() {
    }

    public int getCode() {
        return code;
    }

    public void setCode(int code) {
        this.code = code;
    }

    public int getResult() {
        return result;
    }

    public void setResult(int result) {
        this.result = result;
    }

    @Override
    public String toString() {
        return "PushVideoReturn{" +
                "code=" + code +
                ", result=" + result +
                '}';
    }
}
