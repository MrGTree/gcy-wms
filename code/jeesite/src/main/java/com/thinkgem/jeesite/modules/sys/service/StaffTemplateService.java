/**
 * Copyright &copy; 2012-2016 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.thinkgem.jeesite.modules.sys.service;

import com.thinkgem.jeesite.common.persistence.Page;
import com.thinkgem.jeesite.common.service.CrudService;
import com.thinkgem.jeesite.modules.sys.dao.StaffTemplateDao;
import com.thinkgem.jeesite.modules.sys.entity.StaffTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

/**
 * 员工元属性模板Service
 * @author zhangyawei
 * @version 2017-06-22
 */
@Service
@Transactional(readOnly = true)
public class StaffTemplateService extends CrudService<StaffTemplateDao, StaffTemplate> {

	@Autowired
	private StaffTemplateDao staffTemplateDao;

	public StaffTemplate get(String id) {
		return super.get(id);
	}
	
	public List<StaffTemplate> findList(StaffTemplate staffTemplate) {
		return super.findList(staffTemplate);
	}
	
	public Page<StaffTemplate> findPage(Page<StaffTemplate> page, StaffTemplate staffTemplate) {
		return super.findPage(page, staffTemplate);
	}

	public List<StaffTemplate> findALLListNoPage() {
		return staffTemplateDao.findALLListNoPage();
	}
	
	@Transactional(readOnly = false)
	public void save(StaffTemplate staffTemplate) {
		super.save(staffTemplate);
	}
	
	@Transactional(readOnly = false)
	public void delete(StaffTemplate staffTemplate) {
		super.delete(staffTemplate);
	}
	
}