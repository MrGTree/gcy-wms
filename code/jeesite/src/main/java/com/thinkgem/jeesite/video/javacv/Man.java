package com.thinkgem.jeesite.video.javacv;

import java.io.Serializable;
import java.util.Objects;

public class Man implements Serializable {

    private int x;
    private int y;

    public Man() {
    }

    public Man(int x, int y) {
        this.x = x;
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
        return Math.abs(x - man.x) < 50 &&
                Math.abs(y - man.y) < 50;
    }

    @Override
    public int hashCode() {
        return Objects.hash(x, y);
    }

    public int getX() {
        return x;
    }

    public void setX(int x) {
        this.x = x;
    }

    public int getY() {
        return y;
    }

    public void setY(int y) {
        this.y = y;
    }

    @Override
    public String toString() {
        return "Man{" +
                "x=" + x +
                ", y=" + y +
                '}';
    }
}
