package com.thinkgem.jeesite.video.javacv;

import com.fasterxml.jackson.databind.JavaType;
import com.thinkgem.jeesite.common.mapper.JsonMapper;
import com.thinkgem.jeesite.video.javacv.Entity.DeskCreamer;
import org.apache.commons.collections.CollectionUtils;
import org.apache.ibatis.thread.PropertiesUtil;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;

import java.util.*;
import java.util.stream.Collectors;

@Configuration
public class DeskCreamerMaps {

    private Logger logger = LoggerFactory.getLogger(getClass());


    @Bean(name = "deskCreamerMaps")
    public Map<String, List<DeskCreamer>> deskCreamerMaps() {
        String s = null;
        String filename = "/desk-creamer.properties";
        Properties pro = new Properties();
        try {
            pro.load(PropertiesUtil.class.getResourceAsStream(filename));
            s = pro.getProperty("data");
        }catch (Exception e){
            e.printStackTrace();
            logger.info("Load desk-creamer “"+filename+"” file error.");
        }

        JsonMapper jsonMapper = JsonMapper.getInstance();
        JavaType collectionType = jsonMapper.createCollectionType(List.class, DeskCreamer.class);
        Set<DeskCreamer> deskCreamerList = jsonMapper.fromJson(s, collectionType);
        Map<String,List<DeskCreamer>> result = new HashMap<>();
        if(!CollectionUtils.isEmpty(deskCreamerList)){
            result = deskCreamerList.stream().collect(Collectors.groupingBy(DeskCreamer::getCreamerName));
        }
        return  result;
    }

}
