/**
 * Copyright &copy; 2012-2016 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.thinkgem.jeesite.modules.staff.web;

import com.thinkgem.jeesite.common.config.Global;
import com.thinkgem.jeesite.common.persistence.Page;
import com.thinkgem.jeesite.common.utils.DateUtils;
import com.thinkgem.jeesite.common.utils.StringUtils;
import com.thinkgem.jeesite.common.utils.excel.ExportExcel;
import com.thinkgem.jeesite.common.web.BaseController;
import com.thinkgem.jeesite.modules.staff.entity.StaffEval;
import com.thinkgem.jeesite.modules.staff.service.StaffEvalService;
import com.thinkgem.jeesite.modules.sys.entity.OfficeEval;
import com.thinkgem.jeesite.modules.sys.entity.User;
import com.thinkgem.jeesite.modules.sys.entity.UserEval;
import com.thinkgem.jeesite.modules.sys.service.OfficeService;
import com.thinkgem.jeesite.modules.sys.service.SystemService;
import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.List;

/**
 * 员工评价模块Controller
 *
 * @author liuji
 * @version 2017-06-20
 */
@Controller
@RequestMapping(value = "${adminPath}/staff/staffEval")
public class StaffEvalController extends BaseController {

    //@Autowired
    private StaffEvalService staffEvalService;

    //@Autowired
    private SystemService systemService;

    //@Autowired
    private OfficeService officeService;

    @ModelAttribute
    public StaffEval get(@RequestParam(required = false) String id, @RequestParam(required = false) String staffId) {
        StaffEval entity = null;
        if (StringUtils.isNotBlank(id)) {
            entity = staffEvalService.get(id);
        }/* else if (StringUtils.isNotBlank(staffId)) {
            entity = staffEvalService.getByStaffId(staffId);
        }*/
        if (entity == null) {
            entity = new StaffEval();
        }
        return entity;
    }

    @RequiresPermissions("staff:staffEval:view")
    @RequestMapping(value = {"info"})
    public String index(User user, Model model) {
        return "modules/staff/staffEvalInfo";
    }

    @RequiresPermissions("staff:staffEval:view")
    @RequestMapping(value = {"list", ""})
    public String list(StaffEval staffEval, HttpServletRequest request, HttpServletResponse response, Model model) {
        Page<StaffEval> page = staffEvalService.findPageByStaffId(new Page<StaffEval>(request, response), staffEval);
        //dataScopeFilter(staffEval,"sdf","","id=a.evalOperation")，数据范围限制，移到service层
        //staffEval.getSqlMap().put("dsf", dataScopeFilter(StaffEval,""));
        model.addAttribute("page", page);
        model.addAttribute("staffEval",staffEval);
        return "modules/staff/staffEvalList";
    }

    @RequiresPermissions("staff:staffEval:view")
    @RequestMapping(value = "evalList")
    public String evalList(UserEval userEval, String type, HttpServletRequest request, HttpServletResponse response, Model model) {
        model.addAttribute("type", type);
        if (null == type || "".equals(type) || "0".equals(type)) {//个人
            Page<UserEval> page = systemService.findUserNotSelf(new Page<UserEval>(request, response), userEval);
            model.addAttribute("page", page);
            return "modules/staff/staffEvalInfoList";
        }
        OfficeEval office = new OfficeEval();
        office.setType(type);
        office.setBeginDate(userEval.getBeginDate());
        office.setEndDate(userEval.getEndDate());
        office.setId(userEval.getOffice() == null ? null : userEval.getOffice().getId());
        office.setTaskCount(userEval.getTaskCount() == null ? null : userEval.getTaskCount());
        office.setGoodCount(userEval.getGoodCount() == null ? null : userEval.getGoodCount());
        office.setBadCount(userEval.getBadCount() == null ? null : userEval.getBadCount());
        office.setBugCount(userEval.getBugCount() == null ? null : userEval.getBugCount());
        Page<OfficeEval> page = officeService.findEvalList(new Page<OfficeEval>(request, response), office);
        model.addAttribute("page", page);
        return "modules/staff/officeEvalInfoList";
    }

    @RequiresPermissions("staff:staffEval:view")
    @RequestMapping(value = "export", method= RequestMethod.POST)
    public String exportFile(UserEval userEval, String type, HttpServletRequest request, HttpServletResponse response, RedirectAttributes redirectAttributes) {
        try {
            String fileName = "员工评价"+ DateUtils.getDate("yyyyMMddHHmmss")+".xlsx";
            //Page<User> page = systemService.findUser(new Page<User>(request, response, -1), user);
            if(null == type || "".equals(type) || "0".equals(type)){//个人
                List<UserEval> list = systemService.findUserNotSelfNoPage(userEval);
                new ExportExcel("", UserEval.class).setDataList(list).write(response, fileName).dispose();
            }else {
                OfficeEval office = new OfficeEval();
                office.setType(type);
                office.setBeginDate(userEval.getBeginDate());
                office.setEndDate(userEval.getEndDate());
                office.setId(userEval.getOffice() == null ? null : userEval.getOffice().getId());
                office.setTaskCount(userEval.getTaskCount() == null ? null : userEval.getTaskCount());
                office.setGoodCount(userEval.getGoodCount() == null ? null : userEval.getGoodCount());
                office.setBadCount(userEval.getBadCount() == null ? null : userEval.getBadCount());
                office.setBugCount(userEval.getBugCount() == null ? null : userEval.getBugCount());
                List<OfficeEval> list = officeService.findEvalListNoPage(office);
                new ExportExcel("", OfficeEval.class).setDataList(list).write(response, fileName).dispose();
            }
            return null;
        } catch (Exception e) {
            addMessage(redirectAttributes, "导出员工评价失败！失败信息："+e.getMessage());
        }
        return "redirect:" + adminPath + "/staff/staffEval/list?repage";
    }


    @RequiresPermissions("staff:staffEval:view")
    @RequestMapping(value = "form")
    public String form(StaffEval staffEval, Model model) {
        User user = systemService.getUser(staffEval.getStaffId());
        model.addAttribute("user", user);
        model.addAttribute("staffEval", staffEval);
        return "modules/staff/staffEvalForm";
    }

    @RequiresPermissions("staff:staffEval:edit")
    @RequestMapping(value = "save")
    public String save(StaffEval staffEval, Model model, RedirectAttributes redirectAttributes) {
        if (!beanValidator(model, staffEval)) {
            return form(staffEval, model);
        }
        staffEvalService.save(staffEval);
        addMessage(redirectAttributes, "保存员工评价成功");
        return "redirect:" + Global.getAdminPath() + "/staff/staffEval/?staffId="+staffEval.getStaffId();
    }

    @RequiresPermissions("staff:staffEval:edit")
    @RequestMapping(value = "delete")
    public String delete(StaffEval staffEval, RedirectAttributes redirectAttributes) {
        staffEvalService.delete(staffEval);
        addMessage(redirectAttributes, "删除员工评价成功");
        return "redirect:" + Global.getAdminPath() + "/staff/staffEval/?staffId="+staffEval.getStaffId();
    }

}