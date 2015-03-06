<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%-- <%@ include file="/WEB-INF/inc/taglib.inc"%> --%>
<%-- <%@ include file="/WEB-INF/inc/constants.inc"%> --%>
<!DOCTYPE html>
<!--[if IE 8]> <html lang="en" class="ie8 no-js"> <![endif]-->
<!--[if IE 9]> <html lang="en" class="ie9 no-js"> <![endif]-->
<!--[if !IE]><!-->
<html class="no-js">
<!--<![endif]-->
<!-- BEGIN HEAD -->
<head>
<meta charset="utf-8"/>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta http-equiv="Content-Language" content="zh-cn" />
<title>资源管理</title>
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta content="width=device-width, initial-scale=1.0" name="viewport"/>
<meta content="" name="description"/>
<meta content="" name="author"/>
<%@ include file="/WEB-INF/jsp/inc/headerImport.jsp"%>
<!-- BEGIN GLOBAL MANDATORY STYLES 
<link href="http://fonts.googleapis.com/css?family=Open+Sans:400,300,600,700&subset=all" rel="stylesheet" type="text/css"/>-->
<link href="${ctx}/assets/plugins/font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css"/>
<link href="${ctx}/assets/plugins/bootstrap/css/bootstrap.min.css" rel="stylesheet" type="text/css"/>
<link href="${ctx}/assets/plugins/uniform/css/uniform.default.min.css" rel="stylesheet" type="text/css"/>
<!-- END GLOBAL MANDATORY STYLES -->
<!-- BEGIN PAGE LEVEL STYLES -->
<link rel="stylesheet" type="text/css" href="${ctx}/assets/plugins/select2/select2.css"/>
<link rel="stylesheet" type="text/css" href="${ctx}/assets/plugins/select2/select2-metronic.css"/>
<link rel="stylesheet" href="${ctx}/assets/plugins/data-tables/DT_bootstrap.css"/>
<!-- END PAGE LEVEL STYLES -->
<!-- BEGIN THEME STYLES -->
<link href="${ctx}/assets/css/style-metronic.css" rel="stylesheet" type="text/css"/>
<link href="${ctx}/assets/css/style.css" rel="stylesheet" type="text/css"/>
<link href="${ctx}/assets/css/style-responsive.css" rel="stylesheet" type="text/css"/>
<link href="${ctx}/assets/css/plugins.css" rel="stylesheet" type="text/css"/>
<link href="${ctx}/assets/css/themes/default.css" rel="stylesheet" type="text/css" id="style_color"/>
<link href="${ctx}/assets/css/custom.css" rel="stylesheet" type="text/css"/>
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
								资源管理
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
							<li class="active">
								<a data-toggle="tab" href="#tab_2_2">
									 资源列表
								</a>
							</li>
							<li>
								<a href="add?init=true">
									 新增资源
								</a>
							</li>
							
						</ul>
						<div class="tab-content">
							<div id="tab_2_2" class="tab-pane active">
								<div class="row">
									<div class="col-md-12">
									<!-- BEGIN FORM-->
										<form action="initial" id="queryForm" name="queryForm" method="post" class="form-horizontal">
										<input type="hidden" name="query" id="query" value="false"/>
										<div class="portlet box red">
									<div class="portlet-title">
										<div class="caption">
											<i class="fa fa-reorder"></i>查询条件
										</div>
										<div class="tools">
											<a href="javascript:;" class="collapse" title="单击展开">
											</a>
<!-- 											<a href="#portlet-config" data-toggle="modal" class="config"> -->
<!-- 											</a> -->
<!-- 											<a href="javascript:;" class="reload"> -->
<!-- 											</a> -->
<!-- 											<a href="javascript:;" class="remove"> -->
<!-- 											</a> -->
										</div>
									</div>
									<div class="portlet-body form" style="display: blocked;">
										
											<div class="form-body">
