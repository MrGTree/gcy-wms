/**
 * Copyright &copy; 2012-2016 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.thinkgem.jeesite.modules.staff.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.thinkgem.jeesite.common.persistence.Page;
import com.thinkgem.jeesite.common.service.CrudService;
import com.thinkgem.jeesite.common.utils.StringUtils;
import com.thinkgem.jeesite.modules.staff.entity.StaffWorkExp;
import com.thinkgem.jeesite.modules.staff.dao.StaffWorkExpDao;

/**
 * 员工工作经历Service
 * @author liuji
 * @version 2017-06-21
 */
@Service
@Transactional(readOnly = true)
public class StaffWorkExpService extends CrudService<StaffWorkExpDao, StaffWorkExp> {

	//@Autowired
	private StaffWorkExpDao staffWorkExpDao;

	
	public StaffWorkExp get(String id) {
		StaffWorkExp staffWorkExp = super.get(id);
		return staffWorkExp;
	}
	
	public List<StaffWorkExp> findList(StaffWorkExp staffWorkExp) {
		return super.findList(staffWorkExp);
	}
	
	public Page<StaffWorkExp> findPage(Page<StaffWorkExp> page, StaffWorkExp staffWorkExp) {
		return super.findPage(page, staffWorkExp);
	}
	
	@Transactional(readOnly = false)
	public void save(StaffWorkExp staffWorkExp) {
		super.save(staffWorkExp);
	}
	
	@Transactional(readOnly = false)
	public void delete(StaffWorkExp staffWorkExp) {
		super.delete(staffWorkExp);
	}

    public List<StaffWorkExp> getListByStaffId(String staffId) {
		return staffWorkExpDao.getListByStaffId(staffId);
    }
}