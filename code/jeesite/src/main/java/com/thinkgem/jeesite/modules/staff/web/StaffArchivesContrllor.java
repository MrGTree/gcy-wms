package com.thinkgem.jeesite.modules.staff.web;

import com.google.common.collect.Lists;
import com.thinkgem.jeesite.common.config.Global;
import com.thinkgem.jeesite.common.persistence.Page;
import com.thinkgem.jeesite.common.utils.DateUtils;
import com.thinkgem.jeesite.common.utils.StringUtils;
import com.thinkgem.jeesite.common.utils.excel.ExportExcel;
import com.thinkgem.jeesite.common.utils.excel.ImportExcel;
import com.thinkgem.jeesite.common.web.BaseController;
import com.thinkgem.jeesite.modules.staff.entity.StaffPropAnswer;
import com.thinkgem.jeesite.modules.staff.entity.StaffPropTemplate;
import com.thinkgem.jeesite.modules.staff.entity.StaffPropTemplateMVC;
import com.thinkgem.jeesite.modules.staff.service.StaffPropAnswerService;
import com.thinkgem.jeesite.modules.sys.dao.UserDao;
import com.thinkgem.jeesite.modules.sys.entity.StaffTemplate;
import com.thinkgem.jeesite.modules.sys.entity.User;
import com.thinkgem.jeesite.modules.sys.service.StaffTemplateService;
import com.thinkgem.jeesite.modules.sys.service.SystemService;
import com.thinkgem.jeesite.modules.sys.utils.DictUtils;
import com.thinkgem.jeesite.modules.sys.utils.UserUtils;
import org.apache.poi.hssf.usermodel.HSSFDateUtil;
import org.apache.poi.ss.usermodel.Cell;
import org.apache.poi.ss.usermodel.Row;
import org.apache.shiro.SecurityUtils;
import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.apache.shiro.subject.Subject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.text.DecimalFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import static com.thinkgem.jeesite.common.service.BaseService.dataScopeFilter;

@Controller
@RequestMapping(value = "${adminPath}/staff/staffArchives")
public class StaffArchivesContrllor extends BaseController {

    @Autowired
    private SystemService systemService;

    @Autowired
    private StaffPropAnswerService staffPropAnswerService;

    @Autowired
    private StaffTemplateService staffTemplateService;

    @Autowired
    private UserDao userDao;

    @RequiresPermissions("staff:archives:view")
    @RequestMapping(value = {"info"})
    public String index(User user, Model model) {
        return "modules/staff/staffBasicInfo";
    }

    @RequiresPermissions("staff:family:view")
    @RequestMapping(value = {"familyInfo"})
    public String familyIndex(User user, Model model) {
        return "modules/staff/staffFamilyInfo";
    }

    @RequiresPermissions("staff:family:view")
    @RequestMapping(value = {"familyList", ""})
    public String familyList(User user, HttpServletRequest request, HttpServletResponse response, Model model) {
        Page<User> page = systemService.findUser(new Page<User>(request, response), user);
        model.addAttribute("page", page);
        return "modules/staff/staffFamilyInfoList";
    }

    @RequiresPermissions("staff:archives:view")
    @RequestMapping(value = {"list", ""})
    public String list(User user, HttpServletRequest request, HttpServletResponse response, Model model) {
        Page<User> page = systemService.findUser(new Page<User>(request, response), user);
        model.addAttribute("page", page);
        return "modules/staff/staffBasicInfoList";
    }

    @RequiresPermissions("sys:user:viewLeave")
    @RequestMapping(value = "leaveList")
    public String leaveList(User user, HttpServletRequest request, HttpServletResponse response, Model model) {
        Page<User> page = systemService.findLeaveUser(new Page<User>(request, response), user);
        model.addAttribute("page", page);
        return "modules/staff/staffLeaveBasicInfoList";
    }

