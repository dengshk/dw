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
			<div class="navbar navbar-default" role="navigation" method="post" action="${application.getContextPath()}/customer/customer" style="background:#fff !important;">
				<form class="navbar-form form-inline navbar-left breadcrumb"  id="epinfoForm" onsubmit="return false;" >
					<!--顾客等级-->
					<div class="form-group" style="margin-left:8px;">
						<label class="control-label">顾客等级:</label>
							<select class="form-control select2me" style="width:165px;" id="qry_customerLevel">
								<option value="-1">全部</option>
								<option value="5" <#if bean?? && bean.customerLevel?? && bean.customerLevel == 5>selected="true"</#if>>普通客户</option>
								<option value="4" <#if bean?? && bean.customerLevel?? && bean.customerLevel == 4>selected="true"</#if>>终端代理</option>
								<option value="3" <#if bean?? && bean.customerLevel?? && bean.customerLevel == 3>selected="true"</#if>>特约代理</option>
								<option value="2" <#if bean?? && bean.customerLevel?? && bean.customerLevel == 2>selected="true"</#if>>市级代理</option>
								<option value="1" <#if bean?? && bean.customerLevel?? && bean.customerLevel == 1>selected="true"</#if>>省级代理</option>
							</select>
					</div>
					<!--顾客姓名 -->
					<div class="form-group" style="margin-left:8px;">
						<label class="control-label">顾客姓名:</label>
						<input class="form-control" type="text" id="qry_customerName" style="width:160px !important;" value="${(bean.customerName)!}" placeholder="请输入顾客姓名" />
					</div>
					<button class="btn blue" style="height:31px;width:62px;margin-top:-6px;margin-left:10px;" id="querybtn">查询</button>
				</form>
			</div>
			<!-- 查询条件 -->
			<form  action="${application.getContextPath()}/customer/customer" id="pageForm" role="search" method="post" >
				<!--顾客姓名-->
				<input type="hidden" id="customerName_submit" name="customerName" value="${(bean.customerName)!}"/>
				<!--顾客等级-->
				<input type="hidden" id="customerLevel_submit" name="customerLevel" value="${(bean.customerLevel)!}"/>
				<!--分页-->
				<input type="hidden" id="pageIndex" name="pageIndex" value="${(page.pageIndex)!1}"/>
				<input type="hidden" id="pageSize" name="pageSize" value="${(page.pageSize)!10}"/>
			</form>
			
				<div class="table-toolbar">
					<div class="btn-group">
						<button class="btn blue edit">
						 <i class="fa fa-plus"></i> &nbsp;新增顾客
						</button>
					</div>
				</div>
				<!--报表列属性名-->
				<form id="submitform" action="${application.getContextPath()}/customer/customer" method="post">
					<div class="table-responsive table-scrollable" style="height:<#if !(page.list??) ||  page.list?size == 0>111<#else>${((page.list?size+2)*37)!}</#if>px;">
						<table class="table table-striped table-hover table-bordered dataTable" id="sample_editable_1">
							<thead>
								<tr style="background-color:#EAEAEA;">
									<th style="text-align:center;width:10%;">顾客姓名</th>
									<th style="text-align:center;width:10%;">顾客等级</th>
									<th style="text-align:center;width:12%;">联系电话</th>
									<th style="text-align:center;width:22%;">收获地址</th>
									<th style="text-align:center;width:9%;">定购数量(累计)</th>
									<th style="text-align:center;width:9%;">消费金额(累计)</th>
									<th style="text-align:center;width:14%;">修改时间</th>
									<th colspan="2" style="text-align:center;width:12%;">操作</th>
								</tr>
							</thead>
							<tbody>
								 <#if page.list?? &&  page.list?size &gt; 0>
									<#list page.list as p>
										 <tr style="height:37px;<#if p_index==page.list?size-1>border-bottom:1px #dddddd  solid;</#if>">
											<td align='center'>${(p.customerName)!}</td>
											<td align='center'>${(p.customerLevelName)!}</td>
											<td align='center'>${(p.customerTel)!}</td>
											<td align='left'>${(p.address)!}</td>
											<td align='center'>${(p.totalOrder)!}</td>
											<td align='center'>${(p.totalCost)!}</td>
											<td align='center'>${(p.modifyTime)!}</td>
											<td align='center'>
												<a class="edit" href="#" id="${(p.id)!}"><span class="fa fa-wrench"></span>编辑</a>
											</td>
											<td align='center'>
												<a class="delete" href="#" id="${(p.id)!}" cname="${(p.customerName)!}"><span class="fa fa-times"></span>删除</a>
											</td>
										</tr>
									</#list>
								<#else>
									<tr>
										<td colspan="8" align='center' style="height:37px;border-bottom:1px #dddddd  solid;">还没有数据</td>
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
	
	<script type="text/javascript" src="${application.getContextPath()}/js/customer/customer.js"></script>
	
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