/**
 * Copyright &copy; 2012-2016 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.thinkgem.jeesite.modules.staff.service;

import com.thinkgem.jeesite.common.persistence.Page;
import com.thinkgem.jeesite.common.service.CrudService;
import com.thinkgem.jeesite.modules.staff.dao.StaffEvalDao;
import com.thinkgem.jeesite.modules.staff.entity.StaffEval;
import com.thinkgem.jeesite.modules.sys.dao.UserDao;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

/**
 * 员工评价模块Service
 * @author liuji
 * @version 2017-06-20
 */
@Service
@Transactional(readOnly = true)
public class StaffEvalService extends CrudService<StaffEvalDao, StaffEval> {

	//@Autowired
	private StaffEvalDao staffEvalDao;

	//@Autowired
	private UserDao userDao;

	public StaffEval get(String id) {
		return super.get(id);
	}
	
	public List<StaffEval> findList(StaffEval staffEval) {
		return super.findList(staffEval);
	}
	
	public Page<StaffEval> findPage(Page<StaffEval> page, StaffEval staffEval) {
		return super.findPage(page, staffEval);
	}

	public Page<StaffEval> findPageByStaffId(Page<StaffEval> page,StaffEval staffEval){
		staffEval.getSqlMap().put("dsf", dataScopeFilter(staffEval.getCurrentUser(), "o", "u"));
		staffEval.setPage(page);
		List<StaffEval> evalList = staffEvalDao.getListByStaffId(staffEval);
		page.setList(evalList);
		return page;
	}
	
	@Transactional(readOnly = false)
	public void save(StaffEval staffEval) {
		super.save(staffEval);
		//updateCount(staffEval);
	}

	/*private void updateCount(StaffEval staffEval){
		if (null != staffEval.getGood() && staffEval.getGood()){
			Integer goodCount = staffEvalDao.getStaffGoodCount(staffEval);
			Map<String, Object> map = new HashMap<String, Object>();
			map.put("goodCount",goodCount);
			map.put("id",staffEval.getStaffId());
			userDao.updateGoodCount(map);
		}
		if (null != staffEval.getBad() && staffEval.getBad()){
			Integer badCount = staffEvalDao.getStaffBadCount(staffEval);
			Map<String, Object> map = new HashMap<String, Object>();
			map.put("badCount",badCount);
			map.put("id",staffEval.getStaffId());
			userDao.updateBadCount(map);
		}
		if (null != staffEval.getBugCount()){
			Integer bugCount = staffEvalDao.getStaffBugCount(staffEval);
			Map<String, Object> map = new HashMap<String, Object>();
			map.put("bugCount",bugCount);
			map.put("id",staffEval.getStaffId());
			userDao.updateBugCount(map);
		}
	}*/
	
	@Transactional(readOnly = false)
	public void delete(StaffEval staffEval) {
		super.delete(staffEval);
		//updateCount(staffEval);

	}

	public StaffEval getByStaffId(String staffId) {
		return staffEvalDao.getByStaffId(staffId);
	}

	public List<StaffEval> getListByStaffId(StaffEval staffEval) {
		return staffEvalDao.getListByStaffId(staffEval);
	}
}