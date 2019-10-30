<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
	<title>员工工作经历管理</title>
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
		<shiro:hasPermission name="staff:archives:view"><li><a href="${ctx}/staff/staffArchives/singletonForm?templateId=1&staffId=${staffWorkExp.staffId}">基本信息<shiro:hasPermission name="staff:archives:edit">${null != UUID && '' != UUID ?'修改':'添加'}</shiro:hasPermission><shiro:lacksPermission name="staff:archives:edit">查看</shiro:lacksPermission></a></li></shiro:hasPermission>
		<shiro:hasPermission name="staff:edu:view"><li><a href="${ctx}/staff/staffEdu/list?staffId=${staffWorkExp.staffId}">教育经历列表</a></li></shiro:hasPermission>
		<shiro:hasPermission name="staff:edu:view"><li><a href="${ctx}/staff/staffEdu/form?staffId=${staffWorkExp.staffId}&id=${staffEdu.id}">教育经历<shiro:hasPermission name="staff:edu:edit">${not empty staffEdu.id?'修改':'添加'}</shiro:hasPermission><shiro:lacksPermission name="staff:edu:edit">查看</shiro:lacksPermission></a></li></shiro:hasPermission>
		<shiro:hasPermission name="staff:workExp:view"><li  class="active"><a href="${ctx}/staff/staffWorkExp?staffId=${staffWorkExp.staffId}">工作经历列表</a></li></shiro:hasPermission>
		<shiro:hasPermission name="staff:workExp:view"><li><a href="${ctx}/staff/staffWorkExp/form?staffId=${staffWorkExp.staffId}&id=${staffWorkExp.id}">工作经历<shiro:hasPermission name="staff:workExp:edit">${not empty staffWorkExp.id?'修改':'添加'}</shiro:hasPermission><shiro:lacksPermission name="staff:workExp:edit">查看</shiro:lacksPermission></a></li></shiro:hasPermission>
		<shiro:hasPermission name="staff:family:view"><li><a href="${ctx}/staff/staffArchives/formList?staffId=${staffWorkExp.staffId}&templateId=2">家庭情况列表</a></li></shiro:hasPermission>
		<shiro:hasPermission name="staff:family:view"><li><a href="${ctx}/staff/staffArchives/form?staffId=${staffWorkExp.staffId}&templateId=2">家庭情况<shiro:hasPermission name="staff:family:edit">添加/修改</shiro:hasPermission><shiro:lacksPermission name="staff:family:edit">查看</shiro:lacksPermission></a></li></shiro:hasPermission>
	</ul>
	<%--<form:form id="searchForm" modelAttribute="staffWorkExp" action="${ctx}/staff/staffWorkExp/" method="post" class="breadcrumb form-search">
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
				<th style="text-align:center;vertical-align:middle;">公司名称</th>
				<th style="text-align:center;vertical-align:middle;">时间</th>
				<shiro:hasPermission name="staff:archives:edit"><th style="text-align:center;vertical-align:middle;">操作</th></shiro:hasPermission>
			</tr>
		</thead>
		<tbody>
		<c:forEach items="${page.list}" var="staffWorkExp">
			<tr>
				<td style="text-align:center;vertical-align:middle;">
					${staffWorkExp.corpName}
				</td>
				<td style="text-align:center;vertical-align:middle;"><a href="${ctx}/staff/staffWorkExp/form?id=${staffWorkExp.id}">
					<fmt:formatDate value="${staffWorkExp.startData}" pattern="yyyy-MM-dd"/> ---
					<fmt:formatDate value="${staffWorkExp.endData}" pattern="yyyy-MM-dd"/>
				<%--</a>--%></td>
				<shiro:hasPermission name="staff:archives:edit"><td style="text-align:center;vertical-align:middle;">
    				<a href="${ctx}/staff/staffWorkExp/form?id=${staffWorkExp.id}">修改</a>
					<a href="${ctx}/staff/staffWorkExp/delete?id=${staffWorkExp.id}" onclick="return confirmx('确认要删除该员工工作经历吗？', this.href)">删除</a>
				</td></shiro:hasPermission>
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