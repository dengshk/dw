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
	<link href="${application.getContextPath()}/scripts/plugins/bootstrap/css/bootstrap.min.css" rel="stylesheet" type="text/css"/>
	<link href="${application.getContextPath()}/scripts/plugins/font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css"/>
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
		.portlet.box.blue {
		    border-width: 0 1px 1px;
		}
	</style>
	
	
	<!-- 日期引入 开始 -->
	<link href="${application.getContextPath()}/scripts/plugins/bootstrap-datetimepicker-dsk/bootstrap-datetimepicker.css" rel="stylesheet">
	<link href="${application.getContextPath()}/scripts/plugins/bootstrap-datetimepicker-dsk/font-awesome.min.css" rel="stylesheet">
	<link href="${application.getContextPath()}/scripts/plugins/bootstrap-datetimepicker-dsk/prettify-1.0.css" rel="stylesheet">
	<link href="${application.getContextPath()}/scripts/plugins/bootstrap-datetimepicker-dsk/base.css" rel="stylesheet">
	<!-- HTML5 shim and Respond.js IE8 support of HTML5 elements and media queries -->
	<!--[if lt IE 9]>
	    <script src="js/html5shiv.js"></script>
	    <script src="js/respond.min.js"></script>
	<![endif]-->
	<script src="${application.getContextPath()}/scripts/plugins/bootstrap-datetimepicker-dsk/bootstrap.min.js" type="text/javascript"></script>
	<script src="${application.getContextPath()}/scripts/plugins/bootstrap-datetimepicker-dsk/moment-with-locales.js"></script>
	<script src="${application.getContextPath()}/scripts/plugins/bootstrap-datetimepicker-dsk/bootstrap-datetimepicker.js"></script>
	<!-- 日期引入 结束-->
	
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
				    <!-- BEGIN SAMPLE TABLE PORTLET-->
				    <div class="portlet box blue">
				        <div class="portlet-title">
				            <div class="caption">
				                <i class="fa fa-comments"></i>订单信息</div>
				            <div class="tools">
				                <a href="javascript:;" class="collapse"> </a>
				                <a href="#portlet-config" data-toggle="modal" class="config"> </a>
				                <a href="javascript:;" class="reload"> </a>
				                <a href="javascript:;" class="remove"> </a>
				            </div>
				        </div>
				        <div class="portlet-body">
							<div class="navbar navbar-default" role="navigation" method="post" action="${application.getContextPath()}/proSale/saveSaleInfo" style="background:#fff !important;">
								<form class="navbar-form form-inline navbar-left breadcrumb"  id="proInfoForm" onsubmit="return false;" >
									<input name="flowId" type="hidden" id="flowId" value="${(proSaleInfo.flowId)!}"/>
									<!-- 订货人 -->
									<div class="form-group" style="margin-left:8px;">
										<label class="control-label">订货人:</label>
										<select class="form-control input-small select2me" style="width:160px !important;" name="customerId" id="customerId">
											<#if customers?? && customers?size &gt; 0>
												<option value="-1">请选择</option>
												<#list customers as p>
													<option value="${(p.id)!}" <#if proSaleInfo?? && proSaleInfo.customerId?? && proSaleInfo.customerId?number == p.id?number>selected="true"</#if>>${(p.customerName)!}</option>
												</#list>
											</#if>
										</select>
										<!--<input class="form-control customerName_auto" name="customerName" nonull="0" value="${(proSaleInfo.customerName)!''}" id="customerName" placeholder="全部" style="width:160px !important;" onclick="$('#customerName').autocomplete('search', document.getElementById('customerName') );"/>-->
									</div>
									<!-- 顾客等级 -->
									<div class="form-group" style="margin-left:8px;">
										<label class="control-label">顾客等级:</label>
										<select class="form-control input-small select2me" style="width:160px !important;" name="customerLevel" id="customerLevel" disabled="disabled">
											<option value="1" <#if customer?? && customer.customerLevel?? && customer.customerLevel == 1>selected="true"</#if>>省级代理</option>
											<option value="2" <#if customer?? && customer.customerLevel?? && customer.customerLevel == 2>selected="true"</#if>>市级代理</option>
											<option value="3" <#if customer?? && customer.customerLevel?? && customer.customerLevel == 3>selected="true"</#if>>特约代理</option>
											<option value="4" <#if customer?? && customer.customerLevel?? && customer.customerLevel == 4>selected="true"</#if>>终端代理</option>
											<option value="5" <#if customer?? && customer.customerLevel?? && customer.customerLevel == 5>selected="true"</#if>>普通客户</option>
										</select>
									</div>
									<!-- 顾客电话 -->
									<div class="form-group" style="margin-left:8px;">
										<label class="control-label">联系电话:</label>
										<input class="form-control" type="text" id="customerTel" name="customerTel" style="width:160px !important;" value="${(proSaleInfo.customerTel)!}" placeholder="请输入联系电话"/>
									</div>
									<br />
									<br />
									<!--快递详情-->
									<!-- 快递商 -->
									<div class="form-group" style="margin-left:8px;">
										<label class="control-label">快递商:</label>
										<input class="form-control" type="text" id="express" name="express" style="width:160px !important;" value="${(proSaleInfo.express)!}" placeholder="请输入快递商"/>
									</div>
									<!-- 快递单号 -->
									<div class="form-group" style="margin-left:8px;">
										<label class="control-label">快递单号:</label>
										<input class="form-control" type="text" id="expressNo" name="expressNo" style="width:160px !important;" value="${(proSaleInfo.expressNo)!}" placeholder="请输入快递单号"/>
									</div>
									<!-- 收获地址 -->
									<div class="form-group" style="margin-left:8px;">
										<label class="control-label">收获地址:</label>
										<input class="form-control" type="text" id="address" name="address" style="width:320px !important;" value="${(proSaleInfo.address)!}" placeholder="请输入收获地址"/>
									</div>
									<br />
									<br />
									<!--日期控件 -->
						            <div class="form-group" style="margin-left:8px;">
						                <div class='input-group date' id='datetimepicker1' style="width:160px !important;">
						                    <span class="input-group-addon"><span class="glyphicon glyphicon-calendar"></span></span>
						                    <input type='text' class="form-control" value="${(proSaleInfo.orderDate)!}" id="orderDate" name="orderDate" style="width:160px !important;" />
						                </div>
								        <script type="text/javascript">
								            $(function () {
								                $('#datetimepicker1').datetimepicker({
								               		format : 'YYYY-MM-DD',
								               		extraFormats : [ 'YYYY-MM-DD','YYYY/MM/DD','YYYY.MM.DD']
								                });
								            });
								        </script>
						            </div>
						            <!-- 运费 -->
									<div class="form-group" style="margin-left:8px;">
										<label class="control-label">运费其他:</label>
										<input class="form-control" type="text" id="expressPrice" name="expressPrice" style="width:160px !important;" value="${(proSaleInfo.expressPrice)!}" placeholder="请输入运费/其他"/>
									</div>
									<!-- 实收款 -->
									<div class="form-group" style="margin-left:8px;">
										<label class="control-label">实收金额:</label>
										<input class="form-control" type="text" id="reallyPay" name="reallyPay" style="width:160px !important;" value="${(proSaleInfo.reallyPay)!}" placeholder="请输入实际收款"/>
									</div>
									<!--修改-->
									&nbsp;&nbsp;&nbsp;
									<button class="btn blue" style="height:31px;width:75px;margin-top:-6px;margin-left:10px;" type="submit" id="saveBtn">
										<#if proSaleInfo??>
											<span class="glyphicon glyphicon-wrench" aria-hidden="true"></span>&nbsp;修改
										<#else>
											<span class="glyphicon glyphicon-send" aria-hidden="true"></span>&nbsp;保存
										</#if>
									</button>
								</form>
				            </div>
				        </div>
				    </div>
				    <!-- END SAMPLE TABLE PORTLET-->
					<!-- 分隔线  -->
					<div style="width: 100%;argin-bottom:30px;vertical-align:middle;">
						<div style="border-top:3px solid #ddd;height:1px;width:100%;float: left;"></div>
					</div>
		<div class="portlet">
			<!--报表正文-->
			<div class="portlet-body">
			<!--报表工具-->
				<!--新增-->
				<div class="table-toolbar">
					<div class="btn-group">
						<button class="btn blue editUser" style="height:31px;width:82px;margin-top:8px;margin-left:0px;">新增&nbsp;<i class="fa fa-plus"></i></button>
						<button class="btn blue" style="height:31px;width:82px;margin-top:8px;margin-left:10px;"  id="back"  onClick="goBack();">返回&nbsp;<i class="fa fa-mail-reply"></i></button>
					</div>
				</div>
				<!--分页信息-->
				<form id="editPage" action="${application.getContextPath()}/proSale/child" method="post">
					<input type="hidden" id="editChild" name="flowId" value="${(proSaleInfo.flowId)!}"/>
					<input type="hidden" name="pageIndex" value="${(page.pageIndex)!1}" />
					<input type="hidden" name="pageSize" value="${(page.pageSize)!50}" />
				</form>
				<!--报表列属性名-->
				<form id="submitform" action="${application.getContextPath()}/proSale/child" method="post">
					<div class="table-responsive table-scrollable" style="height:<#if !(page??) || !(page.list??) ||  page.list?size == 0>111<#else>${((page.list?size+2)*37)!}</#if>px;">
						<table class="table table-striped table-hover table-bordered dataTable" id="sample_editable_1">
							<thead>
								<tr style="background-color:#EAEAEA;">
									<!--<th class="table-checkbox">
										<span>
											<input class="group-checkable" data-set="#childs .checkboxes" type="checkbox" >
										</span>
									</th>-->
									<th style="text-align:center;width:12%;">产品名称</th>
									<th style="text-align:center;width:9%;">产品类型</th>
									<th style="text-align:center;width:9%;">进货单价</th>
									<th style="text-align:center;width:9%;">销售单价</th>
									<th style="text-align:center;width:9%;">销售数量</th>
									<th style="text-align:center;width:9%;">成本小计</th>
									<th style="text-align:center;width:9%;">应收款小计</th>
									<th style="text-align:center;width:9%;">利润小计</th>
									<th style="text-align:center;width:13%;">修改时间</th>
									<th colspan="2" style="text-align:center;width:12%;">操作</th>
								</tr>
							</thead>
							<tbody>
								 <#if page?? && page.list?? &&  page.list?size &gt; 0>
									<#list page.list as p>
										 <tr style="height:37px;<#if p_index==page.list?size-1>border-bottom:1px #dddddd  solid;</#if>">
											<td align='center'>${(p.productName)!}</td>
											<td align='center'>${(p.typeName)!}</td>
											<td align='center'>${(p.costPrice)!}</td>
											<td align='center'>${(p.salePrice)!}</td>
											<td align='center'>${(p.orderNum)!}</td>
											<td align='center'>${(p.subtotalCost)!}</td>
											<td align='center'>${(p.subtotalReally)!}</td>
											<td align='center'>${(p.subtotalProfit)!}</td>
											<td align='center'>${(p.modifyTime)!}</td>
											<td align='center'>
												<a class="editUser" href="#" fid="${(p.id)!}"><span class="fa fa-wrench"></span>修改</a>
											</td>
											<td align='center'>
												<a class="delete" href="#" fid="${(p.id)!}" fname="${(p.productName)}"><span class="fa fa-times"></span>删除</a>
											</td>
										</tr>
									</#list>
									<tr style="height:37px;font-weight:bold;background-color:#EAEAEA;">
										<td style="text-align:center;vertical-align:middle;" >总计</td>
										<td style="text-align:center;vertical-align:middle;" >-</td>
										<td style="text-align:center;vertical-align:middle;" >-</td>
										<td style="text-align:center;vertical-align:middle;" >-</td>
										<td style="text-align:center;vertical-align:middle;" >${(flowTotal.orderNum)!}</td>
										<td style="text-align:center;vertical-align:middle;" >${(flowTotal.subtotalCost)!}</td>
										<td style="text-align:center;vertical-align:middle;" >${(flowTotal.subtotalReally)!}</td>
										<td style="text-align:center;vertical-align:middle;" >${(flowTotal.subtotalProfit)!}</td>
										<td style="text-align:center;vertical-align:middle;" >-</td>
										<td style="text-align:center;vertical-align:middle;" >-</td>
										<td style="text-align:center;vertical-align:middle;" >-</td>
									</tr>
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
		<div class="modal fade" id="ajax" tabindex="-1" role="basic" aria-hidden="true"></div>
	</div>
	<!--分页-->
	<script type="text/javascript" src="${application.getContextPath()}/js/ejs_production.js"></script>
	<script type="text/javascript" src="${application.getContextPath()}/scripts/scripts/table-pages.js"></script>	

	<script src="${application.getContextPath()}/js/record/proSaleInfoChild.js" type="text/javascript"></script>
	
	<script type="text/javascript">
	jQuery(document).ready(function() {    
		   PageUtils.init({
				"sync" : true, //异步或者form提交,默认form提交
				"method" : -1,
			   	"lengthMenu": [10, 15, 20, 50],
		        "defaultLength": ${(page.pageSize)!50},      
		        "pageIndex":${(page.pageIndex)!1},
		        "total": ${(page.totalPage)!1},     
		        "form":"editPage",
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