    @RequiresPermissions("staff:archives:view")
    @RequestMapping(value = "export", method= RequestMethod.POST)
    public String exportFile(User user, HttpServletRequest request, HttpServletResponse response, RedirectAttributes redirectAttributes) {
        try {
            List<StaffPropTemplate> templateListByTemplateIdAndRoleId = systemService.getTemplateListByTemplateIdAndRoleId("1", UserUtils.getUser().getRoleIdList());
            user.getSqlMap().put("dsf", dataScopeFilter(user.getCurrentUser(), "o", "a"));
            user.setRoleIdList(UserUtils.getUser().getRoleIdList());
            List<User> allListWithAnswer;
            String fileName;
            String leaveFlag = user.getLeaveFlag();
            long l = System.nanoTime();
            if ("1".equals(leaveFlag)){
                allListWithAnswer = userDao.findAllLeaveListWithAnswer(user);
                fileName = "离职员工信息表"+ DateUtils.getDate("yyyyMMddHHmmss")+".xlsx";
            }else {
                allListWithAnswer = userDao.findAllListWithAnswer(user);
                fileName = "在职员工信息表"+ DateUtils.getDate("yyyyMMddHHmmss")+".xlsx";

            }
            long ls = System.nanoTime();
            System.out.println(ls-l);
            List<String> headerList = Lists.newArrayList();
            int size = templateListByTemplateIdAndRoleId.size();
            int userSize = allListWithAnswer.size();
            for (StaffPropTemplate staffPropTemplate : templateListByTemplateIdAndRoleId) {
                String propName = staffPropTemplate.getStaffPropName();
                if ("离职时间".equals(propName)){
                    if (!"1".equals(leaveFlag)){
                        continue;
                    }
                }
                headerList.add(propName);
            }


            ExportExcel ee = new ExportExcel("", headerList);
            l = System.nanoTime();
            for (int i = 0; i < userSize; i++) {
                Row row = ee.addRow();
                User currentUser = allListWithAnswer.get(i);
                String laoDongHeTongDate = "";
                String birthday="";
                int indexj = 0;
                for (int j = 0; j < size; j++) {
                    StaffPropTemplate staffPropTemplate = templateListByTemplateIdAndRoleId.get(j);
                    String staffDictType = staffPropTemplate.getStaffDictType();
                    String staffPropId = staffPropTemplate.getStaffPropId();
                    String staffPropName = staffPropTemplate.getStaffPropName();
                    Map<String, String> answersIdVal = currentUser.getAnswersIdVal();
                    String val = answersIdVal.get(staffPropId);
                    if ("姓名".equals(staffPropName)){
                        val = currentUser.getName();
                    }else if("所属项目".equals(staffPropName)){
                        val = currentUser.getItem().getName();
                    }else if("职务".equals(staffPropName)){
                        val = currentUser.getUserType();
                    }else if("区域".equals(staffPropName)){
                        val = currentUser.getAreaShi().getName();
                    }else if("项目编号".equals(staffPropName)){
                        val = currentUser.getItem().getItemNo();
                    }else if("员工编号".equals(staffPropName)){
                        val = currentUser.getNo();
                    }else if("联系方式".equals(staffPropName)){
                        val = currentUser.getMobile();
                    }else if("离职时间".equals(staffPropName)){
                        if (!"1".equals(leaveFlag)){
                            indexj++;
                            continue;
                        }
                        Date leaveDate = currentUser.getLeaveDate();
                        if(null == leaveDate){
                            val = "";
                        }else{
                            val = DateUtils.formatDate(leaveDate);
                        }
                    }else if("劳动合同起始日".equals(staffPropName)){
                        laoDongHeTongDate = val;
                    }else if("劳动合同截止日".equals(staffPropName)){
                        if (StringUtils.isNotBlank(laoDongHeTongDate)) {
                            val = DateUtils.formatDate(DateUtils.addDays(DateUtils.addYears(DateUtils.parseDate(laoDongHeTongDate), 3),-1));
                        }
                    }else if ("剩余合同期限(月)".equals(staffPropName)){
                        if (StringUtils.isNotBlank(laoDongHeTongDate)) {
                            double days = DateUtils.getDistanceOfTwoDate(new Date(),DateUtils.addDays(DateUtils.addYears(DateUtils.parseDate(laoDongHeTongDate), 3),-1)) ;
                            double months = days / 30 ;
                            val = new DecimalFormat("######.##").format(months);
                        }
                    }else if("预计转正日".equals(staffPropName)){
                        if (StringUtils.isNotBlank(laoDongHeTongDate)) {
                            val = DateUtils.formatDate(DateUtils.addMonths(DateUtils.parseDate(laoDongHeTongDate),6));
                        }
                    } else if ("出生年月".equals(staffPropName)) {
                        birthday = val;
                    } else if ("年龄".equals(staffPropName)) {
                        if (StringUtils.isNotBlank(birthday)) {
                            val = String.valueOf(new Date().getYear() - DateUtils.parseDate(birthday).getYear());
                        }
                    }
                    String staffPropType = staffPropTemplate.getStaffPropType();
                    if(null == val){
                        val = "";
                    }
                    if (StringUtils.isNotBlank(staffDictType)) {
                        if ("checkbox".equals(staffPropType)){
                            String[] split = StringUtils.split(val, ",");
                            String valTemp = "";
                            for (String s : split) {
                                valTemp = valTemp + DictUtils.getDictLabel(s, staffDictType, "") + ",";
                            }
                            val = valTemp;
                        }else {
                            val = DictUtils.getDictLabel(val, staffDictType, "");
                        }
                    }
                    ee.addCell(row, j - indexj , val);
                }
            }
            ls = System.nanoTime();
            System.out.println(ls - l);
            ee.write(response,fileName).dispose();
            return null;
        } catch (Exception e) {
            addMessage(redirectAttributes, "员工信息表失败！失败信息："+e.getMessage());
        }
        return "redirect:" + adminPath + "/staff/staffArchives/list?repage";
    }


