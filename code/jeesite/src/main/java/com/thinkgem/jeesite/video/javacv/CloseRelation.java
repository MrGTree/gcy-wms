package com.thinkgem.jeesite.video.javacv;

import java.io.Serializable;
import java.util.Set;

public class CloseRelation implements Serializable {

    private Man manOut;
    private Set<CloseMan> closeManSet;

    public CloseRelation(Man manOut, Set<CloseMan> closeManSet) {
        this.manOut = manOut;
        this.closeManSet = closeManSet;
    }

    public CloseRelation() {
    }

    public Man getManOut() {
        return manOut;
    }

    public void setManOut(Man manOut) {
        this.manOut = manOut;
    }

    public Set<CloseMan> getCloseManSet() {
        return closeManSet;
    }

    public void setCloseManSet(Set<CloseMan> closeManSet) {
        this.closeManSet = closeManSet;
    }
}