<!-- 												<h3 class="form-section">Person Info</h3> -->
												<div class="row">
													<div class="col-md-6">
														<div class="form-group">
															<label class="control-label col-md-3">资源名</label>
															<div class="col-md-9">
																<input type="text" class="form-control" name="resourceName" placeholder="资源名">
																<span class="help-block">
																	 搜索资源名称
																</span>
															</div>
														</div>
													</div>
													<!--/span-->
													<div class="col-md-6">
														<div class="form-group">
															<label class="control-label col-md-3">资源URL</label>
															<div class="col-md-9">
																<input type="text" class="form-control" name="resourceUrl" placeholder="资源URL">
<!-- 																<select name="foo" class="select2me form-control"> -->
<!-- 																	<option value="1">Abc</option> -->
<!-- 																	<option value="1">Abc</option> -->
<!-- 																	<option value="1">This is a really long value </option> -->
<!-- 																</select> -->
																<span class="help-block">
																	 例如：/user/login
																</span>
															</div>
														</div>
													</div>
													<!--/span-->
												</div>
												<!--/row-->
												<div class="row">
													<div class="col-md-6">
														<div class="form-group">
															<label class="control-label col-md-3">资源类型</label>
															<div class="col-md-9">
																<select class="form-control">
																	<option value="action">Action</option>
																	<option value="url">Url</option>
																</select>
																<span class="help-block">
																	 选择相应的资源类型
																</span>
															</div>
														</div>
													</div>
													<!--/span-->
													<div class="col-md-6">
														<div class="form-group">
															<label class="control-label col-md-3">菜单模块</label>
															<div class="col-md-9">
																<select class="select2_category form-control" data-placeholder="选择所属的模块" tabindex="1">
																	<option value="">全部模块</option>
																	<c:forEach items="${menuList}" var="menu" varStatus="st">
																	<option value="${menu.moduleId}">${menu.moduleName}</option>
																	</c:forEach>
																</select>
																<span class="help-block">
																	 选择相应的模块
																</span>
															</div>
														</div>
													</div>
													<!--/span-->
												</div>
												<!--/row-->
												<div class="row">
													<div class="col-md-6">
														<div class="form-group">
															<label class="control-label col-md-3">是否启用</label>
															<div class="col-md-9">
