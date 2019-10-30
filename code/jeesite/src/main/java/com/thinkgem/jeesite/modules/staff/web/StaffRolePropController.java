/**
 * Copyright &copy; 2012-2016 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.thinkgem.jeesite.modules.staff.web;

import com.google.common.collect.Lists;
import com.google.common.collect.Maps;
import com.thinkgem.jeesite.common.config.Global;
import com.thinkgem.jeesite.common.persistence.Page;
import com.thinkgem.jeesite.common.utils.StringUtils;
import com.thinkgem.jeesite.common.web.BaseController;
import com.thinkgem.jeesite.modules.staff.entity.StaffPropTemplate;
import com.thinkgem.jeesite.modules.staff.entity.StaffRoleProp;
import com.thinkgem.jeesite.modules.staff.service.StaffRolePropService;
import com.thinkgem.jeesite.modules.sys.entity.Role;
import com.thinkgem.jeesite.modules.sys.entity.StaffTemplate;
import com.thinkgem.jeesite.modules.sys.service.StaffTemplateService;
import com.thinkgem.jeesite.modules.sys.service.SystemService;
import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * 角色对应的模板和属性设置Controller
 * @author liuji
 * @version 2017-06-27
 */
@Controller
@RequestMapping(value = "${adminPath}/staff/staffRoleProp")
public class StaffRolePropController extends BaseController {

	@Autowired
	private StaffRolePropService staffRolePropService;

	@Autowired
	private SystemService systemService;

	@Autowired
	private StaffTemplateService staffTemplateService;
	
	@ModelAttribute
	public StaffRoleProp get(@RequestParam(required=false) String id) {
		StaffRoleProp entity = null;
		if (StringUtils.isNotBlank(id)){
			entity = staffRolePropService.get(id);
		}
		if (entity == null){
			entity = new StaffRoleProp();
		}
		return entity;
	}

	@RequiresPermissions("staff:staffRoleProp:view")
	@RequestMapping(value = {"info"})
	public String index() {
		return "modules/staff/staffRolePropInfo";
	}
	
	@RequiresPermissions("staff:staffRoleProp:view")
	@RequestMapping(value = {"list", ""})
	public String list(StaffRoleProp staffRoleProp, HttpServletRequest request, HttpServletResponse response, Model model) {
		StaffTemplate staffTemplate = new StaffTemplate();
		Page<StaffTemplate> page = staffTemplateService.findPage(new Page<StaffTemplate>(request, response), staffTemplate);
		model.addAttribute("page", page);
		String roleId = staffRoleProp.getRoleId();
		if (null == roleId || "".equals(roleId)){
			return "modules/staff/noneRole";
		}
		model.addAttribute("roleId",roleId);
		return "modules/staff/staffRolePropList";
	}

	@RequiresPermissions("staff:staffRoleProp:view")
	@RequestMapping(value = "form")
	public String form(String templateId,String roleId, Model model) {
		ArrayList<String> list = new ArrayList<String>();
		list.add(roleId);
		List<StaffPropTemplate> templateList = systemService.getTemplateListByTemplateIdAndRoleId(templateId,list);
		HashMap<String, StaffPropTemplate> idMap = new HashMap<String, StaffPropTemplate>();
		for (StaffPropTemplate staffPropTemplate : templateList) {
			idMap.put(staffPropTemplate.getStaffPropId(),staffPropTemplate);
		}
		List<StaffPropTemplate> allTemplateList = systemService.getTemplateListByTemplateId(templateId);
		for (StaffPropTemplate staffPropTemplate : allTemplateList) {
			StaffPropTemplate propTemplate = idMap.get(staffPropTemplate.getStaffPropId());
			if (null == propTemplate){
				staffPropTemplate.setOwnRight(false);
			}else {
				staffPropTemplate.setOwnRight(true);
			}
		}

		StaffTemplate staffTemplate = staffTemplateService.get(templateId);
		//所有的template都使用同一页面展示和保存，页面判断需要template对象
		model.addAttribute("staffTemplate", staffTemplate);
		model.addAttribute("templateList", allTemplateList);
		model.addAttribute("roleId",roleId);
		return "modules/staff/staffRoleBasicForm";
	}

	@RequiresPermissions("staff:staffRoleProp:edit")
	@RequestMapping(value = "save")
	public String save(String roleId, String templateId, String staffPropIdList,  Model model, RedirectAttributes redirectAttributes) {
		/*if (!beanValidator(model, staffRoleProp)){
			return form(staffRoleProp, model);
		}*/
		StaffRoleProp queryStaffRoleProp = new StaffRoleProp();
		queryStaffRoleProp.setRoleId(roleId);
		queryStaffRoleProp.setTemplateId(templateId);
		staffRolePropService.deleteAllRoleProp(queryStaffRoleProp);

		String[] ids = staffPropIdList.split(",");
		for (String id : ids) {
			StaffRoleProp staffRoleProp = new StaffRoleProp();
			staffRoleProp.setRoleId(roleId);
			staffRoleProp.setTemplateId(templateId);
			staffRoleProp.setStaffPropId(id);
			staffRolePropService.save(staffRoleProp);
		}
		addMessage(redirectAttributes, "保存角色对应的属性成功");
		return "redirect:"+Global.getAdminPath()+"/staff/staffRoleProp?roleId="+roleId;
	}
	
	@RequiresPermissions("staff:staffRoleProp:edit")
	@RequestMapping(value = "delete")
	public String delete(StaffRoleProp staffRoleProp, RedirectAttributes redirectAttributes) {
		staffRolePropService.delete(staffRoleProp);
		addMessage(redirectAttributes, "删除角色对应的属性成功");
		return "redirect:"+Global.getAdminPath()+"/staff/staffRoleProp/?repage";
	}

	@RequiresPermissions("staff:staffRoleProp:edit")
	@ResponseBody
	@RequestMapping(value = "treeData")
	public List<Map<String, Object>> treeData(@RequestParam(required=false) String extId, HttpServletResponse response) {
		List<Map<String, Object>> mapList = Lists.newArrayList();
		List<Role> list = systemService.findAllRole();
		for (int i=0; i<list.size(); i++){
			Role e = list.get(i);
			if (StringUtils.isBlank(extId) || (extId!=null && !extId.equals(e.getId()))){
				Map<String, Object> map = Maps.newHashMap();
				map.put("id", e.getId());
				map.put("pId", 0);
				map.put("name", e.getName());
				mapList.add(map);
			}
		}
		return mapList;
	}

}