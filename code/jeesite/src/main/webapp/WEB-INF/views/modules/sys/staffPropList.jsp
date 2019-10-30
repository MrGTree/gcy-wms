<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
	<title>元属性管理</title>
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
		<li class="active"><a href="${ctx}/sys/staffProp/">元属性列表</a></li>
		<shiro:hasPermission name="sys:staffProp:edit"><li><a href="${ctx}/sys/staffProp/form">元属性添加</a></li></shiro:hasPermission>
	</ul>
	<form:form id="searchForm" modelAttribute="staffProp" action="${ctx}/sys/staffProp/" method="post" class="breadcrumb form-search">
		<input id="pageNo" name="pageNo" type="hidden" value="${page.pageNo}"/>
		<input id="pageSize" name="pageSize" type="hidden" value="${page.pageSize}"/>
		<label>元属性名：</label><form:input path="staffPropName" htmlEscape="false" maxlength="150" class="input-medium"/>
		<input id="btnSubmit" class="btn btn-primary" type="submit" value="查询"/>
		<%--<ul class="ul-form">
			<li class="btns"><input id="btnSubmit" class="btn btn-primary" type="submit" value="查询"/></li>
			<li class="clearfix"></li>
		</ul>--%>
	</form:form>
	<sys:message content="${message}"/>
	<table id="contentTable" class="table table-striped table-bordered table-condensed">
		<thead>
			<tr>
				<th style="text-align:center;vertical-align:middle;">元属性名</th>
				<!-- <th>备注信息</th> -->
				<shiro:hasPermission name="sys:staffProp:edit"><th style="text-align:center;vertical-align:middle;">操作</th></shiro:hasPermission>
			</tr>
		</thead>
		<tbody>
		<c:forEach items="${page.list}" var="staffProp">
			<tr>
				<%-- <td><a href="${ctx}/sys/staffProp/form?id=${staffProp.id}">
					<fmt:formatDate value="${staffProp.updateDate}" pattern="yyyy-MM-dd HH:mm:ss"/>
				</a></td> --%>
				<td style="text-align:center;vertical-align:middle;"><a href="${ctx}/sys/staffProp/form?id=${staffProp.id}">
					${staffProp.staffPropName}
				</a></td>
				<%-- <td>
					${staffProp.remarks}
				</td> --%>
				<shiro:hasPermission name="sys:staffProp:edit"><td style="text-align:center;vertical-align:middle;">
    				<a href="${ctx}/sys/staffProp/form?id=${staffProp.id}">修改</a>
					<a href="${ctx}/sys/staffProp/delete?id=${staffProp.id}" onclick="return confirmx('确认要删除该元属性吗？', this.href)">删除</a>
				</td></shiro:hasPermission>
			</tr>
		</c:forEach>
		</tbody>
	</table>
	<div class="pagination">${page}</div>
</body>
</html>