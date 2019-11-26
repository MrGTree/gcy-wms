/**
 * Copyright &copy; 2012-2016 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.thinkgem.jeesite.modules.sys.web;

import com.thinkgem.jeesite.common.config.Global;
import com.thinkgem.jeesite.common.persistence.Page;
import com.thinkgem.jeesite.common.utils.StringUtils;
import com.thinkgem.jeesite.common.web.BaseController;
import com.thinkgem.jeesite.modules.sys.entity.StaffProp;
import com.thinkgem.jeesite.modules.sys.service.StaffPropService;
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

/**
 * 单表生成Controller
 * @author zhangyawei
 * @version 2017-06-22
 */
@Controller
@RequestMapping(value = "${adminPath}/sys/staffProp")
public class StaffPropController extends BaseController {

	//@Autowired
	private StaffPropService staffPropService;
	
	@ModelAttribute
	public StaffProp get(@RequestParam(required=false) String id) {
		StaffProp entity = null;
		if (StringUtils.isNotBlank(id)){
			entity = staffPropService.get(id);
		}
		if (entity == null){
			entity = new StaffProp();
		}
		return entity;
	}
	
	@RequiresPermissions("sys:staffProp:view")
	@RequestMapping(value = {"list", ""})
	public String list(StaffProp staffProp, HttpServletRequest request, HttpServletResponse response, Model model) {
		Page<StaffProp> page = staffPropService.findPage(new Page<StaffProp>(request, response), staffProp); 
		model.addAttribute("page", page);
		return "modules/sys/staffPropList";
	}

	@RequiresPermissions("sys:staffProp:view")
	@RequestMapping(value = "form")
	public String form(StaffProp staffProp, Model model) {
		model.addAttribute("staffProp", staffProp);
		return "modules/sys/staffPropForm";
	}

	@RequiresPermissions("sys:staffProp:edit")
	@RequestMapping(value = "save")
	public String save(StaffProp staffProp, Model model, RedirectAttributes redirectAttributes) {
		if (!beanValidator(model, staffProp)){
			return form(staffProp, model);
		}
		staffPropService.save(staffProp);
		addMessage(redirectAttributes, "保存元属性成功");
		return "redirect:"+Global.getAdminPath()+"/sys/staffProp/?repage";
	}
	
	@RequiresPermissions("sys:staffProp:edit")
	@RequestMapping(value = "delete")
	public String delete(StaffProp staffProp, RedirectAttributes redirectAttributes) {
		staffPropService.delete(staffProp);
		addMessage(redirectAttributes, "删除元属性成功");
		return "redirect:"+Global.getAdminPath()+"/sys/staffProp/?repage";
	}

}