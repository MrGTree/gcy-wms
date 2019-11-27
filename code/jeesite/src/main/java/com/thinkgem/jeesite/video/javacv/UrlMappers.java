package com.thinkgem.jeesite.video.javacv;

import com.fasterxml.jackson.core.type.TypeReference;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.thinkgem.jeesite.common.config.Global;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;

import java.io.IOException;
import java.util.HashSet;
import java.util.Set;

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
        ObjectMapper objectMapper = new ObjectMapper();
        try {
            return objectMapper.readValue(s, new TypeReference<HashSet<UrlMapper>>() {
            });
        } catch (IOException e) {
            logger.error("init one urlMapperSet bean fail",e);
        }

        return new HashSet<UrlMapper>();
    }
}
