/**
 * Copyright &copy; 2012-2016 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.thinkgem.jeesite.modules.sys.entity;

import org.hibernate.validator.constraints.Length;

import com.thinkgem.jeesite.common.persistence.DataEntity;

/**
 * 员工元属性模板Entity
 * @author zhangyawei
 * @version 2017-06-22
 */
public class StaffTemplate extends DataEntity<StaffTemplate> {
	
	private static final long serialVersionUID = 1L;
	private String templateName;		// 模板名称
	
	public StaffTemplate() {
		super();
	}

	public StaffTemplate(String id){
		super(id);
	}

	@Length(min=0, max=64, message="模板名称长度必须介于 0 和 64 之间")
	public String getTemplateName() {
		return templateName;
	}

	public void setTemplateName(String templateName) {
		this.templateName = templateName;
	}
	
}