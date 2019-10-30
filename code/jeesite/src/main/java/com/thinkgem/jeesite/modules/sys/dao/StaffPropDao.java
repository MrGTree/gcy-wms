/**
 * Copyright &copy; 2012-2016 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.thinkgem.jeesite.modules.sys.dao;

import com.thinkgem.jeesite.common.persistence.CrudDao;
import com.thinkgem.jeesite.common.persistence.annotation.MyBatisDao;
import com.thinkgem.jeesite.modules.sys.entity.StaffProp;

/**
 * 单表生成DAO接口
 * @author zhangyawei
 * @version 2017-06-22
 */
@MyBatisDao
public interface StaffPropDao extends CrudDao<StaffProp> {
	
}