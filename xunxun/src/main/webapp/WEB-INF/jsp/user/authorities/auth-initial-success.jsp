<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta http-equiv="Content-Language" content="zh-cn" />
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<html>
<head><title>权限管理</title>
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
    		$('#query').val('true');
    		$("#queryForm").submit();
    	});
    });
    function deleteAuth(id) {
    	$.dialog.confirm('你确定要删除该权限吗？', function(){
    		$.ajax({
	            type:"post",
	            dataType:"text",
	            url: '${ctx}/users/auth-delete.htm?authId=' + id,
	            success: function(msg){
	            	$('#tr'+id).remove();
	            },
	            error: function (msg) {
	                alert(msg.responseText);
	            }
	        });
    	}, function(){
    	    $.dialog.tips('您放弃删除操作。');
    	});
	}
    function queryRes(authId) {
    	$.dialog({
			title:'权限资源明细',
			content:'url:<c:url value="/users/auth-resource.htm?authId=' + authId + '"/>',
			width:804,
			height:600,
			min:true,
			max:false,
			esc:true,
			lock:true
		});
    }
  	//修改实体
    function editAuth(id) {
   	 window.location.href = 'authorities-input.htm?init=true&authId='+id;
    }
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
			<h3 class="bordFont bigFont">权限管理</h3>
			<div class="tab">
				<ul class="tabMenu none bordFont floatUl normalFont">
					<li class="first"><a href="<c:url value="/users/authorities-initial.htm"/>" class="current">权限列表</a>
					</li>
					<li><a href="<c:url value="/users/authorities-input.htm?init=true"/>">新增权限</a></li>
				</ul>
				<div class="">
					<form action="authorities-initial.htm" id="queryForm" name="queryForm" method="post">
					<input type="hidden" name="query" id="query" value="false"/>
						<table class="bugSteel first" style="border-top: 0;">
							<tr>
								<td class="twof"> 权限名</td>
								<td class="twef">
								<input type="text" name="authName" value="${authorities.authName}" class="tf" />
								</td>
								<td class="twof">描述</td>
								<td class="twef">
								<input type="text" name="authDesc" value="${authorities.authDesc}" class="tf" />
								</td>
								<td class="twof">动作</td>
								<td class="twef">
								<input type="text" name="action" value="${authorities.action}" class="tf" />
								</td>
								<td class="twof">排序</td><td class="fotf">
								<select style="width:90px;" name="page.orderBy">
									<option value="authName" <c:if test="${page.orderBy eq 'authName'}">selected="selected"</c:if>>权限名</option>
									<option value="authDesc" <c:if test="${page.orderBy eq 'authDesc'}">selected="selected"</c:if>>描述</option>
									<option value="moduleId" <c:if test="${page.orderBy eq 'moduleId'}">selected="selected"</c:if>>模组</option>
								</select>-
								<select style="width:70px;" name="page.ascDesc">
									<option value="asc" <c:if test="${page.ascDesc eq 'asc'}">selected="selected"</c:if>>升序</option>
									<option value="desc" <c:if test="${page.ascDesc eq 'desc'}">selected="selected"</c:if>>降序</option>
								</select>
								</td>
								<td class="twof"></td>
								<td class="twef">
								<input type="button" value="查询" class="determination" id="queryButton" style="margin-right:20px;" />
									<input type="reset" value="清除" class="cancellation" />
								</td>
							</tr>
						</table>
					
					<table class="tableSteel">
              <tr class="title" style="border-right:1px #bfd2ed solid;">
                <td class="twof"></td>
                <td class="fivf">权限名</td>
                <td class="fivf">描述</td>
                <td class="fivf">默认URL</td>
                <td class="fivf">模组</td>
                <td class="sixf">动作</td>
                <td class="fivf" style="border-right:1px #09f solid">操作</td>
              </tr>
              <c:forEach items="${listResult}" var="auth" varStatus="st">
              <tr id="tr${auth.authId}" style="${st.count%2==0?'background:#f3f3f3':''}">
                <td class="twof"><input type="checkbox" /></td>
                <td class="sixf">${auth.authName }</td>
                <td class="fivf">${auth.authDesc }</td>
                
                <td class="sixf"><c:if test="${auth.enabled == 1}">是</c:if><c:if test="${auth.enabled == 0}">否</c:if></td>
                <td class="sixf">${auth.moduleId}</td>
                <td class="sixf">${auth.action}</td>
                <td class="fivf">
                 <img src="../images/res3.png" title="资源" style="margin-left:4px;margin-top:4px;cursor:pointer;height:22px;width:22px;" onclick="javascript:queryRes('${auth.authId}');"></img>
                 <img src="../images/btn_edit.gif" title="修改" style="margin-left:4px;margin-top:4px;cursor:pointer;" onclick="javascript:editAuth('${auth.authId}')"/>
                 <img src="../images/tu12.gif" title="删除" style="margin-left:4px;margin-top:4px;cursor:pointer;" onclick="javascript:deleteAuth('${auth.authId}')"/></td>
              </tr>
              </c:forEach>
            </table>
					<div id="page">
						<p>
						<vte:pages hasForm="true" beanName="page" formName="queryForm"/>
						</p>
					</div>
					</form>
				</div>
			</div>
			<div class="clear"></div>
			<div class="heiTenpx"></div>
		</div>
		<div class="heiTenpx"></div>
	</div>
		</div>
	</div>
	<div id="footer">
		<jsp:include page="/WEB-INF/tiles/four-footer.jsp" />
	</div>
</div>

</body>
</html>
