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
<link rel="stylesheet" href="<c:url value='/css/zTreeStyle/zTreeStyle.css'/>" type="text/css">
<link rel="stylesheet" href="<c:url value='/css/zTreeStyle/ztree.demo.css'/>" type="text/css">
<script type="text/javascript" src="<c:url value='/js/jquery.ztree.all-3.5.min.js'/>"></script>
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
	function saveAuth(){
		var module = $('#moduleId').val();
		if ($.trim(module) == '') {
			aAlert('请您选择权限所属的模组。');
			return false;
		}
		var enabled = $('#enabled').val();
		if ($.trim(enabled) == '') {
			aAlert('请您选择是否默认URL。');
			return false;
		}
		var targetForm = $('#frm');
		targetForm.submit();
	}
	$(document).ready(function(){
		$('#addResource').click(function(){
			$.dialog({
				title:'权限资源查询',
				content:'url:<c:url value="/users/resources-list.htm"/>',
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
	<SCRIPT type="text/javascript">
    	var setting = {
			check: {
				enable: true,
				chkboxType: {"Y":"ps", "N":"ps"}
			},
			view: {
				dblClickExpand: false
			},
			callback: {
				beforeClick: beforeClick,
				onCheck: onCheck
			}
		};

    	function beforeClick(treeId, treeNode) {
			var zTree = $.fn.zTree.getZTreeObj("subjectTree");
			zTree.checkNode(treeNode, !treeNode.checked, null, true);
			return false;
		}
		
		function onCheck(e, treeId, treeNode) {
			var zTree = $.fn.zTree.getZTreeObj("subjectTree"),
			nodes = zTree.getCheckedNodes(true);
			var urls = "", resIds = "";
			for (var i=0, l=nodes.length; i<l; i++) {
				urls += nodes[i].name + ",";
				resIds += nodes[i].id + ",";
			}
			$('#urls').val(urls);
			$('#resIds').val(resIds);
		}
		
		function showMenu() {
			var cityObj = $("#urls");
			var cityOffset = $("#urls").offset();
			$("#menuContent").css({left:cityOffset.left + "px", top:cityOffset.top + cityObj.outerHeight() + "px"}).slideDown("fast");

			$("body").bind("mousedown", onBodyDown);
		}
		function hideMenu() {
			$("#menuContent").fadeOut("fast");
			$("body").unbind("mousedown", onBodyDown);
		}
		function onBodyDown(event) {
			if (!(event.target.id == "menuBtn" || event.target.id == "menuContent" || $(event.target).parents("#menuContent").length>0)) {
				hideMenu();
			}
		}
		
		var zNodes = ${json};
		$(document).ready(function(){
			$.fn.zTree.init($("#subjectTree"), setting, zNodes);
		});
	</SCRIPT>
</head>
<body>
<div id="container">
	<div id="header">
		<jsp:include page="/WEB-INF/tiles/four-header.jsp" />
	</div>
	<div id="menuContent" class="menuContent" style="display:none; position: absolute;">
		<ul id="subjectTree" class="ztree" style="margin-top:0; width:220px;"></ul>
	</div>
	<div id="middel">
		<div id="left">
			<jsp:include page="/WEB-INF/tiles/four-left.jsp" />
		</div>
		<div id="content">
			<div id="epMcContent" class="epMcCtContent" style="margin-top:10px;margin-bottom:10px;">
	<h3 class="bordFont bigFont">权限管理</h3>
	<form name="frm" id="frm" action="authorities-input.htm" method="post">
	<input type="hidden" name="tokenName" value="${token_name}">
	<input type="hidden" name="authId" value="${auth.authId}"/>
			<div class="tab">
				<ul class="tabMenu none bordFont floatUl normalFont">
					<li class="first"><a href="<c:url value="/users/authorities-initial.htm"/>">权限列表</a></li>
					<li><a href="<c:url value="/users/authorities-input.htm?init=true"/>" class="current">新增权限</a></li>
				</ul>
			</div>
	<table class="tableSteel">
		<tr>
		<td class="twoFont">权限名 </td><td class="widt"><input class="widt" name="authName" value="${auth.authName}" type="text"/><span class="star">*</span></td><td class="star"></td>
		<td class="twoFont">权限描述</td><td class="widt"><input class="widt" name="authDesc" value="${auth.authDesc}" type="text" /><span class="star">*</span></td><td class="star"></td>
		</tr>
		<tr>
		<td class="twoFont">默认URL</td><td class="widt">
		<select id="enabled" name="enabled" style="width:120px;">
			<option value="">--请选择--</option>
			<option value="1" <c:if test="${auth.enabled == 1}">selected="selected"</c:if>>是</option>
			<option value="0" <c:if test="${auth.enabled == 0}">selected="selected"</c:if>>否</option>
		</select>
		<span class="star">*</span></td><td class="star"></td>
		<td class="twoFont">归属</td><td class="widt"><input class="widt" value="${auth.userId}" name="userId" type="text" />（属于哪个用户）</td><td class="star"></td>
		
		</tr>
		<tr>
		<td class="twoFont">菜单模块</td><td class="widt">
		<select id="moduleId" name="moduleId" style="width:120px;">
			<option value="">--请选择--</option>
			<c:forEach items="${list}" var="module">
			<option value="${module.moduleId}" <c:if test="${module.moduleId == auth.moduleId}">selected="selected"</c:if> >${module.moduleName}</option>
			</c:forEach>
		</select>
		<span class="star">*</span>（属于哪个菜单）</td><td class="star"></td>
		<td class="twoFont">动作</td><td class="widt"><input class="widt" name="action" value="${auth.action}" type="text" />（该权限的默认URL）</td><td class="star"></td>
		</tr>
		<tr>
		<td class="twoFont">资源</td><td class="widt" colspan="5">
		<input type="hidden" value="${auth.resIds}" name="resIds" id="resIds" value=""/>
		<input type="text" name="urls" id="urls" value="${auth.resNames}" class="note" />
		<img src="<c:url value='/images/btn_add.gif'/>" id="menuBtn" style="cursor:pointer;" alt="选择资源" title="选择资源" onclick="javascript:showMenu();"/>
		<img id="addResource" src="../images/tb2.gif" style="margin-left:6px;cursor:pointer;"></img>（新增请输入，已有的请点击+选择）</td>
		</tr>
	</table>
	<input type="button" class="determination" value="保存" onclick="saveAuth();"/>
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
