<!DOCTYPE html>
<!-- 
Template Name: Metronic - Responsive Admin Dashboard Template build with Twitter Bootstrap 3.0.2
Version: 1.5.4
Author: KeenThemes
Website: http://www.keenthemes.com/
Purchase: http://themeforest.net/item/metronic-responsive-admin-dashboard-template/4021469?ref=keenthemes
-->
<!--[if IE 8]> <html lang="en" class="ie8 no-js"> <![endif]-->
<!--[if IE 9]> <html lang="en" class="ie9 no-js"> <![endif]-->
<!--[if !IE]><!--> <html lang="en" class="no-js"> <!--<![endif]-->
<!-- BEGIN HEAD -->
<head>
	<meta charset="utf-8" />
	<title>零食管理系统</title>
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta content="width=device-width, initial-scale=1.0" name="viewport" />
	<meta content="" name="description" />
	<meta content="" name="yaon" />
	<meta name="MobileOptimized" content="320">       	
	<link href="${application.getContextPath()}/scripts/plugins/font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css"/>
	<link href="${application.getContextPath()}/scripts/plugins/bootstrap/css/bootstrap.min.css" rel="stylesheet" type="text/css"/>
	<link href="${application.getContextPath()}/scripts/plugins/uniform/css/uniform.default.css" rel="stylesheet" type="text/css"/>
	<!-- END GLOBAL MANDATORY STYLES -->
	<!-- BEGIN PAGE LEVEL PLUGIN STYLES --> 
	<link href="${application.getContextPath()}/scripts/plugins/gritter/css/jquery.gritter.css" rel="stylesheet" type="text/css"/>
	<link href="${application.getContextPath()}/scripts/plugins/bootstrap-daterangepicker/daterangepicker-bs3.css" rel="stylesheet" type="text/css" />
	<link href="${application.getContextPath()}/scripts/plugins/fullcalendar/fullcalendar/fullcalendar.css" rel="stylesheet" type="text/css"/>
	<link href="${application.getContextPath()}/scripts/plugins/jqvmap/jqvmap/jqvmap.css" rel="stylesheet" type="text/css"/>
	<link href="${application.getContextPath()}/scripts/plugins/jquery-easy-pie-chart/jquery.easy-pie-chart.css" rel="stylesheet" type="text/css"/>
	
	
	<link rel="stylesheet" type="text/css" href="${application.getContextPath()}/scripts/plugins/bootstrap-fileupload/bootstrap-fileupload.css" />
	<link rel="stylesheet" type="text/css" href="${application.getContextPath()}/scripts/plugins/select2/select2_metro.css" />
	<link rel="stylesheet" type="text/css" href="${application.getContextPath()}/scripts/plugins/clockface/css/clockface.css" />
	<link rel="stylesheet" type="text/css" href="${application.getContextPath()}/scripts/plugins/bootstrap-wysihtml5/bootstrap-wysihtml5.css" />
	<link rel="stylesheet" type="text/css" href="${application.getContextPath()}/scripts/plugins/bootstrap-datepicker/css/datepicker.css" />
	<link rel="stylesheet" type="text/css" href="${application.getContextPath()}/scripts/plugins/bootstrap-timepicker/compiled/timepicker.css" />
	<link rel="stylesheet" type="text/css" href="${application.getContextPath()}/scripts/plugins/bootstrap-colorpicker/css/colorpicker.css" />
	<link rel="stylesheet" type="text/css" href="${application.getContextPath()}/scripts/plugins/bootstrap-datetimepicker/css/datetimepicker.css" />
	<link rel="stylesheet" type="text/css" href="${application.getContextPath()}/scripts/plugins/jquery-multi-select/css/multi-select.css" />
	<link rel="stylesheet" type="text/css" href="${application.getContextPath()}/scripts/plugins/bootstrap-switch/static/stylesheets/bootstrap-switch-metro.css"/>
	<link rel="stylesheet" type="text/css" href="${application.getContextPath()}/scripts/plugins/jquery-tags-input/jquery.tagsinput.css" />
	<link rel="stylesheet" type="text/css" href="${application.getContextPath()}/scripts/plugins/bootstrap-markdown/css/bootstrap-markdown.min.css">
	<!-- END PAGE LEVEL PLUGIN STYLES -->
	<!-- BEGIN THEME STYLES --> 
	<link href="${application.getContextPath()}/scripts/css/style-metronic.css" rel="stylesheet" type="text/css"/>
	<link href="${application.getContextPath()}/scripts/css/style.css" rel="stylesheet" type="text/css"/>
	<link href="${application.getContextPath()}/scripts/css/style-responsive.css" rel="stylesheet" type="text/css"/>
	<link href="${application.getContextPath()}/scripts/css/plugins.css" rel="stylesheet" type="text/css"/>
	<link href="${application.getContextPath()}/scripts/css/pages/tasks.css" rel="stylesheet" type="text/css"/>
	<link href="${application.getContextPath()}/scripts/css/themes/light.css" rel="stylesheet" type="text/css" id="style_color"/>
	<link href="${application.getContextPath()}/scripts/css/custom.css" rel="stylesheet" type="text/css"/>
	<!-- END THEME STYLES -->
	<link href="${application.getContextPath()}/skins/default.css" rel="stylesheet" type="text/css" id="style_color"/>
	<script type="text/javascript" src="${application.getContextPath()}/scripts/plugins/jquery-1.10.2.min.js"></script>
	<style type="text/css">
		.row{
		margin-left: 0px !important;
		margin-right: 0px !important;
		}
	</style>
	<script type="text/javascript" src="${application.getContextPath()}/scripts/plugins/jquery-1.10.2.min.js"></script>
	
	<!-- bootstrapValidator 开始 -->
	<link href="${application.getContextPath()}/js/bootstrapValidator/bootstrapValidator.css" rel="stylesheet">
	<script src="${application.getContextPath()}/js/bootstrapValidator/bootstrapValidator.js"></script>
	<script src="${application.getContextPath()}/js/bootstrapValidator/zh_CN.js"></script>
	<!-- bootstrapValidator 结束 -->
