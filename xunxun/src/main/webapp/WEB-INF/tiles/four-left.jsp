<%@page import="com.vteba.xunxun.user.model.Authorities"%>
<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page import="java.util.List"%>
<%@page import="com.vteba.xunxun.user.model.ModuleMenu"%>
<%@page import="com.vteba.xunxun.user.model.EmpUser"%>
<%@page import="org.springframework.security.core.context.SecurityContext"%>
<%@ include file="/WEB-INF/inc/taglib.inc" %>

<%
	//EmpUser user = (EmpUser)session.getAttribute("security_context_user");
	EmpUser empUser = (EmpUser)((SecurityContext)session.getAttribute("SPRING_SECURITY_CONTEXT")).getAuthentication().getPrincipal();
	//session.setAttribute("security_context_user", empUser);
	List<ModuleMenu> moduleMenus = empUser.getModuleMenus();
	String currentActionPath = (String)request.getAttribute("currentActionPath");
	int panel = 0;//打开哪个菜单面板
	if (moduleMenus != null && moduleMenus.size() > 0) {
		boolean exit = false;
		for (int i = 0; i < moduleMenus.size(); i++) {
			if (exit) break;
			ModuleMenu menu = moduleMenus.get(i);
			if(menu==null || menu.getAuthorities()==null || menu.getAuthorities().size()==0){
				continue;
			}
			for(Authorities auth : menu.getAuthorities()){
				if(auth == null || auth.getResUrls() == null || auth.getResUrls().size()==0){
					continue;
				}
				if (auth.getResUrls().contains(currentActionPath)) {
					request.setAttribute("currentPath", auth.getAction());
					panel = i;
					exit = true;
				}
			}
		}
	}
%>
<link href="<c:url value='/js/SpryAssets/SpryAccordion.css'/>" rel="stylesheet" type="text/css"/>
<script src="<c:url value='/js/SpryAssets/SpryAccordion.js'/>" type="text/javascript"></script>
<style type="text/css">
.epMcNav{
	width:148px;
	border:1px #ccc solid;
	margin-top:0px;
	-moz-border-radius:5px;
	-khtml-border-radius:5px;
	-webkit-border-radius:5px;
	border-radius:5px;
	margin-bottom:20px;
	height:476px;
}
.epMcNav h3 {
	line-height:30px;
	height:30px;
	color:#333;
	font-weight:600;
}
.epMcNavMcIndex{
 	margin-top:10px;
 	margin-bottom:0px;
	text-decoration:none;
	background:transparent url('../images/bgNavMemberCenterIndex.png') no-repeat scroll 10px center ;
}
.epMcNavMcIndex a span{
	visibility:hidden;
}
.epMcNavMcMessageInweb{
	background:transparent url('../images/bgepMcNavMcMessageInweb.png') no-repeat scroll 10px center ;
}
</style>
	
<div class="epMcNav">	
<h3 class="epMcNavMcIndex"><a href="#"><span>会员首页</span></a></h3>	
<div id="Accordion1" class="Accordion" tabindex="0">
<!-- jstl在session中获取变量，${sessionScope.变量名}或${变量名.成员}-->
<c:if test="${security_context_user.moduleMenus ne null }">
  <c:forEach items="${security_context_user.moduleMenus}" var="menu" varStatus="st">
  <div class="AccordionPanel">
    <div class="AccordionPanelTab top">${menu.moduleName}</div>
    <div class="AccordionPanelContent">
      <c:forEach items="${menu.authorities}" var="auth">
        <p><a href="<c:url value="${auth.action}"/>" <c:if test='${currentPath eq auth.action}'>style='color: red;font-weight: bold;'</c:if>>${auth.authDesc}</a></p>
      </c:forEach>
    </div>
  </div>
  </c:forEach>		
</c:if>
  <div style="width:127px; margin:2px auto;"><a href="<c:url value="/j_spring_security_logout"/>" ><img src="<c:url value='/images/exit.gif'/>" alt="" /></a></div>
</div>
<script type="text/javascript">
var Accordion1 = new Spry.Widget.Accordion("Accordion1",{defaultPanel:<%=panel%>});
</script>
</div>
