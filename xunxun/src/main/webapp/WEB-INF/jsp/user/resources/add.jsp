<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/inc/headerImport.jsp"%>
<!DOCTYPE html>

<!--[if IE 8]> <html lang="en" class="ie8 no-js"> <![endif]-->
<!--[if IE 9]> <html lang="en" class="ie9 no-js"> <![endif]-->
<!--[if !IE]><!-->
<html lang="en" class="no-js">
<!--<![endif]-->
<!-- BEGIN HEAD -->
<head>
<meta charset="utf-8"/>
<base href="${path}"/>
<title>微特购物 | 权限管理 - 新增资源</title>
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta content="width=device-width, initial-scale=1.0" name="viewport"/>
<meta content="" name="description"/>
<meta content="" name="author"/>
<!-- BEGIN GLOBAL MANDATORY STYLES -->

<link href="assets/plugins/font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css"/>
<link href="assets/plugins/bootstrap/css/bootstrap.min.css" rel="stylesheet" type="text/css"/>
<link href="assets/plugins/uniform/css/uniform.default.css" rel="stylesheet" type="text/css"/>
<!-- END GLOBAL MANDATORY STYLES -->
<!-- BEGIN PAGE LEVEL STYLES -->
<link rel="stylesheet" type="text/css" href="assets/plugins/select2/select2.css"/>
<link rel="stylesheet" type="text/css" href="assets/plugins/select2/select2-metronic.css"/>
<link rel="stylesheet" type="text/css" href="assets/plugins/bootstrap-wysihtml5/bootstrap-wysihtml5.css"/>
<link rel="stylesheet" type="text/css" href="assets/plugins/bootstrap-markdown/css/bootstrap-markdown.min.css">
<!-- END PAGE LEVEL SCRIPTS -->
<!-- BEGIN THEME STYLES -->
<link href="assets/css/style-metronic.css" rel="stylesheet" type="text/css"/>
<link href="assets/css/style.css" rel="stylesheet" type="text/css"/>
<link href="assets/css/style-responsive.css" rel="stylesheet" type="text/css"/>
<link href="assets/css/plugins.css" rel="stylesheet" type="text/css"/>
<link href="assets/css/themes/default.css" rel="stylesheet" type="text/css" id="style_color"/>
<link href="assets/css/custom.css" rel="stylesheet" type="text/css"/>
<!-- END THEME STYLES -->
<link rel="shortcut icon" href="favicon.ico"/>
</head>
<!-- END HEAD -->
<!-- BEGIN BODY -->
<body class="page-header-fixed">
<!-- BEGIN HEADER -->
<jsp:include page="/WEB-INF/jsp/common/main-header.jsp"/>
<!-- END HEADER -->
<div class="clearfix">
</div>
<!-- BEGIN CONTAINER -->
<div class="page-container">
	<!-- BEGIN SIDEBAR -->
	<jsp:include page="/WEB-INF/jsp/common/main-menu.jsp"/>
	<!-- END SIDEBAR -->
	<!-- BEGIN CONTENT -->
	<div class="page-content-wrapper">
		<div class="page-content">
			<!-- BEGIN SAMPLE PORTLET CONFIGURATION MODAL FORM-->
			<jsp:include page="/WEB-INF/jsp/common/main-style.jsp"/>
			<!-- BEGIN STYLE CUSTOMIZER -->
			<div class="theme-panel hidden-xs hidden-sm">
				<div class="toggler">
				</div>
				<div class="toggler-close">
				</div>
				<div class="theme-options">
					<div class="theme-option theme-colors clearfix">
						<span>
							 THEME COLOR
						</span>
						<ul>
							<li class="color-black current color-default" data-style="default">
							</li>
							<li class="color-blue" data-style="blue">
							</li>
							<li class="color-brown" data-style="brown">
							</li>
							<li class="color-purple" data-style="purple">
							</li>
							<li class="color-grey" data-style="grey">
							</li>
							<li class="color-white color-light" data-style="light">
							</li>
						</ul>
					</div>
					<div class="theme-option">
						<span>
							 Layout
						</span>
						<select class="layout-option form-control input-small">
							<option value="fluid" selected="selected">Fluid</option>
							<option value="boxed">Boxed</option>
						</select>
					</div>
					<div class="theme-option">
						<span>
							 Header
						</span>
						<select class="header-option form-control input-small">
							<option value="fixed" selected="selected">Fixed</option>
							<option value="default">Default</option>
						</select>
					</div>
					<div class="theme-option">
						<span>
							 Sidebar
						</span>
						<select class="sidebar-option form-control input-small">
							<option value="fixed">Fixed</option>
							<option value="default" selected="selected">Default</option>
						</select>
					</div>
					<div class="theme-option">
						<span>
							 Sidebar Position
						</span>
						<select class="sidebar-pos-option form-control input-small">
							<option value="left" selected="selected">Left</option>
							<option value="right">Right</option>
						</select>
					</div>
					<div class="theme-option">
						<span>
							 Footer
						</span>
						<select class="footer-option form-control input-small">
							<option value="fixed">Fixed</option>
							<option value="default" selected="selected">Default</option>
						</select>
					</div>
				</div>
			</div>
			<!-- END STYLE CUSTOMIZER -->
			<!-- BEGIN PAGE HEADER-->
			<div class="row">
				<div class="col-md-12">
					<!-- BEGIN PAGE TITLE & BREADCRUMB-->
					<h3 class="page-title">
					资源管理 <small>系统中所有可以使用的资源</small>
					</h3>
					<ul class="page-breadcrumb breadcrumb">
						<li class="btn-group">
							<button type="button" class="btn blue dropdown-toggle" data-toggle="dropdown" data-hover="dropdown" data-delay="1000" data-close-others="true">
							<span>
								Actions
							</span>
							<i class="fa fa-angle-down"></i>
							</button>
							<ul class="dropdown-menu pull-right" role="menu">
								<li>
									<a href="#">
										Action
									</a>
								</li>
								<li>
									<a href="#">
										Another action
									</a>
								</li>
								<li>
									<a href="#">
										Something else here
									</a>
								</li>
								<li class="divider">
								</li>
								<li>
									<a href="#">
										Separated link
									</a>
								</li>
							</ul>
						</li>
						<li>
							<i class="fa fa-home"></i>
							<a href="/">
								首页
							</a>
							<i class="fa fa-angle-right"></i>
						</li>
						<li>
							<a href="#">
								权限管理
							</a>
							<i class="fa fa-angle-right"></i>
						</li>
						<li>
							<a href="#">
								新增资源
							</a>
						</li>
					</ul>
					<!-- END PAGE TITLE & BREADCRUMB-->
				</div>
			</div>
			<!-- END PAGE HEADER-->
			<!-- BEGIN PAGE CONTENT-->
			<div class="row">
				<div class="col-md-12">
				<div class="tabbable tabbable-custom tabbable-full-width">
						<ul class="nav nav-tabs">
							<li>
								<a href="resources/initial">
									 资源列表
								</a>
							</li>
							<li class="active">
								<a href="resources/add?init=true">
									 新增资源
								</a>
							</li>
							
						</ul>
						<div class="tab-content">
					<!-- BEGIN VALIDATION STATES-->
					<!-- BEGIN FORM-->
					<form action="resources/add" id="form_sample_2" method="post" class="form-horizontal">
					<input type="hidden" name="tokenName" value="${token_name}">
					<input type="hidden" name="resourceId" value="${res.resourceId}"/>
					<input type="hidden" id="msg" value="${msg}"/>
					<div class="portlet box red">
						<div class="portlet-title">
							<div class="caption">
								<i class="fa fa-reorder"></i>新增资源
							</div>
							<div class="tools">
								<a href="javascript:;" class="collapse">
								</a>
								<a href="#portlet-config" data-toggle="modal" class="config">
								</a>
								<a href="javascript:;" class="reload">
								</a>
								<a href="javascript:;" class="remove">
								</a>
							</div>
						</div>
						<div class="portlet-body form">
							
								<div class="form-body">
									<div class="alert alert-danger display-hide">
										<button class="close" data-close="alert"></button>
										数据输入验证错误，请查看错误提示。
									</div>
									<div class="alert alert-success display-hide">
										<button class="close" data-close="alert"></button>
										数据输入验证成功！
									</div>
									<div class="form-group">
										<label class="control-label col-md-3">Name
										<span class="required">
											 *
										</span>
										</label>
										<div class="col-md-4">
											<div class="input-icon right">
												<i class="fa"></i>
												<input type="text" class="form-control" name="name"/>
											</div>
										</div>
									</div>
									<div class="form-group">
										<label class="control-label col-md-3">Email
										<span class="required">
											 *
										</span>
										</label>
										<div class="col-md-4">
											<div class="input-icon right">
												<i class="fa"></i>
												<input type="email" class="form-control" name="email"/>
											</div>
										</div>
									</div>
									<div class="form-group">
										<label class="control-label col-md-3">URL
										<span class="required">
											 *
										</span>
										</label>
										<div class="col-md-4">
											<div class="input-icon right">
												<i class="fa"></i>
												<input type="text" class="form-control" name="url"/>
											</div>
											<span class="help-block">
												 例如： http://www.demo.com or http://demo.com
											</span>
										</div>
									</div>
									<div class="form-group">
										<label class="control-label col-md-3">Number
										<span class="required">
											 *
										</span>
										</label>
										<div class="col-md-4">
											<div class="input-icon right">
												<i class="fa"></i>
												<input type="text" class="form-control" name="number"/>
											</div>
										</div>
									</div>
									<div class="form-group">
										<label class="control-label col-md-3">Digits
										<span class="required">
											 *
										</span>
										</label>
										<div class="col-md-4">
											<div class="input-icon right">
												<i class="fa"></i>
												<input type="text" class="form-control" name="digits"/>
											</div>
										</div>
									</div>
									<div class="form-group">
										<label class="control-label col-md-3">信用卡
										<span class="required">
											 *
										</span>
										</label>
										<div class="col-md-4">
											<div class="input-icon right">
												<i class="fa"></i>
												<input type="text" class="form-control" name="creditcard"/>
											</div>
											<span class="help-block">
												 例如： 3568 0000 0000 8888
											</span>
										</div>
									</div>
									<div class="form-group">
										<label class="control-label col-md-3">Category
										<span class="required">
											 *
										</span>
										</label>
										<div class="col-md-4">
											<select class="form-control" name="category">
												<option value="">Select...</option>
												<option value="Category 1">Category 1</option>
												<option value="Category 2">Category 2</option>
												<option value="Category 3">Category 5</option>
												<option value="Category 4">Category 4</option>
											</select>
										</div>
									</div>
									<div class="form-group">
										<label class="control-label col-md-3">Select2 Dropdown
										<span class="required">
											 *
										</span>
										</label>
										<div class="col-md-4">
											<select id="form_2_select2" class="form-control select2me" name="options2">
												<option value="">Select...</option>
												<option value="Option 1">Option 1</option>
												<option value="Option 2">Option 2</option>
												<option value="Option 3">Option 3</option>
												<option value="Option 4">Option 4</option>
											</select>
										</div>
									</div>
									<div class="form-group">
										<label class="control-label col-md-3">会员资格
										<span class="required">
											 *
										</span>
										</label>
										<div class="col-md-4">
											<div class="radio-list" data-error-container="#form_2_membership_error">
												<label>
												<input type="radio" name="membership" value="1"/>
												免费 </label>
												<label>
												<input type="radio" name="membership" value="2"/>
												付费 </label>
											</div>
											<div id="form_2_membership_error">
											</div>
										</div>
									</div>
									<div class="form-group">
										<label class="control-label col-md-3">Services
										<span class="required">
											 *
										</span>
										</label>
										<div class="col-md-4">
											<div class="checkbox-list" data-error-container="#form_2_services_error">
												<label>
												<input type="checkbox" value="1" name="service"/> Service 1 </label>
												<label>
												<input type="checkbox" value="2" name="service"/> Service 2 </label>
												<label>
												<input type="checkbox" value="3" name="service"/> Service 3 </label>
											</div>
											<span class="help-block">
												 （最少选择两个）
											</span>
											<div id="form_2_services_error">
											</div>
										</div>
									</div>
								</div>
								<div class="form-actions fluid">
									<div class="col-md-offset-3 col-md-9">
										<button type="submit" class="btn blue">保存</button>
										<button type="button" class="btn default">取消</button>
									</div>
								</div>
							
						</div>
					</div>
					</form>
					<!-- END FORM-->
					</div>
			</div>
					<!-- END VALIDATION STATES-->
				</div>
			
			</div>
			
			<!-- END PAGE CONTENT-->
		</div>
	</div>
	<!-- END CONTENT -->
	<div class="modal fade" id="basic" tabindex="-1" role="basic" aria-hidden="true">
								<div class="modal-dialog">
									<div class="modal-content">
										<div class="modal-header">
											<button type="button" class="close" data-dismiss="modal" aria-hidden="true"></button>
											<h4 class="modal-title">温馨提示：</h4>
										</div>
										<div class="modal-body">
											 ${msg}
										</div>
										<div class="modal-footer">
											<button type="button" class="btn default" data-dismiss="modal">关闭</button>
