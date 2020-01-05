package com.thinkgem.jeesite.video.javacv;

import java.util.Collections;
import java.util.Map;
import java.util.Set;
import java.util.concurrent.ConcurrentHashMap;

import com.fasterxml.jackson.databind.JavaType;
import com.thinkgem.jeesite.common.config.Global;
import com.thinkgem.jeesite.common.mapper.JsonMapper;
import com.thinkgem.jeesite.common.utils.SpringContextHolder;
import com.thinkgem.jeesite.video.javacv.Entity.UrlMapper;
import com.thinkgem.jeesite.video.javacv.Entity.VideoToPicture;
import org.apache.commons.collections.CollectionUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.web.client.RestTemplate;

/**
 * @author liuji
 * @create 2019-11-27 16:33
 */
@Configuration
public class UrlMappers {

    private Logger logger = LoggerFactory.getLogger(getClass());


    @Bean(name = "urlMapperSet")
    public Set<UrlMapper> urlMapperList() {
        String s = Global.getConfig("video.monitor.urlConfig");
        JsonMapper jsonMapper = JsonMapper.getInstance();
        JavaType collectionType = jsonMapper.createCollectionType(Set.class, UrlMapper.class);
        Set<UrlMapper> urlMappers = jsonMapper.fromJson(s, collectionType);
        Set<UrlMapper> urlMapperSet = Collections.newSetFromMap(new ConcurrentHashMap<>(32));
        if (CollectionUtils.isNotEmpty(urlMappers)){
            urlMapperSet.addAll(urlMappers);
        }
        return urlMapperSet;
    }

    @Bean(name = "convertVideoPakcetMap")
    public Map<UrlMapper, ConvertVideoPakcet> convertVideoPakcetMap() {
        return new ConcurrentHashMap<>(32);
    }

    @Bean(name = "ConvertVideoPakcetPictureMap")
    public Map<String, ConvertVideoPakcetPicture> ConvertVideoPakcetPictureMap() {
        return new ConcurrentHashMap<>(32);
    }

    @Bean(name = "cameraStatus")
    public Set<String> cameraStatus() {
        return Collections.newSetFromMap(new ConcurrentHashMap<>(32));
    }

    @Bean(name = "pakcetSet")
    public Set<VideoToPicture> PakcetSet() {
        return Collections.newSetFromMap(new ConcurrentHashMap<>(32));
    }

    @Bean(name = "cameraNameUrlMap")
    public Map<String, UrlMapper> cameraNameUrlMap() {
        ConcurrentHashMap<String, UrlMapper> cameraNameUrlMap = new ConcurrentHashMap<>(32);
        Set<UrlMapper> urlMappers = SpringContextHolder.getBean("urlMapperSet");
        for (UrlMapper urlMapper : urlMappers) {
            cameraNameUrlMap.put(urlMapper.getCamerName(),urlMapper);
        }
        return cameraNameUrlMap;
    }

    @Bean
    public RestTemplate restTemplate(){
        return new RestTemplate();
    }
}
