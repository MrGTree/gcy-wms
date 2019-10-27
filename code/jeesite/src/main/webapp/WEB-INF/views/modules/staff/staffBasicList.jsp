<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
	<title>${staffTemplate.templateName}列表</title>
	<meta name="decorator" content="default"/>
	<script type="text/javascript">
		$(document).ready(function() {
		    
		});
		function page(n,s){
			$("#pageNo").val(n);
			$("#pageSize").val(s);
			$("#searchForm").submit();
        	return false;
        }
        function getBack() {
			window.location.href = "${ctx}/staff/staffArchives/formList?staffId=${user.id}&templateId=${staffTemplate.id}";
        }
	</script>
</head>
<body>
	<ul class="nav nav-tabs">
		<shiro:hasPermission name="staff:archives:view"><li><a href="${ctx}/staff/staffArchives/singletonForm?templateId=1&staffId=${user.id}">基本信息<shiro:hasPermission name="staff:archives:edit">${null != UUID && '' != UUID ?'修改':'添加'}</shiro:hasPermission><shiro:lacksPermission name="staff:archives:edit">查看</shiro:lacksPermission></a></li></shiro:hasPermission>
		<shiro:hasPermission name="staff:edu:view"><li><a href="${ctx}/staff/staffEdu/list?staffId=${user.id}">教育经历列表</a></li></shiro:hasPermission>
		<shiro:hasPermission name="staff:edu:view"><li><a href="${ctx}/staff/staffEdu/form?staffId=${user.id}&id=${staffEdu.id}">教育经历<shiro:hasPermission name="staff:edu:edit">${not empty staffEdu.id?'修改':'添加'}</shiro:hasPermission><shiro:lacksPermission name="staff:edu:edit">查看</shiro:lacksPermission></a></li></shiro:hasPermission>
		<shiro:hasPermission name="staff:workExp:view"><li><a href="${ctx}/staff/staffWorkExp?staffId=${user.id}">工作经历列表</a></li></shiro:hasPermission>
		<shiro:hasPermission name="staff:workExp:view"><li><a href="${ctx}/staff/staffWorkExp/form?staffId=${user.id}&id=${staffWorkExp.id}">工作经历<shiro:hasPermission name="staff:workExp:edit">${not empty staffWorkExp.id?'修改':'添加'}</shiro:hasPermission><shiro:lacksPermission name="staff:workExp:edit">查看</shiro:lacksPermission></a></li></shiro:hasPermission>
		<shiro:hasPermission name="staff:family:view"><li class="active"><a href="${ctx}/staff/staffArchives/formList?staffId=${user.id}&templateId=2">家庭情况列表</a></li></shiro:hasPermission>
		<shiro:hasPermission name="staff:family:view"><li><a href="${ctx}/staff/staffArchives/form?staffId=${user.id}&templateId=2">家庭情况<shiro:hasPermission name="staff:family:edit">添加/修改</shiro:hasPermission><shiro:lacksPermission name="staff:family:edit">查看</shiro:lacksPermission></a></li></shiro:hasPermission>
	</ul>
	<%--<form:form id="searchForm" modelAttribute="staffEdu" action="${ctx}/staff/staffEdu/" method="post" class="breadcrumb form-search">
		<input id="pageNo" name="pageNo" type="hidden" value="${page.pageNo}"/>
		<input id="pageSize" name="pageSize" type="hidden" value="${page.pageSize}"/>
		<ul class="ul-form">
			<li class="btns"><input id="btnSubmit" class="btn btn-primary" type="submit" value="查询"/></li>
			<li class="clearfix"></li>
		</ul>
	</form:form>--%>
	<sys:message content="${message}"/>
	<table id="contentTable" class="table table-striped table-bordered table-condensed">
		<thead>
			<tr>
				<th style="text-align:center;vertical-align:middle;">称谓</th>
				<th style="text-align:center;vertical-align:middle;">姓名</th>
				 <shiro:hasPermission name="staff:archives:edit"> <th style="text-align:center;vertical-align:middle;">操作</th> </shiro:hasPermission>
			</tr>
		</thead>
		<tbody>
		<c:forEach items="${UUIDAnswerMap}" var="answerMapSet">
			<tr>
				<td style="text-align:center;vertical-align:middle;"><a href="${ctx}/staff/staffArchives/form?staffId=${user.id}&templateId=${staffTemplate.id}&UUID=${answerMapSet.key}">
					${answerMapSet.value['4'].staffPropVal}
				</a></td>
				<%--<td style="text-align:center;vertical-align:middle;"><a href="${ctx}/staff/staffEdu/form?id=${staffEdu.id}">
					<fmt:formatDate value="${staffEdu.startData}" pattern="yyyy-MM-dd "/> ---
					<fmt:formatDate value="${staffEdu.endData}" pattern="yyyy-MM-dd "/>
				</a></td>--%>
				<td style="text-align:center;vertical-align:middle;"><a href="${ctx}/staff/staffArchives/form?staffId=${user.id}&templateId=${staffTemplate.id}&UUID=${answerMapSet.key}">
					${answerMapSet.value['1'].staffPropVal}
				</a></td>
				 <shiro:hasPermission name="staff:archives:edit"> <td style="text-align:center;vertical-align:middle;">
    				<a href="${ctx}/staff/staffArchives/form?staffId=${user.id}&templateId=${staffTemplate.id}&UUID=${answerMapSet.key}">修改</a>
					<a href="${ctx}/staff/staffPropAnswer/delete?templateId=${staffTemplate.id}&staffId=${user.id}&UUID=${answerMapSet.key}" onclick="return confirmx('确认要删除该员工这条家庭情况吗？', this.href)">删除</a>
				</td> </shiro:hasPermission>
			</tr>
		</c:forEach>
		</tbody>
	</table>
	<table>
		<tr>
			<td>
				<div class="pagination">${page}</div>
			</td>
			<td>
				<input id="btnCancel" class="btn" type="button" value="返 回" onclick="history.go(-1)"/>
			</td>
		</tr>
	</table>
</body>
</html>