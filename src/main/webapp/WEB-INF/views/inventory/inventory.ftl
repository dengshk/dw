<!DOCTYPE html>
<html lang="en" class="no-js">
<head>
	<meta charset="utf-8" />
	<title>零食管理系统</title>
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta content="width=device-width, initial-scale=1.0" name="viewport" />
	<meta content="" name="description" />
	<meta content="" name="tc" />
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
		.row {
		    margin-left: 0;
		    margin-right: 0;
		}
	</style>
</head>
<!-- END HEAD -->
<!-- BEGIN BODY -->
<body class="page-header-fixed">
	<!-- BEGIN HEADER -->   
	<#include "../index/indexTop.ftl" />
	<!-- END HEADER -->
	<div class="clearfix"></div>
	<!-- BEGIN CONTAINER -->
	<div class="page-container">
		<!-- BEGIN SIDEBAR -->
		<#include "../index/indexMenu.ftl" />
		<!-- END SIDEBAR -->
		<!-- BEGIN PAGE -->
		<div class="page-content" style="min-height:550px;">
			<div class="row">
				<div id="pageTable">
					<div class="col-md-12">
					<!-- title-->
						<div class="portlet ">
							<div class="portlet-body">
								<!--报表工具-->
								<div class="navbar navbar-default" role="navigation" method="post" action="${application.getContextPath()}/inventory/inventory" style="background:#fff !important;">
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
										<!-- 库存数量 -->
										<div class="form-group" style="margin-left:8px;">
											<label class="control-label">库存数量:&lt;=</label>
											<input class="form-control" type="text" id="qry_nums" style="width:160px !important;" value="${(bean.nums)!}" placeholder="请输入查询库存数量"
													onkeyup="this.value=this.value.replace(/\D/g,'')" onafterpaste="this.value=this.value.replace(/\D/g,'')" />
										</div>
										<button class="btn blue" style="height:31px;width:62px;margin-top:-6px;margin-left:10px;" id="querybtn">查询</button>
									</form>
								</div>
								<!-- 查询条件 -->
								<form  action="${application.getContextPath()}/inventory/inventory" id="pageForm" role="search" method="post" >
									<!--产品分类-->
									<input type="hidden" id="typeId" name="typeId" value="${(bean.typeId)!}"/>
									<!--产品名称-->
									<input type="hidden" id="productName" name="productName" value="${(bean.productName)!}"/>
									<!--库存数量-->
									<input type="hidden" id="nums" name="nums" value="${(bean.nums)!}"/>
									<!--分页-->
									<input type="hidden" id="pageIndex" name="pageIndex" value="${(page.pageIndex)!1}"/>
									<input type="hidden" id="pageSize" name="pageSize" value="${(page.pageSize)!10}"/>
								</form>
								<!--表单开始   开始-->
								<div class="table-responsive table-scrollable">
									<table class="table table-striped table-hover table-bordered mytable" id="sample_editable_1">
										<!--表单title 开始-->
										<thead>
											<tr style="background-color:#EAEAEA;">
													<th style="text-align:center;" >产品名称</th>
													<th style="text-align:center;" >产品类型</th>
													<th style="text-align:center;" >库存数量</th>
													<th style="text-align:center;" >累计进货量</th>
													<th style="text-align:center;" >产品状态</th>
											</tr>
										</thead>
										<!--表单title 结束-->
										<!-- 表单内容 开始 -->
										<tbody>
											<#if page?? && page.list?? &&  page.list?size &gt; 0>
												<#list page.list as ls>
													<tr style="height:37px;<#if ls_index==page.list?size-1>border-bottom:1px #dddddd  solid;</#if>">
														<td style="text-align:center;vertical-align:middle;" >${(ls.name)!'-'}</td>
														<td style="text-align:center;vertical-align:middle;" >${(ls.typeName)!'-'}</td>
														<td style="text-align:center;vertical-align:middle;" >${(ls.nums)!'-'}</td>
														<td style="text-align:center;vertical-align:middle;" >${(ls.accNums)!'-'}</td>
														<td align='center'>
															<#if (ls.state)?? && ls.state==1>在售</#if>
															<#if (ls.state)?? && ls.state==0>下架</#if>
														</td>
													</tr>
												</#list>
											<#else>
												<tr>
													<td colspan="10"  align='center' style="height:37px;border-bottom:1px #dddddd  solid;">还没有数据</td>
												</tr>
											</#if>
										</tbody>
										<!-- 表单内容 结束 -->
									</table>
								</div>
								<!--表单开始   结束-->
							</div>
						</div>
						<div id="resoucesPage"></div>
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
	<!--分页-->
	<script src="${application.getContextPath()}/js/ejs_production.js" type="text/javascript"></script>
	<script src="${application.getContextPath()}/scripts/scripts/table-pages.js" type="text/javascript"></script>
	
	<script type="text/javascript" src="${application.getContextPath()}/js/inventory/inventory.js"></script>
	
	
	<script type="text/javascript">
	jQuery(document).ready(function() {
		    var winHeight = window.screen.height;
			var scHeight = document.body.scrollTop;
			var winHeight = window.screen.height;
			$('.page-content').css('min-height',winHeight);
		 });
		$(function(){
			PageUtils.init({
				"sync" : true, //异步或者form提交,默认form提交
				"lengthMenu": [10, 15, 20, 50],
		        "defaultLength": ${(page.pageSize)!10},      
		        "pageIndex":${(page.pageIndex)!1},
		        "total": ${(page.totalPage)!1},     
		        "form":"pageForm",
		        "displayContainer":"resoucesPage",
		        "language": "zh"         //语言  zh or en
		   });
		   $("#modal-backdrop").hide();
		});
	</script>
	<!-- END JAVASCRIPTS -->
</body>
<!-- END BODY -->
</html>