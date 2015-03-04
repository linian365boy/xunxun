<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<html>
<head><title>用户管理</title>
<style type="text/css">
img {border-width: 0px 0px 0px 0px}
#middel{
	width:1348px;
}
#left{
	float:left;
}

#content{
	width:1200px;
}
#footer{
	width:1348px;
}
</style>
<%@ include file="/WEB-INF/inc/taglib.inc" %>
<%@ include file="/WEB-INF/inc/constants.inc" %>
<%@ include file="/WEB-INF/inc/script.inc" %>
<%@ include file="/WEB-INF/inc/style.inc" %>
<script type="text/javascript" src="<c:url value='/dwr/interface/EmpUserBean.js'></c:url>"></script>
<script type="text/javascript">
    $(document).ready(function(){
    	$('#allCheckSelected').click(function(){
    		var listSize = parseInt($('#listSize').val());
    		var all = $('#allCheckSelected');
    		if (all.attr('checked') == 'checked') {
    			for (var i=1; i <= listSize ; i++) {
        			$('#check'+i).attr("checked",true);
        		}
    		} else {
    			for (var i=1; i <= listSize ; i++) {
        			$('#check'+i).attr("checked",false);
        		}
    		}
    		
    	});
    	
    	//查询
    	$('#queryButton').click(function(){
    		var queryForm = $('#queryForm');
    		$('#query').val('true');
    		//queryForm.attr('action','empUser-initial.htm');
    		$('#ajaxForm').val('2');//设为2，普通查询
    		queryForm.submit();
    	});
    	
    	//ajax异步提交
    	$('#queryForm').ajaxForm({
			beforeSubmit:function(){
				var ajax = $('#ajaxForm').val();
				if ($.trim(ajax) == '1') {//批量删除
					if(!isChecked("ids")){
						aAlert("至少选中一条数据。");
						return false;
					}
					var ret = confirm('您确定删除要全部删除吗？');
					if (!ret) {
						return false;
					}
				}//other
				
			},
			success:function(data) {
				var ajax = $('#ajaxForm').val();
				if(data==1){
					if ($.trim(ajax) == '1') {//批量删除
						$("input:checked").attr("checked",false);
		    			var arrayIds = $('#deletedIds').val().split(',');
		    			for (var i=0; i < (arrayIds.length -1); i++) {
		    				$('#tr'+arrayIds[i]).remove();
		    			}
					}
					
				}else{
					if ($.trim(ajax) == '1') {
						aAlert(data);
					}
				}
			} 
		});
    	//批量删除
    	$('#deleteAll').click(function(){
    		var form = $('#queryForm');
    		form.attr('action','empUser-delete.htm');
    		$('#ajaxForm').val('1');//设为1，批量删除
    		form.submit();
    	});
    	
    	//是否选中
		isChecked = function(chekedElementName){
			var flag = false;
			var element = document.getElementsByName(chekedElementName);
			var tempIds = "";
			if (element.length > 0) {
				for (var i = 0; i < element.length; i++) {
					if(element[i].checked){
						flag = true;
						tempIds += element[i].value + ',';//记录下被删除对象的id，以备后续在页面上删除
					}
				}
			}
			$('#deletedIds').val(tempIds);
			return flag;
		};
    });
 
 //修改实体
 function editUser(id) {
	 window.location.href = 'empUser-input.htm?init=true&userId='+id;
 }
 
 //单条删除实体
 function deleteUser(userId) {
	 $.dialog.confirm('你确定要删除该用户吗？', function(){
		 EmpUserBean.deleteUser(userId,function(data){
			 if (data == 'success') {
				 $('#tr'+userId).remove();//在页面上删除那一行
				 //aAlert('删除成功。');
			 }
		 });
 	}, function(){
 	    //$.dialog.tips('不删除');
 	});
 }
 
 function queryRoles(userId) {
	 $.dialog({
			title:'用户角色明细',
			content:'url:<c:url value="/users/user-roles-list.htm?userId=' + userId + '"/>',
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
			
<div id="epMcContent" style="margin-bottom:10px;">
	<div class="epMcCtContent">
	<h3 class="bordFont bigFont">用户管理</h3>
	<div class="tab">
				<ul class="tabMenu none bordFont floatUl normalFont">
					<li class="first"><a href="<c:url value="/users/empUser-initial.htm"/>" class="current">用户列表</a></li>
					<li><a href="<c:url value="/users/empUser-roles.htm?init=true"/>">我的角色</a></li>
					<li><a href="<c:url value="/users/empUser-input.htm?init=true"/>">新增用户</a></li>
				</ul>
				<form action="empUser-initial.htm" id="queryForm" name="queryForm" method="post">
				<input type="hidden" id="listSize" value="${listResult.size()}">
				<input type="hidden" id="deletedIds" value=""><!-- 要被批量删除的实体id -->
				<input type="hidden" id="ajaxForm" value="">
				<input type="hidden" name="query" id="query" value="false"/>
		<table class="bugSteel first" style="border-top: 0;">
							<tr>
								<td class="twof">用户名</td>
								<td class="twef">
								<div class="col-sm-10">
								<input type="text" name="name" value="${empUser.name}" class="form-control input-sm" />
								</div>
								</td>
								<td class="twof">资源类型</td>
								<td class="twef">
								<div class="col-sm-10">
								<select id="resourceType" name="resourceType" class="form-control input-sm">
										<option value="">--请选择--</option>
										<option value="action">Action</option>
										<option value="url">URL</option>
										<option value="method">Method</option>
								</select>
								</div>
								</td>
								<td class="twof">账号</td>
								<td class="twef">
								<div class="col-sm-10">
								<input type="text" name="userAccount" value="${empUser.userAccount}" class="form-control input-sm"/>
								</div>
								</td>
								<td class="twof">Email</td>
								<td class="twef">
								<div class="col-sm-10">
								<input type="text" name="email" value="${empUser.email}" class="form-control input-sm"/>
								</div>
								</td>
							</tr>
							<tr style="height:10px;"></tr>
							<tr>
								<td class="twof">使用中</td>
								<td class="twef">
								<div class="col-sm-10">
								<select id="enable" name="enable" class="form-control input-sm">
										<option value="">--请选择--</option>
										<option value="true">是</option>
										<option value="false">否</option>
								</select>
								</div>
								</td>
								<td class="twof">默认URL</td>
								<td class="twef">
								<div class="col-sm-10">
								<select id="defaults" name="defaults" class="form-control input-sm">
										<option value="">--请选择--</option>
										<option value="1">是</option>
										<option value="0">否</option>
								</select>
								</div>
								</td>
								<td class="twof">排序</td>
								<td class="twef">
								<div class="col-sm-12">
									<div class="col-sm-6" style="padding-left:0px;">
									<select class="form-control input-sm" name="page.orderBy"><option value="name">用户名</option><option value="email">Email</option><option value="userAccount">账号</option></select>
									</div>
									<div class="col-sm-6">
									<select class="form-control input-sm" name="page.ascDesc"><option value="asc">升序</option><option value="desc">降序</option></select>
									</div>
								</div>
								</td>
								<td class="twof"></td>
								<td class="twef">
								<input type="button" value="查询" class="btn btn-primary btn-sm" id="queryButton" style="margin-right:20px;" />
								<input type="reset" value="清除" class="btn btn-default btn-sm"/>
								</td>
							</tr>
						</table>
	
			<table class="tableSteel table-hover">
              <tr class="title" style="border-right:1px #bfd2ed solid;">
                <td class="twof">序号</td>
                <td class="fouf">用户名</td>
                <td class="fivf">Email</td>
                <td class="fivf">部门代码</td>
                <td class="fivf">部门名称</td>
                <td class="fouf">账号</td>
                <td class="fivf">可用</td>
                <td class="sixf">创建时间</td>
                <td class="fivf" style="border-right:1px #09f solid">操作</td>
              </tr>
              
              <c:forEach items="${listResult}" var="user" varStatus="st">
              <tr style="${st.count%2==0?'background:#f3f3f3':''}" id="tr${user.userId}">
                <td class="twof"><input type="checkbox" name="ids" value="${user.userId}" id="check${st.count}"/></td>
                <td class="fouf">${user.name}</td>
                <td class="sixf">${user.email}</td>
                <td class="fivf">${user.deptId}</td>
                <td class="sixf">${user.deptName}</td>
                <td class="fouf">${user.userAccount}</td>
                <td class="fivf">${user.enable}</td>
                <td class="fouf"><fmt:formatDate value="${user.createDate}" pattern="yyyy-MM-dd HH:mm:ss"/></td>
                <td class="fivf">
                <img src="../images/juese3.png" title="角色" style="margin-left:4px;margin-top:4px;cursor:pointer;height:22px;width:22px;" onclick="javascript:queryRoles('${user.userId}');"/>
                <img src="../images/btn_edit.gif" style="margin-left:4px;margin-top:4px;cursor:pointer;" onclick="javascript:editUser('${user.userId}')" title="修改"/>
                <img src="../images/tu12.gif" style="margin-left:4px;margin-top:4px;cursor:pointer;" onclick="javascript:deleteUser('${user.userId}')" title="删除"/>
                </td>
              </tr>
              </c:forEach>
            </table>
        
	        <p style="padding-left:16px;line-height:30px; height:30px;">
          <input type="checkbox" id="allCheckSelected" />
          <label for="allCheckSelected" style="position:relative ;bottom:5px;">全选</label>
          <input type="button" class="pageCutSmallBtnDel" id="deleteAll" value="删除" />
		  </p>
		  <div id="page">
			<p>
				<vte:pages hasForm="true" beanName="page" formName="queryForm"/>
			</p>
		  </div>
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
