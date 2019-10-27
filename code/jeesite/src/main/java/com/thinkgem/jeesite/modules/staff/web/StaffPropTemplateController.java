/**
 * Copyright &copy; 2012-2016 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.thinkgem.jeesite.modules.staff.web;

import com.google.common.collect.Lists;
import com.google.common.collect.Maps;
import com.thinkgem.jeesite.common.config.Global;
import com.thinkgem.jeesite.common.utils.StringUtils;
import com.thinkgem.jeesite.common.web.BaseController;
import com.thinkgem.jeesite.modules.staff.entity.StaffPropTemplate;
import com.thinkgem.jeesite.modules.staff.entity.StaffPropTemplateMVC;
import com.thinkgem.jeesite.modules.staff.entity.StaffRoleProp;
import com.thinkgem.jeesite.modules.staff.service.StaffRolePropService;
import com.thinkgem.jeesite.modules.sys.entity.StaffTemplate;
import com.thinkgem.jeesite.modules.sys.service.StaffPropTemplateService;
import com.thinkgem.jeesite.modules.sys.service.StaffTemplateService;
import com.thinkgem.jeesite.modules.sys.service.SystemService;
import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import javax.servlet.http.HttpServletResponse;
import java.util.*;

/**
 * 模板对应属性设置Controller
 *
 * @author liuji
 * @version 2017-06-28
 */
@Controller
@RequestMapping(value = "${adminPath}/staff/staffPropTemplate")
public class StaffPropTemplateController extends BaseController {

    @Autowired
    private StaffRolePropService staffRolePropService;

    @Autowired
    private SystemService systemService;

    @Autowired
    private StaffTemplateService staffTemplateService;

    @Autowired
    private StaffPropTemplateService staffPropTemplateService;

    /*@ModelAttribute
    public StaffRoleProp get(@RequestParam(required = false) String id) {
        StaffRoleProp entity = null;
        if (StringUtils.isNotBlank(id)) {
            entity = staffRolePropService.get(id);
        }
        if (entity == null) {
            entity = new StaffRoleProp();
        }
        return entity;
    }*/

    @RequiresPermissions("staff:staffPropTemplate:view")
    @RequestMapping(value = {"info"})
    public String index() {
        return "modules/staff/staffPropTemplateInfo";
    }

    /*@RequiresPermissions("staff:staffPropTemplate:view")
    @RequestMapping(value = {"list", ""})
    public String list(StaffRoleProp staffRoleProp, HttpServletRequest request, HttpServletResponse response, Model model) {
        StaffTemplate staffTemplate = new StaffTemplate();
        Page<StaffTemplate> page = staffTemplateService.findPage(new Page<StaffTemplate>(request, response), staffTemplate);
        model.addAttribute("page", page);
        String roleId = staffRoleProp.getRoleId();
        if (null == roleId || "".equals(roleId)) {
            return "modules/staff/noneRole";
        }
        model.addAttribute("roleId", roleId);
        return "modules/staff/staffRolePropList";
    }*/

