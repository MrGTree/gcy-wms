/**
 * Copyright &copy; 2012-2016 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.thinkgem.jeesite.modules.staff.entity;

import com.fasterxml.jackson.annotation.JsonFormat;
import com.thinkgem.jeesite.common.persistence.DataEntity;
import org.hibernate.validator.constraints.Length;

import java.util.Date;

/**
 * 单表生成Entity
 * @author liuji
 * @version 2017-06-19
 */
public class StaffEdu extends DataEntity<StaffEdu> {
	
	private static final long serialVersionUID = 1L;
	private String staffId;		// 员工ID
	private String schoolName;		// 学校
	private Date startData;		// 开始日期
	private Date endData;		// 结束日期
	private String isTongzhao;		// 是否统招
	private String zhuanye;		// 专业
	private String xueli;		// 学历
	private String files;		// 附件
	
	public StaffEdu() {
		super();
	}

	public StaffEdu(String id){
		super(id);
	}

	@Length(min=0, max=2000, message="附件长度必须介于 0 和 2000 之间")
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
	
	@Length(min=0, max=64, message="学校长度必须介于 0 和 64 之间")
	public String getSchoolName() {
		return schoolName;
	}

	public void setSchoolName(String schoolName) {
		this.schoolName = schoolName;
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
	
	@Length(min=0, max=1, message="是否统招长度必须介于 0 和 1 之间")
	public String getIsTongzhao() {
		return isTongzhao;
	}

	public void setIsTongzhao(String isTongzhao) {
		this.isTongzhao = isTongzhao;
	}
	
	@Length(min=0, max=64, message="专业长度必须介于 0 和 64 之间")
	public String getZhuanye() {
		return zhuanye;
	}

	public void setZhuanye(String zhuanye) {
		this.zhuanye = zhuanye;
	}
	
	@Length(min=0, max=64, message="学历长度必须介于 0 和 64 之间")
	public String getXueli() {
		return xueli;
	}

	public void setXueli(String xueli) {
		this.xueli = xueli;
	}
	
}