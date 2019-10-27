<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
	<title>教育经历管理</title>
	<meta name="decorator" content="default"/>
	<script type="text/javascript">
		$(document).ready(function() {
			//$("#name").focus();
			$("#inputForm").validate({
				submitHandler: function(form){
					loading('正在提交，请稍等...');
					form.submit();
				},
				errorContainer: "#messageBox",
				errorPlacement: function(error, element) {
					$("#messageBox").text("输入有误，请先更正。");
					if (element.is(":checkbox")||element.is(":radio")||element.parent().is(".input-append")){
						error.appendTo(element.parent().parent());
					} else {
						error.insertAfter(element);
					}
				}
			});
		});
	</script>
</head>
<body>
	<ul class="nav nav-tabs">
		<shiro:hasPermission name="staff:archives:view"><li><a href="${ctx}/staff/staffArchives/singletonForm?templateId=1&staffId=${user.id}">基本信息<shiro:hasPermission name="staff:archives:edit">${null != UUID && '' != UUID ?'修改':'添加'}</shiro:hasPermission><shiro:lacksPermission name="staff:archives:edit">查看</shiro:lacksPermission></a></li></shiro:hasPermission>
		<shiro:hasPermission name="staff:edu:view"><li><a href="${ctx}/staff/staffEdu/list?staffId=${user.id}">教育经历列表</a></li></shiro:hasPermission>
		<shiro:hasPermission name="staff:edu:view"><li  class="active"><a href="${ctx}/staff/staffEdu/form?staffId=${user.id}&id=${staffEdu.id}">教育经历<shiro:hasPermission name="staff:edu:edit">${not empty staffEdu.id?'修改':'添加'}</shiro:hasPermission><shiro:lacksPermission name="staff:edu:edit">查看</shiro:lacksPermission></a></li></shiro:hasPermission>
		<shiro:hasPermission name="staff:workExp:view"><li><a href="${ctx}/staff/staffWorkExp?staffId=${user.id}">工作经历列表</a></li></shiro:hasPermission>
		<shiro:hasPermission name="staff:workExp:view"><li><a href="${ctx}/staff/staffWorkExp/form?staffId=${user.id}&id=${staffWorkExp.id}">工作经历<shiro:hasPermission name="staff:workExp:edit">${not empty staffWorkExp.id?'修改':'添加'}</shiro:hasPermission><shiro:lacksPermission name="staff:workExp:edit">查看</shiro:lacksPermission></a></li></shiro:hasPermission>
		<shiro:hasPermission name="staff:family:view"><li><a href="${ctx}/staff/staffArchives/formList?staffId=${user.id}&templateId=2">家庭情况列表</a></li></shiro:hasPermission>
		<shiro:hasPermission name="staff:family:view"><li><a href="${ctx}/staff/staffArchives/form?staffId=${user.id}&templateId=2">家庭情况<shiro:hasPermission name="staff:family:edit">添加/修改</shiro:hasPermission><shiro:lacksPermission name="staff:family:edit">查看</shiro:lacksPermission></a></li></shiro:hasPermission>
	</ul><br/>
	<form:form id="inputForm" modelAttribute="staffEdu" action="${ctx}/staff/staffEdu/save" method="post" class="form-horizontal">
		<form:hidden path="id"/>
		<sys:message content="${message}"/>
		<div class="control-group" hidden="hidden">
			<label class="control-label">员工ID：</label>
			<div class="controls">
				<form:input path="staffId" readonly="true" htmlEscape="false" maxlength="64" class="input-xlarge " />
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">员工姓名：</label>
			<div class="controls">
				<input type="text" readonly="readonly" class="input-xlarge" maxlength="64" value="${user.name}">
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">时间：</label>
			<div class="controls">
				<input name="startData" type="text" readonly="readonly" maxlength="20" class="input-medium Wdate "
					value="<fmt:formatDate value="${staffEdu.startData}" pattern="yyyy-MM-dd"/>"
					onclick="WdatePicker({dateFmt:'yyyy-MM-dd',isShowClear:false});"/>&nbsp;&nbsp; 至 &nbsp;&nbsp;
				<input name="endData" type="text" readonly="readonly" maxlength="20" class="input-medium Wdate "
					   value="<fmt:formatDate value="${staffEdu.endData}" pattern="yyyy-MM-dd"/>"
					   onclick="WdatePicker({dateFmt:'yyyy-MM-dd',isShowClear:false});"/>
				<%-- yyyy-MM-dd HH:mm:ss --%>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">学校：</label>
			<div class="controls">
				<form:input path="schoolName" htmlEscape="false" maxlength="64" class="input-xlarge "/>
			</div>
		</div>
		<%--<div class="control-group">
			<label class="control-label">结束日期：</label>
			<div class="controls">
				<input name="endData" type="text" readonly="readonly" maxlength="20" class="input-medium Wdate "
					value="<fmt:formatDate value="${staffEdu.endData}" pattern="yyyy-MM-dd HH:mm:ss"/>"
					onclick="WdatePicker({dateFmt:'yyyy-MM-dd HH:mm:ss',isShowClear:false});"/>
			</div>
		</div>--%>
		<div class="control-group">
			<label class="control-label">是否统招：</label>
			<div class="controls">
				<form:radiobuttons path="isTongzhao" items="${fns:getDictList('is_tongzhao')}" itemLabel="label" itemValue="value" htmlEscape="false" class=""/>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">专业：</label>
			<div class="controls">
				<form:input path="zhuanye" htmlEscape="false" maxlength="64" class="input-xlarge "/>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">学历：</label>
			<div class="controls">
				<%--<form:input path="xueli" htmlEscape="false" maxlength="64" class="input-xlarge "/>--%>
				<form:select path="xueli" class="input-medium">
					<form:option value="" label=""/>
					<form:options items="${fns:getDictList('xueli_type')}" itemLabel="label" itemValue="value" htmlEscape="false"/>
				</form:select>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">附件：</label>
			<div class="controls">
				<form:hidden id="files" path="files" htmlEscape="false" maxlength="255" class="input-xlarge"/>
				<sys:ckfinder input="files" type="images" uploadPath="/staff/staffEdu" selectMultiple="true"/>
			</div>
		</div>
		<%--<div class="control-group">
			<label class="control-label">备注信息：</label>
			<div class="controls">
				<form:textarea path="remarks" htmlEscape="false" rows="4" maxlength="255" class="input-xxlarge "/>
			</div>
		</div>--%>
		<div class="form-actions">
			 <shiro:hasPermission name="staff:edu:edit"> <input name="toWorkExp" class="btn btn-primary" type="submit" value="保存并完善工作经历"/>&nbsp; </shiro:hasPermission>
			 <shiro:hasPermission name="staff:edu:edit"> <input id="btnSubmit" class="btn btn-primary" type="submit" value="保 存"/>&nbsp; </shiro:hasPermission>
			<input id="btnCancel" class="btn" type="button" value="返 回" onclick="history.go(-1)"/>
		</div>
	</form:form>
</body>
</html>