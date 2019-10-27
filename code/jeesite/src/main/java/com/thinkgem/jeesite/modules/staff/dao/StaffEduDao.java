/**
 * Copyright &copy; 2012-2016 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.thinkgem.jeesite.modules.staff.dao;

import com.thinkgem.jeesite.common.persistence.CrudDao;
import com.thinkgem.jeesite.common.persistence.annotation.MyBatisDao;
import com.thinkgem.jeesite.modules.staff.entity.StaffEdu;

import java.util.List;

/**
 * 单表生成DAO接口
 * @author liuji
 * @version 2017-06-19
 */
@MyBatisDao
public interface StaffEduDao extends CrudDao<StaffEdu> {
    StaffEdu getByStaffId(String staffId);

    List<StaffEdu> getListByStaffId(String staffId);
}