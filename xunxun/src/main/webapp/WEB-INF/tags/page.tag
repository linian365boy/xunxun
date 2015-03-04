<%@tag import="com.vteba.tx.generic.Page"%>
<%@ tag language="java" pageEncoding="UTF-8"%>
<%@ attribute name="formName" required="true" rtexprvalue="true" description="form名字"%>
<%@ attribute name="beanName" required="true" rtexprvalue="true" description="分页数据的bean名字"%>
<%-- <%@ attribute name="hasForm" required="true" rtexprvalue="true" description="是否有form" %> --%>
<%
	if (formName == null || formName.equals("")) {
		formName = "queryForm";
	}
	if (beanName == null || beanName.equals("")) {
		beanName = "page";
	}
// 	String hf = getHasForm();
// 	boolean hasForm = false;
// 	if (hf != null && hf.equals("true")) {
// 		hasForm = true;
// 	}
	Page<?> page = (Page<?>)request.getAttribute(beanName);
	int pageNo = 1;
	int pageSize = 10;
	int recordCount = 0;
	int pageCount = 0;
	if (page != null) {
		pageNo = page.getPageNo();
		pageSize = page.getPageSize();
		pageCount = (int) page.getTotalPageCount();
		recordCount = (int) page.getTotalRecordCount();
	}
	int prevPage = pageNo - 1;
	int nextPage = pageNo + 1;
    if(prevPage < 1) {
        prevPage = 1;
    }
    if(nextPage > pageCount) {
        nextPage = pageCount;
    }
%>
<div>
	<ul class="pagination">
		<li><a href="javascript:submitPageForm('<%=formName%>',<%=prevPage%>,<%=pageSize%>);"> <i class="fa fa-angle-left"></i>
		</a></li>
		<% for (int i=1; i <= pageCount; i++) { %>
		<li <% if (i == pageNo) { %> class="active" <%} %>><a href="javascript:submitPageForm('<%=formName%>',<%=i%>,<%=pageSize%>);"> <%=i%> </a></li>
		<% } %>
		<li><a href="javascript:submitPageForm('<%=formName%>',<%=nextPage%>,<%=pageSize%>);"> <i class="fa fa-angle-right"></i>
		</a></li>
	</ul>
</div>