</head>
<!-- END HEAD -->
<!-- BEGIN BODY -->
<body class="page-header-fixed">
    <#include "../index/indexTop.ftl" />
	<!-- END HEADER -->
	<div class="clearfix"></div>
	<!-- BEGIN CONTAINER -->
	<div class="page-container">
		<!-- BEGIN SIDEBAR -->
			<#include "../index/indexMenu.ftl" />
		<!-- END SIDEBAR -->
		<!-- BEGIN PAGE -->
		<div class="page-content" >
			<div class="row" >
	<div class="col-md-12">
		<div class="portlet">
			<!--报表正文-->
			<div class="portlet-body">
			<!--报表工具-->
			<div class="navbar navbar-default" role="navigation" method="post" action="${application.getContextPath()}/record/newProduct" style="background:#fff !important;">
				<form class="navbar-form form-inline navbar-left breadcrumb"  id="epinfoForm" onsubmit="return false;" >
					<!--产品分类-->
					<div class="form-group" style="margin-left:8px;">
						<label class="control-label">产品类型:</label>
							<select class="form-control input-small select2me" style="width:165px;" id="qry_typeId">
								<option value="-1" selected>全部</option>
								<#if productTypes ?? && productTypes?size &gt; 0>
									<#list productTypes as p>
										<option value="${(p.typeId)!}" <#if bean?? && bean.typeId?? && p.typeId?number == bean.typeId?number>selected="true"</#if>>${(p.typeName)!}</option>
									</#list>
								</#if>
							</select>
					</div>
					<!-- 产品名称 -->
					<div class="form-group" style="margin-left:8px;">
						<label class="control-label">产品名称:</label>
						<input class="form-control" type="text" id="qry_productName" style="width:160px !important;" value="${(bean.productName)!}" placeholder="请输入产品名称" />
					</div>
					<button class="btn blue" style="height:31px;width:62px;margin-top:-6px;margin-left:10px;" id="querybtn">查询</button>
				</form>
			</div>
			<!-- 查询条件 -->
			<form  action="${application.getContextPath()}/record/newProduct" id="pageForm" role="search" method="post" >
				<!--产品分类-->
				<input type="hidden" id="typeId" name="typeId" value="${(bean.typeId)!}"/>
				<!--产品名称-->
				<input type="hidden" id="productName" name="productName" value="${(bean.productName)!}"/>
				<!--分页-->
				<input type="hidden" id="pageIndex" name="pageIndex" value="${(page.pageIndex)!1}"/>
				<input type="hidden" id="pageSize" name="pageSize" value="${(page.pageSize)!10}"/>
			</form>
				
				<div class="table-toolbar">
					<div class="btn-group">
						<button class="btn blue editUser">
						 <i class="fa fa-plus"></i> &nbsp;新增产品
						</button>
					</div>
				</div>
				<!--报表列属性名-->
				<form id="submitform" action="${application.getContextPath()}/record/newProduct" method="post">
					<div class="table-responsive table-scrollable" style="height:<#if !(page.list??) ||  page.list?size == 0>111<#else>${((page.list?size+2)*37)!}</#if>px;">
						<table class="table table-striped table-hover table-bordered dataTable" id="sample_editable_1">
							<thead>
								<tr style="background-color:#EAEAEA;">
									<th style="text-align:center;width:12%;">产品名称</th>
									<th style="text-align:center;width:7%;">产品类型</th>
									<th style="text-align:center;width:7%;">省级代理</th>
									<th style="text-align:center;width:7%;">市级代理</th>
									<th style="text-align:center;width:7%;">特约代理</th>
									<th style="text-align:center;width:7%;">终端代理</th>
									<th style="text-align:center;width:7%;">统一零售价</th>
									<th style="text-align:center;width:7%;">克数(g)</th>
									<th style="text-align:center;width:7%;">保质期(月)</th>
									<th style="text-align:center;width:7%;">产品状态</th>
									<th style="text-align:center;width:12%;">修改时间</th>
									<th style="text-align:center;width:13%;">操作</th>
								</tr>
							</thead>
							<tbody>
								 <#if page.list?? &&  page.list?size &gt; 0>
									<#list page.list as p>
										 <tr style="height:37px;<#if p_index==page.list?size-1>border-bottom:1px #dddddd  solid;</#if>">
											<td align='center'>${(p.name)!}</td>
											<td align='center'>${(p.typeName)!}</td>
											<td align='center'>${(p.agent1Price)!}</td>
											<td align='center'>${(p.agent2Price)!}</td>
											<td align='center'>${(p.agent3Price)!}</td>
											<td align='center'>${(p.agent4Price)!}</td>
											<td align='center'>${(p.salePrice)!}</td>
											<td align='center'>${(p.grammage)!}</td>
											<td align='center'>${(p.expiration)!}</td>
											<td align='center'>
												<#if (p.state)?? && p.state==1>在售</#if>
												<#if (p.state)?? && p.state==0>下架</#if>
											</td>
											<td align='center'>${(p.modifyTime)!}</td>
											<td align='center' colspan="3">
												<a class="editUser" href="#" id="${(p.id)!}">修改</a>|
												<a class="resSta changeUserState" align='center' href="#" id="${(p.id)!}" _islock="${(p.state)!}" >
													<#if (p.state)?? && p.state==1>下架</#if>
													<#if (p.state)?? && p.state==0>在售</#if>
												</a>
													|
												<a class="deleteUser" href="#" id="${(p.id)!}" un="${(p.name)!}" userid="${(p.id)!}">删除</a>
											</td>
										</tr>
									</#list>
								<#else>
									<tr>
										<td colspan="11" align='center' style="height:37px;border-bottom:1px #dddddd  solid;">还没有数据</td>
									</tr>
								</#if>
							</tbody>
						</table>
					</div>
				</form>
				<div id="containerPage"></div>
				<div class="clearfix"></div>
			</div>
		</div>
	</div>
