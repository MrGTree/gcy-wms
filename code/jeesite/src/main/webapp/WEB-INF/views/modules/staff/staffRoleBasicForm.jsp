<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
	<title>${staffTemplate.templateName}角色表单权限管理</title>
	<meta name="decorator" content="default"/>
	<script type="text/javascript">
		$(document).ready(function() {
			$("#no").focus();
			$("#inputForm").validate({
				rules: {
					loginName: {remote: "${ctx}/sys/user/checkLoginName?oldLoginName=" + encodeURIComponent('${user.loginName}')}
				},
				messages: {
					loginName: {remote: "档案登录名已存在"},
					confirmNewPassword: {equalTo: "输入与上面相同的密码"}
				},
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
	<ul class="nav nav-tabs"><%--<li><a href="${ctx}/staff/staffArchives/list">档案列表</a></li>--%>

		<li class="active"><a href="${ctx}/staff/staffRoleProp/form?templateId=${staffTemplate.id}&roleId=${roleId}">${staffTemplate.templateName}角色表单权限管理<shiro:hasPermission name="staff:archives:edit">修改</shiro:hasPermission><shiro:lacksPermission name="staff:archives:edit">查看</shiro:lacksPermission></a></li>
	</ul><br/>
	<sys:message content="${message}"/>
	<form:form id="inputForm" action="${ctx}/staff/staffRoleProp/save" method="post">
		<div class="control-group" hidden="hidden">
			<label class="control-label">角色ID:</label>
			<div class="controls">
				<input type="text" readonly="readonly" name="roleId" value="${roleId}"/>
			</div>
		</div>
		<div class="control-group" hidden="hidden">
			<label class="control-label">模板ID:</label>
			<div class="controls">
				<input type="text" readonly="readonly" name="templateId" value="${staffTemplate.id}"/>
			</div>
		</div>
		<table id="showTable" class="table table-striped table-bordered table-condensed">
			<thead><tr><th style="text-align:center;vertical-align:middle;">表单元素名称</th><th>显示样式</th><th style="text-align:center;vertical-align:middle;">是否有权限</th></tr></thead>
			<tbody>
				<c:forEach items="${templateList}" var="staffPropTemplate">
					<tr>
						<td style="text-align:center;vertical-align:middle;">
							<label class="control-label">${staffPropTemplate.staffPropName}:</label>
						</td>
						<td>
							<c:choose>
								<c:when test="${staffPropTemplate.staffPropType == 'date'}">
									<input id="${staffPropTemplate.templateId}.${staffPropTemplate.staffPropId}"type="text" readonly="readonly" maxlength="20" class="input-medium Wdate" style="width:163px;"
										   onclick="WdatePicker({dateFmt:'yyyy-MM-dd'});"/>
								</c:when>
								<c:when test="${staffPropTemplate.staffPropType == 'textarea'}">
									<textarea rows="1" cols="1" style="width: 250px"></textarea>
								</c:when>
								<c:otherwise>
									<input type="text" maxlength="64" class="input-xlarge" />
								</c:otherwise>
							</c:choose>
						</td>
						<td style="text-align:center;vertical-align:middle;">
							<input id="${staffPropTemplate.templateId}.${staffPropTemplate.staffPropId}_right" name="staffPropIdList" type="checkbox"
								   <c:if test="${staffPropTemplate.ownRight}">checked="checked"</c:if>
								   value="${staffPropTemplate.staffPropId}"
								   style="width:50px;margin:0;padding:0;text-align:center;"/>
						</td>
					</tr>
				</c:forEach>
				<tr>
					<td colspan="3" style="text-align:center;vertical-align:middle;">
						<shiro:hasPermission name="staff:archives:edit"><input id="btnSubmit" class="btn btn-primary" type="submit" value="保 存"/>&nbsp;</shiro:hasPermission>
						<input id="btnCancel" class="btn" type="button" value="返 回" onclick="history.go(-1)"/>
					</td>
				</tr>
			</tbody>
		</table>
	</form:form>
</body>
</html>