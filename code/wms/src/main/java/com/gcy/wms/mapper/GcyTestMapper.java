package com.gcy.wms.mapper;

import com.gcy.wms.entity.GcyTest;
import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface GcyTestMapper {

    Integer addTest(GcyTest test);

}
