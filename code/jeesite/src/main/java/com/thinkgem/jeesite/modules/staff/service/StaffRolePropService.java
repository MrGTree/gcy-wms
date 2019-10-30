/**
 * Copyright &copy; 2012-2016 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.thinkgem.jeesite.modules.staff.service;

import com.thinkgem.jeesite.common.persistence.Page;
import com.thinkgem.jeesite.common.service.CrudService;
import com.thinkgem.jeesite.modules.staff.dao.StaffRolePropDao;
import com.thinkgem.jeesite.modules.staff.entity.StaffRoleProp;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

/**
 * 角色对应的模板和属性设置Service
 * @author liuji
 * @version 2017-06-27
 */
@Service
@Transactional(readOnly = true)
public class StaffRolePropService extends CrudService<StaffRolePropDao, StaffRoleProp> {

	@Autowired
	private StaffRolePropDao staffRolePropDao;

	public StaffRoleProp get(String id) {
		StaffRoleProp staffRoleProp = super.get(id);
		return staffRoleProp;
	}
	
	public List<StaffRoleProp> findList(StaffRoleProp staffRoleProp) {
		return super.findList(staffRoleProp);
	}
	
	public Page<StaffRoleProp> findPage(Page<StaffRoleProp> page, StaffRoleProp staffRoleProp) {
		return super.findPage(page, staffRoleProp);
	}
	
	@Transactional(readOnly = false)
	public void save(StaffRoleProp staffRoleProp) {
		super.save(staffRoleProp);
	}
	
	@Transactional(readOnly = false)
	public void delete(StaffRoleProp staffRoleProp) {
		super.delete(staffRoleProp);
	}

	@Transactional(readOnly = false)
	public void deleteAllRoleProp(StaffRoleProp queryStaffRoleProp) {
		staffRolePropDao.deleteAllRoleProp(queryStaffRoleProp);
	}
}