<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
	<title>员工档案管理</title>
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
		<li class="active"><a href="${ctx}/staff/staffPropAnswer/">员工档案列表</a></li>
		<shiro:hasPermission name="staff:staffPropAnswer:edit"><li><a href="${ctx}/staff/staffPropAnswer/form">员工档案添加</a></li></shiro:hasPermission>
	</ul>
	<form:form id="searchForm" modelAttribute="staffPropAnswer" action="${ctx}/staff/staffPropAnswer/" method="post" class="breadcrumb form-search">
		<input id="pageNo" name="pageNo" type="hidden" value="${page.pageNo}"/>
		<input id="pageSize" name="pageSize" type="hidden" value="${page.pageSize}"/>
		<ul class="ul-form">
			<li class="btns"><input id="btnSubmit" class="btn btn-primary" type="submit" value="查询"/></li>
			<li class="clearfix"></li>
		</ul>
	</form:form>
	<sys:message content="${message}"/>
	<table id="contentTable" class="table table-striped table-bordered table-condensed">
		<thead>
			<tr>
				<th>更新时间</th>
				<th>备注信息</th>
				<shiro:hasPermission name="staff:staffPropAnswer:edit"><th>操作</th></shiro:hasPermission>
			</tr>
		</thead>
		<tbody>
		<c:forEach items="${page.list}" var="staffPropAnswer">
			<tr>
				<td><a href="${ctx}/staff/staffPropAnswer/form?id=${staffPropAnswer.id}">
					<fmt:formatDate value="${staffPropAnswer.updateDate}" pattern="yyyy-MM-dd HH:mm:ss"/>
				</a></td>
				<td>
					${staffPropAnswer.remarks}
				</td>
				<shiro:hasPermission name="staff:staffPropAnswer:edit"><td>
    				<a href="${ctx}/staff/staffPropAnswer/form?id=${staffPropAnswer.id}">修改</a>
					<a href="${ctx}/staff/staffPropAnswer/delete?id=${staffPropAnswer.id}" onclick="return confirmx('确认要删除该员工档案吗？', this.href)">删除</a>
				</td></shiro:hasPermission>
			</tr>
		</c:forEach>
		</tbody>
	</table>
	<div class="pagination">${page}</div>
</body>
</html>