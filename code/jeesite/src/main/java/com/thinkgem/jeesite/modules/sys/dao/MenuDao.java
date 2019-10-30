/**
 * Copyright &copy; 2012-2016 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.thinkgem.jeesite.modules.sys.dao;

import java.util.List;

import com.thinkgem.jeesite.common.persistence.CrudDao;
import com.thinkgem.jeesite.common.persistence.annotation.MyBatisDao;
import com.thinkgem.jeesite.modules.staff.entity.StaffPropTemplate;
import com.thinkgem.jeesite.modules.sys.entity.Menu;
import org.apache.ibatis.annotations.Param;

/**
 * 菜单DAO接口
 * @author ThinkGem
 * @version 2014-05-16
 */
@MyBatisDao
public interface MenuDao extends CrudDao<Menu> {

	public List<Menu> findByParentIdsLike(Menu menu);

	public List<Menu> findByUserId(Menu menu);
	
	public int updateParentIds(Menu menu);
	
	public int updateSort(Menu menu);

	List<StaffPropTemplate> getTemplateListByTemplateIdAndRoleId(@Param("templateId") String templateId, @Param("roleIdList") List<String> roleIdList);

	List<StaffPropTemplate> getTemplateListAndAnswerByTemplateIdAndRoleId(@Param("templateId") String templateId,@Param("staffId") String staffId, @Param("UUID") String UUID,@Param("roleIdList") List<String> roleIdList);

	List<StaffPropTemplate> getAllTemplateListAndAnswerByTemplateId(@Param("templateId") String templateId,@Param("staffId") String staffId, @Param("UUID") String UUID);

	List<StaffPropTemplate> getTemplateListByTemplateId(String templateId);

    List<StaffPropTemplate> getAllTemplateList();
}
