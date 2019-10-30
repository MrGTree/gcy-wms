/**
 * Copyright &copy; 2012-2016 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.thinkgem.jeesite.modules.staff.entity;

import com.fasterxml.jackson.annotation.JsonFormat;
import com.thinkgem.jeesite.common.persistence.DataEntity;
import org.hibernate.validator.constraints.Length;

import java.util.Date;

/**
 * 员工工作经历Entity
 * @author liuji
 * @version 2017-06-21
 */
public class StaffWorkExp extends DataEntity<StaffWorkExp> {
	
	private static final long serialVersionUID = 1L;
	private String staffId;		// 员工ID
	private String corpName;		// 公司名称
	private String hangye;		// 行业
	private String position;		// 职位
	private Date startData;		// 开始日期
	private Date endData;		// 结束日期
	private String files;		// 附件
	private String description;		// 描述
	
	public StaffWorkExp() {
		super();
	}

	public StaffWorkExp(String id){
		super(id);
	}

	public String getFiles() {
		return files;
	}

	public void setFiles(String files) {
		this.files = files;
	}

	@Length(min=0, max=64, message="员工ID长度必须介于 0 和 64 之间")
	public String getStaffId() {
		return staffId;
	}

	public void setStaffId(String staffId) {
		this.staffId = staffId;
	}
	
	@Length(min=0, max=64, message="公司名称长度必须介于 0 和 64 之间")
	public String getCorpName() {
		return corpName;
	}

	public void setCorpName(String corpName) {
		this.corpName = corpName;
	}
	
	@Length(min=0, max=64, message="行业长度必须介于 0 和 64 之间")
	public String getHangye() {
		return hangye;
	}

	public void setHangye(String hangye) {
		this.hangye = hangye;
	}
	
	@Length(min=0, max=64, message="职位长度必须介于 0 和 64 之间")
	public String getPosition() {
		return position;
	}

	public void setPosition(String position) {
		this.position = position;
	}
	
	@JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss")
	public Date getStartData() {
		return startData;
	}

	public void setStartData(Date startData) {
		this.startData = startData;
	}
	
	@JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss")
	public Date getEndData() {
		return endData;
	}

	public void setEndData(Date endData) {
		this.endData = endData;
	}
	
	@Length(min=0, max=2048, message="描述长度必须介于 0 和 2048 之间")
	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}
	
}