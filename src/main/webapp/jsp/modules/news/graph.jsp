<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="zh-cn">
<head>
	<%@ include file="../../static/head.jsp"%>
	<link href="http://www.bootcss.com/p/bootstrap-datetimepicker/bootstrap-datetimepicker/css/datetimepicker.css" rel="stylesheet">
	<script src="${pageContext.request.contextPath}/resources/assets/echarts.min.js"></script>
	<script src="${pageContext.request.contextPath}/resources/assets/macarons.js"></script>
	<style>
		.graph{
			margin: 10px auto;
		}
	</style>
</head>
<body>
	<div class="wrapper compact-wrapper">
		<%@ include file="../../static/mainHeader.jsp"%>
		<!-- Sidebar -->
		<%@ include file="../../static/sidebar.jsp"%>
		<!--面包屑-->
		<div class="main-panel">
			<div class="content">
				<div class="page-inner">
					<div class="page-header">
						<ul class="breadcrumbs">
							<li class="nav-home">
								<a href="#">
									<i class="flaticon-home"></i>
								</a>
							</li>
							<li class="separator">
								<i class="flaticon-right-arrow"></i>
							</li>
							<li class="nav-item">
								<a href="#">新闻资讯</a>
							</li>
						</ul>
					</div>

					<div class="col-md-12">
						<div class="col-md-12">
						<div class="card">
							<div class="card-header">
								<div class="d-flex align-items-center">
									<h4 class="card-title">新闻资讯统计</h4>
									
								</div>
							</div>
							<div class="card-body">
								<div class="table-responsive">
									<div id="add-row_wrapper" class="dataTables_wrapper container-fluid dt-bootstrap4 no-footer">
										<div class="row">
											<div class="col-sm-12 col-md-6">
											</div>
										<div class="col-sm-12 col-md-6">	
										</div>
									</div>
									<div class="row">
									<div class="col-sm-12">
									<!--求和的都放同一个统计图里-->
									<!--<div id="main" style="width: 600px;height:400px;"></div>-->
																																																																							</div>
							</div>
							<div class="row">
								<div class="col-sm-12 col-md-5">
									
								</div>
								<div class="col-sm-12 col-md-7">
									
								</div>
							</div>
								</div>
								</div>
							</div>
						</div>
					</div>
						</div>
					</div>
				</div>
			</div>
		</div>
		
		<!-- End Custom template -->
	
	<!--   Core JS Files   -->
	<script src="${pageContext.request.contextPath}/resources/assets/js/core/jquery.3.2.1.min.js"></script>
	<script src="${pageContext.request.contextPath}/resources/assets/js/core/popper.min.js"></script>
	<script src="${pageContext.request.contextPath}/resources/assets/js/core/bootstrap.min.js"></script>
	<!-- jQuery UI -->
	<script src="${pageContext.request.contextPath}/resources/assets/js/plugin/jquery-ui-1.12.1.custom/jquery-ui.min.js"></script>
	<script src="${pageContext.request.contextPath}/resources/assets/js/plugin/jquery-ui-touch-punch/jquery.ui.touch-punch.min.js"></script>
	
	<!-- jQuery Scrollbar -->
	<script src="${pageContext.request.contextPath}/resources/assets/js/plugin/jquery-scrollbar/jquery.scrollbar.min.js"></script>
	<!-- Datatables -->
	<script src="${pageContext.request.contextPath}/resources/assets/js/plugin/datatables/datatables.min.js"></script>
	<!-- Atlantis JS -->
	<script src="${pageContext.request.contextPath}/resources/assets/js/atlantis.min.js"></script>
	<!-- Atlantis DEMO methods, don't include it in your project! -->
	<!--<script src="${pageContext.request.contextPath}/resources/assets/js/setting-demo2.js"></script> -->
	<script type="text/javascript" charset="utf-8" src="${pageContext.request.contextPath}/resources/assets/datetimepicker/bootstrap-datetimepicker.min.js"></script>
	<script >
		<%@ include file="../../utils/menu.jsp"%>
		<%@ include file="../../static/setMenu.js"%>
		<%@ include file="../../utils/baseUrl.jsp"%>
		var tableName = "news";
		var pageType = "graph";

														
		var valueArr = []
		
														
		$(document).ready(function() { 

			$('#projectName').html(projectName)
			setMenu();
			//设置左上角系统名
			if(projectName.length >14){
				$('.logo-header h2').html(projectName.substring(0,13)+'..')
			}else{
				$('.logo-header h2').html(projectName)
			}
			//设置右上角用户名
			$('.user-box .u-text h4').html(window.sessionStorage.getItem('username'))
			<%@ include file="../../static/color.js"%>
			<%@ include file="../../static/style.jsp"%>
			getDetails();
			//draw();
			<%@ include file="../../static/myInfo.js"%>
		});

		function draw(){
			// 基于准备好的dom，初始化echarts实例
			var myChart = echarts.init(document.getElementById('main'),'macarons');
	
						// 指定图表的配置项和数据
			var option = {
				title: {text : '新闻资讯'},
				tooltip: {},
				legend: {},
				xAxis: {
									data : nameArr
								},
				yAxis: {
								},
				series: [{
					type: graphType,
					data: [
																																								]
				}]
			};
			// 使用刚指定的配置项和数据显示图表。
			myChart.setOption(option);
			
		}
		// 需要调group的字段，一个字段一个统计图
																function getDetails(){
																										}
		// 值 字段 数据绑定
		function dataBindByValue(list){
																							}

		//按值统计
		function byVal(){
		$.ajax({ 
			type: "GET",
			url: baseUrl+"value/news/"+xColumnName+'/'+yColumnName,
			data:{ },
			beforeSend: function(xhr) {
				xhr.setRequestHeader("token", window.sessionStorage.getItem('token'));
			},
			success: function(res){               	
				if(res.code == 0){
					console.log(res.data)
					if(res.data != null){
						dataBindByValue(res.data);
					}
				}else if(res.code == 401){
					<%@ include file="../../static/toLogin.jsp"%>   		
				}else{
					alert(res.msg);
				}
			},
		});
		}


		function group(colName){
			$.ajax({ 
                type: "GET",
                url: baseUrl+"group/news/"+colName,
             	data:{	tableName: "news",
                    	columnName: colName
					 },
                beforeSend: function(xhr) {
                    xhr.setRequestHeader("token", window.sessionStorage.getItem('token'));
                },
                success: function(res){               	
                	if(res.code == 0){
						console.log(res.data)
						if(res.data != null){
							groupDataBind(res.data,colName);
						}
					}else if(res.code == 401){
						<%@ include file="../../static/toLogin.jsp"%>   		
					}else{
						alert(res.msg);
					}
				},
			});
		}
		// 类字段的数据处理
		function groupDataBind(list,colName){
																											
		}
		// 用户登出
        <%@ include file="../../static/logout.jsp"%>
	</script>
</body>
</html>