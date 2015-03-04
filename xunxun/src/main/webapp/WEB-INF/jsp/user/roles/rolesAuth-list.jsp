<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<%@ page language="java" pageEncoding="UTF-8"%>
<%@ include file="../../../inc/taglib.inc"%>
<%@ include file="../../../inc/constants.inc" %>
<%@ include file="../../../inc/script.inc" %>
<%@ include file="../../../inc/style.inc" %>
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
	<h3 class="bordFont bigFont">角色权限明细</h3>
	<div class="tab">
		<form action="roles-list.htm" id="queryForm" name="queryForm" method="post">
			<table class="tableSteel">
              <tr class="title" style="border-right:1px #bfd2ed solid;">
                <td class="twof">序号</td>
                <td class="fouf">权限名</td>
                <td class="fivf">描述</td>
                <td class="fivf">可用</td>
              </tr>
              
              <c:forEach items="${list}" var="roleAuth" varStatus="st">
              <tr style="${st.count%2==0?'background:#f3f3f3':''}">
                <td class="twof"><input type="checkbox" id="check${st.count}" /></td>
                <td class="fouf">${roleAuth.authName}</td>
                <td class="sixf">${roleAuth.authDesc}</td>
                <td class="fivf">${roleAuth.enabled}</td>
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