    @RequiresPermissions("staff:staffPropTemplate:view")
    @RequestMapping(value = "form")
    public String form(String templateId, Model model) {
        //获取所有的属性
        List<StaffPropTemplate> allTemplateList = systemService.getAllTemplateList();
        //获取该模板的拥有属性
        List<StaffPropTemplate> templateList = systemService.getTemplateListByTemplateId(templateId);
        HashMap<String, StaffPropTemplate> allIdMap = new HashMap<String, StaffPropTemplate>();
        for (StaffPropTemplate staffPropTemplate : templateList) {
            allIdMap.put(staffPropTemplate.getStaffPropId(), staffPropTemplate);
        }
        //对比设置，所有属性的成员变量的值
        for (StaffPropTemplate staffPropTemplate : allTemplateList) {
            StaffPropTemplate propTemplate = allIdMap.get(staffPropTemplate.getStaffPropId());
            if (null == propTemplate) {
                staffPropTemplate.setOwnProp(false);
                staffPropTemplate.setSort(Integer.MAX_VALUE);
            } else {
                staffPropTemplate.setOwnProp(true);
                staffPropTemplate.setTemplateId(propTemplate.getTemplateId());
                staffPropTemplate.setTemplateName(propTemplate.getTemplateName());
                staffPropTemplate.setStaffPropType(propTemplate.getStaffPropType());
                staffPropTemplate.setStaffDictType(propTemplate.getStaffDictType());
                staffPropTemplate.setSort(propTemplate.getSort());
            }
        }
        Collections.sort(allTemplateList, new Comparator<StaffPropTemplate>() {
            @Override
            public int compare(StaffPropTemplate o1, StaffPropTemplate o2) {
                return o1.getSort() - o2.getSort();
            }
        });
        StaffTemplate staffTemplate = staffTemplateService.get(templateId);
        model.addAttribute("staffTemplate", staffTemplate);
        StaffPropTemplateMVC staffPropTemplateMVC = new StaffPropTemplateMVC();
        staffPropTemplateMVC.setList(allTemplateList);
        model.addAttribute("staffPropTemplateMVC", staffPropTemplateMVC);
        if (null == templateId || "".equals(templateId)) {
            return "modules/staff/noneTemplate";
        }
        return "modules/staff/staffTemplateBasicForm";
    }

/*    @RequiresPermissions("staff:staffPropTemplate:edit")
    @RequestMapping(value = "save")
    public String save(String templateId, String staffPropType, String sort, String staffPropId, Model model, RedirectAttributes redirectAttributes) {

        String[] staffPropIds = StringUtils.split(staffPropId, ",");
        String[] sorts = StringUtils.split(sort, ",");
        //对list进行remove，然后遍历，使用CopyOnWriteArrayList，sort是根据角标的选择的，不设置的为空
        CopyOnWriteArrayList<String> sortList = new CopyOnWriteArrayList<String>(Arrays.asList(sorts));
        for (String s : sortList) {
            if ("".equals(s.trim())) {
                sortList.remove(s);
            }
        }
        //String[] staffPropTypes = StringUtils.split(staffPropType, ",");
        //工具类分隔时自动去除了""的字符串，利用index区分是错位
        String[] staffPropTypes = staffPropType.split(",");

        staffPropTemplateService.deleteAllByTemplateId(templateId);

        for (int i = 0; i < staffPropIds.length; i++) {
            StaffPropTemplate staffPropTemplate = new StaffPropTemplate();
            staffPropTemplate.setTemplateId(templateId);
            staffPropTemplate.setStaffPropId(staffPropIds[i]);
            //只是勾选了id，没有设置类型
            staffPropTemplate.setStaffPropType(staffPropTypes.length > i ? staffPropTypes[i] : "");
            //勾选id，没有设置排序，默认是最大，显示时按最大的处理为空
            staffPropTemplate.setSort(Integer.parseInt((sortList.size() > i) ? sortList.get(i).trim() : "2147483646"));//存储的值
            //表单验证，对单个保存的对象，不是业务数据没有必要验证
            *//*if (!beanValidator(model, staffPropTemplate)) {
                return form(templateId, model);
            }*//*
            staffPropTemplateService.save(staffPropTemplate);
        }

        addMessage(redirectAttributes, "保存表单拥有属性成功");
        return "redirect:" + Global.getAdminPath() + "/staff/staffPropTemplate/form?templateId=" + templateId;
    }*/

    @RequiresPermissions("staff:staffPropTemplate:edit")
    @RequestMapping(value = "save")
    public String save(StaffPropTemplateMVC staffPropTemplateMVC, String templateId, Model model, RedirectAttributes redirectAttributes) {

        staffPropTemplateService.deleteAllByTemplateId(templateId);

        for (StaffPropTemplate staffPropTemplate : staffPropTemplateMVC.getList()) {
            //未选中
            if (null == staffPropTemplate.getStaffPropId() || "".equals(staffPropTemplate.getStaffPropId())){
                continue;
            }
            //可能没有填排序
            if (null == staffPropTemplate.getSort()){
                staffPropTemplate.setSort(Integer.MAX_VALUE - 1);
            }
            staffPropTemplateService.save(staffPropTemplate);
        }

        addMessage(redirectAttributes, "保存表单拥有属性成功");
        return "redirect:" + Global.getAdminPath() + "/staff/staffPropTemplate/form?templateId=" + templateId;
    }

    @RequiresPermissions("staff:staffPropTemplate:edit")
    @RequestMapping(value = "delete")
    public String delete(StaffRoleProp staffRoleProp, RedirectAttributes redirectAttributes) {
        staffRolePropService.delete(staffRoleProp);
        addMessage(redirectAttributes, "删除角色对应的属性成功");
        return "redirect:" + Global.getAdminPath() + "/staff/staffRoleProp/?repage";
    }

    @RequiresPermissions("staff:staffPropTemplate:edit")
    @ResponseBody
    @RequestMapping(value = "treeData")
    public List<Map<String, Object>> treeData(@RequestParam(required = false) String extId, HttpServletResponse response) {
        List<Map<String, Object>> mapList = Lists.newArrayList();
        List<StaffTemplate> list = staffTemplateService.findALLListNoPage();
        for (int i = 0; i < list.size(); i++) {
            StaffTemplate staffTemplate = list.get(i);
            if (StringUtils.isBlank(extId) || (extId != null && !extId.equals(staffTemplate.getId()))) {
                Map<String, Object> map = Maps.newHashMap();
                map.put("id", staffTemplate.getId());
                map.put("pId", 0);
                map.put("name", staffTemplate.getTemplateName());
                mapList.add(map);
            }
        }
        return mapList;
    }

}