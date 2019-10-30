/**
 * Copyright &copy; 2012-2016 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.thinkgem.jeesite.modules.staff.dao;

import com.thinkgem.jeesite.common.persistence.CrudDao;
import com.thinkgem.jeesite.common.persistence.annotation.MyBatisDao;
import com.thinkgem.jeesite.modules.staff.entity.StaffRoleProp;

/**
 * 角色对应的模板和属性设置DAO接口
 * @author liuji
 * @version 2017-06-27
 */
@MyBatisDao
public interface StaffRolePropDao extends CrudDao<StaffRoleProp> {


    void deleteAllRoleProp(StaffRoleProp queryStaffRoleProp);
}