<!-- 											<button type="button" class="btn blue">Save changes</button> -->
										</div>
									</div>
									<!-- /.modal-content -->
								</div>
								<!-- /.modal-dialog -->
							</div>
</div>
<!-- END CONTAINER -->
<!-- BEGIN FOOTER -->
<jsp:include page="/WEB-INF/jsp/common/main-footer.jsp"/>
<!-- END FOOTER -->
<!-- BEGIN JAVASCRIPTS(Load javascripts at bottom, this will reduce page load time) -->
<!-- BEGIN CORE PLUGINS -->
<!--[if lt IE 9]>
<script src="assets/plugins/respond.min.js"></script>
<script src="assets/plugins/excanvas.min.js"></script> 
<![endif]-->
<script src="assets/plugins/jquery-1.10.2.min.js" type="text/javascript"></script>
<script src="assets/plugins/jquery-migrate-1.2.1.min.js" type="text/javascript"></script>
<script src="assets/plugins/bootstrap/js/bootstrap.min.js" type="text/javascript"></script>
<script src="assets/plugins/bootstrap-hover-dropdown/bootstrap-hover-dropdown.min.js" type="text/javascript"></script>
<script src="assets/plugins/jquery-slimscroll/jquery.slimscroll.min.js" type="text/javascript"></script>
<script src="assets/plugins/jquery.blockui.min.js" type="text/javascript"></script>
<script src="assets/plugins/jquery.cokie.min.js" type="text/javascript"></script>
<script src="assets/plugins/uniform/jquery.uniform.min.js" type="text/javascript"></script>
<!-- END CORE PLUGINS -->
<!-- BEGIN PAGE LEVEL PLUGINS -->
<script type="text/javascript" src="assets/plugins/jquery-validation/dist/jquery.validate.min.js"></script>
<script type="text/javascript" src="assets/plugins/jquery-validation/dist/additional-methods.min.js"></script>
<script type="text/javascript" src="assets/plugins/select2/select2.min.js"></script>
<!-- <script type="text/javascript" src="assets/plugins/bootstrap-wysihtml5/wysihtml5-0.3.0.js"></script> -->
<!-- <script type="text/javascript" src="assets/plugins/bootstrap-wysihtml5/bootstrap-wysihtml5.js"></script> -->
<!-- <script type="text/javascript" src="assets/plugins/ckeditor/ckeditor.js"></script> -->
<!-- <script type="text/javascript" src="assets/plugins/bootstrap-markdown/js/bootstrap-markdown.js"></script> -->
<!-- <script type="text/javascript" src="assets/plugins/bootstrap-markdown/lib/markdown.js"></script> -->
<!-- END PAGE LEVEL PLUGINS -->
<!-- BEGIN PAGE LEVEL STYLES -->
<script src="assets/scripts/core/app.js"></script>
<script src="assets/scripts/custom/form-validation.js"></script>
<!-- END PAGE LEVEL STYLES -->
<script>
jQuery(document).ready(function() {   
   // initiate layout and plugins
   App.init();
   FormValidation.init();
   
   var msg = $('#msg').val();
   if ($.trim(msg) != '') {
   	   $('#basic').modal('show');
   }
});
</script>
<!-- END JAVASCRIPTS -->
</body>
<!-- END BODY -->
</html>