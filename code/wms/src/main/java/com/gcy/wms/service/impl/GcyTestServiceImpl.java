package com.gcy.wms.service.impl;

import com.gcy.wms.entity.GcyTest;
import com.gcy.wms.mapper.GcyTestMapper;
import com.gcy.wms.service.GcyTestService;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;

@Service
@Slf4j
public class GcyTestServiceImpl implements GcyTestService {

    @Resource
    private GcyTestMapper mapper;

    @Override
    public Integer addTest(GcyTest test) {
        return mapper.addTest(test);
    }
}
