<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
	<title>角色对应的属性管理</title>
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
	</script>
</head>
<body>
	<ul class="nav nav-tabs">
		<li class="active"><a href="${ctx}/staff/staffRoleProp/">角色对应的属性列表</a></li>
		<%--<shiro:hasPermission name="staff:staffRoleProp:edit"><li><a href="${ctx}/staff/staffRoleProp/form">角色对应的属性添加</a></li></shiro:hasPermission>--%>
	</ul>
	<%--<form:form id="searchForm" modelAttribute="staffRoleProp" action="${ctx}/staff/staffRoleProp/" method="post" class="breadcrumb form-search">
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
				<%--<th>更新时间</th>--%>
				<th>模板名称</th>
				<shiro:hasPermission name="staff:staffRoleProp:edit"><th>操作</th></shiro:hasPermission>
			</tr>
		</thead>
		<tbody>
		<c:forEach items="${page.list}" var="staffTemplate">
			<tr>
				<%--<td><a href="${ctx}/staff/staffRoleProp/form?id=${staffRoleProp.id}">
					<fmt:formatDate value="${staffTemplate.updateDate}" pattern="yyyy-MM-dd HH:mm:ss"/>
				</a></td>--%>
				<td>
					${staffTemplate.templateName}
				</td>
				<shiro:hasPermission name="staff:staffRoleProp:edit"><td>
    				<a href="${ctx}/staff/staffRoleProp/form?templateId=${staffTemplate.id}&roleId=${roleId}">修改</a>
					<%--<a href="${ctx}/staff/staffRoleProp/delete?id=${staffRoleProp.id}" onclick="return confirmx('确认要删除该角色对应的属性吗？', this.href)">删除</a>--%>
				</td></shiro:hasPermission>
			</tr>
		</c:forEach>
		</tbody>
	</table>
	<div class="pagination">${page}</div>
</body>
</html>