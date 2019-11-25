package com.thinkgem.jeesite.video.javacv;

import java.io.Serializable;
import java.util.Objects;

public class CloseMan implements Serializable {

    private int time;

    private Man man;

    public CloseMan(int time, Man man) {
        this.time = time;
        this.man = man;
    }

    public CloseMan() {
    }

    public int getTime() {
        return time;
    }

    public void setTime(int time) {
        this.time = time;
    }

    public Man getMan() {
        return man;
    }

    public void setMan(Man man) {
        this.man = man;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;
        CloseMan closeMan = (CloseMan) o;
        return Objects.equals(man, closeMan.man);
    }

    @Override
    public int hashCode() {
        return Objects.hash(time, man);
    }
}