    @RequiresPermissions("sys:user:edit")
    @RequestMapping(value = "import", method=RequestMethod.POST)
    public String importFile(MultipartFile file, RedirectAttributes redirectAttributes) {
        if(Global.isDemoMode()){
            addMessage(redirectAttributes, "演示模式，不允许操作！");
            return "redirect:" + adminPath + "/sys/user/list?repage";
        }
        try {
            int successNum = 0;
            int failureNum = 0;
            StringBuilder failureMsg = new StringBuilder();
            ImportExcel ei = new ImportExcel(file, 0, 0);
            List<StaffPropTemplate> templateListByTemplateIdAndRoleId = systemService.getTemplateListByTemplateIdAndRoleId("1", UserUtils.getUser().getRoleIdList());
            HashMap<String, StaffPropTemplate> nameMap = new HashMap<String, StaffPropTemplate>();
            for (StaffPropTemplate staffPropTemplate : templateListByTemplateIdAndRoleId) {
                nameMap.put(staffPropTemplate.getStaffPropName(),staffPropTemplate);
            }
            Row nameRow = ei.getRow(0);
            for (int i = ei.getDataRowNum(); i < ei.getLastDataRowNum(); i++) {
                Row row = ei.getRow(i);
                String userName = row.getCell(0).getStringCellValue();
                User QueryUser = new User();
                QueryUser.setName(userName);
                User byName = userDao.getByName(QueryUser);
                if (byName == null){
                    failureMsg.append("<br/>姓名： "+userName+" 导入失败，检查该记录的姓名");
                    failureNum++;
                    continue;
                }
                String id = byName.getId();
                List<String> uuidList = staffPropAnswerService.getUUID("1", byName.getId());
                String UUID;
                if (!uuidList.isEmpty()) {
                    UUID = uuidList.get(0);
                    StaffPropAnswer queryStaffPropAnswer = new StaffPropAnswer();
                    queryStaffPropAnswer.setStaffId(id);
                    queryStaffPropAnswer.setTemplateId("1");
                    queryStaffPropAnswer.setUUID(UUID);
                    staffPropAnswerService.deleteStaffAllAnswer(queryStaffPropAnswer);
                }
                String uuid = java.util.UUID.randomUUID().toString();
                for (int j = 1; j < ei.getLastCellNum(); j++) {
                    String name = ei.getCellValue(nameRow, j).toString();
                    StaffPropTemplate staffPropTemplate = nameMap.get(name);
                    if (staffPropTemplate == null){
                        continue;
                    }
                    String val = "";
                    if ("date".equals(staffPropTemplate.getStaffPropType())){
                        Cell cell = row.getCell(j);
                        Date date = null;
                        if (cell.getCellType() == Cell.CELL_TYPE_NUMERIC && HSSFDateUtil.isCellDateFormatted(cell)){
                            date = cell.getDateCellValue();
                            val = DateUtils.formatDate(date);
                        }else{
                            String value = cell.getStringCellValue();
                            date = DateUtils.parseDate(value);
                            val = DateUtils.formatDate(date);
                        }
                    }else{
                        val = ei.getCellValue(row, j).toString();
                    }
                    if (StringUtils.isNotBlank(staffPropTemplate.getStaffDictType())){
                        val = DictUtils.getDictValue(val, staffPropTemplate.getStaffDictType(), "");
                    }
                    StaffPropAnswer staffPropAnswer = new StaffPropAnswer();
                    staffPropAnswer.setTemplateId("1");
                    staffPropAnswer.setStaffPropId(staffPropTemplate.getStaffPropId());
                    staffPropAnswer.setStaffPropVal(val);
                    staffPropAnswer.setUUID(uuid);
                    staffPropAnswer.setStaffId(byName.getId());
                    staffPropAnswerService.save(staffPropAnswer);
                }
                successNum++;

            }
            if (failureNum>0){
                failureMsg.insert(0, "，失败 "+failureNum+" 条用户，导入信息如下：");
            }
            addMessage(redirectAttributes, "已成功导入 "+successNum+" 条用户"+failureMsg);
        } catch (Exception e) {
            addMessage(redirectAttributes, "导入用户失败！失败信息："+e.getMessage());
        }
        return "redirect:" + adminPath + "/staff/staffArchives/list?repage";
    }

