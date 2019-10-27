/**
 * Copyright &copy; 2012-2016 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.thinkgem.jeesite.modules.sys.entity;

import org.hibernate.validator.constraints.Length;

import com.thinkgem.jeesite.common.persistence.DataEntity;

/**
 * 单表生成Entity
 * @author zhangyawei
 * @version 2017-06-22
 */
public class StaffProp extends DataEntity<StaffProp> {
	
	private static final long serialVersionUID = 1L;
	private String staffPropName;		// 属性名称
	
	public StaffProp() {
		super();
	}

	public StaffProp(String id){
		super(id);
	}

	@Length(min=0, max=64, message="属性名称长度必须介于 0 和 64 之间")
	public String getStaffPropName() {
		return staffPropName;
	}

	public void setStaffPropName(String staffPropName) {
		this.staffPropName = staffPropName;
	}
	
}