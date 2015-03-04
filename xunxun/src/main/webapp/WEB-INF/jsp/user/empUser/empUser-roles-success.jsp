<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta http-equiv="Content-Language" content="zh-cn" />
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<html>
<head><title>我的角色</title>
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
<script type="text/javascript">
$(document).ready(function(){
	$('#queryButton').click(function(){
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
			<div id="epMcContent" style="margin-bottom:10px;">
	<div class="epMcCtContent">
	<h3 class="bordFont bigFont">我的角色</h3>
	<div class="tab">
				<ul class="tabMenu none bordFont floatUl normalFont">
					<li class="first"><a href="<c:url value="/users/empUser-initial.htm"/>">用户列表</a></li>
					<li><a class="current" href="<c:url value="/users/empUser-roles.htm?init=true"/>">我的角色</a></li>
					<li><a href="<c:url value="/users/empUser-input.htm?init=true"/>">新增用户</a></li>
				</ul>
				<form action="empUser-roles.htm" id="queryForm" name="queryForm" method="post">
			<table class="tableSteel">
              <tr class="title" style="border-right:1px #bfd2ed solid;">
                <td class="twof">序号</td>
                <td class="fouf">角色名</td>
                <td class="fivf">描述</td>
                <td class="fivf">可用</td>
                <td class="fouf">用户</td>
                <td class="sixf">创建时间</td>
                <td class="fivf" style="border-right:1px #09f solid">操作</td>
              </tr>
              
              <c:forEach items="${list}" var="role" varStatus="st">
              <tr style="${st.count%2==0?'background:#f3f3f3':''}">
                <td class="twof"><input type="checkbox" /></td>
                <td class="fouf">${role.roleName}</td>
                <td class="sixf">${role.roleDesc}</td>
                <td class="fouf"><c:if test="${role.enabled eq 1}">是</c:if><c:if test="${role.enabled ne 1}">否</c:if></td>
                <td class="fivf">${userName}</td>
                <td class="fouf"><fmt:formatDate value="${role.createTime}" pattern="yyyy-MM-dd HH:mm:ss"/></td>
                <td class="fivf"><input type="button" class="pageCutSmallBtnDel" id="input4" value="删除" /></td>
              </tr>
              </c:forEach>
            </table>
		  
		  </form>
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