<!-- 																<select class="select2_category form-control" data-placeholder="Choose a Category" tabindex="1"> -->
<!-- 																	<option value="Category 1">Category 1</option> -->
<!-- 																	<option value="Category 2">Category 2</option> -->
<!-- 																	<option value="Category 3">Category 5</option> -->
<!-- 																	<option value="Category 4">Category 4</option> -->
<!-- 																</select> -->
																<div class="radio-list">
																	<label class="radio-inline">
																	<input type="radio" name="enabled" value="1" checked/>
																	是 </label>
																	<label class="radio-inline">
																	<input type="radio" name="enabled" value="0"/>
																	否 </label>
																</div>
															</div>
														</div>
													</div>
													<!--/span-->
													<div class="col-md-6">
														<div class="form-group">
															<label class="control-label col-md-3">默认URL</label>
															<div class="col-md-9">
																<div class="radio-list">
																	<label class="radio-inline">
																	<input type="radio" name="defaults" value="" checked/>
																	全部 </label>
																	<label class="radio-inline">
																	<input type="radio" name="defaults" value="true"/>
																	是 </label>
																	<label class="radio-inline">
																	<input type="radio" name="defaults" value="false"/>
																	否 </label>
																</div>
															</div>
														</div>
													</div>
													<!--/span-->
												</div>
											</div>
											<div class="form-actions fluid">
												<div class="row">
													<div class="col-md-6">
														<div class="col-md-offset-3 col-md-9">
															<button type="button" id="queryButton" class="btn blue">查询</button>
															<button type="button" class="btn default">取消</button>
														</div>
													</div>
													<div class="col-md-6">
													</div>
												</div>
											</div>
										
									</div>
								</div>
								</form>
								<!-- BEGIN EXAMPLE TABLE PORTLET-->
					<div class="portlet box red">
						<div class="portlet-title">
							<div class="caption">
								<i class="fa fa-edit"></i>资源列表
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
							<div class="table-toolbar">
								<div class="btn-group">
									<button id="sample_editable_1_new" class="btn blue">
									新增资源 <i class="fa fa-plus"></i>
									</button>
								</div>
								<div class="btn-group pull-right">
									<button class="btn dropdown-toggle" data-toggle="dropdown">Tools <i class="fa fa-angle-down"></i>
									</button>
									<ul class="dropdown-menu pull-right">
										<li>
											<a href="#">
												 打印
											</a>
										</li>
										<li>
											<a href="#">
												 另存为PDF
											</a>
										</li>
										<li>
											<a href="#">
												 导出为Excel
											</a>
										</li>
									</ul>
								</div>
							</div>
							<form action="resources/add" method="post" id="editedForm">
							<table class="table table-striped table-hover table-bordered" id="sample_editable_1">
							<thead>
							<tr>
								<th>
									 资源名
								</th>
								<th>
									 资源类型
								</th>
								<th>
									 资源URL
								</th>
								<th>
									 资源描述
								</th>
								<th>是否可用
								</th>
								<th>默认URL
								</th>
								<th>菜单模块
								</th>
								<th>菜单中显示
								</th>
								<th>
									 Edit
								</th>
								<th>
									 Delete
								</th>
							</tr>
							</thead>
							<tbody>
							<c:forEach items="${listResult}" var="resource" varStatus="st">
							<tr>
								<td>
									 ${resource.resourceName}
								</td>
								<td>
									 ${resource.resourceType }
								</td>
								<td>
									 ${resource.resourceUrl }
								</td>
								<td class="center">
									 ${resource.resourceDesc }
								</td>
								<td>
									 <c:if test="${resource.enabled eq 1}">是</c:if><c:if test="${resource.enabled eq 0}">否</c:if>
								</td>
								<td>
									 <c:if test="${resource.defaults == true}">是</c:if><c:if test="${resource.defaults == false}">否</c:if>
								</td>
								<td>
								<c:forEach items="${menuList}" var="module">
									<c:if test="${resource.moduleId eq module.moduleId}">${module.moduleName}</c:if>
								</c:forEach>
								</td>
								<td>
									 <c:if test="${resource.showInMenu == true}">是</c:if><c:if test="${resource.showInMenu == false}">否</c:if>
								</td>
								<td>
									<a class="edit" href="javascript:;">
										 Edit
									</a>
								</td>
								<td>
									<a class="delete" href="javascript:;">
										 Delete
									</a>
								</td>
							</tr>
							</c:forEach>
							</tbody>
							</table>
							</form>
						</div>
						
						
					</div>
<!-- 					</form> -->
										<!-- END FORM-->			
					<!-- 分页标签 -->
					<v:page formName="queryForm" beanName="page"></v:page>
					<!-- END EXAMPLE TABLE PORTLET-->
									</div>
									
								</div>
								
							</div>
							<!--end tab-pane-->
<!-- 							<div id="tab_1_3" class="tab-pane"> -->
<!-- 								<div class="margin-top-20"> -->
<!-- 									<ul class="pagination"> -->
<!-- 										<li> -->
<!-- 											<a href="#"> -->
<!-- 												 Prev -->
<!-- 											</a> -->
<!-- 										</li> -->
<!-- 										<li> -->
<!-- 											<a href="#"> -->
<!-- 												 1 -->
<!-- 											</a> -->
<!-- 										</li> -->
<!-- 										<li> -->
<!-- 											<a href="#"> -->
<!-- 												 2 -->
<!-- 											</a> -->
<!-- 										</li> -->
<!-- 										<li class="active"> -->
<!-- 											<a href="#"> -->
<!-- 												 3 -->
<!-- 											</a> -->
<!-- 										</li> -->
<!-- 										<li> -->
<!-- 											<a href="#"> -->
<!-- 												 4 -->
<!-- 											</a> -->
<!-- 										</li> -->
<!-- 										<li> -->
<!-- 											<a href="#"> -->
<!-- 												 5 -->
<!-- 											</a> -->
<!-- 										</li> -->
<!-- 										<li> -->
<!-- 											<a href="#"> -->
<!-- 												 Next -->
<!-- 											</a> -->
<!-- 										</li> -->
<!-- 									</ul> -->
<!-- 								</div> -->
<!-- 							</div> -->
							<!--end tab-pane-->
							
							
						</div>
					</div>
							
					
				</div>
			</div>
			
			
			<!-- END PAGE CONTENT -->
		</div>
	</div>
	<!-- END CONTENT -->
