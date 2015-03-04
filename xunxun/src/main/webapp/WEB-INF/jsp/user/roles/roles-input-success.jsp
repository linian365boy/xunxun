<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta http-equiv="Content-Language" content="zh-cn" />
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<html>
<head><title>角色管理</title>
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
	$('#addAuth').click(function(){
		$.dialog({
			title:'角色权限查询',
			content:'url:<c:url value="/users/auth-list.htm"/>',
			width:820,
			height:620,
			min:true,
			max:true,
			esc:true,
			lock:true
		});
	});
	$('#saveRole').click(function(){
		var queryForm = $('#queryForm');
		queryForm.submit();
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
	<h3 class="bigFont bordFont blac">角色管理</h3>
		<div class="tab">
		<ul class="tabMenu none bordFont floatUl normalFont">
			<li class="first"><a href="<c:url value="/users/roles-initial.htm"/>">角色列表</a></li>
			<li><a class="current" href="<c:url value="/users/roles-input.htm?init=true"/>">新增角色</a></li>
		</ul>
	<div id="tabContent1">
	<form action="roles-input.htm" method="post" name="queryForm" id="queryForm">
	<input type="hidden" name="tokenName" value="${token_name}">
	<input type="hidden" name="roleId" value="${role.roleId}"/>
		<table class="tableSteel">
			<tr>
			<td class="twof"></td>
			<td class="fivf">角色名</td>
			<td><div class="col-xs-8"><input type="text" name="roleName" value="${role.roleName}" class="form-control input-sm" /></div><span class="star">*</span></td>
			
			<td class="fivf">角色描述</td>
			<td><div class="col-xs-8"><input type="text" name="roleDesc" value="${role.roleDesc}" class="form-control input-sm" /></div><span class="star">*</span></td>
			<td class="twof"></td>
			</tr>
			<tr>
			<td class="twof"></td>
			<td class="fivf">是否启用</td>
			<td><div class="col-xs-8">
					<select name="enabled" class="form-control input-sm">
						<option value="1" <c:if test="${role.enabled == 1}">selected="selected"</c:if>>是</option>
						<option value="0" <c:if test="${role.enabled != 1}">selected="selected"</c:if>>否</option>
					</select>
				</div>
					<span class="star">*</span>
			</td>
			
			<td class="fivf">优先级</td>
			<td><div class="col-xs-8">
					<select name="priority" class="form-control input-sm">
						<option value="1" <c:if test="${role.priority == 1}">selected="selected"</c:if>>1</option>
						<option value="2" <c:if test="${role.priority == 2}">selected="selected"</c:if>>2</option>
						<option value="3" <c:if test="${role.priority == 3}">selected="selected"</c:if>>3</option>
					</select>
				</div>
					<span class="star">*</span></td>
			<td class="twof"></td>
			</tr>
			<tr>
			<td class="twof"></td>
			<td class="fivf">拥有权限</td>
			<td class="tenf" colspan="4">
			<input type="hidden" id="authIds" value="${role.authIds}" name="authIds"/>
			<div class="col-xs-9">
			<input type="text" id="authNames" value="${role.authNames}" class="form-control input-sm"/>
			</div>
			<span class="star">*</span><img id="addAuth" src="../images/tb2.gif" style="margin-left:6px;cursor:pointer;"></img> </td>
			</tr>
		  </table>
			<div class="text-center">
				<input type="button" class="btn btn-primary btn-sm" id="saveRole" value="保存" />
			</div>
			</form>
		</div>
	</div>
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
