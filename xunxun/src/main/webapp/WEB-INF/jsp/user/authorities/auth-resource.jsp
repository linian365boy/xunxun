<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<%@ page language="java" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/inc/taglib.inc"%>
<%@ include file="/WEB-INF/inc/constants.inc" %>
<%@ include file="/WEB-INF/inc/script.inc" %>
<%@ include file="/WEB-INF/inc/style.inc" %>
<html>
	<head>      
    <title>权限资源明细</title>
    <style type="text/css">
    table.tableSteel{
    width:795px;
    margin:0 auto;
    }
    #container{
    width:800px;
    }
    #container #epMcContent{
    width:800px;
    }
    #container .epMcCtContent{
    margin-top:2px;
    }
    table.bugSteel{
    width:795px;
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
    	$('#btnReturn').click(function(){
    		api.close();
    	});
    });
    </script>
    </head>
  <body>
  <div id="container">
<div id="epMcContent" style="margin-bottom:100px;">
	<div class="epMcCtContent">
	<h3 class="bordFont bigFont">权限资源明细</h3>
	<div class="tab">
		<form action="auth-list.htm" id="queryForm" name="queryForm" method="post">
			<table class="tableSteel">
              <tr class="title" style="border-right:1px #bfd2ed solid;">
                <td class="twof"></td>
                <td class="fivf">资源名</td>
                <td class="fivf">资源类型</td>
                <td class="fivf">URL</td>
                <td class="fivf">资源描述</td>
              </tr>
              
              <c:forEach items="${list}" var="resource" varStatus="st">
              <tr style="${st.count%2==0?'background:#f3f3f3':''}">
                <td class="twof"></td>
                <td class="fivf">${resource.resourceName}</td>
                <td class="fivf">${resource.resourceType}</td>
                <td class="fivf">${resource.resourceUrl}</td>
                <td class="fivf">${resource.resourceDesc}</td>
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
