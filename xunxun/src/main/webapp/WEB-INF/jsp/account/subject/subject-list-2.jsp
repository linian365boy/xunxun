<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<%@ page language="java" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/inc/taglib.inc"%>
<%@ include file="/WEB-INF/inc/constants.inc" %>
<%@ include file="/WEB-INF/inc/script.inc" %>
<%@ include file="/WEB-INF/inc/style.inc" %>
<%@ taglib prefix="vte" uri="/WEB-INF/tld/" %>
<html>
	<head>      
    <title>科目查询</title>
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
    	$('#btnReturn').click(function(){
    		var listSize = parseInt($('#listSize').val());
    		var ret = "";
    		for (var i=1; i<=listSize; i++) {
    			if ($('#radio'+i).attr('checked')=='checked'){
    				ret += $('#radio'+i).val()+";";
    			}
    		}
    		window.returnValue = ret;
    		window.close();
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
	<h3 class="bordFont bigFont">科目查询</h3>
	<div class="tab">
		<form action="subject-list.htm" id="queryForm" name="queryForm" method="post">
		<table class="bugSteel first" style="border-top: 0;">
							<tr>
								<td style="width:50px;">&nbsp;科目代码</td>
								<td class="twef">
								<input type="text" name="subjectCode" />
								</td>
								<td class="twof">科目名</td>
								<td class="twef">
								<input type="text" name="subjectName" />
								</td>
								<td style="width:50px;">科目大类</td><td class="fotf">
								<select id="majorCate" name="majorCate" style="width:60px;">
										<option value="资产">资产</option>
										<option value="负债">负债</option>
										<option value="权益">权益</option>
										<option value="成本">成本</option>
										<option value="损益">损益</option>
								</select>
								</td>
								<td class="twef">
								<input type="button" value="查询" class="determination" id="queryButton" style="margin-right:20px;" />
								</td>
							</tr>
						</table>
	
			<table class="tableSteel">
              <tr class="title" style="border-right:1px #bfd2ed solid;">
                <td class="twof">序号</td>
                <td class="fouf">科目代码</td>
                <td class="fivf">科目名</td>
                <td class="fivf">科目分类</td>
                <td class="fouf">科目大类</td>
              </tr>
              
              <c:forEach items="${listResult}" var="subject" varStatus="st">
              <tr style="${st.count%2==0?'background:#f3f3f3':''}">
                <td class="twof"><input type="radio" name="kemu" id="radio${st.count}" value="${subject.subjectCode}#${subject.subjectName}#${subject.childSubjects.size()}#${subject.id}#${subject.level}"/></td>
                <td class="fouf">${subject.subjectCode}</td>
                <td class="sixf">${subject.subjectName}</td>
                <td class="fivf">${subject.subjectType}</td>
                <td class="fouf">${subject.majorCate}</td>
              </tr>
              </c:forEach>
            </table>
        
	      <p style="padding-left:16px;line-height:30px; height:30px;">
          <input type="button" class="pageCutSmallBtnCheckout" id="btnReturn" value="确定" />
          <input type="hidden" id="listSize" value="${listResult.size()}">
		  </p>
		  </form>
	</div>
	</div>
	</div>
</div>
</body>
</html>
