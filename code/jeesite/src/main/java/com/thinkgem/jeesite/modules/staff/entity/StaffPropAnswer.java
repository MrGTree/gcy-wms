/**
 * Copyright &copy; 2012-2016 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.thinkgem.jeesite.modules.staff.entity;

import org.hibernate.validator.constraints.Length;

import com.thinkgem.jeesite.common.persistence.DataEntity;

/**
 * 员工档案信息Entity
 * @author liuji
 * @version 2017-06-22
 */
public class StaffPropAnswer extends DataEntity<StaffPropAnswer> {
	
	private static final long serialVersionUID = 1L;
	private String staffId;		// 员工id
	private String templateId;		// 模板id
	private String staffPropId;		// 元属性id
	private String staffPropVal;		// 员工属性值
	private String UUID;              //模板批次号

	public String getUUID() {
		return UUID;
	}

	public void setUUID(String UUID) {
		this.UUID = UUID;
	}

	public StaffPropAnswer() {
		super();
	}

	public StaffPropAnswer(String id){
		super(id);
	}

	@Length(min=0, max=64, message="员工id长度必须介于 0 和 64 之间")
	public String getStaffId() {
		return staffId;
	}

	public void setStaffId(String staffId) {
		this.staffId = staffId;
	}
	
	@Length(min=0, max=64, message="模板id长度必须介于 0 和 64 之间")
	public String getTemplateId() {
		return templateId;
	}

	public void setTemplateId(String templateId) {
		this.templateId = templateId;
	}
	
	@Length(min=0, max=64, message="元属性id长度必须介于 0 和 64 之间")
	public String getStaffPropId() {
		return staffPropId;
	}

	public void setStaffPropId(String staffPropId) {
		this.staffPropId = staffPropId;
	}
	
	@Length(min=0, max=255, message="员工属性值长度必须介于 0 和 255 之间")
	public String getStaffPropVal() {
		return staffPropVal;
	}

	public void setStaffPropVal(String staffPropVal) {
		this.staffPropVal = staffPropVal;
	}
	
}