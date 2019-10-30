<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
	<title>${staffTemplate.templateName}管理</title>
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
            var ldht = document.getElementById("laoDongHeTongDate");
            if (null != ldht) {
                var DateStr = ldht.value;
                if (DateStr != null && "" != DateStr) {
                    var ldhtDate = new Date(DateStr);
                    ldhtDate.setMonth(ldhtDate.getMonth() + 6);
                    if(null!=document.getElementById("zhuanzhengri")){
                        document.getElementById("zhuanzhengri").value=ldhtDate.toLocaleDateString();
                    }
                    var dieDate = new Date(DateStr);
                    dieDate.setFullYear(dieDate.getFullYear() + 3);
                    dieDate.setDate(dieDate.getDate() - 1);
                    if(null!= document.getElementById("laoDongHeTongDateDie")){
                        document.getElementById("laoDongHeTongDateDie").value=dieDate.toLocaleDateString();
                    }
                    var shengyu = dateDiff(new Date().toLocaleDateString(),dieDate.toLocaleDateString());
                    if(null!=document.getElementById("shengyuqixian")){
                        document.getElementById("shengyuqixian").value=parseFloat(shengyu / 30).toFixed(2);
                    }
                }
            }
            var birObj = document.getElementById("birthday");
            if(null!=birObj){
                var DateStrBir = birObj.value;
                if(null!=DateStrBir && "" != DateStrBir){
                    var birthday = new Date(DateStrBir);
                    var today = new Date();
                    var ageDate = today.getFullYear() - birthday.getFullYear();
                    document.getElementById("age").value=ageDate;
                }
            }
		});

        function dateDiff(startDateString, endDateString){
            var separator = "/"; //日期分隔符
            var startDates = startDateString.split(separator);
            var endDates = endDateString.split(separator);
            var startDate = new Date(startDates[0], startDates[1], startDates[2]);
            var endDate = new Date(endDates[0], endDates[1], endDates[2]);
            return parseInt((endDate - startDate ) / 1000 / 60 / 60 /24);//把相差的毫秒数转换为天数
        };

        function changeDate(){
            var DateStr = document.getElementById("laoDongHeTongDate").value;
            var ldhtDate = new Date(DateStr);
            ldhtDate.setMonth(ldhtDate.getMonth() + 6);
            if(null!=document.getElementById("zhuanzhengri")){
                document.getElementById("zhuanzhengri").value=ldhtDate.toLocaleDateString();
			}
            var dieDate = new Date(DateStr);
            dieDate.setFullYear(dieDate.getFullYear() + 3);
            dieDate.setDate(dieDate.getDate() - 1);
            if(null!= document.getElementById("laoDongHeTongDateDie")){
                document.getElementById("laoDongHeTongDateDie").value=dieDate.toLocaleDateString();
            }
            var shengyu = dateDiff(new Date().toLocaleDateString(),dieDate.toLocaleDateString());
            if(null!=document.getElementById("shengyuqixian")){
                document.getElementById("shengyuqixian").value=parseFloat(shengyu / 30).toFixed(2);
            }
        }
        
        function changeAge() {
            var DateStr = document.getElementById("birthday").value;
            var birthday = new Date(DateStr);
            var today = new Date();
            var ageDate = today.getFullYear() - birthday.getFullYear();
            document.getElementById("age").value=ageDate;
        }

	</script>