    @RequiresPermissions("sys:user:edit")
    @RequestMapping(value = "importExt", method = RequestMethod.POST)
    public String importFileExt(MultipartFile file, RedirectAttributes redirectAttributes) {
        if (Global.isDemoMode()) {
            addMessage(redirectAttributes, "演示模式，不允许操作！");
            return "redirect:" + adminPath + "/sys/user/list?repage";
        }
        try {
            int successNum = 0;
            int failureNum = 0;
            StringBuilder failureMsg = new StringBuilder();
            ImportExcel ei = new ImportExcel(file, 0, 0);
            List<StaffPropTemplate> templateListByTemplateIdAndRoleId = systemService.getTemplateListByTemplateIdAndRoleId("1", UserUtils.getUser().getRoleIdList());
            HashMap<String, StaffPropTemplate> nameMap = new HashMap<String, StaffPropTemplate>();
            for (StaffPropTemplate staffPropTemplate : templateListByTemplateIdAndRoleId) {
                nameMap.put(staffPropTemplate.getStaffPropName(), staffPropTemplate);
            }
            Row nameRow = ei.getRow(0);
            for (int i = ei.getDataRowNum(); i <= ei.getLastDataRowNum(); i++) {
                Row row = ei.getRow(i);
                String userName = row.getCell(0).getStringCellValue();
                User QueryUser = new User();
                QueryUser.setName(userName);
                User byName = userDao.getByName(QueryUser);
                if (byName == null) {
                    failureMsg.append("<br/>姓名： " + userName + " 导入失败，检查该记录的姓名");
                    failureNum++;
                    continue;
                }
                String id = byName.getId();
                List<String> uuidList = staffPropAnswerService.getUUID("1", byName.getId());
                String UUID;
                if (!uuidList.isEmpty()) {
                    UUID = uuidList.get(0);
                }else {
                    UUID = java.util.UUID.randomUUID().toString();
                }
                for (int j = 1; j < ei.getLastCellNum(); j++) {
                    String name = ei.getCellValue(nameRow, j).toString();
                    StaffPropTemplate staffPropTemplate = nameMap.get(name);
                    if (staffPropTemplate == null) {
                        continue;
                    }
                    String val = "";
                    if ("date".equals(staffPropTemplate.getStaffPropType())) {
                        Cell cell = row.getCell(j);
                        Date date = null;
                        if (cell.getCellType() == Cell.CELL_TYPE_NUMERIC && HSSFDateUtil.isCellDateFormatted(cell)) {
                            date = cell.getDateCellValue();
                            val = DateUtils.formatDate(date);
                        } else {
                            String value = cell.getStringCellValue();
                            date = DateUtils.parseDate(value);
                            val = DateUtils.formatDate(date);
                        }
                    } else {
                        val = ei.getCellValue(row, j).toString();
                    }
                    if (StringUtils.isNotBlank(staffPropTemplate.getStaffDictType())) {
                        val = DictUtils.getDictValue(val, staffPropTemplate.getStaffDictType(), "");
                    }
                    StaffPropAnswer staffPropAnswer = new StaffPropAnswer();
                    staffPropAnswer.setTemplateId("1");
                    staffPropAnswer.setStaffPropId(staffPropTemplate.getStaffPropId());
                    staffPropAnswer.setStaffId(byName.getId());
                    staffPropAnswer.setUUID(UUID);
                    if (!uuidList.isEmpty()) {
                        StaffPropAnswer answer = staffPropAnswerService.getByEntity(staffPropAnswer);
                        //判断是否是新增，不是null就是新增，修改val保存
                        if (answer != null) {
                            answer.setStaffPropVal(val);
                            staffPropAnswerService.save(answer);
                        }else {
                            staffPropAnswer.setStaffPropVal(val);
                            staffPropAnswerService.save(staffPropAnswer);
                        }
                    } else {
                        //肯定是新增
                        staffPropAnswer.setStaffPropVal(val);
                        staffPropAnswerService.save(staffPropAnswer);
                    }
                }
                successNum++;
            }
            if (failureNum > 0) {
                failureMsg.insert(0, "，失败 " + failureNum + " 条用户，导入信息如下：");
            }
            addMessage(redirectAttributes, "已成功导入 " + successNum + " 条用户" + failureMsg);
        } catch (Exception e) {
            addMessage(redirectAttributes, "导入用户失败！失败信息：" + e.getMessage());
        }
        return "redirect:" + adminPath + "/staff/staffArchives/list?repage";
    }

