package com.thinkgem.jeesite.video.javacv;

import org.springframework.stereotype.Component;

import java.util.ArrayList;
import java.util.List;

@Component
public class RevicedListCollection {

    private List<ConvertVideoPakcet> revicedList;

    public RevicedListCollection(){
        revicedList = new ArrayList<>();
    }

    public List<ConvertVideoPakcet> getRevicedList(){
        return revicedList;
    }

    public void setRevicedList(ConvertVideoPakcet c){
        revicedList.add(c);
    }
}
