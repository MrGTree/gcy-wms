/**
 * Copyright &copy; 2012-2016 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.thinkgem.jeesite.modules.staff.dao;

import com.thinkgem.jeesite.common.persistence.CrudDao;
import com.thinkgem.jeesite.common.persistence.annotation.MyBatisDao;
import com.thinkgem.jeesite.modules.staff.entity.StaffPropAnswer;
import org.apache.ibatis.annotations.Param;

import java.util.List;

/**
 * 员工档案信息DAO接口
 * @author liuji
 * @version 2017-06-22
 */
@MyBatisDao
public interface StaffPropAnswerDao extends CrudDao<StaffPropAnswer> {

    List<StaffPropAnswer> getListByStaffIdAndTemplateId(@Param("staffId") String staffId, @Param("templateId") String templateId);

    void deleteStaffAllAnswer(StaffPropAnswer staffPropAnswer);

    List<String> getUUID(@Param("templateId") String templateId,@Param("staffId") String id);

    StaffPropAnswer getByEntity(StaffPropAnswer staffPropAnswer);
}