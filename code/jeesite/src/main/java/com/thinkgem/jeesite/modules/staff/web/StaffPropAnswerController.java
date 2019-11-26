/**
 * Copyright &copy; 2012-2016 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.thinkgem.jeesite.modules.staff.web;

import com.thinkgem.jeesite.common.persistence.Page;
import com.thinkgem.jeesite.common.utils.StringUtils;
import com.thinkgem.jeesite.common.web.BaseController;
import com.thinkgem.jeesite.modules.staff.entity.StaffPropAnswer;
import com.thinkgem.jeesite.modules.staff.entity.StaffPropAnswerMVC;
import com.thinkgem.jeesite.modules.staff.service.StaffPropAnswerService;
import com.thinkgem.jeesite.modules.sys.entity.User;
import com.thinkgem.jeesite.modules.sys.service.StaffTemplateService;
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

/**
 * 员工档案信息Controller
 *
 * @author liuji
 * @version 2017-06-22
 */
@Controller
@RequestMapping(value = "${adminPath}/staff/staffPropAnswer")
public class StaffPropAnswerController extends BaseController {

    //@Autowired
    private StaffPropAnswerService staffPropAnswerService;

    //@Autowired
    private SystemService systemService;

    //@Autowired
    private StaffTemplateService staffTemplateService;

    @ModelAttribute
    public StaffPropAnswer get(@RequestParam(required = false) String id) {
        StaffPropAnswer entity = null;
        if (StringUtils.isNotBlank(id)) {
            entity = staffPropAnswerService.get(id);
        }
        if (entity == null) {
            entity = new StaffPropAnswer();
        }
        return entity;
    }

    @RequiresPermissions("staff:archives:view")
    @RequestMapping(value = {"list", ""})
    public String list(StaffPropAnswer staffPropAnswer, HttpServletRequest request, HttpServletResponse response, Model model) {
        Page<StaffPropAnswer> page = staffPropAnswerService.findPage(new Page<StaffPropAnswer>(request, response), staffPropAnswer);
        model.addAttribute("page", page);
        return "modules/staff/staffPropAnswerList";
    }

    @RequiresPermissions("staff:archives:view")
    @RequestMapping(value = "form")
    public String form(StaffPropAnswer staffPropAnswer, Model model) {
        model.addAttribute("staffPropAnswer", staffPropAnswer);
        return "modules/staff/staffPropAnswerForm";
    }

    @RequiresPermissions("staff:archives:edit")
    @RequestMapping(value = "save")
    public String save(StaffPropAnswerMVC staffPropAnswerMVC, String staffId, String toEdu, String templateId, String UUID, String referer, Model model, RedirectAttributes redirectAttributes, HttpServletRequest request) {
        /*if (!beanValidator(model, staffPropAnswer)){
			return form(staffPropAnswer, model);
		}*/

        //判断是不是修改，是修改就删除再添加，不是就是直接添加
        if (UUID != null && !"".equals(UUID)) {
            StaffPropAnswer queryStaffPropAnswer = new StaffPropAnswer();
            queryStaffPropAnswer.setStaffId(staffId);
            queryStaffPropAnswer.setTemplateId(templateId);
            queryStaffPropAnswer.setUUID(UUID);
            staffPropAnswerService.deleteStaffAllAnswer(queryStaffPropAnswer);
        }

        String uuid = java.util.UUID.randomUUID().toString();

        for (StaffPropAnswer staffPropAnswer : staffPropAnswerMVC.getList()) {
            staffPropAnswer.setUUID(uuid);
            staffPropAnswerService.save(staffPropAnswer);
        }
        User user = systemService.getUser(staffId);
        addMessage(redirectAttributes, "保存" + user.getName() + "员工" + staffTemplateService.get(templateId).getTemplateName() + "成功");
        //页面将&符号变成了&amp；，暂时这样解决
        if ("2".equals(templateId)){
            return "redirect:" + adminPath +"/staff/staffArchives/formList?staffId="+user.getId()+"&templateId="+templateId;
        }
        if (null != toEdu && "保存并完善教育信息".equals(toEdu)){
            return "redirect:" + adminPath +"/staff/staffEdu/form?staffId="+user.getId();
        }
        return "redirect:" + referer;
    }

    @RequiresPermissions("staff:archives:edit")
    @RequestMapping(value = "delete")
    public String delete(StaffPropAnswer staffPropAnswer, RedirectAttributes redirectAttributes, HttpServletRequest request) {
        staffPropAnswerService.deleteStaffAllAnswer(staffPropAnswer);
        User user = systemService.getUser(staffPropAnswer.getStaffId());
        addMessage(redirectAttributes, "删除" + user.getName() + "员工" + staffTemplateService.get(staffPropAnswer.getTemplateId()).getTemplateName() + "成功");
        //哪个页面的删除按钮就跳转到哪个删除的页面
        String referer = request.getHeader("Referer");
        return "redirect:" + referer;
    }

}