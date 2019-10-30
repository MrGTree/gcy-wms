package com.thinkgem.jeesite.modules.sys.dao;

import com.thinkgem.jeesite.common.persistence.CrudDao;
import com.thinkgem.jeesite.common.persistence.annotation.MyBatisDao;
import com.thinkgem.jeesite.modules.staff.entity.StaffPropTemplate;
import org.apache.ibatis.annotations.Param;

import java.util.List;

@MyBatisDao
public interface StaffPropTemplateDao extends CrudDao<StaffPropTemplate> {

	 List<StaffPropTemplate> getTemplateListByTemplateId(@Param("template_id") String templateId);

	void deleteAllByTemplateId(String templateId);
}