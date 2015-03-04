<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<%@ page language="java" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/inc/taglib.inc"%>
<%@ include file="/WEB-INF/inc/constants.inc" %>
<%@ include file="/WEB-INF/inc/script.inc" %>
<%@ include file="/WEB-INF/inc/style.inc" %>

<script src="../js/jquery.cookie.js" type="text/javascript"></script>
<script src="../js/jquery.treeview.js" type="text/javascript"></script>
<script src="../js/treeView.js" type="text/javascript"></script>

<link rel="stylesheet" href="../css/treeViewScreen.css" />
<link rel="stylesheet" href="../css/jquery.treeview.css" />
<html>
	<head>      
    <title>科目查询</title>
    <style type="text/css">
    table.tableSteel{
    width:600px;
    margin:0 auto;
    }
    #container{
    width:604px;
    }
    #container #epMcContent{
    width:604px;
    }
    #container .epMcCtContent{
    margin-top:2px;
    }
    table.bugSteel{
    width:600px;
    }
    tr td {
    font:12px 宋体,arial,helvertica,sans-serif;
    }
    input{
	border:1px #ccc solid;
	}
	.bgh{
	background:#a3f3f3;
	}
    </style>
    <script type="text/javascript">
    $(document).ready(function(){
    	var obj = window.dialogArguments;
    	$('#obj').val(obj);
    	$('#btnReturn').click(function(){
    		var ret = $('#retValue').val();
    		window.returnValue = ret;
    		window.close();
    	});
    	//改变span的样式
    	$('#red').find('span').mouseover(function(){
    		$(this).addClass('hover');
    	});
    	$('#red').find('span').mouseout(function(){
    		$(this).removeClass('hover');
    	});
    });
    function selectItem (code,name,childNumber,id,level,dir) {
    	if (parseInt(childNumber) > 0 && $('#obj').val() == 'selectChild') {//只能选择子类
    		//aAlert(childNumber);
    	} else {
    		$('#red').find('span').removeClass('bgh');
    		$("#"+id).addClass('bgh');
    		var temp = code+"#"+name+"#"+childNumber+"#"+id+"#"+level+"#"+dir+";";
    		$('#retValue').val(temp);
    	}
    }
    </script>
    </head>
  <body>
  <div id="container">
<div id="epMcContent" style="margin-bottom:100px;">
	<div class="epMcCtContent">
	<h3 class="bordFont bigFont">科目查询</h3>
	<input type="hidden" id="retValue" value="">
	<input type="hidden" id="obj" value="">
	<ul id="red" class="treeview-red" style="margin-left:20px;">
	<c:forEach items="${mapResult}" var="mapType" varStatus="st">
	<li><span>${mapType.key}</span>
	<ul id="red" class="treeview-red">
	<c:forEach items="${mapType.value}" var="subject" varStatus="st">
		<li><span id="${subject.id}" onclick="javascript:selectItem('${subject.subjectCode}','${subject.subjectName}',${subject.childNumber},'${subject.id}',${subject.level},'${subject.balanceDirection}');">${subject.subjectCode}_${subject.subjectName}</span>
			<c:if test="${subject.childSubjects.size() > 0}">
				<ul><c:forEach items="${subject.childSubjects}" var="sub2" varStatus="st2">
					<li><span id="${sub2.id}" onclick="javascript:selectItem('${sub2.subjectCode}','${sub2.subjectName}',${sub2.childNumber},'${sub2.id}',${sub2.level},'${sub2.balanceDirection}');">${sub2.subjectCode}_${sub2.subjectName}</span>
						<c:if test="${sub2.childSubjects.size() > 0}">
						<ul><c:forEach items="${sub2.childSubjects}" var="sub3" varStatus="st3">
							<li><span id="${sub3.id}" onclick="javascript:selectItem('${sub3.subjectCode}','${sub3.subjectName}',${sub3.childNumber},'${sub3.id}',${sub3.level},'${sub3.balanceDirection}');">${sub3.subjectCode}_${sub3.subjectName}</span></li>
							</c:forEach>
						</ul>
						</c:if>
					</li>
					</c:forEach>
				</ul>
			</c:if>
		</li>
	</c:forEach>
	</ul>
	</li>
	</c:forEach>
	</ul>
	
	<p style="padding-left:16px;margin:10px;text-align:center;">
          <input type="button" class="cancellation" id="btnReturn" value="确定" />
          <div style="float:right;margin-right:20px;color:red;">请选择相应的科目，点击确定返回。</div>
	</p>
	</div>
	</div>
</div>
</body>
</html>
