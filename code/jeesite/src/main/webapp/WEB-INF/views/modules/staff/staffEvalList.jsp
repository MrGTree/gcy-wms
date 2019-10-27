<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
	<title>员工评价管理</title>
	<meta name="decorator" content="default"/>
	<script type="text/javascript">
		$(document).ready(function() {
            var listHidden = $('.timeToHidden');
            var size = listHidden.size();
            var staffId = "${fns:getUser().id}"
            if (staffId =='1'){

			}else if (staffId !='1'&& size > 0){
                listHidden.each(function () {
                    var time = $(this).attr("value");
                    var sTime = parseInt(time);
                    var obj = $(this);
                    setTimeout(function () {
                        obj.prop("hidden",true);
                        size--;
                        if(size <= 0){
                            $('.doSome').prop("hidden",true);
                        }
                    },sTime);
                });
			}else {
                $('.doSome').prop("hidden",true);
            }

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
		<li class="active"><a href="${ctx}/staff/staffEval?staffId=${staffEval.staffId}&evalOfficeId=${staffEval.evalOfficeId}">员工评价列表</a></li>
		<c:if test="${not empty staffEval.staffId && fns:getUser().id != staffEval.staffId}">
			<shiro:hasPermission name="staff:staffEval:edit"><li><a href="${ctx}/staff/staffEval/form?staffId=${staffEval.staffId}">员工评价添加</a></li></shiro:hasPermission>
		</c:if>
	</ul>
	<form:form id="searchForm" modelAttribute="staffEval" action="${ctx}/staff/staffEval/" method="post" class="breadcrumb form-search">
		<input id="pageNo" name="pageNo" type="hidden" value="${page.pageNo}"/>
		<input id="pageSize" name="pageSize" type="hidden" value="${page.pageSize}"/>
		<sys:tableSort id="orderBy" name="orderBy" value="${page.orderBy}" callback="page();"/>
		<input type="hidden" name="staffId" value="${staffEval.staffId}">
		<input type="hidden" name="evalOfficeId" value="${staffEval.evalOfficeId}">
		<input type="hidden" name="startData" value="<fmt:formatDate value="${staffEval.startData}" pattern="yyyy-MM-dd"/>">
		<input type="hidden" name="endData" value="<fmt:formatDate value="${staffEval.endData}" pattern="yyyy-MM-dd"/>">
		<%--<ul class="ul-form">
			<li class="btns"><input id="btnSubmit" class="btn btn-primary" type="submit" value="查询"/></li>
			<li class="clearfix"></li>
		</ul>--%>
	</form:form>
	<sys:message content="${message}"/>
	<table id="contentTable" class="table table-striped table-bordered table-condensed">
		<thead>
			<tr>
				<th style="text-align:center;vertical-align:middle;">所在部门</th>
				<th style="text-align:center;vertical-align:middle;">所在组</th>
				<th style="text-align:center;vertical-align:middle;">姓名</th>
				<th class="sort-column startData" style="text-align:center;vertical-align:middle;">起始时间</th>
				<th class="sort-column endData" style="text-align:center;vertical-align:middle;">结束时间</th>
				<th style="text-align:center;vertical-align:middle;">工作任务条数</th>
				<th style="text-align:center;vertical-align:middle;">生产缺陷数量</th>
				<th style="text-align:center;vertical-align:middle;">任务延期次数</th>
				<c:if test="${fns:getUser().id != staffEval.staffId}">
					<shiro:hasPermission name="staff:staffEval:edit"><th class="doSome " style="text-align:center;vertcal-align:middle;">操作</th></shiro:hasPermission>
				</c:if>
			</tr>
		</thead>
		<tbody>
		<c:forEach items="${page.list}" var="staffEval">
			<tr>
				<td style="text-align:center;vertical-align:middle;">
					${fns:getUserById(staffEval.staffId).item}
				</td>
				<td style="text-align:center;vertical-align:middle;">
						${fns:getUserById(staffEval.staffId).group}
				</td>
				<td style="text-align:center;vertical-align:middle;">
					${fns:getUserById(staffEval.staffId).name}
				</td>
				<td style="text-align:center;vertical-align:middle;"><a href="${ctx}/staff/staffEval/form?id=${staffEval.id}">
					<fmt:formatDate value="${staffEval.startData}" pattern="yyyy-MM-dd"/>
				</a></td>
				<td style="text-align:center;vertical-align:middle;"><a href="${ctx}/staff/staffEval/form?id=${staffEval.id}">
					<fmt:formatDate value="${staffEval.endData}" pattern="yyyy-MM-dd"/>
				</a></td>
				<td style="text-align:center;vertical-align:middle;">
					${staffEval.taskCount}
				</td>
				<td style="text-align:center;vertical-align:middle;">
					${staffEval.bugCount}
				</td>
				<td style="text-align:center;vertical-align:middle;">
					${staffEval.efficiency}
				</td>
				<c:if test="${fns:getUser().id != staffEval.staffId}">
					<shiro:hasPermission name="staff:staffEval:edit"><td class="doSome" style="text-align:center;vertical-align:middle;">
						<div id="${staffEval.staffId}"
						<c:choose>
							<c:when test="${fns:getUser().id == '1'}">

							</c:when>
							<c:when test="${fns:getUser().id != '1' && staffEval.surplusTime <= 0}">
								hidden="hidden"
							</c:when>
							<c:otherwise>
								class="timeToHidden" value="${staffEval.surplusTime}"
							</c:otherwise>
						</c:choose>
						>
    					<a href="${ctx}/staff/staffEval/form?id=${staffEval.id}">修改</a>
						<a href="${ctx}/staff/staffEval/delete?id=${staffEval.id}" onclick="return confirmx('确认要删除该员工评价吗？', this.href)">删除</a>
						</div>
					</td></shiro:hasPermission>

				</c:if>
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