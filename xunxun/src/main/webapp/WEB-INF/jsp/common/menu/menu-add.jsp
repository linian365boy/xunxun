<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta http-equiv="Content-Language" content="zh-cn" />
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<html>
<head><title>新增菜单</title>
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
	<h3 class="titleBig bigFont bordFont">菜单管理</h3>
	<form id="tabContent" action="add.htm" method="post">
	<input type="hidden" name="tokenName" value="${token_name}">
	<input type="hidden" name="moduleId" value="${entity.moduleId}"/>
				<div class="tab">
					<ul class="tabMenu none bordFont floatUl normalFont">
						<li class="first"><a href="<c:url value="/menu/list.htm"/>">菜单列表</a>
						</li>
						<li><a href="<c:url value="/menu/add.htm?init=true"/>"  class="current">新增菜单</a></li>
					</ul>
				</div>
				<div id="tabContent1">
		  
		  <table class="tableSteel">
			<tr>
			<td class="twof"></td>
			<td class="fivf">模块名</td>
			<td><input type="text" name="moduleName" value="${entity.moduleName}" class="twf190" /><span class="star">*</span></td>
			
			<td class="fivf"></td>
			<td><input type="hidden" name="createTime" value="<fmt:formatDate value="${entity.createTime}" pattern="yyyy-MM-dd HH:mm:ss"/>" class="twf190" /></td>
			<td class="twof"></td>
			</tr>
			<tr>
			<td class="twof"></td>
			<td class="fivf">显示顺序</td>
			<td><input type="text" name="orders" value="${entity.orders}" class="twf190" /><span class="star">*</span></td>
			
			<td class="fivf">是否启用</td>
			<td>
				<select name="enable">
					<option value="true" <c:if test="${entity.enable == true}">selected="selected"</c:if>>是</option>
					<option value="false" <c:if test="${entity.enable == false}">selected="selected"</c:if>>否</option>
				</select>
			<span class="star">*</span></td>
			<td class="twof"></td>
			</tr>
			
		  </table>
		  
			<div>
				<input type="button" class="pageCutSmallBtnSub" id="saveResBtn" value="保存" />
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