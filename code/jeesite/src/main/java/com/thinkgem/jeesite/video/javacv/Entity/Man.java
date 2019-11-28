package com.thinkgem.jeesite.video.javacv.Entity;

import com.thinkgem.jeesite.common.config.Global;

import java.io.Serializable;
import java.util.Objects;

public class Man implements Serializable {

    private float x;
    private float y;

    public Man() {
    }

    public Man(float x, float y) {
        this.x = x;
        this.y = y;
    }

    public float getX() {
        return x;
    }

    public void setX(float x) {
        this.x = x;
    }

    public float getY() {
        return y;
    }

    public void setY(float y) {
        this.y = y;
    }

    /**
     * 100个像素内，表示是一个人
     * @param o
     * @return
     */
    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;
        Man man = (Man) o;
        return Math.abs(x - man.x) < Global.getOneManValue() &&
                Math.abs(y - man.y) < Global.getOneManValue();
    }

    @Override
    public int hashCode() {
        return Objects.hash(x, y);
    }


    @Override
    public String toString() {
        return "Man{" +
                "x=" + x +
                ", y=" + y +
                '}';
    }
}
