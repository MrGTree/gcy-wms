<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
	<title>员工评价</title>
	<meta name="decorator" content="default"/>
	<script type="text/javascript">
		$(document).ready(function() {
			$("#btnExport").click(function(){
				top.$.jBox.confirm("确认要导出员工评价吗？","系统提示",function(v,h,f){
					if(v=="ok"){
						$("#searchForm").attr("action","${ctx}/staff/staffEval/export");
						$("#searchForm").submit();
					}
				},{buttonsFocus:1});
				top.$('.jbox-body .jbox-icon').css('top','55px');
			});
			$("#btnImport").click(function(){
				$.jBox($("#importBox").html(), {title:"导入数据", buttons:{"关闭":true}, 
					bottomText:"导入文件不能超过5M，仅允许导入“xls”或“xlsx”格式文件！"});
			});
		});
		function page(n,s){
			if(n) $("#pageNo").val(n);
			if(s) $("#pageSize").val(s);
			$("#searchForm").attr("action","${ctx}/staff/staffEval/evalList");
			$("#searchForm").submit();
	    	return false;
	    };
		function setUrl(selStr,id) {
		    var url = '${ctx}/staff/staffEval/list?evalOfficeId='+id+'&startData='+$("#beginDate").val()+'&endData='+$("#endDate").val();
			$(selStr).attr('href',url);
        }
	</script>
