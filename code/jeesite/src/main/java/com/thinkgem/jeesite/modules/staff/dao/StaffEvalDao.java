/**
 * Copyright &copy; 2012-2016 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.thinkgem.jeesite.modules.staff.dao;

import com.thinkgem.jeesite.common.persistence.CrudDao;
import com.thinkgem.jeesite.common.persistence.annotation.MyBatisDao;
import com.thinkgem.jeesite.modules.staff.entity.StaffEval;

import java.util.List;

/**
 * 员工评价模块DAO接口
 * @author liuji
 * @version 2017-06-20
 */
@MyBatisDao
public interface StaffEvalDao extends CrudDao<StaffEval> {

    StaffEval getByStaffId(String staffId);

    List<StaffEval> getListByStaffId(StaffEval staffEval);

    Integer getStaffGoodCount(StaffEval staffEval);

    Integer getStaffBadCount(StaffEval staffEval);

    Integer getStaffBugCount(StaffEval staffEval);
}