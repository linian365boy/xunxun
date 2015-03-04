<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta http-equiv="Content-Language" content="zh-cn" />
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<html>
<head><title>新增资源</title>
<style type="text/css">
img {border-width: 0px 0px 0px 0px}
#middel{
	width:1340px;
}
#left{
	float:left;
}

#content{
	width:1200px;
}
#footer{
	width:1340px;
}
span.star{
	padding-left:10px;
	color:red;
}
</style>
<%@ include file="/WEB-INF/inc/taglib.inc" %>
<%@ include file="/WEB-INF/inc/constants.inc" %>
<%@ include file="/WEB-INF/inc/script.inc" %>
<%@ include file="/WEB-INF/inc/style.inc" %>
<script type="text/javascript">
    $(document).ready(function(){
    	$('#saveResBtn').click(function(){
    		var saveForm = $('#tabContent');
    		saveForm.submit();
    	});
    });
    </script>
</head>
<body>
<div id="container">
	<div id="header">
		<jsp:include page="/WEB-INF/tiles/four-header.jsp" />
	</div>
	<div id="middel">
		<div id="left">
			<jsp:include page="/WEB-INF/tiles/four-left.jsp" />
		</div>
		<div id="content">
			<div id="epMcContent">
	<div class="epMcCtContent">
	<h3 class="titleBig bigFont bordFont">资源管理</h3>
	<form id="tabContent" action="resources-input.htm" method="post">
	<input type="hidden" name="tokenName" value="${token_name}">
	<input type="hidden" name="resourceId" value="${res.resourceId}"/>
				<div class="tab">
					<ul class="tabMenu none bordFont floatUl normalFont">
						<li class="first"><a href="<c:url value="/users/resources-initial.htm"/>">资源列表</a>
						</li>
						<li><a href="<c:url value="/users/resources-input.htm?init=true"/>"  class="current">新增资源</a></li>
					</ul>
				</div>
				<div id="tabContent1">
		  
		  <table class="tableSteel">
			<tr>
			<td class="twof"></td>
			<td class="fivf">资源名</td>
			<td><div class="col-xs-8"><input type="text" name="resourceName" value="${res.resourceName}" class="form-control input-sm" /></div><span class="star">*</span></td>
			
			<td class="fivf">资源描述</td>
			<td><div class="col-xs-8"><input type="text" name="resourceDesc" value="${res.resourceDesc}" class="form-control input-sm" /></div><span class="star">*</span></td>
			<td class="twof"></td>
			</tr>
			<tr>
			<td class="twof"></td>
			<td class="fivf">资源URL</td>
			<td><div class="col-xs-8"><input type="text" name="resourceUrl" value="${res.resourceUrl}" class="form-control input-sm" /></div><span class="star">*</span></td>
			
			<td class="fivf">默认URL</td>
			<td><div class="col-xs-8">
				<select name="defaults" class="form-control input-sm">
					<option value="0" <c:if test="${res.defaults == false}">selected="selected"</c:if>>否</option>
					<option value="1" <c:if test="${res.defaults == true}">selected="selected"</c:if>>是</option>
				</select>
				</div>
			<span class="star">*</span></td>
			<td class="twof"></td>
			</tr>
			<tr>
			<td class="twof"></td>
			<td class="fivf">是否启用</td>
			<td><div class="col-xs-8">
					<select name="enabled" class="form-control input-sm">
						<option value="1" <c:if test="${res.enabled ==1}">selected="selected"</c:if>>是</option>
						<option value="0" <c:if test="${res.enabled ==0}">selected="selected"</c:if>>否</option>
					</select>
				</div>
					<span class="star">*</span>
			</td>
			
			<td class="fivf">菜单中显示</td>
			<td><div class="col-xs-8">
					<select name="showInMenu" class="form-control input-sm">
						<option value="0" <c:if test="${res.showInMenu == false}">selected="selected"</c:if>>否</option>
						<option value="1" <c:if test="${res.showInMenu == true}">selected="selected"</c:if>>是</option>
					</select>
				</div>
					<span class="star">*</span></td>
			<td class="twof"></td>
			</tr>
			<tr>
			<td class="twof"></td>
			<td class="fivf">资源类型</td>
			<td><div class="col-xs-8">
				<select name="resourceType" class="form-control input-sm">
					<option value="url" <c:if test="${res.resourceType eq 'url'}">selected="selected"</c:if>>URL</option>
					<option value="action" <c:if test="${res.resourceType eq 'action'}">selected="selected"</c:if>>Action</option>
					<option value="method" <c:if test="${res.resourceType eq 'method'}">selected="selected"</c:if>>Method</option>
				</select>
				</div>
			<span class="star">*</span></td>
			<td class="fivf">菜单模块</td>
			<td><div class="col-xs-8">
			<select id="moduleId" name="moduleId" class="form-control input-sm">
				<option value="">--请选择--</option>
				<c:forEach items="${list}" var="module">
					<option value="${module.moduleId}" <c:if test="${module.moduleId == res.moduleId}">selected="selected"</c:if> >${module.moduleName}</option>
				</c:forEach>
			</select></div>
			<span class="star">*</span></td>
			<td class="twof"></td>
			</tr>
		  </table>
		  
			<div class="text-center">
				<input type="button" class="btn btn-primary" id="saveResBtn" value="保存" />
			</div>
		</div>
		
	</form>	
	</div>
	</div>
		</div>
	</div>
	<div id="footer">
		<jsp:include page="/WEB-INF/tiles/four-footer.jsp" />
	</div>
</div>

</body>
</html>