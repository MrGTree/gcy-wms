/**
 * Copyright &copy; 2012-2016 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.thinkgem.jeesite.modules.staff.web;

import com.thinkgem.jeesite.common.config.Global;
import com.thinkgem.jeesite.common.persistence.Page;
import com.thinkgem.jeesite.common.utils.StringUtils;
import com.thinkgem.jeesite.common.web.BaseController;
import com.thinkgem.jeesite.modules.staff.entity.StaffWorkExp;
import com.thinkgem.jeesite.modules.staff.service.StaffWorkExpService;
import com.thinkgem.jeesite.modules.sys.entity.User;
import com.thinkgem.jeesite.modules.sys.service.SystemService;
import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.List;

/**
 * 员工工作经历Controller
 * @author liuji
 * @version 2017-06-21
 */
@Controller
@RequestMapping(value = "${adminPath}/staff/staffWorkExp")
public class StaffWorkExpController extends BaseController {

	//@Autowired
	private StaffWorkExpService staffWorkExpService;

	//@Autowired
	private SystemService systemService;
	
	@ModelAttribute
	public StaffWorkExp get(@RequestParam(required=false) String id) {
		StaffWorkExp entity = null;
		if (StringUtils.isNotBlank(id)){
			entity = staffWorkExpService.get(id);
		}
		if (entity == null){
			entity = new StaffWorkExp();
		}
		return entity;
	}

	@RequiresPermissions("staff:workExp:view")
	@RequestMapping(value = {"info"})
	public String index(User user, Model model) {
		return "modules/staff/staffWorkExpInfo";
	}

	@RequiresPermissions("staff:workExp:view")
	@RequestMapping(value = "workExpList")
	public String evalList(User user, HttpServletRequest request, HttpServletResponse response, Model model) {
		Page<User> page = systemService.findUser(new Page<User>(request, response), user);
		model.addAttribute("page", page);
		return "modules/staff/staffWorkExpInfoList";
	}
	
	@RequiresPermissions("staff:workExp:view")
	@RequestMapping(value = {"list", ""})
	public String list(StaffWorkExp staffWorkExp, HttpServletRequest request, HttpServletResponse response, Model model) {
		Page<StaffWorkExp> page = staffWorkExpService.findPage(new Page<StaffWorkExp>(request, response), staffWorkExp);
		List<StaffWorkExp> listByStaffId = staffWorkExpService.getListByStaffId(staffWorkExp.getStaffId());
		page.setList(listByStaffId);
		page.setCount(listByStaffId.size());
		model.addAttribute("staffWorkExp",staffWorkExp);
		model.addAttribute("page", page);
		return "modules/staff/staffWorkExpList";
	}

	@RequiresPermissions("staff:workExp:view")
	@RequestMapping(value = "form")
	public String form(StaffWorkExp staffWorkExp, Model model) {
		User user = systemService.getUser(staffWorkExp.getStaffId());
		model.addAttribute("user", user);
		model.addAttribute("staffWorkExp", staffWorkExp);
		return "modules/staff/staffWorkExpForm";
	}

	@RequiresPermissions("staff:workExp:edit")
	@RequestMapping(value = "save")
	public String save(StaffWorkExp staffWorkExp, String toFamily,Model model, RedirectAttributes redirectAttributes) {
		if (!beanValidator(model, staffWorkExp)){
			return form(staffWorkExp, model);
		}
		staffWorkExpService.save(staffWorkExp);
		addMessage(redirectAttributes, "保存员工工作经历成功");
		if (null != toFamily && "保存并完善家庭信息".equals(toFamily)){
			return "redirect:" + adminPath + "/staff/staffArchives/form?templateId=2&staffId="+staffWorkExp.getStaffId();
		}
		return "redirect:"+Global.getAdminPath()+"/staff/staffWorkExp/?staffId="+staffWorkExp.getStaffId();
	}
	
	@RequiresPermissions("staff:workExp:edit")
	@RequestMapping(value = "delete")
	public String delete(StaffWorkExp staffWorkExp, RedirectAttributes redirectAttributes) {
		staffWorkExpService.delete(staffWorkExp);
		addMessage(redirectAttributes, "删除员工工作经历成功");
		return "redirect:"+Global.getAdminPath()+"/staff/staffWorkExp/?staffId="+staffWorkExp.getStaffId();
	}

}