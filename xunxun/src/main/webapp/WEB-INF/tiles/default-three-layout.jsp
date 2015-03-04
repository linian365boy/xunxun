<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles" %>
<%@ page language="java" pageEncoding="UTF-8"%>

<html>
<head><title><tiles:getAsString name="title"/></title>
<style type="text/css">
body {
margin:0px auto;
text-align:center;
}
img {border-width: 0px 0px 0px 0px}
#container{
/*width:1200px;*/
padding:0px;
text-align:center;
margin:0 auto;
}
#header{
/*width:950px;
text-align:center;
padding:0px;*/
margin:0 auto;
/*background-color:#345622;

border:black 1px solid;*/
}

#content{
margin:0 auto;
width:1200px;
/*background-color:blue;
border:black 1px solid;*/
}
#footer{
width:1200px;
margin:0 auto;
/*float:left;
background-color:green;*/
}
</style>
</head>
<body>

<div id="container">
	<div id="header">
		<tiles:insertAttribute name="header"/>
	</div>
	<div id="content">
		<tiles:insertAttribute name="content"/>
	</div>
	<div id="footer">
		<tiles:insertAttribute name="footer"/>
	</div>
</div>

</body>
</html>
