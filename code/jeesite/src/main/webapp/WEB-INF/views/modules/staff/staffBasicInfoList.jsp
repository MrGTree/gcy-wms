<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
	<title>基本信息管理</title>
	<meta name="decorator" content="default"/>
	<script type="text/javascript">
		$(document).ready(function() {
			$("#btnExport").click(function(){
				top.$.jBox.confirm("确认要导出在职员工信息表吗？数据量大请耐心等待","系统提示",function(v,h,f){
					if(v=="ok"){
						$("#searchForm").attr("action","${ctx}/staff/staffArchives/export");
						$("#searchForm").submit();
					}
				},{buttonsFocus:1});
				top.$('.jbox-body .jbox-icon').css('top','55px');
			});
			$("#btnImport").click(function(){
				$.jBox($("#importBox").html(), {title:"导入数据", buttons:{"关闭":true},
					bottomText:"该操作会删除全数据，然后导入全量数据"});
			});
            $("#btnImportExt").click(function(){
                $.jBox($("#importBoxExt").html(), {title:"导入修改数据", buttons:{"关闭":true},
                    bottomText:"仅允许导入“xls”或“xlsx”格式文件！"});
            });
		});
		function page(n,s){
			if(n) $("#pageNo").val(n);
			if(s) $("#pageSize").val(s);
			$("#searchForm").attr("action","${ctx}/staff/staffArchives/list");
			$("#searchForm").submit();
	    	return false;
	    }
	</script>
</head>
<body>
	<div id="importBox" class="hide">
		<form id="importForm" action="${ctx}/staff/staffArchives/import" method="post" enctype="multipart/form-data"
			class="form-search" style="padding-left:20px;text-align:center;" onsubmit="loading('正在导入，数据量大，请稍等...');"><br/>
			<input id="uploadFile" name="file" type="file" style="width:330px"/><br/>
			<span>导入文件条数在100-150左右，仅允许导入“xls”或“xlsx”格式文件！</span><br/>
			<input id="btnImportSubmit" class="btn btn-primary" type="submit" value="   导    入   "/>
			<%--<a href="${ctx}/sys/user/import/template">下载模板</a>--%>
		</form>
	</div>
	<div id="importBoxExt" class="hide">
		<form id="importFormExt" action="${ctx}/staff/staffArchives/importExt" method="post" enctype="multipart/form-data"
			class="form-search" style="padding-left:20px;text-align:center;" onsubmit="loading('正在导入，数据量大，请稍等...');"><br/>
			<input id="uploadFile" name="file" type="file" style="width:330px"/><br/><br/>
			<input id="btnImportSubmit" class="btn btn-primary" type="submit" value="   导    入   "/>
			<%--<a href="${ctx}/sys/user/import/template">下载模板</a>--%>
		</form>
	</div>
	<ul class="nav nav-tabs">
		<li class="active"><a href="${ctx}/staff/staffArchives/list">基本信息列表</a></li>
		<shiro:hasPermission name="sys:user:viewLeave"><li><a href="${ctx}/staff/staffArchives/leaveList">离职员工基本信息列表</a></li></shiro:hasPermission>
		<%--<li><a href="${ctx}/staff/staffEdu/eduList">员工教育信息</a></li>
		<li><a href="${ctx}/staff/staffWorkExp/workExpList">员工工作经历</a></li>
		<li><a href="${ctx}/staff/staffArchives/familyList">家庭情况列表</a></li>--%>
		<%--<shiro:hasPermission name="staff:archives:edit"><li><a href="${ctx}/staff/staffArchives/form?templateId=1">基本信息添加</a></li></shiro:hasPermission>--%>
	</ul>
	<form:form id="searchForm" modelAttribute="user" action="${ctx}/staff/staffArchives/list" method="post" class="breadcrumb form-search ">
		<input id="pageNo" name="pageNo" type="hidden" value="${page.pageNo}"/>
		<input id="pageSize" name="pageSize" type="hidden" value="${page.pageSize}"/>
		<sys:tableSort id="orderBy" name="orderBy" value="${page.orderBy}" callback="page();"/>
		<ul class="ul-form">
			<li><label>归属公司：</label><sys:treeselect id="company" name="company.id" value="${user.company.id}" labelName="company.name" labelValue="${user.company.name}" 
				title="公司" url="/sys/office/treeData?type=1" cssClass="input-small" allowClear="true"/></li>
			<li><label>登录名：</label><form:input path="loginName" htmlEscape="false" maxlength="50" class="input-medium"/></li>
			<li class="clearfix"></li>
			<li><label>归属部门：</label><sys:treeselect id="office" name="office.id" value="${user.office.id}" labelName="office.name" labelValue="${user.office.name}" 
				title="部门" url="/sys/office/treeData?type=2" cssClass="input-small" allowClear="true"/></li>
			<li><label>姓&nbsp;&nbsp;&nbsp;名：</label><form:input path="name" htmlEscape="false" maxlength="50" class="input-medium"/></li>
			<li class="btns"><input id="btnSubmit" class="btn btn-primary" type="submit" value="查询" onclick="return page();"/>
				<shiro:hasPermission name="staff:archives:edit"><input id="btnImport" class="btn btn-primary" type="button" value="导入"/></shiro:hasPermission>
				<shiro:hasPermission name="staff:archives:edit"><input id="btnImportExt" class="btn btn-primary" type="button" value="修改"/></shiro:hasPermission>
				<input id="btnExport" class="btn btn-primary" type="button" value="导出信息"/></li>
			<li class="clearfix"></li>
		</ul>
	</form:form>
	<sys:message content="${message}"/>
	<table id="contentTable" class="table table-striped table-bordered table-condensed">
		<thead><tr><th>归属公司</th><th>归属部门</th><th>归属组</th><th class="sort-column login_name">登录名</th><th class="sort-column name">姓名</th><th>邮箱</th><th>手机</th><%--<th>角色</th> --%><shiro:hasPermission name="staff:archives:edit"><th>操作</th></shiro:hasPermission></tr></thead>
		<tbody>
		<c:forEach items="${page.list}" var="user">
			<tr>
				<td>${user.company.name}</td>
				<td>${user.item.name}</td>
				<td>${user.group.name}</td>
				<td><a href="${ctx}/staff/staffArchives/singletonForm?templateId=1&staffId=${user.id}">${user.loginName}</a></td>
				<td>${user.name}</td>
				<td>${user.email}</td>
				<td>${user.mobile}</td><%--
				<td>${user.roleNames}</td> --%>
				<shiro:hasPermission name="staff:archives:edit"><td>
					<%--staff/staffArchives/form?templateId=1--%>
					<a href="${ctx}/staff/staffArchives/singletonForm?templateId=1&staffId=${user.id}">修改</a>
					<a href="${ctx}/staff/staffPropAnswer/delete?templateId=1&staffId=${user.id}" onclick="return confirmx('确认要删除该员工的基本信息信息吗？', this.href)">删除</a>
				</td></shiro:hasPermission>
			</tr>
		</c:forEach>
		</tbody>
	</table>
	<div class="pagination">${page}</div>
</body>
</html>