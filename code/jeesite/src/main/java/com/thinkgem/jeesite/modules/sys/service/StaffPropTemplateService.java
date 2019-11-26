package com.thinkgem.jeesite.modules.sys.service;

import com.thinkgem.jeesite.common.persistence.Page;
import com.thinkgem.jeesite.common.service.CrudService;
import com.thinkgem.jeesite.modules.staff.entity.StaffPropTemplate;
import com.thinkgem.jeesite.modules.sys.dao.StaffPropTemplateDao;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Service
@Transactional(readOnly = true)
public class StaffPropTemplateService extends CrudService<StaffPropTemplateDao, StaffPropTemplate> {

	//@Autowired
	private  StaffPropTemplateDao staffPropTemplateDao ;


	public StaffPropTemplate get(String id) {
		return super.get(id);
	}

	public List<StaffPropTemplate> findList(StaffPropTemplate staffPropTemplate) {
		return super.findList(staffPropTemplate);
	}

	public Page<StaffPropTemplate> findPage(Page<StaffPropTemplate> page, StaffPropTemplate staffPropTemplate) {
		return super.findPage(page, staffPropTemplate);
	}

	public List<StaffPropTemplate> getTemplateListByTemplateId(String id) {
		
		return staffPropTemplateDao.getTemplateListByTemplateId(id);
	}

	@Transactional(readOnly = false)
	public void deleteAllByTemplateId(String templateId) {
		staffPropTemplateDao.deleteAllByTemplateId(templateId);
	}
}
