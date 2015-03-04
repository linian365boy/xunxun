<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta http-equiv="Content-Language" content="zh-cn" />
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<html>
<head><title>新增会计科目</title>
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
	
	$(document).ready(function(){
		var msg = $.trim($('#message').val());
    	if (msg != '' && msg != null) {
    		$.dialog.alert(msg);
    	}
    	
    	$('#foreignCurrencyAccount').change(function(){
    		var value = $('#foreignCurrencyAccount').val();
    		if (value == '不核算') {
    			$('#fal').attr('selected','selected');
    			$('#adjustExrate').attr('disabled','disabled');
    		} else {
    			$('#adjustExrate').removeAttr('disabled');
    		}
    	});
    	
    	$('#majorCate').change(function(){
    		var zc = '<option value="现金">现金</option><option value="银行存款">银行存款</option><option value="流动资产">流动资产</option>';
    		zc += '<option value="坏账准备">坏账准备</option><option value="存货">存货</option><option value="非流动资产">非流动资产</option>';
    		zc += '<option value="固定资产">固定资产</option><option value="累计折旧">累计折旧</option>';
    		var fz = '<option value="流动负债">流动负债</option><option value="非流动负债">非流动负债</option>';
    		var gt = '<option value="共同">共同</option>';
    		var qy = '<option value="资本">资本</option><option value="累计盈余">累计盈余</option>';
    		var cb = '<option value="生产成本">生产成本</option>';
    		var sy = '<option value="收入">收入</option><option value="其他收入">其他收入</option><option value="销售成本">销售成本</option>';
    		sy += '<option value="费用">费用</option><option value="其他费用">其他费用</option>';
    		var type = $('#majorCate').val();
    		if (type =='资产') {
    			$('#subjectType').html(zc);
    		} else if(type == '负债') {
    			$('#subjectType').html(fz);
    		} else if(type == '共同') {
    			$('#subjectType').html(gt);
    		} else if(type == '权益') {
    			$('#subjectType').html(qy);
    		} else if(type == '成本') {
    			$('#subjectType').html(cb);
    		} else if(type == '损益') {
    			$('#subjectType').html(sy);
    		}
    		
    	});
//     	$('#subjectCode').change(function(){
//     		$('#parentCode').val('');
//     		$('#balanceDirection').html('<option id="jief" value="借">借方</option><option id="daif" value="贷">贷方</option>');
//     	});
    	$('#saveSubject').click(function(){
    		var subjectCode = $('#subjectCode').val();
    		if ($.trim(subjectCode) == '') {
    			$.dialog.alert('科目代码不能为空。');
				return false;
			}
			if (!isInteger(subjectCode)){
				$.dialog.alert('科目代码填写错误。科目代码必须为整数。');
				return false;
			}
			var parentCode = $('#parentCode').val();
    		if ($.trim(parentCode) == '') {//新增的是一级科目
    			if (subjectCode.length > 4 ) {
    				$.dialog.alert('科目代码填写错误。您填写的一级科目代码不正确。');
    				return false;
    			}
    			$('#level').val('1');//一级科目
    		} else {
    			if (subjectCode.length < 6 ) {
    				$.dialog.alert('科目代码填写规则错误。');
    				return false;
    			}
    		}
    		var majorCate = $('#majorCate').val();
    		if ($.trim(majorCate) == '') {
    			$.dialog.alert('请选择科目大类。');
    			return false;
    		}
    		var subjectType = $('#subjectType').val();
    		if ($.trim(subjectType) == '') {
    			$.dialog.alert('请选择科目分类。');
    			return false;
    		}
    		var subjectName = $('#subjectName').val();
    		if ($.trim(subjectName) == '') {
    			$.dialog.alert('科目名称不能为空。');
    			return false;
    		}
    		if (subjectName.length > 10) {
    			$.dialog.alert('科目名称长度不能超过10个字符。');
    			return false;
    		}
    		if ($.trim(parentCode) == '') {
    			$.dialog.confirm('您新增的科目是一级科目，请确保您填写的科目代码是正确的。您确定新增？', function(){
    				var forms = $('#saveSubForm');
    	    		forms.submit();
    	    	}, function(){
    	    	    $.dialog.tips('放弃新增会计科目。');
    	    	});
//     			var sure = confirm();
//         		if (!sure) {
//         			return false;
//         		}
    		} else {
    			var forms = $('#saveSubForm');
    			forms.submit();
    		}
    	});
	});
	</script>
	<SCRIPT type="text/javascript">
    	var setting = {
			check: {
				enable: true,
				chkboxType: {"Y":"", "N":""}
			},
			view: {
				dblClickExpand: false
			},
			callback: {
				beforeClick: beforeClick,
				beforeCheck: beforeCheck,
				onCheck: onCheck
			}
		};

		function beforeClick(treeId, treeNode) {
			var zTree = $.fn.zTree.getZTreeObj("subjectTree");
			var nodes = zTree.getCheckedNodes(true);
			for (var i=0, l=nodes.length; i<l; i++) {
				zTree.checkNode(nodes[i], false, null, true);
			}
			zTree.checkNode(treeNode, !treeNode.checked, null, true);
			return false;
		}
		
		function beforeCheck(treeId, treeNode) {
			var zTree = $.fn.zTree.getZTreeObj("subjectTree");
			var nodes = zTree.getCheckedNodes(true);
			for (var i=0, l=nodes.length; i<l; i++) {
				if (treeNode.id == nodes[i].id) {
					zTree.checkNode(treeNode, true, null, true);
				} else {
					zTree.checkNode(nodes[i], false, null, true);
				}
			}
			return treeNode;
		}
		
		function onCheck(e, treeId, treeNode) {
			var zTree = $.fn.zTree.getZTreeObj("subjectTree"),
			nodes = zTree.getCheckedNodes(true),
			v = "";
			for (var i=0, l=nodes.length; i<l; i++) {
				if (treeNode.id == nodes[i].id) {
					v = nodes[i].name;
				}
			}
			var arr = v.split('_');
			$('#parentName').val(arr[1]);
			$('#parentCode').val(treeNode.id);
			$('#formatMsg').text('(科目代码自动生成，请勿修改。)');
// 			if (dir =='借') {
// 				$('#jief').attr("selected","selected");
// 				$('#balanceDirection').html('<option id="jief" value="借">借方</option>');
// 			} else if (dir == "贷") {
// 				$('#daif').attr("selected","selected");
// 				$('#balanceDirection').html('<option id="daif" value="贷">贷方</option>');
// 			}
			$('#level').val(treeNode.level);
			$("#parentCode").val(arr[0]);
		}
		
		function showMenu() {
			var cityObj = $("#parentCode");
			var cityOffset = $("#parentCode").offset();
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
		
		var zNodes = ${subjectTree};
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
		<ul id="subjectTree" class="ztree" style="margin-top:0; width:280px;"></ul>
	</div>
	<div id="middel">
		<div id="left">
			<jsp:include page="/WEB-INF/tiles/four-left.jsp" />
		</div>
		<div id="content">
			<div id="epMcContent" class="epMcCtContent" style="margin-top:10px;margin-bottom:10px;">
	<h3 class="bordFont bigFont">会计科目</h3>
	<form name="saveSubForm" id="saveSubForm" action="subject-input.htm" method="post">
	<input type="hidden" id="message" value="${msg}">
<!-- 	<input type="hidden" name="id" id="id" value=""/> -->
	<input type="hidden" name="level" id="level" value=""/>
	<input type="hidden" name="childNumber" id="childNumber" value="0"/>
	<input type="hidden" name="tokenName" value="${token_name}">
			<div class="tab">
				<ul class="tabMenu none bordFont floatUl normalFont">
					<li class="first"><a href="<c:url value="/account/subject-initial.htm"/>">科目列表</a></li>
					<li><a href="<c:url value="/account/subject-input.htm?init=true"/>"  class="current">新增会计科目</a></li>
					<li><a href="<c:url value="/account/subject-importExcel.htm?init=true"/>">导入会计科目</a></li>
				</ul>
			</div>
	<table class="singleIncreasesResources">
	<tbody>
		<tr>
		<td class="twoFont">父级科目</td><td class="widt">
		<input type="text" name="parentSubject.subjectCode" id="parentCode" readonly="readonly" value="" class="widt" />
		<img src="<c:url value='/images/btn_add.gif'/>" id="menuBtn" style="cursor:pointer;" alt="选择科目" title="选择科目" onclick="showMenu();"/>
<%-- 		<img id="selectParentSub" style="cursor:pointer;" title="点击选择科目" src="<c:url value='/images/btn_add.gif'/>"/> --%>
		</td><td></td>
		<input type="hidden" name="parentName" id="parentName" value=""/>
		<td class="twoFont">科目代码 </td><td class="widt"><input style="width:100px;" name="subjectCode" id="subjectCode" type="text"/><span class="star">*</span><span class="star" id="formatMsg">(格式：1001)</span></td>
		</tr>
		<tr>
		<td class="twoFont">科目大类</td><td class="widt"><select id="majorCate" name="majorCate" style="width:100px;">
										<option value="">--请选择--</option>
										<option value="资产">资产</option>
										<option value="负债">负债</option>
										<option value="共同">共同</option>
										<option value="权益">权益</option>
										<option value="成本">成本</option>
										<option value="损益">损益</option>
								</select><span class="star">*</span></td><td></td>
		<td class="twoFont">科目分类</td><td class="widt">
		<select id="subjectType" name="subjectType" style="width:100px;">
										<option value="">--请选择--</option></select><span class="star">*</span><span style="padding-left:10px;font-weight:100">(请先选择科目大类)</span></td>
		</tr>
		<tr>
		<td class="twoFont">余额方向</td><td class="widt"><select name="balanceDirection" id="balanceDirection" style="width:100px;"><option id="jief" value="借">借方</option><option id="daif" value="贷">贷方</option></select><span class="star">*</span></td><td class="star"></td>
		<td class="twoFont">辅助核算</td><td class="widt">
					<select id="aidAccount" name="aidAccount" style="width: 100px;">
						<option value="">--请选择--</option>
						<option value="供应商往来">供应商往来</option>
						<option value="客户往来">客户往来</option>
						<option value="个人往来">个人往来</option>
						<option value="项目核算">项目核算</option>
						<option value="部门核算">部门核算</option>
					</select></td><td class="star"></td>
		</tr>
		<tr>
		<td class="twoFont">科目名称</td><td class="widt"><input class="widt" name="subjectName" id="subjectName" type="text" /><span class="star">*</span></td><td class="star"></td>
		<td class="twoFont">状态</td><td class="widt"><select name="state" style="width:100px;"><option value="使用中">使用中</option><option value="未使用">未使用</option></select><span class="star">*</span></td>
		</tr>
		<tr>
		<td class="twoFont">外币核算</td><td class="widt"><select id="foreignCurrencyAccount" name="foreignCurrencyAccount" style="width:100px;">
										<option value="不核算">不核算</option>
										<option value="所有币别">所有币别</option>
								</select></td><td class="star"></td>
		<td class="twoFont">期末调汇</td><td class="widt"><select id="adjustExrate" name="adjustExrate" style="width:100px;">
										<option value="false" id="fal">否</option><option value="true">是</option>
								</select></td><td class="star"></td>
		</tr>
		<tr>
		<td class="twoFont">帐页格式</td><td class="widt"><select id="ledgerFormat" name="ledgerFormat" style="width:100px;">
										<option value="1">金额式</option>
										<option value="2">数量金额式</option>
								</select></td><td class="star"></td>
		<td class="twoFont"></td><td class="widt"></td><td class="star"></td>
		</tr>
	</tbody>
	</table>
	<input type="button" class="determination" id="saveSubject" value="保存" />
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
