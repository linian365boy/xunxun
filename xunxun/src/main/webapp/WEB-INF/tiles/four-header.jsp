<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../inc/taglib.inc" %>
<%@ include file="../inc/constants.inc" %>
	<script type="text/javascript" src="${ctx}/js/bootstrap.min.js"></script>
	<script type="text/javascript" src="${ctx}/js/lhgdialog/lhgdialog.min.js"></script>

	<link rel="stylesheet" type="text/css" href="${ctx}/css/bootstrap.min.css" media="all" />
	<link rel="stylesheet" type="text/css" href="${ctx}/css/bootstrap-theme.min.css" media="all" />
<style type="text/css">
/* input { */
/* 	border:1px #ccc solid; */
/* } */
</style>

<div id="header">
	<div class="up">
		<p class="welcome">
			<c:if test="${sessionScope.security_context_user.name ne null}">您好，${sessionScope.security_context_user.name}，欢迎您！&nbsp;<a
					href="<c:url value="/j_spring_security_logout"/>" target="_self">退出</a>
			</c:if>
			<c:if test="${sessionScope.security_context_user.name eq null}">您好，欢迎您！&nbsp;请<a
					href="<c:url value="/user/login"/>" target="_self">登录</a>
			</c:if>
		</p>
		<ul class="topmenu">
			<li>我的平台</li>
			<li class="separation">|</li>
			<li>购物车0件</li>
			<li class="separation">|</li>
			<li>客服中心</li>
			<li class="separation">|</li>
			<li><span>快捷导航</span></li>
			<li class="separation">|</li>
			<li>我要买</li>
			<li class="separation">|</li>
			<li>我要卖</li>
		</ul>
	</div>
	<h1 class="epMcCenterTitle">
		<span></span>
	</h1>
</div>
