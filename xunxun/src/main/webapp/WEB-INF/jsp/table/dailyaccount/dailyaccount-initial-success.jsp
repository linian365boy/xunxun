<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta http-equiv="Content-Language" content="zh-cn" />
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<html>
<head><title>日记账</title>
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
<script language="javascript" type="text/javascript" src="../js/My97DatePicker/WdatePicker.js"></script>
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
	<h3 class="bordFont bigFont">日记账</h3>
	<div class="tab">
				<ul class="tabMenu none bordFont floatUl normalFont">
					<li class="first"><a href="<c:url value="/table/dailyaccount-initial.htm?types=cash"/>" <c:if test="${(types eq null) or (types eq 'cash')}">class="current"</c:if> >现金日记账</a></li>
					<li><a href="<c:url value="/table/dailyaccount-initial.htm?types=bank"/>" <c:if test="${types eq 'bank'}">class="current"</c:if>>银行存款日记账</a></li>
				</ul>
		<form action="dailyaccount-initial.htm" id="queryForm" name="queryForm" method="post">
		<table class="bugSteel first" style="border-top: 0;">
							<tr><td class="twof">日期</td>
								<td class="twef"><input type="text" style="width:90px;" onclick="WdatePicker()" class="Wdate" id="startDate" name="startDate"/>-<input type="text" onclick="WdatePicker()" class="Wdate" style="width:90px;" id="endDate" name="endDate"/></td>
								
								<td class="twof">科目</td>
								<td class="fivf">
								<select id="subjectCode" name="subjectCode" style="width:110px;">
										<option value="1001">1001_现金</option>
								</select>
								</td>
								<td class="twof">币别</td>
								<td class="fivf">
								<select id="currency" name="currency" style="width:90px;">
										<option value="CNY">人民币</option>
								</select></td>
								
								<td class="sixf">
								<span>
								<input type="checkbox" style="margin-top:6px;" checked="checked" name="detailSubject" id="detailSubject" />
								<label for="detailSubject" style="position: relative; bottom: 5px;">只显示最明细科目</label>
								</span>
								</td>
								<td class="tenf">
								<input type="button" value="查询" class="determination" id="queryButton" style="margin-right:20px;" />
									<input type="reset" value="清除" class="cancellation" />
								</td>
							</tr>
						</table>
	
			<table class="tableSteelSkmbw" style="margin-top:0px;">
              <tr class="title" style="border-right:1px #bfd2ed solid;">
                <td class="fouf">日期</td>
                <td class="fouf">凭证字号</td>
                <td class="fouf">摘要</td>
                <td class="sixf">对方科目</td>
                <td class="fivf">借方金额</td>
                <td class="fivf">贷方金额</td>
                <td class="fouf">余额方向</td>
                <td class="fivf" style="border-right:1px #09f solid">余额</td>
              </tr>
              <c:if test="${lastDayBal ne null}">
              <tr>
                <td class="fouf"></td>
                <td class="fouf"></td>
                <td class="fouf">上日余额</td>
                <td class="sixf"></td>
                <td class="fivf"></td>
                <td class="fivf"></td>
                <td class="fouf">借</td>
                <td class="fivf" style="border-right:1px #09f solid"><fmt:formatNumber value="${lastDayBal}" pattern="#,##0.00#"/></td>
              </tr>
              </c:if>
              <c:forEach items="${listResult}" var="daily" varStatus="st">
              <tr style="${(st.count+1)%2==0?'background:#f3f3f3':''}">
                <td class="fouf"><c:if test="${daily.subjectCode ne null}">${daily.createDate}</c:if></td>
                <td class="fouf">${daily.codeNo}</td>
                <td class="fouf">${daily.summary}</td>
                <td class="sixf"><c:if test="${daily.subjectCode ne null}">${daily.subjectCode}_${daily.subjectName}</c:if></td>
                <td class="fivf"><c:if test="${daily.debit ==0}"></c:if><c:if test="${daily.debit !=0}"><fmt:formatNumber value="${daily.debit}" pattern="#,#00.00#"/></c:if></td>
                <td class="fivf"><c:if test="${daily.credit ==0}"></c:if><c:if test="${daily.credit !=0}"><fmt:formatNumber value="${daily.credit}" pattern="#,#00.00#"/></c:if></td>
                <td class="fouf">${daily.balanceDirection}</td>
                <td class="fivf" style="border-right:1px #09f solid"><c:if test="${daily.balance ==0}"></c:if><c:if test="${daily.balance !=0}"><fmt:formatNumber value="${daily.balance}" pattern="#,#00.00#"/></c:if></td>
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
