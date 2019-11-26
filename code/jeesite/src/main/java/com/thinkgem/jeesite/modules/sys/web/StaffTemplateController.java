/**
 * Copyright &copy; 2012-2016 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.thinkgem.jeesite.modules.sys.web;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.thinkgem.jeesite.common.config.Global;
import com.thinkgem.jeesite.common.persistence.Page;
import com.thinkgem.jeesite.common.web.BaseController;
import com.thinkgem.jeesite.common.utils.StringUtils;
import com.thinkgem.jeesite.modules.sys.entity.StaffTemplate;
import com.thinkgem.jeesite.modules.sys.service.StaffTemplateService;

/**
 * 员工元属性模板Controller
 * @author zhangyawei
 * @version 2017-06-22
 */
@Controller
@RequestMapping(value = "${adminPath}/sys/staffTemplate")
public class StaffTemplateController extends BaseController {

	//@Autowired
	private StaffTemplateService staffTemplateService;
	
	@ModelAttribute
	public StaffTemplate get(@RequestParam(required=false) String id) {
		StaffTemplate entity = null;
		if (StringUtils.isNotBlank(id)){
			entity = staffTemplateService.get(id);
		}
		if (entity == null){
			entity = new StaffTemplate();
		}
		return entity;
	}
	
	@RequiresPermissions("sys:staffTemplate:view")
	@RequestMapping(value = {"list", ""})
	public String list(StaffTemplate staffTemplate, HttpServletRequest request, HttpServletResponse response, Model model) {
		Page<StaffTemplate> page = staffTemplateService.findPage(new Page<StaffTemplate>(request, response), staffTemplate); 
		model.addAttribute("page", page);
		return "modules/sys/staffTemplateList";
	}

	@RequiresPermissions("sys:staffTemplate:view")
	@RequestMapping(value = "form")
	public String form(StaffTemplate staffTemplate, Model model) {
		model.addAttribute("staffTemplate", staffTemplate);
		return "modules/sys/staffTemplateForm";
	}

	@RequiresPermissions("sys:staffTemplate:edit")
	@RequestMapping(value = "save")
	public String save(StaffTemplate staffTemplate, Model model, RedirectAttributes redirectAttributes) {
		if (!beanValidator(model, staffTemplate)){
			return form(staffTemplate, model);
		}
		staffTemplateService.save(staffTemplate);
		addMessage(redirectAttributes, "保存员工元属性模板成功");
		return "redirect:"+Global.getAdminPath()+"/sys/staffTemplate/?repage";
	}
	
	@RequiresPermissions("sys:staffTemplate:edit")
	@RequestMapping(value = "delete")
	public String delete(StaffTemplate staffTemplate, RedirectAttributes redirectAttributes) {
		staffTemplateService.delete(staffTemplate);
		addMessage(redirectAttributes, "删除员工元属性模板成功");
		return "redirect:"+Global.getAdminPath()+"/sys/staffTemplate/?repage";
	}

}