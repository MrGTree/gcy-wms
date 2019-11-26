/**
 * Copyright &copy; 2012-2016 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.thinkgem.jeesite.modules.staff.service;

import com.thinkgem.jeesite.common.persistence.Page;
import com.thinkgem.jeesite.common.service.CrudService;
import com.thinkgem.jeesite.modules.staff.dao.StaffPropAnswerDao;
import com.thinkgem.jeesite.modules.staff.entity.StaffPropAnswer;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

/**
 * 员工档案信息Service
 * @author liuji
 * @version 2017-06-22
 */
@Service
@Transactional(readOnly = true)
public class StaffPropAnswerService extends CrudService<StaffPropAnswerDao, StaffPropAnswer> {

	//@Autowired
	private StaffPropAnswerDao staffPropAnswerDao;

	public StaffPropAnswer get(String id) {
		return super.get(id);
	}
	
	public List<StaffPropAnswer> findList(StaffPropAnswer staffPropAnswer) {
		return super.findList(staffPropAnswer);
	}
	
	public Page<StaffPropAnswer> findPage(Page<StaffPropAnswer> page, StaffPropAnswer staffPropAnswer) {
		return super.findPage(page, staffPropAnswer);
	}
	
	@Transactional(readOnly = false)
	public void save(StaffPropAnswer staffPropAnswer) {
		super.save(staffPropAnswer);
	}
	
	@Transactional(readOnly = false)
	public void delete(StaffPropAnswer staffPropAnswer) {
		super.delete(staffPropAnswer);
	}

    public List<StaffPropAnswer> getListByStaffIdAndTemplateId(String staffId, String templateId) {
		return staffPropAnswerDao.getListByStaffIdAndTemplateId(staffId,templateId);
    }

	@Transactional(readOnly = false)
	public void deleteStaffAllAnswer(StaffPropAnswer staffPropAnswer) {
		staffPropAnswerDao.deleteStaffAllAnswer(staffPropAnswer);
	}

	public List<String> getUUID(String templateId, String id) {
		return staffPropAnswerDao.getUUID(templateId,id);
	}

	public StaffPropAnswer getByEntity(StaffPropAnswer staffPropAnswer) {
		return staffPropAnswerDao.getByEntity(staffPropAnswer);
	}
}