</head>
<body>
<ul class="nav nav-tabs">
	<shiro:hasPermission name="staff:archives:view"><li <c:if test="${staffTemplate.id ==1}">class="active"</c:if>><a href="${ctx}/staff/staffArchives/singletonForm?templateId=1&staffId=${user.id}">基本信息<shiro:hasPermission name="staff:archives:edit">${null != UUID && '' != UUID ?'修改':'添加'}</shiro:hasPermission><shiro:lacksPermission name="staff:archives:edit">查看</shiro:lacksPermission></a></li></shiro:hasPermission>
	<shiro:hasPermission name="staff:edu:view"><li><a href="${ctx}/staff/staffEdu/list?staffId=${user.id}">教育经历列表</a></li></shiro:hasPermission>
	<shiro:hasPermission name="staff:edu:view"><li><a href="${ctx}/staff/staffEdu/form?staffId=${user.id}&id=${staffEdu.id}">教育经历<shiro:hasPermission name="staff:edu:edit">${not empty staffEdu.id?'修改':'添加'}</shiro:hasPermission><shiro:lacksPermission name="staff:edu:edit">查看</shiro:lacksPermission></a></li></shiro:hasPermission>
	<shiro:hasPermission name="staff:workExp:view"><li><a href="${ctx}/staff/staffWorkExp?staffId=${user.id}">工作经历列表</a></li></shiro:hasPermission>
	<shiro:hasPermission name="staff:workExp:view"><li><a href="${ctx}/staff/staffWorkExp/form?staffId=${user.id}&id=${staffWorkExp.id}">工作经历<shiro:hasPermission name="staff:workExp:edit">${not empty staffWorkExp.id?'修改':'添加'}</shiro:hasPermission><shiro:lacksPermission name="staff:workExp:edit">查看</shiro:lacksPermission></a></li></shiro:hasPermission>
	<shiro:hasPermission name="staff:family:view"><li><a href="${ctx}/staff/staffArchives/formList?staffId=${user.id}&templateId=2">家庭情况列表</a></li></shiro:hasPermission>
	<shiro:hasPermission name="staff:family:view"><li <c:if test="${staffTemplate.id ==2}">class="active"</c:if>><a href="${ctx}/staff/staffArchives/form?staffId=${user.id}&templateId=2">家庭情况<shiro:hasPermission name="staff:family:edit">添加/修改</shiro:hasPermission><shiro:lacksPermission name="staff:family:edit">查看</shiro:lacksPermission></a></li></shiro:hasPermission>