</head>
<body>
	<div id="importBox" class="hide">
		<form id="importForm" action="${ctx}/sys/user/import" method="post" enctype="multipart/form-data"
			class="form-search" style="padding-left:20px;text-align:center;" onsubmit="loading('正在导入，请稍等...');"><br/>
			<input id="uploadFile" name="file" type="file" style="width:330px"/><br/><br/>　　
			<input id="btnImportSubmit" class="btn btn-primary" type="submit" value="   导    入   "/>
			<a href="${ctx}/sys/user/import/template">下载模板</a>
		</form>
	</div>
	<ul class="nav nav-tabs">
		<li class="active"><a href="${ctx}/staff/staffEval/evalList">员工评价</a></li>
		<%--<shiro:hasPermission name="staff:archives:edit"><li><a href="${ctx}/staff/staffArchives/form">评价添加</a></li></shiro:hasPermission>--%>
	</ul>
	<form:form id="searchForm" modelAttribute="userEval" action="${ctx}/sys/user/list" method="post" class="breadcrumb form-search ">
		<input id="pageNo" name="pageNo" type="hidden" value="${page.pageNo}"/>
		<input id="pageSize" name="pageSize" type="hidden" value="${page.pageSize}"/>
		<sys:tableSort id="orderBy" name="orderBy" value="${page.orderBy}" callback="page();"/>
		<ul class="ul-form">
			<%--<li><label>归属公司：</label><sys:treeselect id="company" name="company.id" value="${user.company.id}" labelName="company.name" labelValue="${user.company.name}"
				title="公司" url="/sys/office/treeData?type=1" cssClass="input-small" allowClear="true"/></li>--%>
			<li><label>姓&nbsp;&nbsp;&nbsp;名：</label><form:input path="name" htmlEscape="false" maxlength="50" class="input-mini"/></li>
			<%--<li><label>登录名：</label><form:input path="loginName" htmlEscape="false" maxlength="50" class="input-medium"/></li>--%>
			<%--<li class="clearfix"></li>--%><%--用于li的换行--%>
			<li><label>日期范围：&nbsp;</label><input id="beginDate" name="beginDate" type="text" readonly="readonly" maxlength="20" class="input-mini Wdate"
					value="<fmt:formatDate value="${userEval.beginDate}" pattern="yyyy-MM-dd"/>" onclick="WdatePicker({dateFmt:'yyyy-MM-dd',isShowClear:false});"/>
				&nbsp; -- &nbsp;<input id="endDate" name="endDate" type="text" readonly="readonly" maxlength="20" class="input-mini Wdate"
					value="<fmt:formatDate value="${userEval.endDate}" pattern="yyyy-MM-dd"/>" onclick="WdatePicker({dateFmt:'yyyy-MM-dd',isShowClear:false});"/>&nbsp;&nbsp;
			</li>
			<li><label>归属部门：</label><sys:treeselect id="office" name="office.id" value="${userEval.office.id}" labelName="office.name" labelValue="${userEval.office.name}"
							title="部门" url="/sys/office/treeData?type=2" cssClass="input-small" allowClear="true"/></li>
			<li><label>奖励数：</label><form:input path="goodCount" htmlEscape="false" maxlength="50" style="width:50px;margin:0;padding:0;text-align:center;"/></li>
			<li>&nbsp;&nbsp;惩罚数：<form:input path="BadCount" htmlEscape="false" maxlength="50" style="width:50px;margin:0;padding:0;text-align:center;"/></li>
			<li>&nbsp;&nbsp;生产缺陷数量：<form:input path="bugCount" htmlEscape="false" maxlength="50" style="width:50px;margin:0;padding:0;text-align:center;"/></li>
			<li>&nbsp;&nbsp;工作任务条数：<form:input path="taskCount" htmlEscape="false" maxlength="50" style="width:50px;margin:0;padding:0;text-align:center;"/></li>
			<li>&nbsp;&nbsp;查询类型：<select name="type" class="required input-mini" style="width:85px;*width:75px">
				<option value="0" ${'0' == type?'selected':''}>个人</option>
				<c:forEach items="${fns:getDictList('sys_office_type')}" var="dict">
					<option value="${dict.value}" ${dict.value== type?'selected':''} title="${dict.description}">${dict.label}</option>
				</c:forEach>
			</select></li>
			<li class="btns"><input id="btnSubmit" class="btn btn-primary" type="submit" value="查询" onclick="return page();"/>
				<input id="btnExport" class="btn btn-primary" type="button" value="导出"/>
				<%--<input id="btnImport" class="btn btn-primary" type="button" value="导入"/></li>--%>
			<li class="clearfix"></li>
		</ul>
	</form:form>
	<sys:message content="${message}"/>
	<table id="contentTable" class="table table-striped table-bordered table-condensed">
		<thead><tr><%--<th>归属公司</th><th>归属部门</th>--%><th class="sort-column name">部门名称</th><th>主负责人</th><th class="sort-column evalCount">评价次数</th><th class="sort-column taskCount">工作任务条数</th><th class="sort-column bugCount">生产缺陷数量</th><th class="sort-column AvgEfficiency">任务延期次数</th><th class="sort-column goodCount">奖励总数</th><th class="sort-column badCount">惩罚总数</th><%--<th>角色</th> --%><shiro:hasPermission name="staff:archives:edit"><th>操作</th></shiro:hasPermission></tr></thead>
		<tbody>
		<c:forEach items="${page.list}" var="office" varStatus="vs">
			<tr>
				<%--<td>&lt;%&ndash;${user.company.name}&ndash;%&gt;</td>--%>
				<%--<td>&lt;%&ndash;${user.office.name}&ndash;%&gt;</td>--%>
				<%--<td><a href="${ctx}/staff/staffEval/list?staffId=${user.id}">${user.loginName}</a></td>--%>
				<td>${office.name}</td>
				<%--<td><a href="${ctx}/sys/user/form?id=${user.id}">${user.loginName}</a></td>--%>
				<td><a href="${ctx}/sys/user/form?id=${office.primaryPerson.id}">${office.primaryPersonName}</a></td>
				<td>${office.evalCountStr}</td>
				<td>${office.taskCountStr}</td>
				<td>${office.bugCountStr}</td>
				<%--<td>${empty office.bugPoint ? 0 : office.bugPointStr}</td>--%>
				<td>${office.avgEfficiencyStr}</td>
				<td>${office.goodCountStr}</td>
				<td>${office.badCountStr}</td><%--
				<td>${user.roleNames}</td> --%>
				<shiro:hasPermission name="staff:archives:view"><td>
					<%--<a href="${ctx}/staff/staffEval/form?staffId=${user.id}">修改</a>
					<a href="${ctx}/staff/staffEval/delete?staffId=${user.id}" onclick="return confirmx('确认要删除该员工的档案信息吗？', this.href)">删除</a>--%>
					<%--<a href="${ctx}/staff/staffEval/list?evalOfficeId=${office.id}">查看</a>--%>
					<a id="officeA${vs.index}A" href="" onclick="setUrl('#officeA${vs.index}A','${office.id}')">查看</a>
				</td></shiro:hasPermission>
			</tr>
		</c:forEach>
		</tbody>
	</table>
	<div class="pagination">${page}</div>
</body>
</html>