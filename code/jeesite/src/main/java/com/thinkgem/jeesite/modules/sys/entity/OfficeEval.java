/**
 * Copyright &copy; 2012-2016 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.thinkgem.jeesite.modules.sys.entity;

import com.thinkgem.jeesite.common.persistence.TreeEntity;
import com.thinkgem.jeesite.common.utils.excel.annotation.ExcelField;
import org.hibernate.validator.constraints.Length;

import javax.validation.constraints.NotNull;
import java.text.DecimalFormat;
import java.util.Date;
import java.util.List;

/**
 * 机构Entity
 * @author ThinkGem
 * @version 2013-05-15
 */
public class OfficeEval extends TreeEntity<OfficeEval> {

	private static final long serialVersionUID = 1L;
//	private Office parent;	// 父级编号
//	private String parentIds; // 所有父级编号
	private Area area;		// 归属区域
	private String code; 	// 机构编码
//	private String name; 	// 机构名称
//	private Integer sort;		// 排序
	private String type; 	// 机构类型（1：公司；2：部门；3：小组）
	private String grade; 	// 机构等级（1：一级；2：二级；3：三级；4：四级）
	private String address; // 联系地址
	private String zipCode; // 邮政编码
	private String master; 	// 负责人
	private String phone; 	// 电话
	private String fax; 	// 传真
	private String email; 	// 邮箱
	private String useable;//是否可用
	private User primaryPerson;//主负责人
	private User deputyPerson;//副负责人
	private List<String> childDeptList;//快速添加子部门

	private Integer goodCount; //员工奖励计数
	private Integer badCount; //员工惩罚计数
	private Integer bugCount; //员工bug计数
	private Integer taskCount; //完成功能总数
	private Double bugPoint; //bug完成功能占比
	private Integer avgEfficiency; //平均效率数
	private Integer evalCount; //评价次数

	private Date beginDate;		// 开始日期
	private Date endDate;		// 结束日期

	public Integer getEvalCount() {
		return evalCount;
	}

	public void setEvalCount(Integer evalCount) {
		this.evalCount = evalCount;
	}

	@ExcelField(title="评价次数", align=2, sort=3)
	public Integer getEvalCountStr() {
		return this.evalCount == null ? 0:this.evalCount;
	}

	@Override
	@ExcelField(title="部门名称", align=2, sort=1)
	public String getName() {
		return this.name;
	}

	@ExcelField(title="主负责人", align=2, sort=2)
	public String getPrimaryPersonName(){
		if (this.primaryPerson == null || this.primaryPerson.getName() == null){
			return "";
		}
		return this.primaryPerson.getName();
	}
	//页面显示double保留6位小数
	public String getBugPointStr() {
		DecimalFormat decimalFormat = new DecimalFormat();
		decimalFormat.applyPattern("######.######");
		return decimalFormat.format(this.bugPoint == null ? 0 : this.bugPoint);
	}

	@ExcelField(title="任务延期次数", align=2, sort=6)
	public Integer getAvgEfficiencyStr() {
		return this.avgEfficiency == null?0:this.avgEfficiency;
	}

	@ExcelField(title="工作任务条数", align=2, sort=4)
	public Integer getTaskCountStr() {
		return this.taskCount == null?0:this.taskCount;
	}

	@ExcelField(title="奖励总数", align=2, sort=7)
	public Integer getGoodCountStr() {
		return this.goodCount == null ? 0:this.goodCount;
	}

	@ExcelField(title="惩罚总数", align=2, sort=8)
	public Integer getBadCountStr() {
		return this.badCount == null ? 0:this.badCount;
	}


	@ExcelField(title="生产缺陷数量", align=2, sort=5)
	public Integer getBugCountStr() {
		return this.bugCount == null?0:this.bugCount;
	}

	public Integer getGoodCount() {
		return goodCount;
	}

	public void setGoodCount(Integer goodCount) {
		this.goodCount = goodCount;
	}

