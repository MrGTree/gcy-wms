<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
	<title>${staffTemplate.templateName}表单管理</title>
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

        /*function changeType(id) {
            if(document.getElementById(id).checked){
                var selectString = 'select[about = ' + id + ']';
                $(selectString).children().eq(1).attr("disable",false);
                $(selectString).children().eq(1).attr("selected","selected");
            };
        }*/
	</script>
</head>
<body>
	<ul class="nav nav-tabs"><%--<li><a href="${ctx}/staff/staffArchives/list">档案列表</a></li>--%>

		<li class="active"><a href="${ctx}/staff/staffRoleProp/form?templateId=${staffTemplate.id}&roleId=${roleId}">${staffTemplate.templateName}表单<shiro:hasPermission name="staff:archives:edit">修改</shiro:hasPermission><shiro:lacksPermission name="staff:archives:edit">查看</shiro:lacksPermission></a></li>
	</ul><br/>
	<sys:message content="${message}"/>
	<form:form id="inputForm" action="${ctx}/staff/staffPropTemplate/save" method="post">
		<div class="control-group" hidden="hidden">
			<label class="control-label">模板ID:</label>
			<div class="controls">
				<input type="text" readonly="readonly" name="templateId" value="${staffTemplate.id}"/>
			</div>
		</div>
		<table id="showTable" class="table table-striped table-bordered table-condensed">
			<thead><tr><th style="text-align:center;vertical-align:middle;">表单元素名称</th><th style="text-align:center;vertical-align:middle;">显示样式</th><th style="text-align:center;vertical-align:middle;">样式选择</th><th style="text-align:center;vertical-align:middle;" title="显示表单类型设置为“下拉框、复选框、点选框”时，需设置字典的类型">字典类型</th><th style="text-align:center;vertical-align:middle;">排序</th><th style="text-align:center;vertical-align:middle;">表单是否有属性</th></tr></thead>
			<tbody>
				<c:forEach items="${staffPropTemplateMVC.list}" var="staffPropTemplate" varStatus="vs">
					<tr>
						<td style="text-align:center;vertical-align:middle;">
							<label class="control-label">${staffPropTemplate.staffPropName}:</label>
						</td>
						<td style="text-align:center;vertical-align:middle;">
							<c:choose>
								<c:when test="${staffPropTemplate.staffPropType == 'date'}">
									<input id="${staffPropTemplate.templateId}.${staffPropTemplate.staffPropId}"type="text" readonly="readonly" maxlength="20" class="input-medium Wdate" style="width:163px;"
										   onclick="WdatePicker({dateFmt:'yyyy-MM-dd'});"/>
								</c:when>
								<c:when test="${staffPropTemplate.staffPropType == 'radio'}">
									<c:forEach items="${fns:getDictList(staffPropTemplate.staffDictType)}" var="dict" varStatus="dictVS">
										<label for="${staffPropTemplate.staffPropId}${dictVS.index}">${dict.label}</label>
										<input id="${staffPropTemplate.staffPropId}${dictVS.index}" type="radio" value="${dict.value}" />
									</c:forEach>
								</c:when>
								<c:when test="${staffPropTemplate.staffPropType == 'checkbox'}">
									<c:forEach items="${fns:getDictList(staffPropTemplate.staffDictType)}" var="dict" varStatus="dictVS">
										<label for="${staffPropTemplate.staffPropId}${dictVS.index}">${dict.label}</label>
										<input id="${staffPropTemplate.staffPropId}${dictVS.index}" type="checkbox" value="${dict.value}" />
									</c:forEach>
								</c:when>
								<c:when test="${staffPropTemplate.staffPropType == 'select'}">
									<select class="input-medium">
										<c:forEach items="${fns:getDictList(staffPropTemplate.staffDictType)}" var="dict">
											<option value="${dict.value}" title="${dict.description}">${dict.label}</option>
										</c:forEach>
									</select>
								</c:when>
								<c:when test="${staffPropTemplate.staffPropType == 'textarea'}">
									<textarea rows="1" cols="1" style="width: 250px"></textarea>
								</c:when>
								<c:otherwise>
									<input type="text" maxlength="64" class="input-xlarge" />
								</c:otherwise>
							</c:choose>

						</td>
						<%--为了适应SpringMVC标签，form：form--%>
						<%--<c:set var="command" scope="request" value="${staffPropTemplate}"></c:set>--%>
						<input type="hidden" readonly="readonly" name="list[${vs.index}].templateId" value="${staffTemplate.id}"/>

						<td style="text-align:center;">
							<%--<form:select path="staffPropType" class="input-medium" about="${staffPropTemplate.staffPropId}">
								<form:option value="" label=""/>
								&lt;%&ndash;<option value="0000" disabled="disabled"></option>&ndash;%&gt;
								<form:options items="${fns:getDictList('prop_type')}" itemLabel="label" itemValue="value" htmlEscape="false"/>
							</form:select>--%>
							<%--required input-mini--%>
							<select name="list[${vs.index}].staffPropType" class="input-medium">
								<c:forEach items="${fns:getDictList('prop_type')}" var="dict">
									<option value="${dict.value}" ${dict.value==staffPropTemplate.staffPropType?'selected':''} title="${dict.description}">${dict.label}</option>
								</c:forEach>
							</select>
						</td>

						<td style="text-align:center;">
							<input type="text" name="list[${vs.index}].staffDictType" value="${staffPropTemplate.staffDictType}" maxlength="64" class="input-mini"/>
						</td>

						<td style="text-align:center;">
							<c:choose>
								<c:when test="${staffPropTemplate.sort == 2147483647 || staffPropTemplate.sort == 2147483646}">
									<input name="list[${vs.index}].sort" type="text" value="" style="width:50px;margin:0;padding:0;text-align:center;">
								</c:when>
								<c:otherwise>
									<input name="list[${vs.index}].sort" type="text" value="${staffPropTemplate.sort}" style="width:50px;margin:0;padding:0;text-align:center;">
								</c:otherwise>
							</c:choose>
						</td>
						<td style="text-align:center;vertical-align:middle;">
							<input id="${staffPropTemplate.staffPropId}" name="list[${vs.index}].staffPropId" type="checkbox"
								   <c:choose>
									   <c:when test="${staffPropTemplate.ownProp}">
										   checked="checked"
									   </c:when>
									   <%--<c:otherwise>
										   onclick="changeType('${staffPropTemplate.staffPropId}')"
									   </c:otherwise>--%>
								   </c:choose>
								   value="${staffPropTemplate.staffPropId}" <%--onclick="changeType('${staffPropTemplate.staffPropId}')"--%>
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