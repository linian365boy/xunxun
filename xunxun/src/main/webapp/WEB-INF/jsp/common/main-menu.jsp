<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/inc/taglib.inc" %>
<%@ include file="/WEB-INF/inc/constants.inc" %>
<%@page import="com.vteba.xunxun.user.model.Authorities"%>
<%@page import="java.util.List"%>
<%@page import="com.vteba.xunxun.user.model.ModuleMenu"%>
<%@page import="com.vteba.xunxun.user.model.EmpUser"%>
<%@page import="org.springframework.security.core.context.SecurityContext"%>
<%
	EmpUser empUser = (EmpUser)((SecurityContext)session.getAttribute("SPRING_SECURITY_CONTEXT")).getAuthentication().getPrincipal();
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
	request.setAttribute("panel", panel);
%>
	<div class="page-sidebar-wrapper">
		<div class="page-sidebar navbar-collapse collapse">
			<!-- add "navbar-no-scroll" class to disable the scrolling of the sidebar menu -->
			<!-- BEGIN SIDEBAR MENU -->
			<ul class="page-sidebar-menu" data-auto-scroll="true" data-slide-speed="200">
				<li class="sidebar-toggler-wrapper">
					<!-- BEGIN SIDEBAR TOGGLER BUTTON -->
					<div class="sidebar-toggler hidden-phone">
					</div>
					<!-- BEGIN SIDEBAR TOGGLER BUTTON -->
				</li>
				<li class="sidebar-search-wrapper">
					<!-- BEGIN RESPONSIVE QUICK SEARCH FORM -->
					<form class="sidebar-search" action="extra_search.html" method="POST">
						<div class="form-container">
							<div class="input-box">
								<a href="javascript:;" class="remove">
								</a>
								<input type="text" placeholder="Search..."/>
								<input type="button" class="submit" value=" "/>
							</div>
						</div>
					</form>
					<!-- END RESPONSIVE QUICK SEARCH FORM -->
				</li>
				<li class="start <c:if test="${0 == panel}">active</c:if> ">
					<a href="index.html">
						<i class="fa fa-home"></i>
						<span class="title">
							控制台
						</span>
						<c:if test="${0 == panel}"><span class="selected"></span></c:if>
					</a>
				</li>
				<c:if test="${security_context_user.moduleMenus ne null }">
  					<c:forEach items="${security_context_user.moduleMenus}" var="menu" varStatus="st">
  						<input type="hidden" id="asdd${st.count}" />
  						<li <c:if test="${panel != 0 && (st.count-1) == panel}">class="active"</c:if>>
						<a href="javascript:;">
							<i class="fa fa-shopping-cart"></i>
							<span class="title">
								${menu.moduleName}
							</span>
							<c:if test="${panel != 0 && (st.count-1) == panel}"><span class="selected"></span></c:if>
							<span class="arrow <c:if test="${panel != 0 && (st.count-1) == panel}">open</c:if>">
							</span>
						</a>
						<ul class="sub-menu">
  						<c:forEach items="${menu.authorities}" var="auth">
  							<li <c:if test='${currentPath eq auth.action}'>class="active"</c:if>>
								<a href="<c:url value="${auth.action}"/>">
									<i class="fa fa-bullhorn"></i>
									${auth.authDesc}
								</a>
							</li>
  						</c:forEach>
  						</ul>
						</li>
  					</c:forEach>
  				</c:if>
				
				<li>
					<a href="javascript:;">
						<i class="fa fa-th"></i>
						<span class="title">
							数据表格
						</span>
						<span class="arrow ">
						</span>
					</a>
					<ul class="sub-menu">
						<li>
							<a href="${ctx}/table_basic.jsp">
								 Basic Datatables
							</a>
						</li>
						<li>
							<a href="${ctx}/table_responsive.jsp">
								 Responsive Datatables
							</a>
						</li>
						<li>
							<a href="${ctx}/table_editable.jsp">
								 Editable Datatables
							</a>
						</li>
					</ul>
				</li>
				<li class="last ">
					<a href="charts.html">
						<i class="fa fa-bar-chart-o"></i>
						<span class="title">
							可视化图表
						</span>
					</a>
				</li>
			</ul>
			<!-- END SIDEBAR MENU -->
		</div>
	</div>