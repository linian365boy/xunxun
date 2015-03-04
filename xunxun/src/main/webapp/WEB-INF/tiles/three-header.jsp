<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<style type="text/css">

ul.topmenu {
	height:33px;
	float:right;
	display:inline;
	margin-right:30px;
}
ul.topmenu li {
	float:left;
	display:inline;
	margin:0 5px;
	padding:0;
	color:#ccc;
	line-height:30px;
}
ul.topmenu li a:link,ul.topmenu li a:visited{
	line-height:30px;
	float:left;
	display:inline;
	margin:0 1px;
	padding:0;
	color:#333;
	text-decoration:none;
}
ul.topmenu li a:hover{
	color:#06c;
}
p.welcome {
	float:left;
	margin-left:20px;
	display:inline;
	line-height:33px;
	color:#333;
}
#logo{
margin-top:0px;
margin-left:0px;
}
#logo .searchFuzzy{
	width:480px;
	height:65px;
	margin-top:10px;
	display:block;
	background:transparent url('/skmbwdocs/images/bgFuzzySearch.png') no-repeat scroll left 25px;
	float:right;
}

.searchFuzzy ul.floatLeft li,.searchFuzzy ul.floatRight li{
	float:left;
	line-height:27px;
	height:27px;
}
#logo .searchFuzzy a:link,#logo .searchFuzzy a:visited{
	display:inline-block;
	text-decoration:none;
	width:60px;
	line-height:26px;
	text-align:center;
	height:26px;
	color:#06c;
	margin:0;
	padding:0;
	font-size:14px!important;
	font-family:宋体, Arial, Helvetica, sans-serif;
	font-weight:600;
}
#logo .searchFuzzy a:hover{
	color:#f60;
	font-weight:600;
}
#logo .searchFuzzy a.current{
	color:#f60!important;
	font-weight:600;
	background:transparent url('/skmbwdocs/images/bgFuzzySearchCurrent.png') no-repeat scroll center top!important;
}

input.searchFuzzyInputText{
	width:384px;
	height:26px;
	padding-left:8px;
	border:1px #ccc solid;
	margin-left:0px;
	margin-bottom:-2px;
	line-height:24px;
	font-size:12px;
	-moz-border-radius:5px;
	-webkit-border-radius:5px;
	border-radius:5px;
	color:#999;
	display:inline;
}
input.searchFuzzyInputsubmit{
	border:0;
	width:58px;
	height:24px;
	margin-right:18px;
	margin-top:5px;
	background:transparent url('/skmbwdocs/images/btnFuzzySearch.gif') no-repeat scroll left top;
	display:inline;
	_margin-top:50px！important;
}

h1.epMcCenterTitle{
	width:980px;
	height:37px;
	border-bottom:3px #1b7cb8 solid;
	background:transparent url('/skmbwdocs/images/bgMemberCenter.png') no-repeat scroll left top ;
}
h1.epMcCenterTitle span{
	display:none;
}
.up{
height:33px;
overflow:hidden;
}
</style>
<div id="header">
			<div class="up">
				<p class="welcome">
					您好，欢迎您的到来！
					<a href="/${SERVLET_PATH}/j_spring_security_logout" target="_blank">退出</a>
				</p>
				<ul class="topmenu">
					<li>
						我的会员中心
					</li>
					<li>|</li>
					<li>
						购物车0件
					</li>
					<li>|</li>
					<li>
						客服中心
					</li>
					<li>|</li>
					<li>
						<span>快捷导航</span>
					</li>
					<li>|</li>
					<li>
						我要买
					</li>
					<li>|</li>
					<li>
						我要卖
					</li>
				</ul>
			</div>
			<div id="logo">
			
			<span class="searchFuzzy">
			<ul class="floatLeft">
			<li><a href="#" class="current" >产品</a></li>
			<li><a href="#">店铺</a></li>
			</ul>
			
			<input type="text" value="" class="searchFuzzyInputText" />
			<input type="button" value="" class="searchFuzzyInputsubmit" />
			
			</span>
			<div style="margin-left:0px;float:left;">
			<a href="#" >
			<img id="logo" alt="logo" src="/skmbwdocs/images/logoTaosteel.gif" />
			</a>
			</div>
			</div>			
			<h1 class="epMcCenterTitle"><span>企业会员中心</span></h1>
</div>
