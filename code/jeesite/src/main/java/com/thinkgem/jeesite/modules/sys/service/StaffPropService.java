/**
 * Copyright &copy; 2012-2016 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.thinkgem.jeesite.modules.sys.service;

import java.util.List;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.thinkgem.jeesite.common.persistence.Page;
import com.thinkgem.jeesite.common.service.CrudService;
import com.thinkgem.jeesite.modules.sys.entity.StaffProp;
import com.thinkgem.jeesite.modules.sys.dao.StaffPropDao;

/**
 * 单表生成Service
 * @author zhangyawei
 * @version 2017-06-22
 */
@Service
@Transactional(readOnly = true)
public class StaffPropService extends CrudService<StaffPropDao, StaffProp> {

	public StaffProp get(String id) {
		return super.get(id);
	}
	
	public List<StaffProp> findList(StaffProp staffProp) {
		return super.findList(staffProp);
	}
	
	public Page<StaffProp> findPage(Page<StaffProp> page, StaffProp staffProp) {
		return super.findPage(page, staffProp);
	}
	
	@Transactional(readOnly = false)
	public void save(StaffProp staffProp) {
		super.save(staffProp);
	}
	
	@Transactional(readOnly = false)
	public void delete(StaffProp staffProp) {
		super.delete(staffProp);
	}
	
}