</div>
		</div>
	
		<!--dialog请求层-->
		<div id="ajax-modal" class="modal fade" tabindex="-1"></div>
		<div class="modal fade" id="ajax" tabindex="-1" role="basic" aria-hidden="true">
		</div>
	</div>
	<!--分页-->
	<script type="text/javascript" src="${application.getContextPath()}/js/ejs_production.js"></script>
	<script type="text/javascript" src="${application.getContextPath()}/scripts/scripts/table-pages.js"></script>	
	
	<script type="text/javascript" src="${application.getContextPath()}/js/record/productManager.js"></script>
	<!--<script type="text/javascript" src="${application.getContextPath()}/js/userManager/initSelect.js"></script>-->
	<!--复选框 -->
	<script src="${application.getContextPath()}/scripts/plugins/uniform/jquery.uniform.min.js" type="text/javascript" ></script>
	<!--验证--> 	
	<script type="text/javascript" src="${application.getContextPath()}/js/record/validater.js"></script>	
	
	<script type="text/javascript">
	jQuery(document).ready(function() {    
		   PageUtils.init({
				"sync" : true, //异步或者form提交,默认form提交
				"method" : -1,
			   	"lengthMenu": [10, 15, 20, 50],
		        "defaultLength": ${(page.pageSize)!10},      
		        "pageIndex":${(page.pageIndex)!1},
		        "total": ${(page.totalPage)!1},     
		        "form":"pageForm",
		        "displayContainer":"containerPage",
		        "language": "zh"         //语言  zh or en
		   });
		var winHeight = window.screen.height;
		var scHeight = document.body.scrollTop;
		var winHeight = window.screen.height;
		$('.page-content').css('min-height',winHeight);
		$("#modal-backdrop").hide();
    });	
	</script>
</body>
<!-- END BODY -->
</html>