<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta http-equiv="Content-Language" content="zh-cn" />
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<html>
<head><title>会计科目列表</title>
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
<script type="text/javascript" src="<c:url value='/dwr/interface/AccountBalanceBean.js'/>"></script>
<script type="text/javascript" src="<c:url value='/dwr/interface/SubjectBean.js'/>"></script>
    <script type="text/javascript">
    //var $j = jQuery.noConflict();
    $(document).ready(function(){
    	//显示提示信息
    	var msg = $.trim($('#message').val());
    	if (msg != '' && msg != null) {
    		$.dialog.alert(msg);
    	}
    	//保存凭证
    	$('#saveCert').click(function(){
    		var debitSum = $('#debitSum').val();
    		var creditSum = $('#creditSum').val();
    		if(parseFloat(debitSum) != parseFloat(creditSum)){
    			$.dialog.alert('借方金额合计不等于贷方金额合计，无法保存。请调整。');
    			return false;
    		}
    		var createDate = $('#createDate').val();
    		if ($.trim(createDate) == '') {
    			$.dialog.alert('请您选择日期。');
    			return false;
    		}
    		var forms = $('#saveCertForm');
    		forms.submit();
    	});
    	
    	//添加凭证分录
    	$('#addNewCert').click(function(){
    		var summaryTemp = $('#summaryTemp').val();
    		if ($.trim(summaryTemp) == ''){
    			$.dialog.alert('摘要不能为空。');
    			return false;
    		}
    		if (isValidChar(summaryTemp)) {
    			$.dialog.alert('摘要含有非法字符。');
    			return false;
    		}
    		if ($.trim(summaryTemp).length > 25){
    			$.dialog.alert('摘要最多输入25位。');
    			return false;
    		}
    		var temp = $('#subjectIdTemp').val();
    		if($.trim(temp) == ''){
    			$.dialog.alert('会计科目不能为空。');
    			return false;
    		}
    		var arr = temp.split('_');
    		var subjectIdTemp = arr[0];
    		var subjectNameTemp = '';
    		if(subjectIdTemp == undefined || !isInteger(subjectIdTemp)){
    			$.dialog.alert('您填写的会计科目不合法。');
    			return false;
    		}
    		dwr.engine.setAsync(false);//设为同步
    		SubjectBean.checkSubjectExist(subjectIdTemp, function(data){
    			subjectNameTemp = data;//将返回值，赋给外层变量
    		});
    		if($.trim(subjectNameTemp) == 'error'){//在dwr回调函数中赋值，决定是否中断后面的操作
    			$.dialog.alert('您填写的会计科目不合法。');
    			return false;
    		}
    		var debitAmountTemp = $('#debitAmountTemp').val();
    		var creditAmountTemp = $('#creditAmountTemp').val();
    		
    		if($.trim(debitAmountTemp)=='' && $.trim(creditAmountTemp)==''){
    			$.dialog.alert('借方金额和贷方金额不能同时为空。');
    			return false;
    		}
    		if($.trim(debitAmountTemp) !='' && $.trim(creditAmountTemp) !=''){
    			$.dialog.alert('借方金额和贷方金额不能同时填写。');
    			return false;
    		}    		
    		if($.trim(debitAmountTemp) !='' && !isDoubleFormat(debitAmountTemp, 2)){
    			$.dialog.alert('借方金额输入格式错误。');
    			return false;
    		}
    		if($.trim(creditAmountTemp) !='' && !isDoubleFormat(creditAmountTemp, 2)){
    			$.dialog.alert('贷方金额输入格式错误。');
    			return false;
    		}
    		var indexs = $('#indexs').val();
    		var editSubject = $('#editSubject').val();
    		if (editSubject != '-1') {//修改某一个分录
    			$('#certListSummary'+editSubject).val(summaryTemp);
        		$('#certListSubjectId'+editSubject).val(subjectIdTemp);//科目id
        		$('#certListSubjectName'+editSubject).val(subjectNameTemp);//科目名
        		$('#certListSubjectShow'+editSubject).val(subjectIdTemp+'_'+subjectNameTemp);//显示科目id和name
        		$('#certListDebitAmount'+editSubject).val(debitAmountTemp);
        		$('#certListCreditAmount'+editSubject).val(creditAmountTemp);
        		
        		$('#editSubject').val('-1');//标记分录已修改
    		}else{
    			if (parseInt(indexs) < 6) {//原有的6个凭证分录
        			$('#certListSummary'+indexs).val(summaryTemp);
            		$('#certListSubjectId'+indexs).val(subjectIdTemp);//科目id
            		$('#certListSubjectName'+indexs).val(subjectNameTemp);//科目名
            		$('#certListSubjectShow'+indexs).val(subjectIdTemp+'_'+subjectNameTemp);//显示科目id和name
            		$('#certListDebitAmount'+indexs).val(debitAmountTemp);
            		$('#certListCreditAmount'+indexs).val(creditAmountTemp);
        		} else {//超过6个分录，新增DOM
        			var html = '';
        			html += '<tr id="tr'+ indexs +'"><td class="fouf"></td>';
    				html += '<td><input type="text" name="certList['+ indexs +'].summary" id="certListSummary'+ indexs +'" value="'+ summaryTemp +'" class="twf270" ></td>';
    				//html += '<td><input type="text" name="certList['+ indexs +'].subjectId" id="certListSubjectId'+ indexs +'" value="'+ subjectIdTemp +'" class="twf270" /></td>';
    				html += '<td><input type="hidden" name="certList['+ indexs +'].subjectId" id="certListSubjectId'+ indexs +'" value="'+ subjectIdTemp +'" class="twf270" >';
    				html += '<input type="hidden" name="certList['+ indexs +'].subjectName" id="certListSubjectName'+ indexs +'" value="'+ subjectNameTemp +'" class="twf270" >';
    				html += '<input type="text" id="certListSubjectShow'+ indexs +'" value="'+ temp +'" class="twf270" ></td>';
    				html += '<td><input type="text" name="certList['+ indexs +'].debitAmount" id="certListDebitAmount'+ indexs +'" value="'+ debitAmountTemp +'" class="twf190" /></td>';
    				html += '<td><input type="text" name="certList['+ indexs +'].creditAmount" id="certListCreditAmount'+ indexs +'" value="'+ creditAmountTemp +'" class="twf190" /></td>';
    				html += '<td class="sixf" style="text-align:center;"><input type="button" onclick="javascript:editCert(\''+ indexs +'\')" title="修改凭证" class="tableSteelBtnEdit" />&nbsp;<input type="button" onclick="javascript:deleteCert(\''+ indexs +'\');" title="删除凭证" class="tableSteelBtnDel" /></td>';
    				html += '</tr>';
    				
    				$('#anchor').before(html);
        		}
    			$('#indexs').val(parseInt(indexs)+1);//凭证分录行数加1
    		}
    		//清空4个临时input
    		$('#summaryTemp').val('');
    		$('#subjectIdTemp').val('');
    		$('#debitAmountTemp').val('');
    		$('#creditAmountTemp').val('');
    		
    		//汇总贷方金额和借方金额，以及转换大小写
    		sumDebitCreditBig();
    	});
    	
    });
    
    /**
	 * 汇总贷方金额和借方金额，以及转换大小写
	 */
	function sumDebitCreditBig(){
		var indexs = $('#indexs').val();
		indexs = indexs - 1;//因为在合计前增加了，实际还没有，现在减去
		//计算借方金额合计
		var debitAmountSum = 0;
		for (var i=0; i <= indexs; i++) {
			if ($('#certListDebitAmount'+i) != undefined && $('#certListDebitAmount'+i).val() != undefined && $('#certListDebitAmount'+i).val() != ''){
				debitAmountSum += parseFloat($('#certListDebitAmount'+i).val());
			}
		}
		$('#debitSum').val(format_number(debitAmountSum, 2));
		//计算贷方金额合计
		var creditAmountSum = 0;
		for (var i=0; i <= indexs; i++) {
			if($('#certListCreditAmount'+i) != undefined && $('#certListCreditAmount'+i).val() != undefined && $('#certListCreditAmount'+i).val() != ''){
				creditAmountSum += parseFloat($('#certListCreditAmount'+i).val());
			}
		}
		$('#creditSum').val(format_number(creditAmountSum, 2));
		//金额大写
		var bigNumber = convertCurrency(debitAmountSum);
		$('#bigSum').val(bigNumber);
	}
    
	/**
	 * 查询科目余额
	 */
    function queryAccountBalance(){
    	var subjectCode = $('#subjectIdTemp').val();
    	var temp = subjectCode.split('_');
    	if ($.trim(subjectCode) != '' && isInteger(temp[0])) {
    		AccountBalanceBean.queryAccountBalanceByCode(temp[0], function(data){
        		if (parseInt(data) == -1) {
        			$('#subjectBalance').text('0.00');
        		} else {
        			$('#subjectBalance').text(data);
        		}
        	});
    	} else {
    		$.dialog.alert('请您选择会计科目。');
    	}
    	
    }
    /**
     * 删除某一个凭证分录，即一个tr
     */
    function deleteCert(tr){
    	var certListSummary = $('#certListSummary'+tr).val();
    	var certListSubjectId = $('#certListSubjectId'+tr).val();
    	if ($.trim(certListSubjectId) == '' || $.trim(certListSummary) == ''){
    		$.dialog.alert('该凭证分录为空。');
    		return false;
    	}
    	$.dialog.confirm('您确定要删除该凭证分录？', function(){
    		$('#tr'+tr).remove();
        	sumDebitCreditBig();
    	}, function(){
    	    $.dialog.tips('放弃删除。');
    	});
    }
    /**
     * 编辑修改某一个凭证分录，即一个tr
     */
    function editCert(indexs){
    	//要编辑的分录的值
    	var certListSummary = $('#certListSummary'+indexs).val();
		var certListSubjectId = $('#certListSubjectId'+indexs).val();
		var certListSubjectName = $('#certListSubjectName'+indexs).val();
		var certListDebitAmount = $('#certListDebitAmount'+indexs).val();
		var certListCreditAmount = $('#certListCreditAmount'+indexs).val();
		if ($.trim(certListSubjectId) == '' || $.trim(certListSummary) == ''){
			$.dialog.alert('该凭证分录为空。');
    		return false;
    	}
		$('#summaryTemp').val(certListSummary);
		$('#subjectIdTemp').val(certListSubjectId+'_'+certListSubjectName);
		$('#debitAmountTemp').val(certListDebitAmount);
		$('#creditAmountTemp').val(certListCreditAmount);
		
		$('#editSubject').val(indexs);//标记要修改的分录
    }
    
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
			var cityObj = $("#subjectIdTemp");
			cityObj.attr("value", v);
		}
		
		function showMenu() {
			var cityObj = $("#subjectIdTemp");
			var cityOffset = $("#subjectIdTemp").offset();
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
    <script language="javascript" type="text/javascript" src="../js/My97DatePicker/WdatePicker.js"></script>
    <style type="text/css">
    .jiacu td{
    	font-size:14px;font-weight:600;
    }
    .jiacu td input{
    	font-size:14px;font-weight:600;
    }
    .noBorder input {
    	border:0px;
    }
    .noBorder td{
    	border:1px #09f solid;
    }
    </style>
</head>
<body>
<div id="container">
	<div id="header">
		<jsp:include page="/WEB-INF/tiles/four-header.jsp" />
	</div>
	<div id="menuContent" class="menuContent" style="display:none; position: absolute;z-index:20000;">
		<ul id="subjectTree" class="ztree" style="margin-top:0; width:280px;"></ul>
	</div>
	<div id="middel">
		<div id="left">
			<jsp:include page="/WEB-INF/tiles/four-left.jsp" />
		</div>
		<div id="content">
			<div id="epMcContent">
	<div class="epMcCtContent">
	<h3 class="titleBig bigFont bordFont">凭证管理</h3>
	<form id="saveCertForm" action="certificate-input.htm" method="post">
	<input type="hidden" id="message" value="${msg}">
	<input type="hidden" id="indexs" value="0">
	<input type="hidden" id="editSubject" value="-1">
	<input type="hidden" name="tokenName" value="${token_name}">
				<div class="tab">
					<ul class="tabMenu none bordFont floatUl normalFont">
						<li class="first"><a href="<c:url value="/account/certificate-input.htm?init=true"/>"  class="current">录入凭证</a></li>
						<li><a href="<c:url value="/account/certificate-initial.htm"/>">查询凭证</a></li>
					</ul>
				</div>
				<div id="tabContent1">
		<table class="tableSteelss">
			<tr>
				<td class="twof"><span>日期</span></td>
				<td class="fivf"><input type="text" onclick="WdatePicker()" name="createDate" id="createDate" class="tf Wdate" style="margin-left:15px;"/></td>
				<td class="fivf"><span>凭证字号</span></td>
				<td class="fivf"><select id="codeNo" name="codeNo" style="width:100px;margin-left:15px;">
										<option value="记">记</option>
								</select></td>
				<td class="sixf"><span>附单据张数</span></td>
				<td><input type="text" name="attacheSheet" class="tf" style="margin-left:15px;"/></td>
			</tr>
		  </table>
		<table class="tableSteel" style="margin-bottom:0px;border-bottom:0px;">
							<tr>
								<td class="twof55">摘要</td>
								<td class="fivf" colspan="3">
								<div class="col-sm-9">
								<input type="text" value="" id="summaryTemp" class="form-control input-sm" />
								</div>
								[<a>常用摘要</a>]</td>
								<td class="twof">会计科目</td>
								<td class="twef" colspan="3">
								<div class="col-sm-9">
								<input type="text" class="form-control input-sm" value="" id="subjectIdTemp"/>
								</div>
								<img src="<c:url value='/images/btn_add.gif'/>" id="menuBtn" style="cursor:pointer;" alt="选择科目" title="选择科目" onclick="showMenu();"/>
								</td>
								<td class="twof">[<a href="javascript:queryAccountBalance();">查询余额</a>]</td><td class="tenf"><span id="subjectBalance" style="font-weight:600;"></span></td>
							</tr>
							<tr style="border-bottom:0px;">
								<td class="twof55">借方金额</td>
								<td class="fivf" colspan="3">
								<div class="col-sm-9">
								<input type="text" value="" id="debitAmountTemp" class="form-control input-sm"/>
								</div>
								</td>
								<td class="twof">贷方金额</td>
								<td class="twef" colspan="3">
								<div class="col-sm-9">
								<input type="text" value="" id="creditAmountTemp" class="form-control input-sm"/>
								</div>
								</td>
								<td class="tenf">
								<input type="button" value="添加" class="determination" id="addNewCert" style="margin-right:20px;" />
								</td>
								<td class="tenf"></td>
							</tr>
						</table>
		<table class="tableSteel noBorder" style="margin-top:0px;">
			<tr class="title">
			<td class="fouf"></td>
			<td class="eigf">摘要<span class="red">*</span></td>
			<td class="sixf">科目<span class="red">*</span></td>
			<td class="fouf">借方金额<span class="red">*</span></td>
			<td class="fouf">贷方金额<span class="red">*</span></td>
			<td class="sixf" style="border-right:1px #09f solid;">操作</td>
			</tr>
			<tr id="tr0">
				<td class="fouf"></td>
				<td><input type="text" name="certList[0].summary" id="certListSummary0" value="" class="twf270" ></td>
				<td><input type="hidden" name="certList[0].subjectId" id="certListSubjectId0" value="" class="twf270" >
				<input type="hidden" name="certList[0].subjectName" id="certListSubjectName0" value="" class="twf270" >
				<input type="text" id="certListSubjectShow0" value="" class="twf270" ></td>
				<td><input type="text" name="certList[0].debitAmount" id="certListDebitAmount0" value="" class="twf190" ></td>
				<td><input type="text" name="certList[0].creditAmount" id="certListCreditAmount0" value="" class="twf190" ></td>
				<td class="sixf" style="text-align:center;"><input type="button" onclick="javascript:editCert('0')" title="修改凭证" class="tableSteelBtnEdit" />&nbsp;<input type="button" onclick="javascript:deleteCert('0')" title="删除凭证" class="tableSteelBtnDel" /></td>
			</tr>
			<tr id="tr1">
				<td class="fouf"></td>
				<td><input type="text" name="certList[1].summary" id="certListSummary1" value="" class="twf270" /></td>
				<td><input type="hidden" name="certList[1].subjectId" id="certListSubjectId1" value="" class="twf270" />
				<input type="hidden" name="certList[1].subjectName" id="certListSubjectName1" value="" class="twf270" />
				<input type="text" id="certListSubjectShow1" value="" class="twf270" /></td>
				<td><input type="text" name="certList[1].debitAmount" id="certListDebitAmount1" value="" class="twf190" /></td>
				<td><input type="text" name="certList[1].creditAmount" id="certListCreditAmount1" value="" class="twf190" /></td>
				<td class="sixf" style="text-align:center;"><input type="button" onclick="javascript:editCert('1')" title="修改凭证" class="tableSteelBtnEdit" />&nbsp;<input type="button" onclick="javascript:deleteCert('1')" title="删除凭证" class="tableSteelBtnDel" /></td>
			</tr>
			<tr id="tr2">
				<td class="fouf"></td>
				<td><input type="text" name="certList[2].summary" id="certListSummary2" value="" class="twf270" /></td>
				<td><input type="hidden" name="certList[2].subjectId" id="certListSubjectId2" value="" class="twf270" />
				<input type="hidden" name="certList[2].subjectName" id="certListSubjectName2" value="" class="twf270" />
				<input type="text" id="certListSubjectShow2" value="" class="twf270" /></td>
				<td><input type="text" name="certList[2].debitAmount" id="certListDebitAmount2" value="" class="twf190" /></td>
				<td><input type="text" name="certList[2].creditAmount" id="certListCreditAmount2" value="" class="twf190" /></td>
				<td class="sixf" style="text-align:center;"><input type="button" onclick="javascript:editCert('2')" title="修改凭证" class="tableSteelBtnEdit" />&nbsp;<input type="button" onclick="javascript:deleteCert('2')" title="删除凭证" class="tableSteelBtnDel" /></td>
			</tr>
			<tr id="tr3">
				<td class="fouf"></td>
				<td><input type="text" name="certList[3].summary" id="certListSummary3" value="" class="twf270" /></td>
				<td><input type="hidden" name="certList[3].subjectId" id="certListSubjectId3" value="" class="twf270" />
				<input type="hidden" name="certList[3].subjectName" id="certListSubjectName3" value="" class="twf270" />
				<input type="text" id="certListSubjectShow3" value="" class="twf270" /></td>
				<td><input type="text" name="certList[3].debitAmount" id="certListDebitAmount3" value="" class="twf190" /></td>
				<td><input type="text" name="certList[3].creditAmount" id="certListCreditAmount3" value="" class="twf190" /></td>
				<td class="sixf" style="text-align:center;"><input type="button" onclick="javascript:editCert('3')" title="修改凭证" class="tableSteelBtnEdit" />&nbsp;<input type="button" onclick="javascript:deleteCert('3')" title="删除凭证" class="tableSteelBtnDel" /></td>
			</tr>
			<tr id="tr4">
				<td class="fouf"></td>
				<td><input type="text" name="certList[4].summary" id="certListSummary4" value="" class="twf270" /></td>
				<td><input type="hidden" name="certList[4].subjectId" id="certListSubjectId4" value="" class="twf270" />
				<input type="hidden" name="certList[4].subjectName" id="certListSubjectName4" value="" class="twf270" />
				<input type="text" id="certListSubjectShow4" value="" class="twf270" /></td>
				<td><input type="text" name="certList[4].debitAmount" id="certListDebitAmount4" value="" class="twf190" /></td>
				<td><input type="text" name="certList[4].creditAmount" id="certListCreditAmount4" value="" class="twf190" /></td>
				<td class="sixf" style="text-align:center;"><input type="button" onclick="javascript:editCert('4')" title="修改凭证" class="tableSteelBtnEdit" />&nbsp;<input type="button" onclick="javascript:deleteCert('4')" title="删除凭证" class="tableSteelBtnDel" /></td>
			</tr>
			<tr id="tr5">
				<td class="fouf"></td>
				<td><input type="text" name="certList[5].summary" id="certListSummary5" value="" class="twf270" /></td>
				<td><input type="hidden" name="certList[5].subjectId" id="certListSubjectId5" value="" class="twf270" />
				<input type="hidden" name="certList[5].subjectName" id="certListSubjectName5" value="" class="twf270" />
				<input type="text" id="certListSubjectShow5" value="" class="twf270" /></td>
				<td><input type="text" name="certList[5].debitAmount" id="certListDebitAmount5" value="" class="twf190" /></td>
				<td><input type="text" name="certList[5].creditAmount" id="certListCreditAmount5" value="" class="twf190" /></td>
				<td class="sixf" style="text-align:center;"><input type="button" onclick="javascript:editCert('5')" title="修改凭证" class="tableSteelBtnEdit" />&nbsp;<input type="button" onclick="javascript:deleteCert('5')" title="删除凭证" class="tableSteelBtnDel" /></td>
			</tr><!--<input type="button" title="添加凭证" class="tableSteelBtnAdd">-->
			<input type="hidden" id="anchor">
			<tr style="background:#F3F3F3;" class="jiacu">
				<td class="fouf" style="text-align:center;">合计：</td>
				<td class="fouf">&nbsp;<input type="text" value="" id="bigSum" class="twf270" style="background:#F3F3F3;"/></td>
				<td class="fouf"></td>
				<td class="fouf">&nbsp;<input type="text" value="" name="debitAmount" id="debitSum" class="twf190" style="background:#F3F3F3;"/></td>
				<td class="fouf">&nbsp;<input type="text" value="" name="creditAmount" id="creditSum" class="twf190" style="background:#F3F3F3;"/></td>
				<td class="floRight"></td>
			</tr> 
		  </table>
			<div style="margin-bottom:10px;">
				<input type="button" class="pageCutSmallBtnSub" id="saveCert" value="保存" /><input type="button" class="pageCutSmallBtnDel" id="cancela" value="取消" />
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
