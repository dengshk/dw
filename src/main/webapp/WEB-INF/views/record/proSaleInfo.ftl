<!DOCTYPE html>
<html lang="en" class="no-js">
<head>
	<meta charset="utf-8" />
	<title>零食管理系统</title>
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta content="width=device-width, initial-scale=1.0" name="viewport" />
	<meta content="" name="description" />
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
								<div class="navbar navbar-default" role="navigation" method="post" action="${application.getContextPath()}/proSale/fetchPage" style="background:#fff !important;">
									<form class="navbar-form form-inline navbar-left breadcrumb"  id="epinfoForm" onsubmit="return false;" >
										<!--时间范围控件       开始-->
										<div class="form-group">
											<label class="control-label">时间范围:</label>
											<div class="form-group" id="reportrange" dateFormat="YYYY.MM.DD" beforNdays="1" timeP="false" timeM="false" showDays="true"  style="width:165px;">
												<div class="input-icon right" data-date-start-date="-30d"  style="width:165px;">
													<input type="text" class="form-control report-input" id="queryTime" name="queryTime" value="${(bean.queryTime)!}" readOnly style=" padding-right: 15px !important;width:165px !important;" />
												</div>
											</div>
										</div>
										<a href="#" onclick="document.getElementById('queryTime').value=''"><i class="fa fa-rotate-left"></i></a>
										<!--时间范围控件       结束-->
										<!-- 订货人 -->
										<div class="form-group" style="margin-left:8px;">
											<label class="control-label">订货人:</label>
											<select class="form-control input-small select2me" style="width:160px !important;" name="customerId" id="customerId">
												<#if customers?? && customers?size &gt; 0>
													<option value="-1">请选择</option>
													<#list customers as p>
														<option value="${(p.id)!}" <#if bean?? && bean.customerId?? && bean.customerId?number == p.id?number>selected="true"</#if>>${(p.customerName)!}</option>
													</#list>
												</#if>
											</select>
											<!--<input class="form-control customerName_auto" name="customerName" nonull="0" value="${(proSaleInfo.customerName)!''}" id="customerName" placeholder="全部" style="width:160px !important;" onclick="$('#customerName').autocomplete('search', document.getElementById('customerName') );"/>-->
										</div>
										<button class="btn blue" style="height:31px;width:62px;margin-top:-6px;margin-left:10px;" id="querybtn">查询</button>
									</form>
								</div>
								<div class="table-toolbar">
									<div class="btn-group">
										<button class="btn blue" style="height:31px;width:82px;margin-top:8px;margin-left:0px;" id="add">新增&nbsp;<i class="fa fa-plus"></i></button>
										<!--
										<button class="btn blue" style="height:31px;width:82px;margin-top:8px;margin-left:10px;" id="export">导出&nbsp;<i class="fa fa-download"></i></button>
										<button class="btn blue" style="height:31px;width:82px;margin-top:8px;margin-left:10px;" id="import">导入&nbsp;<i class="fa fa-upload"></i></button>
										<button class="btn blue" style="height:31px;width:82px;margin-top:8px;margin-left:10px;" fileName="ImportTemplate" id="demo">导入模板&nbsp;<i class="fa fa-file-text-o"></i></button>
										-->
									</div>
									<div class="btn-group pull-right">
									</div>
								</div>
								<!-- 查询条件 -->
								<form  action="${application.getContextPath()}/proSale/fetchPage" id="pageForm" role="search" method="post" >
									<!--时间-->
									<input type="hidden" id="queryTime_query" name="queryTime" value="${(bean.queryTime)!}"/>
									<!--订货人ID-->
									<input type="hidden" id="customerId_query" name="customerId" value="${(bean.customerId)!}"/>
									<!--分页-->
									<input type="hidden" id="pageIndex" name="pageIndex" value="${(page.pageIndex)!1}"/>
									<input type="hidden" id="pageSize" name="pageSize" value="${(page.pageSize)!10}"/>
								</form>
								<form  action="${application.getContextPath()}/proSale/child" id="editPage" role="search" method="post" >
									<!--修改id-->
									<input type="hidden" id="editChild" name="flowId" value=""/>
								</form>
								<!--表单开始   开始-->
								<div class="table-responsive table-scrollable">
									<table class="table table-striped table-hover table-bordered mytable" id="sample_editable_1">
										<!--表单title 开始-->
										<thead>
											<tr style="background-color:#EAEAEA;">
													<th style="text-align:center;width:14%;">订单号</th>
													<th style="text-align:center;width:10%;">订单日期</th>
													<th style="text-align:center;width:8%;">订货人</th>
													<!--
													<th style="text-align:center;width:8%;">是否付款</th>
													<th style="text-align:center;width:8%;">订单状态</th>
													-->
													<th style="text-align:center;width:8%;">产品成本</th>
													<th style="text-align:center;width:8%;">运费/其他</th>
													<th style="text-align:center;width:8%;">销售数量</th>
													<th style="text-align:center;width:8%;">实收款</th>
													<th style="text-align:center;width:8%;">售后利润</th>
													<th colspan="2" style="text-align:center;overflow:hidden;white-space:nowrap;text-overflow:ellipsis;width:12%;">操作</th>
											</tr>
										</thead>
										<!--表单title 结束-->
										<!-- 表单内容 开始 -->
										<tbody>
											<#if page?? && page.list?? &&  page.list?size &gt; 0>
												<#list page.list as ls>
													<tr name="linkToDetail" fid="${(ls.flowId)!}" style="height:37px;<#if ls_index==page.list?size-1>border-bottom:1px #dddddd  solid;</#if>">
														<td style="text-align:center;vertical-align:middle;" >${(ls.flowId)!'-'}</td>
														<td style="text-align:center;vertical-align:middle;" >${(ls.orderDate)!'-'}</td>
														<td style="text-align:center;vertical-align:middle;" >${(ls.customerName)!'-'}</td>
														<!--
														<td style="text-align:center;vertical-align:middle;" >
															<select class="form-control input-small select2me" style="width:165px;" name="pay">
																<#if ls.pay ??>
																	<option value="0" <#if ls.pay?? && ls.pay==0>selected</#if>>未付款</option>
																	<option value="1" <#if ls.pay?? && ls.pay==1>selected</#if>>已付款</option>
																</#if>
															</select>
														</td>
														<td style="text-align:center;vertical-align:middle;" >
															<select class="form-control input-small select2me" style="width:115px;" name="state">
																<#if ls.state ??>
																	<option value="1" <#if ls.state?? && ls.state==1>selected</#if>>已下单</option>
																	<option value="2" <#if ls.state?? && ls.state==2>selected</#if>>已发货</option>
																	<option value="3" <#if ls.state?? && ls.state==3>selected</#if>>已完成</option>
																</#if>
															</select>
														</td>
														-->
														<td style="text-align:center;vertical-align:middle;" >${(ls.tatalCost)!'-'}</td>
														<td style="text-align:center;vertical-align:middle;" >${(ls.expressPrice)!'无'}</td>
														<td style="text-align:center;vertical-align:middle;" >${(ls.saleNum)!'-'}</td>
														<td style="text-align:center;vertical-align:middle;" >${(ls.reallyPay)!'-'}</td>
														<td style="text-align:center;vertical-align:middle;" >${(ls.profit)!'-'}</td>
														<td style="text-align:center;vertical-align:middle;" name="${(ls.flowId)!'-'}">
															<a href="#" class="edit" fid="${(ls.flowId)!}"><span class="fa fa-info"></span>详单</a>
															<!--
															<a href="#" class="save" fid="${(ls.flowId)!}">保存</a>|
															-->
														</td>
														<td style="text-align:center;vertical-align:middle;" name="${(ls.flowId)!'-'}">
															<a href="#" class="delete" fid="${(ls.flowId)!}"><span class="fa fa-times"></span>删除</a>
														</td>
													</tr>
												</#list>
											<#else>
												<tr>
													<td colspan="12"  align='center' style="height:37px;border-bottom:1px #dddddd  solid;">还没有数据</td>
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
	<!-- 开始    日期范围控件脚本  -->
	<script type="text/javascript" src="${application.getContextPath()}/scripts/plugins/bootstrap-daterangepicker/moment.min.js"></script>
	<script type="text/javascript" src="${application.getContextPath()}/scripts/plugins/bootstrap-daterangepicker/daterangepicker_amend.js"></script>
	<script type="text/javascript" src="${application.getContextPath()}/scripts/scripts/form-dateRanges_amend.js"></script>
	<!--分页-->
	<script src="${application.getContextPath()}/js/ejs_production.js" type="text/javascript"></script>
	<script src="${application.getContextPath()}/scripts/scripts/table-pages.js" type="text/javascript"></script>
	
	<script src="${application.getContextPath()}/js/record/proSaleInfo.js" type="text/javascript"></script>
	
	<script type="text/javascript">
	jQuery(document).ready(function() {
			//设置日期控件
			DateRanges.init('reportrange');
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