    @RequiresPermissions("staff:archives:view")
    @RequestMapping(value = "formList")
    public String formList(StaffPropAnswer staffPropAnswer, Model model) {
        StaffTemplate staffTemplate = staffTemplateService.get(staffPropAnswer.getTemplateId());
        model.addAttribute("staffTemplate", staffTemplate);
        User user = systemService.getUser(staffPropAnswer.getStaffId());
        model.addAttribute("user", user);
        List<StaffPropAnswer> staffPropAnswerList = staffPropAnswerService.getListByStaffIdAndTemplateId(staffPropAnswer.getStaffId(), staffPropAnswer.getTemplateId());
        //HashMap<String, List<StaffPropAnswer>> UUIDAnswerList = new HashMap<String, List<StaffPropAnswer>>();
        HashMap<String, Map<String, StaffPropAnswer>> UUIDAnswerMap = new HashMap<String, Map<String, StaffPropAnswer>>();
        //HashMap<String,List<StaffPropTemplate>> UUIDAnswerMap = new HashMap<String, List<StaffPropTemplate>>();
        //HashMap<String, StaffPropAnswer> answerMap = new HashMap<String, StaffPropAnswer>();
        if (null != staffPropAnswerList && staffPropAnswerList.size() > 0) {
            UUIDAnswerMap = getUUIDAnswerMap(staffPropAnswerList);
        }
       /* List<String> uuidList = staffPropAnswerService.getUUID(staffPropAnswer.getTemplateId(), staffPropAnswer.getStaffId());
        for (String UUID : uuidList) {
            UUIDAnswerMap.put(UUID,systemService.getTemplateListAndAnswerByTemplateIdAndRoleId(staffPropAnswer.getTemplateId(), staffPropAnswer.getStaffId(),UUID, UserUtils.getUser().getRoleIdList()));
        }*/
        model.addAttribute("UUIDAnswerMap", UUIDAnswerMap);
        return "modules/staff/staffBasicList";
    }

