<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta http-equiv="Content-Language" content="zh-cn" />
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<html>
<head><title>凭证汇总表</title>
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
    		var queryForm = $('#queryForm');
    		queryForm.submit();
    	});
    });
    </script>
<script language="javascript" type="text/javascript" src="../js/dateSelect.js"></script>
    <style type="text/css">
    .jiacu td{
    	font-size:14px;font-weight:600;
    }
    </style>
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
	<h3 class="bordFont bigFont">凭证汇总表</h3>
	<div class="tab">
		<form action="accountsummary-initial.htm" id="queryForm" name="queryForm" method="post">
		<table class="bugSteel first" style="border-top: 0;">
							<tr><td class="twof" style="width:50px;">会计期间</td>
								<td class="twef"><input type="text" onclick="javascript:SelectDateYL(this,'yyyy-MM',0,-22)" style="width:90px;" id="startPeriod" name="accountPeriod" value="${model.accountPeriod}"/>-<input type="text" onclick="javascript:SelectDateYL(this,'yyyy-MM',0,-22)" style="width:90px;" id="endPeriod" name="endPeriod" value="${model.endPeriod}"/></td>
								
								<td style="width:40px">科目级次</td><td style="width:100px;">
								<select style="width:100px;" name="level">
								<option value="0">所有</option>
								<option value="1" <c:if test="${level eq 1}">selected="selected"</c:if>>一级</option>
								<option value="2" <c:if test="${level eq 2}">selected="selected"</c:if>>二级</option>
								<option value="3" <c:if test="${level eq 3}">selected="selected"</c:if>>三级</option>
								</select></td>
								<td class="twof">币别</td>
								<td class="fivf">
								<select id="currency" name="currency" style="width:100px;">
										<option value="CNY" <c:if test="${currency eq 'CNY'}">selected="selected"</c:if>>人民币</option>
								</select>
								</td>
								<td style="width:30px;"><input type="button" value="查询" class="determination" id="queryButton"/> </td>
							</tr>
						</table>
	
			<table class="tableSteelSkmbw">
              <tr class="title" style="border-right:1px #bfd2ed solid;">
                <td class="twof">序号</td>
                <td class="fouf">科目代码</td>
                <td class="fivf">科目名</td>
                <td class="fouf">借方金额</td>
                <td class="fouf" style="border-right:1px #09f solid">贷方金额</td>
              </tr>
              
              <c:forEach items="${listResult}" var="summary" varStatus="st">
              <tr style="${st.count%2==0?'background:#f3f3f3':''}">
                <td class="twof">${st.count}</td>
                <td class="fouf">${summary.subjectCode}</td>
                <td class="sixf">${summary.subjectName}</td>
                <td class="fouf"><c:if test="${summary.debit ==0}"></c:if><c:if test="${summary.debit !=0}"><fmt:formatNumber value="${summary.debit}" pattern="#,#00.00#"/></c:if></td>
                <td class="fouf" style="border-right:1px #09f solid"><c:if test="${summary.credit ==0}"></c:if><c:if test="${summary.credit !=0}"><fmt:formatNumber value="${summary.credit}" pattern="#,#00.00#"/></c:if></td>
              </tr>
              </c:forEach>
              <tr class="jiacu">
                <td class="twof">合计：</td>
                <td class="fouf"></td>
                <td class="sixf"></td>
                <td class="fouf"><fmt:formatNumber value="${debit}" pattern="#,#00.00#"/></td>
                <td class="fouf" style="border-right:1px #09f solid"><fmt:formatNumber value="${credit}" pattern="#,#00.00#"/></td>
              </tr>
            </table>
        
	        <p style="padding-left:16px;line-height:30px; height:30px;">
          <input type="button" class="pageCutSmallBtnCheckout" id="exportExcel" value="导出" />
		  </p>
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
