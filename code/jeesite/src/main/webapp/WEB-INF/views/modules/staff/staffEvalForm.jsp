<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
	<title>员工评价管理</title>
	<meta name="decorator" content="default"/>
	<script type="text/javascript">
		$(document).ready(function() {
			//$("#name").focus();
			$("#inputForm").validate({
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

			//checked,才显示
            if (!document.getElementById("goodInput").checked){
                $('#good').hide();
			}

            if (!document.getElementById("badInput").checked){
                $('#bad').hide();
            }

		});

		function showGood() {
		    //如果是没有选中，传的值为0，相应的评价至为空
            if (!document.getElementById("goodInput").checked){
                $('#goodValue').val('0');
                $('#goodExplain').text('');
            }
            if (document.getElementById("goodInput").checked){
                $('#goodValue').val('1');
            }
			$('#good').toggle();
        };

		function showBad() {
            if (!document.getElementById("badInput").checked){
                $('#badValue').val('0');
                $('#badExplain').text('');
            }
            if (document.getElementById("badInput").checked){
                $('#badValue').val('1');
            }
			$('#bad').toggle();
        }

	</script>
</head>
<body>
	<ul class="nav nav-tabs">
		<li><a href="${ctx}/staff/staffEval?staffId=${staffEval.staffId}">员工评价列表</a></li>
		<li class="active"><a href="${ctx}/staff/staffEval/form?staffId=${staffEval.staffId}&id=${staffEval.id}">员工评价<shiro:hasPermission name="staff:staffEval:edit">${not empty staffEval.id?'修改':'添加'}</shiro:hasPermission><shiro:lacksPermission name="staff:staffEval:edit">查看</shiro:lacksPermission></a></li>
	</ul><br/>
	<form:form id="inputForm" modelAttribute="staffEval" action="${ctx}/staff/staffEval/save" method="post" class="form-horizontal">
		<form:hidden path="id"/>
		<sys:message content="${message}"/>		
		<div class="control-group" style="display: none">
			<label class="control-label">员工ID：</label>
			<div class="controls">
				<form:input path="staffId" htmlEscape="false" maxlength="64" class="input-xlarge " readonly="true"/>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">员工姓名：</label>
			<div class="controls">
				<input type="text" readonly="readonly" class="input-xlarge" maxlength="64" value="${user.name}">
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">所在项目：</label>
			<div class="controls">
				<input type="text" readonly="readonly" class="input-xlarge" maxlength="64" value="${user.office}">
				<input type="hidden" name="evalOfficeId" value="${user.office.id}">
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">开始日期：</label>
			<div class="controls">
				<input name="startData" type="text" readonly="readonly" maxlength="20" class="required input-medium Wdate "
					value="<fmt:formatDate value="${staffEval.startData}" pattern="yyyy-MM-dd"/>"
					onclick="WdatePicker({dateFmt:'yyyy-MM-dd',isShowClear:false});"/>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">结束日期：</label>
			<div class="controls">
				<input name="endData" type="text" readonly="readonly" maxlength="20" class="required input-medium Wdate "
					value="<fmt:formatDate value="${staffEval.endData}" pattern="yyyy-MM-dd"/>"
					onclick="WdatePicker({dateFmt:'yyyy-MM-dd',isShowClear:false});"/>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">工作任务条数：</label>
			<div class="controls">
				<form:input path="taskCount" htmlEscape="false" maxlength="11" class="input-xlarge  digits"/>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">生产缺陷数量：</label>
			<div class="controls">
				<form:input path="bugCount" htmlEscape="false" maxlength="11" class="input-xlarge  digits"/>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">任务延期次数：</label>
			<div class="controls">
				<form:input path="efficiency" htmlEscape="false" maxlength="11" class="input-xlarge  digits"/>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label" ><font color="green">奖励：</font></label>
			<%--<div class="controls">--%>
				<input id="goodInput" type="checkbox" onclick="showGood()"
					   <c:if test="${staffEval.good}">checked="checked"</c:if>
					   style="width:50px;margin:0;padding:0;text-align:center;"/>
				<input id="goodValue" type="hidden" name="good" value="${staffEval.good}"/>

			<label ><font color="red">惩罚：</font></label>
			<%--<div class="controls">--%>
				<input id="badInput" type="checkbox" onclick="showBad()"
					   <c:if test="${staffEval.bad}">checked="checked"</c:if>
					   style="width:50px;margin:0;padding:0;text-align:center;"/>
				<input id="badValue" type="hidden" name="bad" value="${staffEval.bad}"/>
			<%--</div>--%>
			<%--</div>--%>
		</div>
		<div class="control-group" id="good">
			<label class="control-label"><font color="green">奖励说明：</font></label>
			<div class="controls">
				<form:textarea path="goodExplain" htmlEscape="false" rows="4" maxlength="255" class="input-xxlarge "/>
			</div>
		</div>

		<%--<div class="control-group">
			<label class="control-label">惩罚：</label>
			<div class="controls">
				<input id="badInput" type="checkbox" onclick="showBad()"
					   <c:if test="${staffEval.bad}">checked="checked"</c:if>
					   style="width:50px;margin:0;padding:0;text-align:center;"/>
				<input id="badValue" type="hidden" name="bad" value="${staffEval.bad}"/>
			</div>
		</div>--%>
		<div class="control-group" id="bad">
			<label class="control-label"><font color="red">惩罚说明：</font></label>
			<div class="controls">
				<form:textarea path="badExplain" htmlEscape="false" rows="4" maxlength="255" class="input-xxlarge "/>
			</div>
		</div>

		<div class="control-group">
			<label class="control-label">本周期评价说明：</label>
			<div class="controls">
				<form:textarea path="evalExplain" htmlEscape="false" rows="4" maxlength="255" class="input-xxlarge "/>
			</div>
		</div>
		<%--<div class="control-group">
			<label class="control-label">备用列1：</label>
			<div class="controls">
				<form:input path="extColum1" htmlEscape="false" maxlength="64" class="input-xlarge "/>
			</div>
		</div>--%>
		<%--<div class="control-group">
			<label class="control-label">备用列2：</label>
			<div class="controls">
				<form:input path="extColum2" htmlEscape="false" maxlength="64" class="input-xlarge "/>
			</div>
		</div>--%>
		<div class="control-group">
			<label class="control-label">评价人：</label>
			<div class="controls">
				<%--<form:input path="evalOperation" htmlEscape="false" maxlength="64" class="input-xlarge " />--%>
				<c:choose>
					<c:when test="${empty staffEval.id}"><%--表示是增加--%>
						<input type="hidden" name="office.id" value="${fns:getUser().office.id}"/>
						<input type="hidden" name="evalOperation" value="${fns:getUser().id}"/>
						<input type="text" readonly="readonly" class="input-xlarge" maxlength="64" value="${fns:getUser().name}">
					</c:when>
					<c:otherwise>
						<input type="text" readonly="readonly" class="input-xlarge" value="${fns:getUserById(staffEval.evalOperation).name}"/>
					</c:otherwise>
				</c:choose>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">评价时间：</label>
			<div class="controls">
				<%--<input name="evalDate" type="text" readonly="readonly" maxlength="20" class="input-medium Wdate "
					value="<fmt:formatDate value='${fns:getDate("yyyy-MM-dd HH:mm:ss")}' pattern="yyyy-MM-dd HH:mm:ss"/>"
					onclick="WdatePicker({dateFmt:'yyyy-MM-dd HH:mm:ss',isShowClear:false});"/>--%>
				<c:choose>
					<c:when test="${empty staffEval.id}">
						<input type="text" name="evalDate" readonly="readonly" class="input-xlarge" maxlength="64" value="${fns:getDate("yyyy-MM-dd HH:mm:ss")}">
					</c:when>
					<c:otherwise>
						<label class="lbl"><fmt:formatDate value="${staffEval.evalDate}" type="both" dateStyle="full"/></label>
					</c:otherwise>
				</c:choose>
			</div>
		</div>
		<%--<div class="control-group">"
			<label class="control-label">备注信息：</label>
			<div class="controls">
				<form:textarea path="remarks" htmlEscape="false" rows="4" maxlength="255" class="input-xxlarge "/>
			</div>
		</div>--%>
		<div class="form-actions">
			<shiro:hasPermission name="staff:staffEval:edit">
				<input id="btnSubmit"
					<c:if test="${fns:getUser().id != '1' && not empty staffEval.id && staffEval.surplusTime <= 0}">
						style="display :none"
					</c:if>
					class="btn btn-primary" type="submit" value="保 存"/>&nbsp;
			</shiro:hasPermission>
			<input id="btnCancel" class="btn" type="button" value="返 回" onclick="history.go(-1)"/>
		</div>
	</form:form>
</body>
</html>