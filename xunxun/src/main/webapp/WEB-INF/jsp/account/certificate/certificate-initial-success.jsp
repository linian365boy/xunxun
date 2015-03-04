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
<script type="text/javascript">
    $(document).ready(function(){
    	$('#allCheckSelected').click(function(){
    		var listSize = parseInt($('#listSize').val());
    		var all = $('#allCheckSelected');
    		if (all.attr('checked') == 'checked') {
    			for (var i=1; i <= listSize ; i++) {
        			$('#check'+i).attr("checked",true);
        		}
    		} else {
    			for (var i=1; i <= listSize ; i++) {
        			$('#check'+i).attr("checked",false);
        		}
    		}
    		
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
	<h3 class="bordFont bigFont">凭证管理</h3>
	<div class="tab">
				<ul class="tabMenu none bordFont floatUl normalFont">
					<li class="first"><a href="<c:url value="/account/certificate-input.htm?init=true"/>">录入凭证</a></li>
					<li><a href="<c:url value="/account/certificate-initial.htm"/>" class="current">查询凭证</a></li>
				</ul>
		<form action="certificate-initial.htm" id="queryForm" name="queryForm" method="post">
		<input type="hidden" id="listSize" value="${listResult.size()}">
		<table class="bugSteel first" style="border-top: 0;">
							<tr>
								<td style="width:50px"><span style="margin-left:10px;">凭证编号</span></td>
								<td class="fivf"><input type="text" name="codeNo" class="form-control input-sm" /></td>
								<td class="twof">系统</td>
								<td class="fivf">
								<select id="system" name="system" style="width:100px;">
										<option value="">--请选择--</option>
										<option value="action">Action</option>
										<option value="url">URL</option>
										<option value="method">Method</option>
								</select>
								</td>
								<td class="twof">制单日期</td>
								<td class="twef"><input type="text" style="width:90px;" name="createDate"/>-<input type="text" style="width:90px;" name="createDate"/></td>
								<td class="twof">制单人</td>
								<td class="fivf">
								<input type="text" class="form-control input-sm" name="createEmp"/>
								</td>
								<td class="twof">排序</td><td class="tenf"><select style="width:80px;" name="page.orderBy"><option value="createEmp">制单人</option><option value="auditEmp">审核人</option><option value="system">系统</option></select>-<select style="width:50px;" name="page.ascDesc"><option value="asc">升序</option><option value="desc">降序</option></select></td>
							</tr>
							<tr><td class="twof">摘要</td>
								<td class="fivf"><input type="text" name="summary" class="form-control input-sm" style="width:120px;"/></td>
								
								<td class="twof">状态</td>
								<td class="fivf">
								<select id="state" name="state" style="width:90px;">
										<option value="">--请选择--</option>
										<option value="1">是</option>
										<option value="0">否</option>
								</select>
								</td>
								<td class="twof">审核日期</td>
								<td class="twef"><input type="text" style="width:90px;" name="auditDate"/>-<input type="text" style="width:90px;" name="auditDate"/></td>
								
								<td class="twof">审核人</td>
								<td class="fivf"><input type="text" class="form-control input-sm" name="auditEmp"/></td>
								<td class="twof"></td>
								<td class="tenf">
								<input type="button" value="查询" class="determination" id="queryButton" style="margin-right:20px;" />
									<input type="reset" value="清除" class="cancellation" />
								</td>
							</tr>
						</table>
	
			<table class="tableSteel">
              <tr class="title" style="border-right:1px #bfd2ed solid;">
                <td class="twof">序号</td>
                <td class="fouf">凭证编号</td>
                <td class="fivf">摘要</td>
                <td class="fouf">制单人</td>
                <td class="fouf">制单日期</td>
                <td class="fouf">审核人</td>
                <td class="fouf">审核日期</td>
                <td class="sixf">备注</td>
                <td class="fouf">状态</td>
                <td class="fouf">系统</td>
                <td class="sixf">借方金额合计</td>
                <td class="sixf">贷方金额合计</td>
                <td class="fivf" style="border-right:1px #09f solid">操作</td>
              </tr>
              
              <c:forEach items="${listResult}" var="certs" varStatus="st">
              <tr style="${st.count%2==0?'background:#f3f3f3':''}">
                <td class="twof"><input type="checkbox" id="check${st.count}" value="${certs.id}"/></td>
                <td class="fouf">${certs.codeNo}</td>
                <td class="sixf">${certs.summary}</td>
                <td class="fivf">${certs.createEmp}</td>
                <td class="fouf">${certs.createDate}</td>
                <td class="fivf">${certs.auditEmp}</td>
                <td class="sixf">${certs.auditDate}</td>
                <td class="fouf">${certs.remark}</td>
                <td class="fouf">${certs.state}</td>
                <td class="fouf">${certs.system}</td>
                <td class="sixf">${certs.debitAmount}</td>
                <td class="sixf">${certs.creditAmount}</td>
                <td class="fivf"><input type="button" onclick="javascript:editCert('0')" title="修改凭证" class="tableSteelBtnEdit" />&nbsp;<input type="button" onclick="javascript:deleteCert('0')" title="删除凭证" class="tableSteelBtnDel" /></td>
              </tr>
              </c:forEach>
            </table>
        
	        <p style="padding-left:16px;line-height:30px; height:30px;">
          <input type="checkbox" id="allCheckSelected" />
          <label for="pageCutSmallCheckbox1" style="position:relative ;bottom:5px;">全选</label>
          <input type="button" class="pageCutSmallBtnCheckout" id="input2" value="确定导入" />
          <input type="button" class="pageCutSmallBtnDel" id="input23" value="删除" />
		  </p>
		  <div id="page">
			<p><vte:pages hasForm="true" beanName="page" formName="queryForm"/></p>
		  </div>
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
