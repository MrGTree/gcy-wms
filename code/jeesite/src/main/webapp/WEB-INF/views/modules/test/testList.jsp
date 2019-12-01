<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
	<title>视频智能分析</title>
	<meta name="decorator" content="default"/>
</head>
<body>
<ul class="nav nav-tabs">
</ul>
<table id="contentTable" class="table table-striped table-bordered table-condensed">
	<thead>
	<tr>
		<th style="text-align:center;vertical-align:middle;width: 40%">待分析视频</th>
		<th style="text-align:center;vertical-align:middle;width: 40%">违规推送</th>
		<th style="text-align:center;vertical-align:middle;width: 20%">摄像头编号</th>
	</tr>
	</thead>
	<tbody>
	<c:forEach items="${page.list}" var="urlMapper">
		<tr>
			<td style="text-align:center;vertical-align:middle;">
					${urlMapper.inputUrl}
			</td>
			<td style="text-align:center;vertical-align:middle;">
					${urlMapper.outPutUrl}
			</td>
			<td style="text-align:center;vertical-align:middle;">
					${urlMapper.camerName}
			</td>
		</tr>
	</c:forEach>
	</tbody>
</table>
<hr></hr>
<table>
	<form:form id="inputForm" modelAttribute="urlMapper" action="${ctx}/test/test/startAnalizy" method="post" class="form-horizontal">
		<div class="control-group">
			<label class="control-label">需要分析的视频:</label>
			<div class="controls">
				分析地址:<input name="inputUrl" style="width: 100%"/><br/>
				违规推送:<input name="outPutUrl" style="width: 100%"/><br/>
				客户端号:<input name="camerName" style="width: 100%"/><br/>
			</div>
		</div>
		<div class="form-actions">
			<input id="btnSubmit" class="btn btn-primary" style="width: 100%" type="submit" value="开始分析"/>
		</div>
	</form:form>
</table>
</body>
</html>