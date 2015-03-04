<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta http-equiv="Content-Language" content="zh-cn" />
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<html>
<head><title>总账</title>
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
	<h3 class="bordFont bigFont">总账</h3>
	<div class="tab">
				
		<form action="ledger-initial.htm" id="queryForm" name="queryForm" method="post">
		<table class="bugSteel first" style="border-top: 0;margin-top:5px;">
							<tr><td class="twof" style="width:50px;">会计期间</td>
								<td class="twef"><input type="text" onclick="javascript:SelectDateYL(this,'yyyy-MM',0,-22)" style="width:90px;" id="startPeriod" name="startPeriod"/>-<input type="text" onclick="javascript:SelectDateYL(this,'yyyy-MM',0,-22)" style="width:90px;" id="endPeriod" name="endPeriod"/></td>
								
								<td style="width:50px">会计科目</td>
								<td style="width:130px;"><input type="text" id="startLevel" name="startLevel" style="width:70px;" />&nbsp;<input type="text" id="startLevelShow" style="width:110px;" readonly="readonly"/></td>
								<td class="twof">至</td>
								<td style="width:130px;">
								<input type="text" style="width:70px;" id="endLevel" name="endLevel"/>&nbsp;<input type="text" style="width:110px;" id="endLevelShow" disabled="disabled" />
								</td>
								<td style="width:40px">科目级次</td><td style="width:60px;"><select style="width:60px;" name="level"><option value="1">一级</option><option value="2">二级</option><option value="3">三级</option></select></td>
								<td class="twof">币别</td>
								<td class="fivf">
								<select id="currency" name="currency" style="width:80px;">
										<option value="CNY">人民币</option>
								</select>
								</td>
								<td style="width:30px;"><input type="button" value="查询" class="determination" id="queryButton" /></td>
							</tr><!-- 
							<tr><td class="twof"></td>
								<td class="fivf"></td>
								
								<td class="twof"></td>
								<td style="width:130px;">
								
								</td>
								<td class="twof"></td>
								<td class="twef"></td>
								
								<td class="twof"></td>
								<td class="fivf"></td>
								<td class="twof"></td>
								<td class="tenf">
								<input type="button" value="查询" class="determination" id="queryButton" style="margin-right:20px;" />
									<input type="reset" value="清除" class="cancellation" />
								</td>
							</tr> -->
						</table>
	
			<table class="tableSteelSkmbw">
              <tr class="title" style="border-right:1px #bfd2ed solid;">
                <td class="fouf">科目代码</td>
                <td class="fivf">科目名称</td>
                <td class="fouf">会计期间</td>
                <td class="fouf">摘要</td>
                <td class="fivf">借方金额</td>
                <td class="fivf">贷方金额</td>
                <td class="fouf">余额方向</td>
                <td class="fivf" style="border-right:1px #09f solid">余额</td>
              </tr>
              
              <c:forEach items="${listResult}" var="ledger" varStatus="st">
              <tr style="${st.count%2==0?'background:#f3f3f3':''}">
                <td class="fouf"><c:if test="${ledger.summary ne '期初余额'}"></c:if><c:if test="${ledger.summary eq '期初余额'}">${ledger.subjectCode}</c:if></td>
                <td class="sixf"><c:if test="${ledger.summary ne '期初余额'}"></c:if><c:if test="${ledger.summary eq '期初余额'}">${ledger.subjectName}</c:if></td>
                <td class="fouf">${ledger.accountPeriod}</td>
                <td class="sixf">${ledger.summary}</td>
                <td class="fouf"><c:if test="${ledger.debitBalance ==0}"></c:if><c:if test="${ledger.debitBalance !=0}"><fmt:formatNumber value="${ledger.debitBalance}" pattern="#,#00.00#"/></c:if></td>
                <td class="fouf"><c:if test="${ledger.creditBalance ==0}"></c:if><c:if test="${ledger.creditBalance !=0}"><fmt:formatNumber value="${ledger.creditBalance}" pattern="#,#00.00#"/></c:if></td>
                <td class="fouf">${ledger.balanceDirection}</td>
                <td class="fouf" style="border-right:1px #09f solid"><c:if test="${ledger.balance ==0}"></c:if><c:if test="${ledger.balance !=0}"><fmt:formatNumber value="${ledger.balance}" pattern="#,#00.00#"/></c:if></td>
              </tr>
              </c:forEach>
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
