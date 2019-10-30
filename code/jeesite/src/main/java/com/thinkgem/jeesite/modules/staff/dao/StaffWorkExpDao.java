/**
 * Copyright &copy; 2012-2016 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.thinkgem.jeesite.modules.staff.dao;

import com.thinkgem.jeesite.common.persistence.CrudDao;
import com.thinkgem.jeesite.common.persistence.annotation.MyBatisDao;
import com.thinkgem.jeesite.modules.staff.entity.StaffWorkExp;

import java.util.List;

/**
 * 员工工作经历DAO接口
 * @author liuji
 * @version 2017-06-21
 */
@MyBatisDao
public interface StaffWorkExpDao extends CrudDao<StaffWorkExp> {

    List<StaffWorkExp> getListByStaffId(String staffId);
}