</ul><br/>
	<sys:message content="${message}"/>
	<br/>
	<form:form id="inputForm" action="${ctx}/staff/staffPropAnswer/save" method="post" class="form-horizontal">
		<div class="control-group" hidden="hidden">
			<label class="control-label">员工ID:</label>
			<div class="controls">
				<input type="text" readonly="readonly" name="staffId" value="${user.id}"/>
			</div>
		</div>
		<div class="control-group" hidden="hidden">
			<label class="control-label">referer:</label>
			<div class="controls">
				<input type="text" readonly="readonly" name="referer" value="${referer}"/>
			</div>
		</div>
		<input type="hidden" name="UUID" value="${UUID}" />
		<div class="control-group" hidden="hidden">
			<label class="control-label">模板ID:</label>
			<div class="controls">
				<input type="text" readonly="readonly" name="templateId" value="${staffTemplate.id}"/>
			</div>
		</div>
		<%--<div class="control-group">
			<label class="control-label">员工姓名:</label>
			<div class="controls">
				<input type="text" readonly="readonly" value="${user.name}" class="input-xlarge"/>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">员工手机号:</label>
			<div class="controls">
				<input type="text" readonly="readonly" value="${user.mobile}" class="input-xlarge"/>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">员工邮件:</label>
			<div class="controls">
				<input type="text" readonly="readonly" value="${user.email}" class="input-xlarge"/>
			</div>
		</div>--%>

		<sys:message content="${message}"/>
		<c:forEach items="${staffPropTemplateMVC.list}" var="staffPropTemplate" varStatus="vs">
			<div class="control-group">
				<input type="hidden" readonly="readonly" name="list[${vs.index}].staffId" value="${user.id}"/>
				<input type="hidden" readonly="readonly" name="list[${vs.index}].templateId" value="${staffTemplate.id}"/>
				<input type="hidden" name="list[${vs.index}].staffPropId" value="${staffPropTemplate.staffPropId}"/>
				<c:choose>
					<c:when test="${staffPropTemplate.staffPropName == '离职时间' && user.leaveFlag != '1'}">

					</c:when>
					<c:otherwise>
						<label class="control-label">${staffPropTemplate.staffPropName}:</label>
					</c:otherwise>
				</c:choose>
				<c:choose>
					<c:when test="${staffPropTemplate.staffPropName == '姓名'}">
						<div class="controls">
							<input disabled="disabled" id="${staffPropTemplate.templateId}.${staffPropTemplate.staffPropId}"  type="text" value="${user.name}" maxlength="64" class="input-xlarge"/>
						</div>
					</c:when>
					<c:when test="${staffPropTemplate.staffPropName == '职务'}">
						<div class="controls">
							<input disabled="disabled" id="${staffPropTemplate.templateId}.${staffPropTemplate.staffPropId}"  type="text" value='${fns:getDictLabel(user.userType, staffPropTemplate.staffDictType,"")}' maxlength="64" class="input-xlarge"/>
						</div>
					</c:when>
					<c:when test="${staffPropTemplate.staffPropName == '区域'}">
						<div class="controls">
							<input disabled="disabled" id="${staffPropTemplate.templateId}.${staffPropTemplate.staffPropId}"  type="text" value='${user.areaShi}' maxlength="64" class="input-xlarge"/>
						</div>
					</c:when>
					<c:when test="${staffPropTemplate.staffPropName == '所属项目'}">
						<div class="controls">
							<input disabled="disabled" id="${staffPropTemplate.templateId}.${staffPropTemplate.staffPropId}"  type="text" value="${user.item}" maxlength="64" class="input-xlarge"/>
						</div>
					</c:when>
					<c:when test="${staffPropTemplate.staffPropName == '员工编号'}">
						<div class="controls">
							<input disabled="disabled" id="${staffPropTemplate.templateId}.${staffPropTemplate.staffPropId}"  type="text" value="${user.no}" maxlength="64" class="input-xlarge"/>
						</div>
					</c:when>
					<c:when test="${staffPropTemplate.staffPropName == '联系方式'}">
						<div class="controls">
							<input disabled="disabled" id="${staffPropTemplate.templateId}.${staffPropTemplate.staffPropId}"  type="text" value="${user.mobile}" maxlength="64" class="input-xlarge"/>
						</div>
					</c:when>
					<c:when test="${staffPropTemplate.staffPropName == '项目编号'}">
						<div class="controls">
							<input disabled="disabled" id="${staffPropTemplate.templateId}.${staffPropTemplate.staffPropId}"  type="text" value="${user.item.itemNo}" maxlength="64" class="input-xlarge"/>
						</div>
					</c:when>
					<c:when test="${staffPropTemplate.staffPropName == '劳动合同起始日'}">
						<div class="controls">
							<input id="laoDongHeTongDate" name="list[${vs.index}].staffPropVal" type="text" readonly="readonly" maxlength="20" class="input-medium Wdate" style="width:163px;"
								   value="${staffPropTemplate.answer}"
								   onclick="WdatePicker({dateFmt:'yyyy-MM-dd'});" onchange="changeDate();"/>
						</div>
					</c:when>
					<c:when test="${staffPropTemplate.staffPropName == '离职时间' && user.leaveFlag != '1'}">

					</c:when>
					<c:when test="${staffPropTemplate.staffPropName == '离职时间'}">
						<div class="controls">
							<input disabled="disabled" type="text" readonly="readonly" maxlength="20" class="input-medium Wdate" style="width:163px;"
								   value="<fmt:formatDate value="${user.leaveDate}" pattern="yyyy-MM-dd"/>"
								   onclick="WdatePicker({dateFmt:'yyyy-MM-dd'});" onchange="changeDate();"/>
						</div>
					</c:when>
					<c:when test="${staffPropTemplate.staffPropName == '劳动合同截止日'}">
						<div class="controls">
							<input disabled="disabled" id="laoDongHeTongDateDie" type="text" readonly="readonly" maxlength="20" class="input-medium Wdate" style="width:163px;"
								   value=""
								   onclick="WdatePicker({dateFmt:'yyyy-MM-dd'});"/>
						</div>
					</c:when>
					<c:when test="${staffPropTemplate.staffPropName == '预计转正日'}">
						<div class="controls">
							<input disabled="disabled" id="zhuanzhengri" type="text" readonly="readonly" maxlength="20" class="input-medium Wdate" style="width:163px;"
								   value=""
								   onclick="WdatePicker({dateFmt:'yyyy-MM-dd'});"/>
						</div>
					</c:when>
					<c:when test="${staffPropTemplate.staffPropName == '剩余合同期限(月)'}">
						<div class="controls">
							<input disabled="disabled" id="shengyuqixian"  type="text" value="" maxlength="64" class="input-xlarge"/>
						</div>
					</c:when>
					<c:when test="${staffPropTemplate.staffPropName == '出生年月'}">
						<div class="controls">
							<input id="birthday" name="list[${vs.index}].staffPropVal" type="text" readonly="readonly" maxlength="20" class="input-medium Wdate" style="width:163px;"
								   value="${staffPropTemplate.answer}"
								   onclick="WdatePicker({dateFmt:'yyyy-MM-dd'});" onchange="changeAge();"/>
						</div>
					</c:when>
					<c:when test="${staffPropTemplate.staffPropName == '年龄'}">
						<div class="controls">
							<input disabled="disabled" id="age"  type="text" value="" maxlength="64" class="input-xlarge"/>
						</div>
					</c:when>
					<c:when test="${staffPropTemplate.staffPropType == 'date'}">
						<div class="controls">
							<input id="${staffPropTemplate.templateId}.${staffPropTemplate.staffPropId}" name="list[${vs.index}].staffPropVal" type="text" readonly="readonly" maxlength="20" class="input-medium Wdate" style="width:163px;"
								   value="${staffPropTemplate.answer}"
								   onclick="WdatePicker({dateFmt:'yyyy-MM-dd'});"/>
						</div>
					</c:when>
					<c:when test="${staffPropTemplate.staffPropType == 'radio'}">
						<div class="controls">
							<%--<form:radiobuttons path="list[${vs.index}].answer" items="${fns:getDictList(staffPropTemplate.staffDictType)}" itemLabel="label" itemValue="value" htmlEscape="false" class=""/>--%>
							<c:forEach items="${fns:getDictList(staffPropTemplate.staffDictType)}" var="dict" varStatus="dictVS">
								<label for="${staffPropTemplate.staffPropId}${dictVS.index}">${dict.label}</label>
								<input name="list[${vs.index}].staffPropVal" id="${staffPropTemplate.staffPropId}${dictVS.index}" type="radio" value="${dict.value}" ${dict.value==staffPropTemplate.answer?'checked':''} />
							</c:forEach>
						</div>
					</c:when>
					<c:when test="${staffPropTemplate.staffPropType == 'checkbox'}">
						<div class="controls">
							<c:forEach items="${fns:getDictList(staffPropTemplate.staffDictType)}" var="dict" varStatus="dictVS">
								<label for="${staffPropTemplate.staffPropId}${dictVS.index}">${dict.label}</label>
								<input name="list[${vs.index}].staffPropVal" id="${staffPropTemplate.staffPropId}${dictVS.index}" type="checkbox" value="${dict.value}" />
							</c:forEach>
							<script type="text/javascript">
								var answers${vs.index} = '${staffPropTemplate.answer}';
                                answers${vs.index} = "," + answers${vs.index} + ',';
                                var nameStr = 'list['+'${vs.index}'+'].staffPropVal';
                                var cb${vs.index} = document.getElementsByName(nameStr);//这里改你checkbox的name值
                                for (var i = 0; i < cb${vs.index}.length; i++){
                                    if (answers${vs.index}.indexOf(',' + cb${vs.index}[i].value + ',') != -1) cb${vs.index}[i].checked = true;
                                }
							</script>
							<%--${dict.value==staffPropTemplate.answer?'checked':''}--%>
							<%--<form:checkboxes path="list[${vs.index}].staffPropVal" items="${fns:getDictList(staffPropTemplate.staffDictType)}" itemLabel="label" itemValue="value" htmlEscape="false"/>--%>
						</div>
					</c:when>
					<c:when test="${staffPropTemplate.staffPropType == 'select'}">
						<div class="controls">
							<select name="list[${vs.index}].staffPropVal" class="input-medium">
								<c:forEach items="${fns:getDictList(staffPropTemplate.staffDictType)}" var="dict">
									<option value="${dict.value}" ${dict.value==staffPropTemplate.answer?'selected':''} title="${dict.description}">${dict.label}</option>
								</c:forEach>
							</select>
						</div>
					</c:when>
					<c:when test="${staffPropTemplate.staffPropType == 'textarea'}">
						<div class="controls">
							<%--<form:textarea path="remarks" htmlEscape="false" rows="4" maxlength="255" class="input-xxlarge "/>--%>
							<textarea name="list[${vs.index}].staffPropVal" rows="4" maxlength="255" class="input-xxlarge ">${staffPropTemplate.answer}</textarea>
						</div>
					</c:when>
					<c:when test="${staffPropTemplate.staffPropType == 'images' or staffPropTemplate.staffPropType == 'files' }">
						<div class="controls">
							<%--
							<form:hidden id="staffPropValList" path="staffPropValList" htmlEscape="false" maxlength="255" class="input-xlarge"/>
							<sys:ckfinder input="staffPropValList" type="${staffPropTemplate.staffPropType}" uploadPath="/staff/staffBasic" selectMultiple="true"/>
							--%>
							<%--<form:hidden id="list[${vs.index}].answer" path="list[${vs.index}].answer" htmlEscape="false" maxlength="255" class="input-xlarge"/>--%>
							<input type="hidden" id="listanswer${vs.index}" name="list[${vs.index}].staffPropVal" htmlEscape="false" maxlength="255" class="input-xlarge" value="${staffPropTemplate.answer}"/>
							<sys:ckfinder input="listanswer${vs.index}" type="${staffPropTemplate.staffPropType}" uploadPath="/staff/staffBasic" selectMultiple="true"/>
						</div>
					</c:when>
					<c:otherwise>
						<div class="controls">
							<input id="${staffPropTemplate.templateId}.${staffPropTemplate.staffPropId}" name="list[${vs.index}].staffPropVal" type="text" value="${staffPropTemplate.answer}" maxlength="64" class="input-xlarge" <%--class="${empty user.id?'required':''}"--%>/>
						</div>
					</c:otherwise>
				</c:choose>
				<%--value="<fmt:formatDate value="${staffPropTemplate.answer}" pattern="yyyy-MM-dd"/>"--%>
			</div>
		</c:forEach>

		<div class="form-actions">
			<c:choose>
				<c:when test="${staffTemplate.id == 1}">
					<shiro:hasPermission name="staff:archives:edit"><input name="toEdu" class="btn btn-primary" type="submit" value="保存并完善教育信息"/>&nbsp;</shiro:hasPermission>
					<shiro:hasPermission name="staff:archives:edit"><input id="btnSubmit" class="btn btn-primary" type="submit" value="保 存"/>&nbsp;</shiro:hasPermission>
				</c:when>
				<c:when test="${staffTemplate.id == 2}">
					<shiro:hasPermission name="staff:family:edit"><input id="btnSubmit" class="btn btn-primary" type="submit" value="保 存"/>&nbsp;</shiro:hasPermission>
				</c:when>
			</c:choose>
			<input id="btnCancel" class="btn" type="button" value="返 回" onclick="history.go(-1)"/>
		</div>
	</form:form>
</body>
</html>