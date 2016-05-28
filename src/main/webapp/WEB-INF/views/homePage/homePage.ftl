<!DOCTYPE html>
<html lang="en" class="no-js">
<head>
	<meta charset="utf-8" />
	<title>零食管理系统</title>
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta content="width=device-width, initial-scale=1.0" name="viewport" />
	<meta content="" name="description" />
	<meta content="" name="yaon" />
	<meta name="MobileOptimized" content="320">
	<!-- BEGIN GLOBAL MANDATORY STYLES -->          
	<link href="${application.getContextPath()}/scripts/plugins/font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css"/>
	<link href="${application.getContextPath()}/scripts/plugins/bootstrap/css/bootstrap.min.css" rel="stylesheet" type="text/css"/>
	<!-- END GLOBAL MANDATORY STYLES -->
	<!-- BEGIN PAGE LEVEL PLUGIN STYLES --> 
	<link href="${application.getContextPath()}/scripts/plugins/bootstrap-daterangepicker/daterangepicker-bs3.css" rel="stylesheet" type="text/css" />
	<!-- END PAGE LEVEL PLUGIN STYLES -->
	<!-- BEGIN THEME STYLES --> 
	<link href="${application.getContextPath()}/scripts/css/style-metronic.css" rel="stylesheet" type="text/css"/>
	<link href="${application.getContextPath()}/scripts/css/style.css" rel="stylesheet" type="text/css"/>
	<link href="${application.getContextPath()}/scripts/css/style-responsive.css" rel="stylesheet" type="text/css"/>
	<link href="${application.getContextPath()}/scripts/css/plugins.css" rel="stylesheet" type="text/css"/>
	<link href="${application.getContextPath()}/scripts/css/themes/light.css" rel="stylesheet" type="text/css" id="style_color"/>
	<!-- END THEME STYLES -->
	<link href="${application.getContextPath()}/scripts/plugins/metronic_v4.5.6/global/css/components.min.css" rel="stylesheet" type="text/css" id="style_color"/>
	<link href="${application.getContextPath()}/skins/default.css" rel="stylesheet" type="text/css" id="style_color"/>
	<script type="text/javascript" src="${application.getContextPath()}/scripts/plugins/jquery-1.10.2.min.js"></script>
	
	<script type="text/javascript" src="${application.getContextPath()}/scripts/plugins/echarts3/echarts.min.js"></script>
	<script type="text/javascript" src="${application.getContextPath()}/scripts/plugins/echarts3/macarons.js"></script>
</head>
<body class="page-header-fixed">
	<!-- 上框 开始 -->   
	<#include "../index/indexTop.ftl" />
	<!-- 上框 结束 -->
	<div class="clearfix"></div>
	<!-- BEGIN CONTAINER -->
	<div class="page-container">
		<!-- 左边菜单 开始 -->
		<#include "../index/indexMenu.ftl" />
		<!-- 左边菜单 结束 -->
		<div class="page-content">
	        <!-- BEGIN PAGE TITLE-->
	        <h3 class="page-title" style="width:95%;float:left;margin-left:40px;margin-top:20px;">运营情况
	            <small>收支 & 热销</small>
	        </h3>
	        <!-- END PAGE TITLE-->
			<!-- BEGIN DASHBOARD STATS 1-->
            <div class="row" style="width:95%;float:left;margin-left:25px;">
                <div class="col-lg-3 col-md-3 col-sm-6 col-xs-12">
                    <a class="dashboard-stat dashboard-stat-v2 red" href="#">
                        <div class="visual">
                            <i class="fa fa-bar-chart-o"></i>
                        </div>
                        <div class="details">
                            <div class="number">
                                <span data-counter="counterup" data-value="${(total.totalProfit)!'0.00'}">0.00</span>￥
                             </div>
                            <div class="desc">累计利润</div>
                        </div>
                    </a>
                </div>
                <div class="col-lg-3 col-md-3 col-sm-6 col-xs-12">
                    <a class="dashboard-stat dashboard-stat-v2 blue" href="#">
                        <div class="visual">
                            <i class="fa fa-comments"></i>
                        </div>
                        <div class="details">
                            <div class="number">
                                <span data-counter="counterup" data-value="${(total.totalStock)!'0'}">0</span>
                            </div>
                            <div class="desc">累计进货</div>
                        </div>
                    </a>
                </div>
                <div class="col-lg-3 col-md-3 col-sm-6 col-xs-12">
                    <a class="dashboard-stat dashboard-stat-v2 green" href="#">
                        <div class="visual">
                            <i class="fa fa-shopping-cart"></i>
                        </div>
                        <div class="details">
                            <div class="number">
                                <span data-counter="counterup" data-value="${(total.stockNums)!'0'}">0</span>
                            </div>
                            <div class="desc">库存数量</div>
                        </div>
                    </a>
                </div>
                <div class="col-lg-3 col-md-3 col-sm-6 col-xs-12">
                    <a class="dashboard-stat dashboard-stat-v2 purple" href="#">
                        <div class="visual">
                            <i class="fa fa-globe"></i>
                        </div>
                        <div class="details">
                            <div class="number">
                                <span data-counter="counterup" data-value="${(total.customerNums)!'0'}">0</span>
                            </div>
                            <div class="desc">拥有客户</div>
                        </div>
                    </a>
                </div>
            </div>
            <div class="clearfix"></div>
            <!-- END DASHBOARD STATS 1-->
			<!-- 分隔线  -->
			<div style="width: 97%;float: left;margin-left:10px;argin-bottom:30px;vertical-align:middle;">
				<div style="border-top:3px solid #ddd;height:1px;width: 100%;float: left;"></div>
			</div>
			<div class="row">
				<div class="col-md-12">
					<div style="width:95%;height:400px;float:left;margin-top:20px;margin-left:40px;">
					    <!--累计盈利-->
						<div id="chart4Line" class="main" style="width:60%;height:400px;float:left;">
							<div class="clearfix"></div>
						</div>
						<!--当天收支情况-->
						<div id="chart4Pie" class="main" style="width:35%;height:400px;margin-left:40px;float:right;">
							<div class="clearfix"></div>
						</div>
					</div>
					<!-- 分隔线  -->
					<div style="width: 97%;float: left;margin-top:30px;margin-left:10px;argin-bottom:30px;vertical-align:middle;">
						<div style="border-top:3px solid #ddd;height:1px;width: 100%;float: left;"></div>
					</div>
					<div style="width:95%;height:400px;float:left;margin-top:20px;margin-left:40px;">
					    <!--销量排行topN-->
						<div id="chart4Bar" class="main" style="width:100%;height:400px;float:left;">
							<div class="clearfix"></div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<script src="http://cdnjs.cloudflare.com/ajax/libs/waypoints/2.0.3/waypoints.min.js"></script>
	<script src="${application.getContextPath()}/scripts/plugins/metronic_v4.5.6/global/plugins/counterup/jquery.counterup.min.js"></script>
	<script src="${application.getContextPath()}/scripts/plugins/metronic_v4.5.6/global/plugins/counterup/jquery.waypoints.min.js"></script>
	<!--自定义js-->
	<script type="text/javascript" src="${application.getContextPath()}/js/homePage/homePage.js"></script>
	<script type="text/javascript">
		$(document).ready(function(){
			var winHeight = window.screen.height;
			var scHeight = document.body.scrollTop;
			var winHeight = window.screen.height;
			$('.page-content').css('min-height',winHeight);
			$("#modal-backdrop").hide();
		});
	</script>
</body>
</html>