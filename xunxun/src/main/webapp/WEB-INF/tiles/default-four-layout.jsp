<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta http-equiv="Content-Language" content="zh-cn" />
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<html>
<head><title><tiles:getAsString name="title"/></title>
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
<%@ include file="../inc/taglib.inc" %>
<%@ include file="../inc/constants.inc" %>
<%@ include file="../inc/script.inc" %>
<%@ include file="../inc/style.inc" %>
</head>
<body>
<div id="container">
	<div id="header">
		<tiles:insertAttribute name="header"/>
	</div>
	<div id="middel">
		<div id="left">
			<tiles:insertAttribute name="left"/>
		</div>
		<div id="content">
			<tiles:insertAttribute name="content"/>
		</div>
	</div>
	<div id="footer">
		<tiles:insertAttribute name="footer"/>
	</div>
</div>

</body>
</html>