</div>
<!-- END CONTAINER -->
<!-- BEGIN FOOTER -->
<jsp:include page="/WEB-INF/jsp/common/main-footer.jsp"/>
<!-- END FOOTER -->
<!-- BEGIN JAVASCRIPTS(Load javascripts at bottom, this will reduce page load time) -->
<!-- BEGIN CORE PLUGINS -->
<!--[if lt IE 9]>
<script src="${ctx}/assets/plugins/respond.min.js"></script>
<script src="${ctx}/assets/plugins/excanvas.min.js"></script> 
<![endif]-->
<script src="${ctx}/assets/plugins/jquery-1.10.2.min.js" type="text/javascript"></script>
<script src="${ctx}/assets/plugins/jquery-migrate-1.2.1.min.js" type="text/javascript"></script>
<script src="${ctx}/assets/plugins/bootstrap/js/bootstrap.min.js" type="text/javascript"></script>
<script src="${ctx}/assets/plugins/bootstrap-hover-dropdown/bootstrap-hover-dropdown.min.js" type="text/javascript"></script>
<script src="${ctx}/assets/plugins/jquery-slimscroll/jquery.slimscroll.min.js" type="text/javascript"></script>
<script src="${ctx}/assets/plugins/jquery.blockui.min.js" type="text/javascript"></script>
<script src="${ctx}/assets/plugins/jquery.cokie.min.js" type="text/javascript"></script>
<script src="${ctx}/assets/plugins/uniform/jquery.uniform.min.js" type="text/javascript"></script>
<!-- END CORE PLUGINS -->
<!-- BEGIN PAGE LEVEL PLUGINS -->
<script type="text/javascript" src="${ctx}/assets/plugins/select2/select2.min.js"></script>
<script type="text/javascript" src="${ctx}/assets/plugins/data-tables/jquery.dataTables.min.js"></script>
<script type="text/javascript" src="${ctx}/assets/plugins/data-tables/DT_bootstrap.js"></script>
<!-- END PAGE LEVEL PLUGINS -->
<!-- BEGIN PAGE LEVEL SCRIPTS -->
<script src="${ctx}/assets/scripts/core/app.js"></script>
<script src="${ctx}/assets/scripts/custom/table-editable.js"></script>
<script type="text/javascript" src="<c:url value='/js/common-utils.js'/>"></script>
<script>
jQuery(document).ready(function() {   
   App.init();
   TableEditable.init();
   $('#queryButton').click(function(){
		$('#query').val('true');
		$("#queryForm").submit();
	});
});

function deleteRes(id) {
	$.dialog.confirm('你确定要删除这条资源吗？', function(){
		$.ajax({
            type:"post",
            dataType:"text",
            url: '${ctx}/users/resources-delete.htm?resourceId=' + id,
            success: function(msg){
            	$('#tr'+id).remove();
            },
            error: function (msg) {
                alert(msg.responseText);
            }
        });
	}, function(){
	    $.dialog.tips('您放弃删除。');
	});
}

	//修改实体
function editRes(id) {
	 window.location.href = 'resources-input.htm?init=true&resourceId='+id;
}
</script>
</body>
<!-- END BODY -->
</html>
