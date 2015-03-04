<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta http-equiv="Content-Language" content="zh-cn" />
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<html>
<head><title>菜单管理</title>
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
    
  	//修改实体
    function editMenu(id) {
   	 window.location.href = 'add.htm?init=true&moduleId='+id;
    }
  	
    function deleteMenu(id) {
    	$.dialog.confirm('你确定要删除该菜单吗？', function(){
    		$.ajax({
	            type:"post",
	            dataType:"text",
	            url: '${ctx}/menu/delete.htm?moduleId=' + id,
	            success: function(msg){
	            	$('#tr'+id).remove();
	            },
	            error: function (msg) {
	                alert(msg.responseText);
	            }
	        });
    	}, function(){
    	    //$.dialog.tips('不删除');
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
			<h3 class="bordFont bigFont">菜单管理</h3>
			<div class="tab">
				<ul class="tabMenu none bordFont floatUl normalFont">
					<li class="first"><a href="<c:url value="/menu/list.htm"/>" class="current">菜单列表</a>
					</li>
					<li><a href="<c:url value="/menu/add.htm?init=true"/>">新增菜单</a></li>
				</ul>
				<div class="">
					<form action="list.htm" id="queryForm" name="queryForm" method="post">
					<input type="hidden" name="query" id="query" value="false"/>
						<table class="bugSteel first" style="border-top: 0;">
							<tr>
								<td class="twof">&nbsp;模块名</td>
								<td class="tenf">
								<div class="col-sm-11">
								<input type="text" name="moduleName" value="${moduleMenu.moduleName}" class="form-control input-sm" />
								</div>
								</td>
								<td class="fouf">是否可用</td>
								<td class="tenf">
								<div class="col-sm-9">
								<select name="enable" class="form-control input-sm">
									<option value="true" <c:if test="${moduleMenu.enable == true}">selected="selected"</c:if>>是</option>
									<option value="false" <c:if test="${moduleMenu.enable == false}">selected="selected"</c:if>>否</option>
								</select>
								<div class="col-sm-8">
								</td>
								<td class="twof">排序</td>
								<td class="fotf">
								<div class="col-sm-12">
								<div class="col-sm-6">
								<select class="form-control input-sm" name="page.orderBy">
									<option value="moduleName" <c:if test="${page.orderBy eq 'moduleName'}">selected="selected"</c:if>>权限名</option>
									<option value="enable" <c:if test="${page.orderBy eq 'enable'}">selected="selected"</c:if>>是否可用</option>
								</select>
								</div>
								<div class="col-sm-6">
								<select class="form-control input-sm" name="page.ascDesc">
									<option value="asc" <c:if test="${page.ascDesc eq 'asc'}">selected="selected"</c:if>>升序</option>
									<option value="desc" <c:if test="${page.ascDesc eq 'desc'}">selected="selected"</c:if>>降序</option>
								</select>
								</div>
								</div>
								</td>
								<td class="eigf">
								<input type="button" value="查询" class="btn btn-primary btn-sm" id="queryButton" style="margin-right:20px;" />
								<input type="reset" value="清除" class="btn btn-default btn-sm" />
								</td>
							</tr>
						</table>
					
					<table class="tableSteel">
              <tr class="title" style="border-right:1px #bfd2ed solid;">
                <td class="twof"></td>
                <td class="fivf">ID</td>
                <td class="fivf">模块名</td>
                <td class="fivf">创建时间</td>
                <td class="fivf">是否可用</td>
                <td class="sixf">显示顺序</td>
                <td class="fivf" style="border-right:1px #09f solid">操作</td>
              </tr>
              <c:forEach items="${listResult}" var="entity" varStatus="st">
              <tr id="tr${entity.moduleId}" style="${st.count%2==0?'background:#f3f3f3':''}">
                <td class="twof"><input type="checkbox" /></td>
                <td class="sixf">${entity.moduleId}</td>
                <td class="fivf">${entity.moduleName}</td>
                <td class="sixf"><fmt:formatDate value="${entity.createTime}" pattern="yyyy-MM-dd HH:mm:ss"/></td>
                <td class="sixf"><c:if test="${enable == true}">是</c:if><c:if test="${enable == false}">否</c:if></td>
                <td class="sixf">${entity.orders}</td>
                <td class="fivf">
                 <img src="../images/res3.png" title="资源" style="margin-left:4px;margin-top:4px;cursor:pointer;height:22px;width:22px;" onclick="javascript:queryMenu('${entity.moduleId}');"></img>
                 <img src="../images/btn_edit.gif" title="修改" style="margin-left:4px;margin-top:4px;cursor:pointer;" onclick="javascript:editMenu('${entity.moduleId}')"/>
                 <img src="../images/tu12.gif" title="删除" style="margin-left:4px;margin-top:4px;cursor:pointer;" onclick="javascript:deleteMenu('${entity.moduleId}')"/></td>
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
