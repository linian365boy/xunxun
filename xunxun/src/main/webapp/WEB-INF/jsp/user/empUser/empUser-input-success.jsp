<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta http-equiv="Content-Language" content="zh-cn" />
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<html>
<head><title>新增用户</title>
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
</style>
<%@ include file="/WEB-INF/inc/taglib.inc" %>
<%@ include file="/WEB-INF/inc/constants.inc" %>
<%@ include file="/WEB-INF/inc/script.inc" %>
<%@ include file="/WEB-INF/inc/style.inc" %>
<style type="text/css">
table.singleIncreasesResources{
	width:1235px;
	height:;
	/*border-top:1px #ccc solid;*/
	border-bottom:1px #ccc solid;
	font-weight:600;
}
table.singleIncreasesResources thead tr{
	line-height:30px;
	height:30px;
	border-bottom:1px #ccc dashed;
}
table.singleIncreasesResources thead tr td{
	padding-left:16px;
}

table.singleIncreasesResources tbody tr{
	height:40px;
	line-height:40px;
	border-bottom:1px #ccc dashed;
}
td.twoFont{
	width:105px;
	text-align:center;
	font-weight:600;
	color:#666;

}
td.star{
	width:65px;
	text-align:left;
	color:red;
}
td.widt{
	width:215px;
	font-weight:600;
	color:#666;
}
input{
	border:1px #ccc solid;
}
input.widt{
	width:210px;
}
input.szd{
	width:98px;
}
input.gsr{
	width:98px;
}
input.inputRadio{
	width:16px;
	height:16px;
	line-height:24px;
	margin-right:10px;
	margin-left:10px;
}
input.note{
	width:580px;
}
span.star{
	padding-left:10px;
	color:red;
}
input.determination{
	margin:10px 20px 20px 500px;
	border:0;
}
input.cancellation{
	margin:10px 20px 20px 0;
	border:0;
}

input.iptBuySteelAdd{
	width:13px;
	height:13px;
	margin-left:5px;
	background:transparent url('../images/tb2.gif') no-repeat scroll left top;
}
</style>

    <script type="text/javascript">
	function saveUser(){
		var targetForm = $('#frm');
		
		var userAccount = $("#userAccount").val();
		if($.trim(userAccount) == ''){
			aAlert('账号是必填项。');
			return false;
		}
		var name = $('#name').val();
		if($.trim(name) == ''){
			aAlert('用户名必填。');
			return false;
		}
		var email = $('#email').val();
		if($.trim(email) == ''){
			aAlert('邮箱必填。');
			return false;
		}
		var currentPass = $('#currentPass').val();
		if ($.trim(currentPass) == '') {//没有填密码
			var sourcePass = $('#sourcePass').val();//原密码
			if ($.trim(sourcePass) == '') {//原密码是空，是新增的
				aAlert('密码是必填项。');
				return false;
			} else {//是更新的
				$('#currentPass').val(sourcePass);
			}
		}
		targetForm.submit();
	}
	$(document).ready(function(){
		$('#addAuth').click(function(){
			$.dialog({
				title:'用户角色查询',
				content:'url:<c:url value="/users/roles-list.htm"/>',
				width:804,
				height:620,
				min:true,
				max:true,
				esc:true,
				lock:true
			});
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
			<div id="epMcContent" class="epMcCtContent" style="margin-top:10px;margin-bottom:10px;">
	<h3 class="bordFont bigFont">用户管理</h3>
	<form name="frm" id="frm" action="empUser-input.htm" method="post">
	<input type="hidden" name="tokenName" value="${token_name}">
	<input type="hidden" id="sourcePass" value="${entity.pass}">
	<input type="hidden" name="userId" value="${entity.userId}"/>
			<div class="tab">
				<ul class="tabMenu none bordFont floatUl normalFont">
					<li class="first"><a href="<c:url value="/users/empUser-initial.htm"/>">用户列表</a></li>
					<li><a href="<c:url value="/users/empUser-roles.htm?init=true"/>">我的角色</a></li>
					<li><a href="<c:url value="/users/empUser-input.htm?init=true"/>" class="current">新增用户</a></li>
				</ul>
			</div>
	<table class="tableSteel">
		<tr>
		<td class="twoFont">账号 </td><td class="widt"><input class="widt" name="userAccount" id="userAccount" value="${entity.userAccount}" type="text"/><span class="star">*</span></td><td class="star"></td>
		<td class="twoFont">姓名</td><td class="widt"><input class="widt" name="name" id="name" value="${entity.name}" type="text" /><span class="star">*</span></td><td class="star"></td>
		</tr>
		<tr>
		<td class="twoFont">邮箱</td><td class="widt"><input class="widt" id="email" name="email" value="${entity.email}" type="text"/><span class="star">*</span></td><td class="star"></td>
		<td class="twoFont">部门ID</td><td class="widt"><input class="widt" name="deptId" value="${entity.deptId}" type="text" /><span class="star">*</span></td><td class="star"></td>
		</tr>
		<tr>
		<td class="twoFont">密码</td><td class="widt"><input class="widt" name="pass" id="currentPass" type="password"/><span class="star">*</span></td><td class="star"></td>
		<td class="twoFont">可用</td><td class="widt">
		<select name="enable">
			<option value="1" <c:if test="${entity.enable == 1}">selected="selected"</c:if>>是</option>
			<option value="0" <c:if test="${entity.enable == 0}">selected="selected"</c:if>>否</option>
		</select>
		<span class="star">*</span></td><td class="star"></td>
		</tr>
		<tr>
		<td class="twoFont">权限</td><td class="widt" colspan="5"><input type="text" name="authName" value="${entity.roleNames}" id="authName" readOnly="false" class="note" /><img id="addAuth" src="../images/tb2.gif" style="margin-left:6px;cursor:pointer;"></img></td>
		<input type="hidden" name="username" value="${entity.username}" id="authId"/>
		</tr>
		<tr>
		<td class="twoFont">部门名称</td><td class="widt" ><input type="text" name="deptName" value="${entity.deptName}" class="widt" /><span class="star">*</span></td><td class="star"></td>
		<td class="twoFont"></td><td class="widt">
		</td><td class="star"></td>
		</tr>
	</table>
	<input type="button" class="determination" value="保存" onclick="saveUser();"/>
	<input type="reset" class="cancellation" id="" value="取消" />
	</form>
</div>
		</div>
	</div>
	<div id="footer">
		<jsp:include page="/WEB-INF/tiles/four-footer.jsp" />
	</div>
</div>

</body>
</html>
