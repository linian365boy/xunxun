<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/inc/taglib.inc" %>
<%@ include file="/WEB-INF/inc/constants.inc" %>
<!DOCTYPE html>
<!--[if IE 8]> <html lang="en" class="ie8 no-js"> <![endif]-->
<!--[if IE 9]> <html lang="en" class="ie9 no-js"> <![endif]-->
<!--[if !IE]><!-->
<html lang="en" class="no-js">
<!--<![endif]-->
<!-- BEGIN HEAD -->
<head>
<meta charset="utf-8"/>
<title>Metronic | Data Tables - Basic Datatables</title>
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta content="width=device-width, initial-scale=1.0" name="viewport"/>
<meta content="" name="description"/>
<meta content="" name="author"/>

<!-- BEGIN GLOBAL MANDATORY STYLES 
<link href="http://fonts.googleapis.com/css?family=Open+Sans:400,300,600,700&subset=all" rel="stylesheet" type="text/css"/>-->
<link href="assets/plugins/font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css"/>
<link href="assets/plugins/bootstrap/css/bootstrap.min.css" rel="stylesheet" type="text/css"/>
<link href="assets/plugins/uniform/css/uniform.default.min.css" rel="stylesheet" type="text/css"/>
<!-- END GLOBAL MANDATORY STYLES -->
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
			<div class="modal fade" id="portlet-config" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
				<div class="modal-dialog">
					<div class="modal-content">
						<div class="modal-header">
							<button type="button" class="close" data-dismiss="modal" aria-hidden="true"></button>
							<h4 class="modal-title">Modal title</h4>
						</div>
						<div class="modal-body">
							 Widget settings form goes here
						</div>
						<div class="modal-footer">
							<button type="button" class="btn blue">Save changes</button>
							<button type="button" class="btn default" data-dismiss="modal">Close</button>
						</div>
					</div>
					<!-- /.modal-content -->
				</div>
				<!-- /.modal-dialog -->
			</div>
			<!-- /.modal -->
			<!-- END SAMPLE PORTLET CONFIGURATION MODAL FORM-->
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
					Basic Datatables <small>basic datatable samples</small>
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
							<a href="index.html">
								Home
							</a>
							<i class="fa fa-angle-right"></i>
						</li>
						<li>
							<a href="#">
								Data Tables
							</a>
							<i class="fa fa-angle-right"></i>
						</li>
						<li>
							<a href="#">
								Basic Datatables
							</a>
						</li>
					</ul>
					<!-- END PAGE TITLE & BREADCRUMB-->
				</div>
			</div>
			<!-- END PAGE HEADER-->
			<!-- BEGIN PAGE CONTENT-->
			<div class="row">
				<div class="col-md-6">
					<!-- BEGIN SAMPLE TABLE PORTLET-->
					<div class="portlet box red">
						<div class="portlet-title">
							<div class="caption">
								<i class="fa fa-cogs"></i>Simple Table
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
						<div class="portlet-body">
							<div class="table-responsive">
								<table class="table table-hover">
								<thead>
								<tr>
									<th>
										 #
									</th>
									<th>
										 First Name
									</th>
									<th>
										 Last Name
									</th>
									<th>
										 Username
									</th>
									<th>
										 Status
									</th>
								</tr>
								</thead>
								<tbody>
								<tr>
									<td>
										 1
									</td>
									<td>
										 Mark
									</td>
									<td>
										 Otto
									</td>
									<td>
										 makr124
									</td>
									<td>
										<span class="label label-sm label-success">
											 Approved
										</span>
									</td>
								</tr>
								<tr>
									<td>
										 2
									</td>
									<td>
										 Jacob
									</td>
									<td>
										 Nilson
									</td>
									<td>
										 jac123
									</td>
									<td>
										<span class="label label-sm label-info">
											 Pending
										</span>
									</td>
								</tr>
								<tr>
									<td>
										 3
									</td>
									<td>
										 Larry
									</td>
									<td>
										 Cooper
									</td>
									<td>
										 lar
									</td>
									<td>
										<span class="label label-sm label-warning">
											 Suspended
										</span>
									</td>
								</tr>
								<tr>
									<td>
										 4
									</td>
									<td>
										 Sandy
									</td>
									<td>
										 Lim
									</td>
									<td>
										 sanlim
									</td>
									<td>
										<span class="label label-sm label-danger">
											 Blocked
										</span>
									</td>
								</tr>
								</tbody>
								</table>
							</div>
						</div>
					</div>
					<!-- END SAMPLE TABLE PORTLET-->
				</div>
				<div class="col-md-6">
					<!-- BEGIN BORDERED TABLE PORTLET-->
					<div class="portlet box yellow">
						<div class="portlet-title">
							<div class="caption">
								<i class="fa fa-coffee"></i>Bordered Table
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
						<div class="portlet-body">
							<div class="table-responsive">
								<table class="table table-bordered table-hover">
								<thead>
								<tr>
									<th>
										 #
									</th>
									<th>
										 First Name
									</th>
									<th>
										 Last Name
									</th>
									<th>
										 Username
									</th>
									<th>
										 Status
									</th>
								</tr>
								</thead>
								<tbody>
								<tr>
									<td rowspan="2">
										 1
									</td>
									<td>
										 Mark
									</td>
									<td>
										 Otto
									</td>
									<td>
										 makr124
									</td>
									<td>
										<span class="label label-sm label-success">
											 Approved
										</span>
									</td>
								</tr>
								<tr>
									<td>
										 Jacob
									</td>
									<td>
										 Nilson
									</td>
									<td>
										 jac123
									</td>
									<td>
										<span class="label label-sm label-info">
											 Pending
										</span>
									</td>
								</tr>
								<tr>
									<td>
										 2
									</td>
									<td>
										 Larry
									</td>
									<td>
										 Cooper
									</td>
									<td>
										 lar
									</td>
									<td>
										<span class="label label-sm label-warning">
											 Suspended
										</span>
									</td>
								</tr>
								<tr>
									<td>
										 3
									</td>
									<td>
										 Sandy
									</td>
									<td>
										 Lim
									</td>
									<td>
										 sanlim
									</td>
									<td>
										<span class="label label-sm label-danger">
											 Blocked
										</span>
									</td>
								</tr>
								</tbody>
								</table>
							</div>
						</div>
					</div>
					<!-- END BORDERED TABLE PORTLET-->
				</div>
			</div>
			<div class="row">
				<div class="col-md-6">
					<!-- BEGIN SAMPLE TABLE PORTLET-->
					<div class="portlet box purple">
						<div class="portlet-title">
							<div class="caption">
								<i class="fa fa-comments"></i>Striped Table
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
						<div class="portlet-body">
							<div class="table-responsive">
								<table class="table table-striped table-hover">
								<thead>
								<tr>
									<th>
										 #
									</th>
									<th>
										 First Name
									</th>
									<th>
										 Last Name
									</th>
									<th>
										 Username
									</th>
									<th>
										 Status
									</th>
								</tr>
								</thead>
								<tbody>
								<tr>
									<td>
										 1
									</td>
									<td>
										 Mark
									</td>
									<td>
										 Otto
									</td>
									<td>
										 makr124
									</td>
									<td>
										<span class="label label-sm label-success">
											 Approved
										</span>
									</td>
								</tr>
								<tr>
									<td>
										 2
									</td>
									<td>
										 Jacob
									</td>
									<td>
										 Nilson
									</td>
									<td>
										 jac123
									</td>
									<td>
										<span class="label label-sm label-info">
											 Pending
										</span>
									</td>
								</tr>
								<tr>
									<td>
										 3
									</td>
									<td>
										 Larry
									</td>
									<td>
										 Cooper
									</td>
									<td>
										 lar
									</td>
									<td>
										<span class="label label-sm label-warning">
											 Suspended
										</span>
									</td>
								</tr>
								<tr>
									<td>
										 4
									</td>
									<td>
										 Sandy
									</td>
									<td>
										 Lim
									</td>
									<td>
										 sanlim
									</td>
									<td>
										<span class="label label-sm label-danger">
											 Blocked
										</span>
									</td>
								</tr>
								</tbody>
								</table>
							</div>
						</div>
					</div>
					<!-- END SAMPLE TABLE PORTLET-->
				</div>
				<div class="col-md-6">
					<!-- BEGIN CONDENSED TABLE PORTLET-->
					<div class="portlet box green">
						<div class="portlet-title">
							<div class="caption">
								<i class="fa fa-picture"></i>Condensed Table
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
						<div class="portlet-body">
							<div class="table-responsive">
								<table class="table table-condensed table-hover">
								<thead>
								<tr>
									<th>
										 #
									</th>
									<th>
										 First Name
									</th>
									<th>
										 Last Name
									</th>
									<th>
										 Username
									</th>
									<th>
										 Status
									</th>
								</tr>
								</thead>
								<tbody>
								<tr>
									<td>
										 1
									</td>
									<td>
										 Mark
									</td>
									<td>
										 Otto
									</td>
									<td>
										 makr124
									</td>
									<td>
										<span class="label label-sm label-success">
											 Approved
										</span>
									</td>
								</tr>
								<tr>
									<td>
										 2
									</td>
									<td>
										 Jacob
									</td>
									<td>
										 Nilson
									</td>
									<td>
										 jac123
									</td>
									<td>
										<span class="label label-sm label-info">
											 Pending
										</span>
									</td>
								</tr>
								<tr>
									<td>
										 3
									</td>
									<td>
										 Larry
									</td>
									<td>
										 Cooper
									</td>
									<td>
										 lar
									</td>
									<td>
										<span class="label label-sm label-warning">
											 Suspended
										</span>
									</td>
								</tr>
								<tr>
									<td>
										 4
									</td>
									<td>
										 Sandy
									</td>
									<td>
										 Lim
									</td>
									<td>
										 sanlim
									</td>
									<td>
										<span class="label label-sm label-danger">
											 Blocked
										</span>
									</td>
								</tr>
								<tr>
									<td>
										 5
									</td>
									<td>
										 Sandy
									</td>
									<td>
										 Lim
									</td>
									<td>
										 sanlim
									</td>
									<td>
										<span class="label label-sm label-danger">
											 Blocked
										</span>
									</td>
								</tr>
								</tbody>
								</table>
							</div>
						</div>
					</div>
					<!-- END CONDENSED TABLE PORTLET-->
				</div>
			</div>
			<div class="row">
				<div class="col-md-6">
					<!-- BEGIN SAMPLE TABLE PORTLET-->
					<div class="portlet box blue">
						<div class="portlet-title">
							<div class="caption">
								<i class="fa fa-comments"></i>Contextual Rows
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
						<div class="portlet-body">
							<div class="table-responsive">
								<table class="table table-bordered table-hover">
								<thead>
								<tr>
									<th>
										 #
									</th>
									<th>
										 Class Name
									</th>
									<th>
										 Column
									</th>
									<th>
										 Column
									</th>
									<th>
										 Column
									</th>
								</tr>
								</thead>
								<tbody>
								<tr class="active">
									<td>
										 1
									</td>
									<td>
										 active
									</td>
									<td>
										 Column heading
									</td>
									<td>
										 Column heading
									</td>
									<td>
										 Column heading
									</td>
								</tr>
								<tr class="success">
									<td>
										 2
									</td>
									<td>
										 success
									</td>
									<td>
										 Column heading
									</td>
									<td>
										 Column heading
									</td>
									<td>
										 Column heading
									</td>
								</tr>
								<tr class="warning">
									<td>
										 3
									</td>
									<td>
										 warning
									</td>
									<td>
										 Column heading
									</td>
									<td>
										 Column heading
									</td>
									<td>
										 Column heading
									</td>
								</tr>
								<tr class="danger">
									<td>
										 4
									</td>
									<td>
										 danger
									</td>
									<td>
										 Column heading
									</td>
									<td>
										 Column heading
									</td>
									<td>
										 Column heading
									</td>
								</tr>
								</tbody>
								</table>
							</div>
						</div>
					</div>
					<!-- END SAMPLE TABLE PORTLET-->
				</div>
				<div class="col-md-6">
					<!-- BEGIN SAMPLE TABLE PORTLET-->
					<div class="portlet box red">
						<div class="portlet-title">
							<div class="caption">
								<i class="fa fa-comments"></i>Contextual Columns
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
						<div class="portlet-body">
							<div class="table-responsive">
								<table class="table table-bordered table-hover">
								<thead>
								<tr>
									<th>
										 #
									</th>
									<th>
										 Column
									</th>
									<th>
										 Column
									</th>
									<th>
										 Column
									</th>
									<th>
										 Column
									</th>
								</tr>
								</thead>
								<tbody>
								<tr>
									<td>
										 1
									</td>
									<td class="active">
										 active
									</td>
									<td class="success">
										 success
									</td>
									<td class="warning">
										 warning
									</td>
									<td class="danger">
										 danger
									</td>
								</tr>
								<tr>
									<td>
										 2
									</td>
									<td class="active">
										 active
									</td>
									<td class="success">
										 success
									</td>
									<td class="warning">
										 warning
									</td>
									<td class="danger">
										 danger
									</td>
								</tr>
								<tr>
									<td>
										 3
									</td>
									<td class="active">
										 active
									</td>
									<td class="success">
										 success
									</td>
									<td class="warning">
										 warning
									</td>
									<td class="danger">
										 danger
									</td>
								</tr>
								<tr>
									<td>
										 4
									</td>
									<td class="active">
										 active
									</td>
									<td class="success">
										 success
									</td>
									<td class="warning">
										 warning
									</td>
									<td class="danger">
										 danger
									</td>
								</tr>
								</tbody>
								</table>
							</div>
						</div>
					</div>
					<!-- END SAMPLE TABLE PORTLET-->
				</div>
			</div>
			<div class="row">
				<div class="col-md-6">
					<!-- BEGIN SAMPLE TABLE PORTLET-->
					<div class="portlet">
						<div class="portlet-title">
							<div class="caption">
								<i class="fa fa-bell-o"></i>Advance Table
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
						<div class="portlet-body">
							<div class="table-responsive">
								<table class="table table-striped table-bordered table-advance table-hover">
								<thead>
								<tr>
									<th>
										<i class="fa fa-briefcase"></i> Company
									</th>
									<th class="hidden-xs">
										<i class="fa fa-user"></i> Contact
									</th>
									<th>
										<i class="fa fa-shopping-cart"></i> Total
									</th>
									<th>
									</th>
								</tr>
								</thead>
								<tbody>
								<tr>
									<td class="highlight">
										<div class="success">
										</div>
										<a href="#">
											 RedBull
										</a>
									</td>
									<td class="hidden-xs">
										 Mike Nilson
									</td>
									<td>
										 2560.60$
									</td>
									<td>
										<a href="#" class="btn default btn-xs purple">
											<i class="fa fa-edit"></i> Edit
										</a>
									</td>
								</tr>
								<tr>
									<td class="highlight">
										<div class="info">
										</div>
										<a href="#">
											 Google
										</a>
									</td>
									<td class="hidden-xs">
										 Adam Larson
									</td>
									<td>
										 560.60$
									</td>
									<td>
										<a href="#" class="btn default btn-xs black">
											<i class="fa fa-trash-o"></i> Delete
										</a>
									</td>
								</tr>
								<tr>
									<td class="highlight">
										<div class="important">
										</div>
										<a href="#">
											 Apple
										</a>
									</td>
									<td class="hidden-xs">
										 Daniel Kim
									</td>
									<td>
										 3460.60$
									</td>
									<td>
										<a href="#" class="btn default btn-xs purple">
											<i class="fa fa-edit"></i> Edit
										</a>
									</td>
								</tr>
								<tr>
									<td class="highlight">
										<div class="warning">
										</div>
										<a href="#">
											 Microsoft
										</a>
									</td>
									<td class="hidden-xs">
										 Nick
									</td>
									<td>
										 2560.60$
									</td>
									<td>
										<a href="#" class="btn default btn-xs blue">
											<i class="fa fa-share"></i> Share
										</a>
									</td>
								</tr>
								</tbody>
								</table>
							</div>
						</div>
					</div>
					<!-- END SAMPLE TABLE PORTLET-->
				</div>
				<div class="col-md-6">
					<!-- BEGIN SAMPLE TABLE PORTLET-->
					<div class="portlet">
						<div class="portlet-title">
							<div class="caption">
								<i class="fa fa-shopping-cart"></i>Advance Table
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
						<div class="portlet-body">
							<div class="table-responsive">
								<table class="table table-striped table-bordered table-advance table-hover">
								<thead>
								<tr>
									<th>
										<i class="fa fa-briefcase"></i> From
									</th>
									<th class="hidden-xs">
										<i class="fa fa-question"></i> Descrition
									</th>
									<th>
										<i class="fa fa-bookmark"></i> Total
									</th>
									<th>
									</th>
								</tr>
								</thead>
								<tbody>
								<tr>
									<td>
										<a href="#">
											 Pixel Ltd
										</a>
									</td>
									<td class="hidden-xs">
										 Server hardware purchase
									</td>
									<td>
										 52560.10$
										<span class="label label-sm label-success label-mini">
											 Paid
										</span>
									</td>
									<td>
										<a href="#" class="btn default btn-xs green-stripe">
											 View
										</a>
									</td>
								</tr>
								<tr>
									<td>
										<a href="#">
											 Smart House
										</a>
									</td>
									<td class="hidden-xs">
										 Office furniture purchase
									</td>
									<td>
										 5760.00$
										<span class="label label-sm label-warning label-mini">
											 Pending
										</span>
									</td>
									<td>
										<a href="#" class="btn default btn-xs blue-stripe">
											 View
										</a>
									</td>
								</tr>
								<tr>
									<td>
										<a href="#">
											 FoodMaster Ltd
										</a>
									</td>
									<td class="hidden-xs">
										 Company Anual Dinner Catering
									</td>
									<td>
										 12400.00$
										<span class="label label-sm label-success label-mini">
											 Paid
										</span>
									</td>
									<td>
										<a href="#" class="btn default btn-xs blue-stripe">
											 View
										</a>
									</td>
								</tr>
								<tr>
									<td>
										<a href="#">
											 WaterPure Ltd
										</a>
									</td>
									<td class="hidden-xs">
										 Payment for Jan 2013
									</td>
									<td>
										 610.50$
										<span class="label label-sm label-danger label-mini">
											 Overdue
										</span>
									</td>
									<td>
										<a href="#" class="btn default btn-xs red-stripe">
											 View
										</a>
									</td>
								</tr>
								</tbody>
								</table>
							</div>
						</div>
					</div>
					<!-- END SAMPLE TABLE PORTLET-->
				</div>
			</div>
			<!-- END PAGE CONTENT-->
		</div>
	</div>
	<!-- END CONTENT -->
</div>
<!-- END CONTAINER -->
<!-- BEGIN FOOTER -->
<div class="footer">
	<div class="footer-inner">
		 2014 &copy; Metronic by keenthemes.
	</div>
	<div class="footer-tools">
		<span class="go-top">
			<i class="fa fa-angle-up"></i>
		</span>
	</div>
</div>
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
<script src="assets/scripts/core/app.js"></script>
<script>
jQuery(document).ready(function() {       
   // initiate layout and plugins
   App.init();
});
</script>
</body>
<!-- END BODY -->
</html>