    /**
     * staffPropAnswer根据UUID，将list转换成key为UUDI，value为map的map
     * @param staffPropAnswerList
     * @return
     */
    public static HashMap<String, Map<String, StaffPropAnswer>> getUUIDAnswerMap(List<StaffPropAnswer> staffPropAnswerList) {
        HashMap<String, Map<String, StaffPropAnswer>> UUIDAnswerMap = new HashMap<String, Map<String, StaffPropAnswer>>();
        for (StaffPropAnswer staffPropAnswer : staffPropAnswerList) {
            //根据UUID分Map
            Map<String, StaffPropAnswer> answerMap = UUIDAnswerMap.get(staffPropAnswer.getUUID());
            if (null == answerMap) {
                answerMap = new HashMap<String, StaffPropAnswer>();
                //将新生成的answerMap放入UUIDAnswerMap中
                UUIDAnswerMap.put(staffPropAnswer.getUUID(), answerMap);
            }
            //根据找到的
            answerMap.put(staffPropAnswer.getStaffId(), staffPropAnswer);
        }
        return UUIDAnswerMap;
    }

    @RequiresPermissions("staff:archives:view")
    @RequestMapping(value = "form")
    public String form(String templateId, @RequestParam(required = false) String UUID, String staffId, Model model, HttpServletRequest request) {
        User user = systemService.getUser(staffId);
        //根据templateId和当前登录用户的角色确定当前表单的属性列
        /*List<StaffPropTemplate> templateList = systemService.getTemplateListByTemplateIdAndRoleId(templateId, UserUtils.getUser().getRoleIdList());
        List<StaffPropAnswer> staffPropAnswerList = staffPropAnswerService.getListByStaffIdAndTemplateId(staffId, templateId);
        if (null != staffPropAnswerList && staffPropAnswerList.size() > 0 && null != UUID && !"".equals(UUID)) {
            HashMap<String, Map<String, StaffPropAnswer>> UUIDAnswerMap = getUUIDAnswerMap(staffPropAnswerList);

            for (StaffPropTemplate staffPropTemplate : templateList) {
                //员工的表单的回显，StaffPropTemplate增加answer的属性值
                //权限没分配这个属性时，对应的属性Answer这条记录都是没有的，所以是null
                StaffPropAnswer staffPropAnswer = UUIDAnswerMap.get(UUID).get(staffPropTemplate.getStaffPropId());
                staffPropTemplate.setAnswer(staffPropAnswer==null?"":staffPropAnswer.getStaffPropVal());
            }
        }*/
        List<StaffPropTemplate> templateList = systemService.getTemplateListAndAnswerByTemplateIdAndRoleId(templateId, staffId,UUID, UserUtils.getUser().getRoleIdList());
        StaffTemplate staffTemplate = staffTemplateService.get(templateId);
        String referer = request.getHeader("Referer");
        //用于表单添加完成后的页面跳转
        model.addAttribute("referer", referer);
        model.addAttribute("UUID", UUID);
        //判断是添加还是修改档案
        model.addAttribute("user", user);
        //所有的template都使用同一页面展示和保存，页面判断需要template对象
        model.addAttribute("staffTemplate", staffTemplate);
        StaffPropTemplateMVC staffPropTemplateMVC = new StaffPropTemplateMVC();
        staffPropTemplateMVC.setList(templateList);
        model.addAttribute("staffPropTemplateMVC", staffPropTemplateMVC);
        return "modules/staff/staffBasicForm";
    }

