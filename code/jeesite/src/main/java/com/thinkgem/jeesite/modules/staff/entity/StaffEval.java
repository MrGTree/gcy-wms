/**
 * Copyright &copy; 2012-2016 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.thinkgem.jeesite.modules.staff.entity;

import com.fasterxml.jackson.annotation.JsonFormat;
import com.thinkgem.jeesite.common.config.Global;
import com.thinkgem.jeesite.common.persistence.DataEntity;
import com.thinkgem.jeesite.modules.sys.entity.Office;
import org.hibernate.validator.constraints.Length;

import javax.validation.constraints.NotNull;
import java.util.Date;

/**
 * 员工评价模块Entity
 * @author liuji
 * @version 2017-06-20
 */
public class StaffEval extends DataEntity<StaffEval> {
	
	private static final long serialVersionUID = 1L;
	private String staffId;		// 员工ID
	private Date startData;		// 开始日期
	private Date endData;		// 结束日期
	private Integer taskCount;		// 工作任务条数
	private Integer bugCount;		// 生产缺陷数量
	private Integer efficiency;		// 任务延期次数
	private Boolean good;			// 奖励记录
	private String goodExplain;		// 奖励说明
	private Boolean bad;			// 惩罚记录
	private String badExplain;		// 惩罚说明
	private String evalExplain;		// 评价说明
	private String extColum1;		// 备用列1
	private String extColum2;		// 备用列2
	private String extColum3;		// 备用列3
	private String extColum4;		// 备用列4
	private String extColum5;		// 备用列5
	private Office office;
	private String evalOperation;		// 评价人
	private Date evalDate;		// 评价时间
	private String evalOfficeId; //评价时所在office

	private Long SurplusTime; //过期时间

	public Long getSurplusTime() {
		long time = evalDate.getTime();
		long now = new Date().getTime();
		long expireTime = time + Global.evalOutTime;
		this.SurplusTime = expireTime - now;
		return this.SurplusTime;
	}

	public String getEvalOfficeId() {
		return evalOfficeId;
	}

	public void setEvalOfficeId(String evalOfficeId) {
		this.evalOfficeId = evalOfficeId;
	}

	public void setSurplusTime(Long surplusTime) {
		SurplusTime = surplusTime;
	}

	public Office getOffice() {
		return office;
	}

	public void setOffice(Office office) {
		this.office = office;
	}

	public Boolean getGood() {
		return good;
	}

	public void setGood(Boolean good) {
		this.good = good;
	}
	@Length(min=0, max=255, message="奖励说明长度必须介于 0 和 255 之间")
	public String getGoodExplain() {
		return goodExplain;
	}

	public void setGoodExplain(String goodExplain) {
		this.goodExplain = goodExplain;
	}

	public Boolean getBad() {
		return bad;
	}

	public void setBad(Boolean bad) {
		this.bad = bad;
	}
	@Length(min=0, max=255, message="惩罚说明长度必须介于 0 和 255 之间")
	public String getBadExplain() {
		return badExplain;
	}

	public void setBadExplain(String badExplain) {
		this.badExplain = badExplain;
	}

	public String getExtColum3() {
		return extColum3;
	}

	public void setExtColum3(String extColum3) {
		this.extColum3 = extColum3;
	}
	@Length(min=0, max=255, message="备用列4长度必须介于 0 和 255 之间")
	public String getExtColum4() {
		return extColum4;
	}

	public void setExtColum4(String extColum4) {
		this.extColum4 = extColum4;
	}
	@Length(min=0, max=255, message="备用列5长度必须介于 0 和 255 之间")
	public String getExtColum5() {
		return extColum5;
	}

	public void setExtColum5(String extColum5) {
		this.extColum5 = extColum5;
	}

	@Length(min=0, max=255, message="评价说明长度必须介于 0 和 255 之间")
	public String getEvalExplain() {
		return evalExplain;
	}

	public void setEvalExplain(String evalExplain) {
		this.evalExplain = evalExplain;
	}

	public StaffEval() {
		super();
	}

	public StaffEval(String id){
		super(id);
	}

	@Length(min=0, max=64, message="员工ID长度必须介于 0 和 64 之间")
	public String getStaffId() {
		return staffId;
	}

	public void setStaffId(String staffId) {
		this.staffId = staffId;
	}

	@NotNull(message = "请选择评价的开始日期")
	@JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss")
	public Date getStartData() {
		return startData;
	}

	public void setStartData(Date startData) {
		this.startData = startData;
	}

	@NotNull(message = "请选择评价的结束日期")
	@JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss")
	public Date getEndData() {
		return endData;
	}

	public void setEndData(Date endData) {
		this.endData = endData;
	}
	
	public Integer getTaskCount() {
		return taskCount;
	}

	public void setTaskCount(Integer taskCount) {
		this.taskCount = taskCount;
	}
	
	public Integer getBugCount() {
		return bugCount;
	}

	public void setBugCount(Integer bugCount) {
		this.bugCount = bugCount;
	}

//	@Max(value = 100,message = "效率数不能大于100") @Min(value = 0,message = "效率数需大于0")
	public Integer getEfficiency() {
		return efficiency;
	}

	public void setEfficiency(Integer efficiency) {
		this.efficiency = efficiency;
	}
	
	@Length(min=0, max=64, message="备用列1长度必须介于 0 和 255 之间")
	public String getExtColum1() {
		return extColum1;
	}

	public void setExtColum1(String extColum1) {
		this.extColum1 = extColum1;
	}
	
	@Length(min=0, max=64, message="备用列2长度必须介于 0 和 255 之间")
	public String getExtColum2() {
		return extColum2;
	}

	public void setExtColum2(String extColum2) {
		this.extColum2 = extColum2;
	}
	
	@Length(min=0, max=64, message="评价人长度必须介于 0 和 64 之间")
	public String getEvalOperation() {
		return evalOperation;
	}

	public void setEvalOperation(String evalOperation) {
		this.evalOperation = evalOperation;
	}
	
	@JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss")
	public Date getEvalDate() {
		return evalDate;
	}

	public void setEvalDate(Date evalDate) {
		this.evalDate = evalDate;
	}
	
}