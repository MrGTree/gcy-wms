/**
 * Copyright &copy; 2012-2016 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.thinkgem.jeesite.modules.staff.service;

import com.thinkgem.jeesite.common.persistence.Page;
import com.thinkgem.jeesite.common.service.CrudService;
import com.thinkgem.jeesite.modules.staff.dao.StaffEduDao;
import com.thinkgem.jeesite.modules.staff.entity.StaffEdu;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

/**
 * 单表生成Service
 * @author liuji
 * @version 2017-06-19
 */
@Service
@Transactional(readOnly = true)
public class StaffEduService extends CrudService<StaffEduDao, StaffEdu> {

	//@Autowired
	private StaffEduDao staffEduDao;

	public StaffEdu get(String id) {
		return super.get(id);
	}

	public StaffEdu getByStaffId(String staffId) {
		return staffEduDao.getByStaffId(staffId);
	}

	public List<StaffEdu> findList(StaffEdu staffEdu) {
		return super.findList(staffEdu);
	}
	
	public Page<StaffEdu> findPage(Page<StaffEdu> page, StaffEdu staffEdu) {
		return super.findPage(page, staffEdu);
	}
	
	@Transactional(readOnly = false)
	public void save(StaffEdu staffEdu) {
		super.save(staffEdu);
	}
	
	@Transactional(readOnly = false)
	public void delete(StaffEdu staffEdu) {
		super.delete(staffEdu);
	}

    public List<StaffEdu> getListByStaffId(String staffId) {
		return staffEduDao.getListByStaffId(staffId);
    }
}