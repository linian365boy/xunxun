<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<%@ page language="java" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/inc/taglib.inc"%>
<%@ include file="/WEB-INF/inc/constants.inc" %>
<%@ include file="/WEB-INF/inc/script.inc" %>
<%@ include file="/WEB-INF/inc/style.inc" %>
<html>
	<head>      
    <title>角色权限明细</title>
    <style type="text/css">
    table.tableSteel{
    width:800px;
    margin:0 auto;
    }
    #container{
    width:804px;
    }
    #container #epMcContent{
    width:804px;
    }
    #container .epMcCtContent{
    margin-top:2px;
    }
    table.bugSteel{
    width:800px;
    }
    tr td {
    font:12px/1.4 宋体,arial,helvertica,sans-serif;
    }
    input{
	border:1px #ccc solid;
	}
    </style>
    <script type="text/javascript">
    $(document).ready(function(){
    	$('#allCheckSelected').click(function(){
    		var listSize = parseInt($('#listSize').val());
    		for (var i=1; i <= listSize ; i++) {
    			$('#check'+i).attr("checked",true);
    		}
    	});
    	$('#btnReturn').click(function(){
    		api.close();
    	});
    	$('#queryButton').click(function(){
    		var queryForm = $('#queryForm');
    		queryForm.submit();
    	});
    });
    </script>
    </head>
  <body>
  <div id="container">
<div id="epMcContent" style="margin-bottom:100px;">
	<div class="epMcCtContent">
	<h3 class="bordFont bigFont">用户角色明细</h3>
	<div class="tab">
		<form action="roles-list.htm" id="queryForm" name="queryForm" method="post">
			<table class="tableSteel">
              <tr class="title" style="border-right:1px #bfd2ed solid;">
                <td class="twof" ></td>
                <td class="fouf" >角色名</td>
                <td class="sixf" style="width:300px;">角色描述</td>
                <td class="twof" style="width:100px;">是否可用</td>
              </tr>
              
              <c:forEach items="${list}" var="role" varStatus="st">
              <tr style="${st.count%2==0?'background:#f3f3f3':''}">
                <td class="twof"></td>
                <td class="fouf">${role.roleName}</td>
                <td class="sixf" style="width:300px;">${role.roleDesc}</td>
                <td class="twof" style="width:100px;"><c:if test="${role.enabled == 1}">是</c:if><c:if test="${role.enabled != 1}">否</c:if> </td>
              </tr>
              </c:forEach>
            </table>
	        <p style="padding-left:16px;line-height:30px; height:30px;text-align:center;margin-top:4px;">
          <input type="button" class="pageCutSmallBtnCheckout" id="btnReturn" value="返回" />
		  </p>
		  </form>
	</div>
	</div>
	</div>
</div>
</body>
</html>
