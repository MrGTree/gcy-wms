package com.thinkgem.jeesite.modules.staff.entity;

import com.thinkgem.jeesite.common.persistence.DataEntity;

import java.util.HashMap;
import java.util.Map;

/**
 * Created by qingn on 2017/6/21.
 */
public class StaffPropTemplate extends DataEntity<StaffPropTemplate> {
    private static final long serialVersionUID = 1L;
    private String templateId;
    private String templateName;
    private String staffPropId;
    private String staffPropName;
    private String staffPropType;
    private String staffDictType;
    private Integer sort;


    //程序中使用的属性，方便页面显示和操作。不是数据库封装
    private String answer;
    private Boolean ownRight;
    private Boolean ownProp;

    //为了实现附件，利用springMVC的自带的form标签
    private String staffPropValList;

    public String getStaffPropValList() {
        //页面附件回显时使用
        return staffPropValList = this.answer;
    }

    private Map<String,String> IdValMap = new HashMap<String,String>();

    public Map<String, String> getIdValMap() {
        IdValMap.put(this.staffPropId,this.answer);
        return IdValMap;
    }

    public void setIdValMap(Map<String, String> idValMap) {
        IdValMap = idValMap;
    }


    public String getStaffDictType() {
        return staffDictType;
    }

    public void setStaffDictType(String staffDictType) {
        this.staffDictType = staffDictType;
    }

    public void setStaffPropValList(String staffPropValList) {
        this.staffPropValList = staffPropValList;
    }

    public Boolean getOwnProp() {
        return ownProp;
    }

    public void setOwnProp(Boolean ownProp) {
        this.ownProp = ownProp;
    }

    public Boolean getOwnRight() {
        return ownRight;
    }

    public void setOwnRight(Boolean ownRight) {
        this.ownRight = ownRight;
    }

    public String getAnswer() {
        return answer;
    }

    public void setAnswer(String answer) {
        this.answer = answer;
    }

    public String getTemplateId() {
        return templateId;
    }

    public void setTemplateId(String templateId) {
        this.templateId = templateId;
    }

    public String getTemplateName() {
        return templateName;
    }

    public void setTemplateName(String templateName) {
        this.templateName = templateName;
    }

    public String getStaffPropId() {
        return staffPropId;
    }

    public void setStaffPropId(String staffPropId) {
        this.staffPropId = staffPropId;
    }

    public String getStaffPropName() {
        return staffPropName;
    }

    public void setStaffPropName(String staffPropName) {
        this.staffPropName = staffPropName;
    }

    public String getStaffPropType() {
        return staffPropType;
    }

    public void setStaffPropType(String staffPropType) {
        this.staffPropType = staffPropType;
    }

    public Integer getSort() {
        return sort;
    }

    public void setSort(Integer sort) {
        this.sort = sort;
    }

}