    @RequiresPermissions("staff:archives:view")
    @RequestMapping(value = "singletonForm")
    public String singletonForm(String templateId, String staffId, Model model, HttpServletRequest request) {
        User user = systemService.getUser(staffId);
        //根据templateId和当前登录用户的角色确定当前表单的属性列
        //List<StaffPropTemplate> templateList = systemService.getTemplateListByTemplateIdAndRoleId(templateId, UserUtils.getUser().getRoleIdList());
        //List<StaffPropAnswer> staffPropAnswerList = staffPropAnswerService.getListByStaffIdAndTemplateId(staffId, templateId);
        //HashMap<String, StaffPropAnswer> answerMap = new HashMap<String, StaffPropAnswer>();
        //判断有没有表单对应的answer，没有就是新增，不用回显
        //if(null !=staffPropAnswerList && staffPropAnswerList.size()>0){
            //动态表单页面判断是添加还是修改
            //model.addAttribute("UUID","1");
            /*for (StaffPropAnswer staffPropAnswer : staffPropAnswerList) {
                answerMap.put(staffPropAnswer.getStaffPropId(),staffPropAnswer);
            }
            for (StaffPropTemplate staffPropTemplate : templateList) {
                //员工的表单的回显，StaffPropTemplate增加answer的属性值
                //新增角色对应的prop可能Answer不存在对应的条目
                StaffPropAnswer staffPropAnswer = answerMap.get(staffPropTemplate.getStaffPropId());
                staffPropTemplate.setAnswer(staffPropAnswer==null?"":staffPropAnswer.getStaffPropVal());
            }*/
        //}
        List<String> uuidList = staffPropAnswerService.getUUID(templateId, staffId);
        String UUID = "";
        if(!uuidList.isEmpty()){
            UUID = uuidList.get(0);
            model.addAttribute("UUID",UUID);
        }
        Subject subject = SecurityUtils.getSubject();
        //判断是否有权限修改，如果有则必须修改全部
        boolean permitted = subject.isPermitted("staff:archives:edit");
        List<StaffPropTemplate> templateList = null;
        if (permitted){
            //获取当前模板的全部属性和答案
            templateList = systemService.getAllTemplateListAndAnswerByTemplateId(templateId, staffId,UUID);
        }else {
            templateList = systemService.getTemplateListAndAnswerByTemplateIdAndRoleId(templateId, staffId,UUID, UserUtils.getUser().getRoleIdList());
        }

        StaffTemplate staffTemplate = staffTemplateService.get(templateId);
        String referer = request.getHeader("Referer");
        //用于表单添加完成后的页面跳转
        model.addAttribute("referer", referer);
        //判断是添加还是修改档案
        model.addAttribute("user", user);
        //所有的template都使用同一页面展示和保存，页面判断需要template对象
        model.addAttribute("staffTemplate", staffTemplate);
        StaffPropTemplateMVC staffPropTemplateMVC = new StaffPropTemplateMVC();
        staffPropTemplateMVC.setList(templateList);
        model.addAttribute("staffPropTemplateMVC", staffPropTemplateMVC);
        return "modules/staff/staffBasicForm";
    }
}
