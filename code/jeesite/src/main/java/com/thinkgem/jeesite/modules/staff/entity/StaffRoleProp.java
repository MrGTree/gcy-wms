/**
 * Copyright &copy; 2012-2016 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.thinkgem.jeesite.modules.staff.entity;

import org.hibernate.validator.constraints.Length;

import com.thinkgem.jeesite.common.persistence.DataEntity;

/**
 * 角色对应的模板和属性设置Entity
 * @author liuji
 * @version 2017-06-27
 */
public class StaffRoleProp extends DataEntity<StaffRoleProp> {
	
	private static final long serialVersionUID = 1L;
	private String roleId;		// 角色id
	private String staffPropId;		// 元属性id
	private String templateId;		// 模板id
	
	public StaffRoleProp() {
		super();
	}

	public StaffRoleProp(String id){
		super(id);
	}

	@Length(min=0, max=64, message="角色id长度必须介于 0 和 64 之间")
	public String getRoleId() {
		return roleId;
	}

	public void setRoleId(String roleId) {
		this.roleId = roleId;
	}
	
	@Length(min=0, max=64, message="元属性id长度必须介于 0 和 64 之间")
	public String getStaffPropId() {
		return staffPropId;
	}

	public void setStaffPropId(String staffPropId) {
		this.staffPropId = staffPropId;
	}
	
	@Length(min=0, max=64, message="模板id长度必须介于 0 和 64 之间")
	public String getTemplateId() {
		return templateId;
	}

	public void setTemplateId(String templateId) {
		this.templateId = templateId;
	}
	
}