	public Integer getBadCount() {
		return badCount;
	}

	public void setBadCount(Integer badCount) {
		this.badCount = badCount;
	}

	public Integer getBugCount() {
		return bugCount;
	}

	public void setBugCount(Integer bugCount) {
		this.bugCount = bugCount;
	}

	public Integer getTaskCount() {
		return taskCount;
	}

	public void setTaskCount(Integer taskCount) {
		this.taskCount = taskCount;
	}

	public Double getBugPoint() {
		return bugPoint;
	}

	public void setBugPoint(Double bugPoint) {
		this.bugPoint = bugPoint;
	}

	public Integer getAvgEfficiency() {
		return avgEfficiency;
	}

	public void setAvgEfficiency(Integer avgEfficiency) {
		this.avgEfficiency = avgEfficiency;
	}

	public Date getBeginDate() {
		return beginDate;
	}

	public void setBeginDate(Date beginDate) {
		this.beginDate = beginDate;
	}

	public Date getEndDate() {
		return endDate;
	}

	public void setEndDate(Date endDate) {
		this.endDate = endDate;
	}

	public OfficeEval(){
		super();
//		this.sort = 30;
		this.type = "2";
	}

	public OfficeEval(String id){
		super(id);
	}
	
	public List<String> getChildDeptList() {
		return childDeptList;
	}

	public void setChildDeptList(List<String> childDeptList) {
		this.childDeptList = childDeptList;
	}

	public String getUseable() {
		return useable;
	}

	public void setUseable(String useable) {
		this.useable = useable;
	}

	public User getPrimaryPerson() {
		return primaryPerson;
	}

	public void setPrimaryPerson(User primaryPerson) {
		this.primaryPerson = primaryPerson;
	}

	public User getDeputyPerson() {
		return deputyPerson;
	}

	public void setDeputyPerson(User deputyPerson) {
		this.deputyPerson = deputyPerson;
	}

//	@JsonBackReference
//	@NotNull
	public OfficeEval getParent() {
		return parent;
	}

	public void setParent(OfficeEval parent) {
		this.parent = parent;
	}
//
//	@Length(min=1, max=2000)
//	public String getParentIds() {
//		return parentIds;
//	}
//
//	public void setParentIds(String parentIds) {
//		this.parentIds = parentIds;
//	}

	@NotNull
	public Area getArea() {
		return area;
	}

	public void setArea(Area area) {
		this.area = area;
	}
//
//	@Length(min=1, max=100)
//	public String getName() {
//		return name;
//	}
//
//	public void setName(String name) {
//		this.name = name;
//	}
//
//	public Integer getSort() {
//		return sort;
//	}
//
//	public void setSort(Integer sort) {
//		this.sort = sort;
//	}
	
	@Length(min=1, max=1)
	public String getType() {
		return type;
	}

	public void setType(String type) {
		this.type = type;
	}

	@Length(min=1, max=1)
	public String getGrade() {
		return grade;
	}

	public void setGrade(String grade) {
		this.grade = grade;
	}

	@Length(min=0, max=255)
	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	@Length(min=0, max=100)
	public String getZipCode() {
		return zipCode;
	}

	public void setZipCode(String zipCode) {
		this.zipCode = zipCode;
	}

	@Length(min=0, max=100)
	public String getMaster() {
		return master;
	}

	public void setMaster(String master) {
		this.master = master;
	}

	@Length(min=0, max=200)
	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	@Length(min=0, max=200)
	public String getFax() {
		return fax;
	}

	public void setFax(String fax) {
		this.fax = fax;
	}

	@Length(min=0, max=200)
	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	@Length(min=0, max=100)
	public String getCode() {
		return code;
	}

	public void setCode(String code) {
		this.code = code;
	}

//	public String getParentId() {
//		return parent != null && parent.getId() != null ? parent.getId() : "0";
//	}
	
	@Override
	public String toString() {
		return name;
	}
}