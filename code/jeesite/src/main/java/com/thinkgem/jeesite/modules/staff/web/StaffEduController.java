/**
 * Copyright &copy; 2012-2016 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.thinkgem.jeesite.modules.staff.web;

import com.thinkgem.jeesite.common.config.Global;
import com.thinkgem.jeesite.common.persistence.Page;
import com.thinkgem.jeesite.common.utils.StringUtils;
import com.thinkgem.jeesite.common.web.BaseController;
import com.thinkgem.jeesite.modules.staff.entity.StaffEdu;
import com.thinkgem.jeesite.modules.staff.service.StaffEduService;
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
 * 员工教育Controller
 * @author liuji
 * @version 2017-06-19
 */
@Controller
@RequestMapping(value = "${adminPath}/staff/staffEdu")
public class StaffEduController extends BaseController {

	//@Autowired
	private StaffEduService staffEduService;

	//@Autowired
	private SystemService systemService;
	
	@ModelAttribute
	public StaffEdu get(@RequestParam(required=false) String id,@RequestParam(required=false) String staffId) {
		StaffEdu entity = null;
		if (StringUtils.isNotBlank(id)){
			entity = staffEduService.get(id);
		}
		if (entity == null){
			entity = new StaffEdu();
		}
		return entity;
	}

	@RequiresPermissions("staff:edu:view")
	@RequestMapping(value = {"info"})
	public String index(User user, Model model) {
		return "modules/staff/staffEduInfo";
	}

	@RequiresPermissions("staff:edu:view")
	@RequestMapping(value = "eduList")
	public String evalList(User user, HttpServletRequest request, HttpServletResponse response, Model model) {
		Page<User> page = systemService.findUser(new Page<User>(request, response), user);
		model.addAttribute("page", page);
		return "modules/staff/staffEduInfoList";
	}

	@RequiresPermissions("staff:edu:view")
	@RequestMapping(value = {"list", ""})
	public String list(StaffEdu staffEdu, HttpServletRequest request, HttpServletResponse response, Model model) {
		Page<StaffEdu> page = staffEduService.findPage(new Page<StaffEdu>(request, response), staffEdu);
		List<StaffEdu> listByStaffId = staffEduService.getListByStaffId(staffEdu.getStaffId());
		page.setList(listByStaffId);
		page.setCount(listByStaffId.size());
		model.addAttribute("staffEdu",staffEdu);
		model.addAttribute("page", page);
		return "modules/staff/staffEduList";
	}

	@RequiresPermissions("staff:edu:view")
	@RequestMapping(value = "form")
	public String form(StaffEdu staffEdu, Model model) {
		User user = systemService.getUser(staffEdu.getStaffId());
		model.addAttribute("user", user);
		model.addAttribute("staffEdu", staffEdu);
		return "modules/staff/staffEduForm";
	}

	@RequiresPermissions("staff:edu:edit")
	@RequestMapping(value = "save")
	public String save(StaffEdu staffEdu, String toWorkExp,Model model, RedirectAttributes redirectAttributes) {
		if (!beanValidator(model, staffEdu)){
			return form(staffEdu, model);
		}
		staffEduService.save(staffEdu);
		addMessage(redirectAttributes, "保存教育经历成功");
		if (null != toWorkExp && "保存并完善工作经历".equals(toWorkExp)){
			return "redirect:" + adminPath + "/staff/staffWorkExp/form?staffId="+staffEdu.getStaffId();
		}
		return "redirect:"+Global.getAdminPath()+"/staff/staffEdu/?staffId="+staffEdu.getStaffId();
	}
	
	@RequiresPermissions("staff:edu:edit")
	@RequestMapping(value = "delete")
	public String delete(StaffEdu staffEdu, RedirectAttributes redirectAttributes) {
		staffEduService.delete(staffEdu);
		addMessage(redirectAttributes, "删除教育经历成功");
		return "redirect:"+Global.getAdminPath()+"/staff/staffEdu/?staffId="+staffEdu.getStaffId();
	}

}