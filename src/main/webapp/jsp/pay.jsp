<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="zh-cn">
<head>
<%@ include file="static/head.jsp"%>
</head>
<body>
	<div class="wrapper compact-wrapper">
		<%@ include file="static/mainHeader.jsp"%>
		<!-- Sidebar -->
		<%@ include file="static/sidebar.jsp"%>
		<div class="main-panel">
			<div class="content">
				<div class="page-inner">
					<div class="page-header">
						<ul class="breadcrumbs">
							<li class="nav-home"><a
								href="${pageContext.request.contextPath}/index.jsp"> <i
									class="flaticon-home"></i>
							</a></li>
							<li class="separator"><i class="flaticon-right-arrow"></i></li>
							<li class="nav-item"><a
								href="${pageContext.request.contextPath}/jsp/modules/yuangongxinxi/list.jsp">支付</a>
							</li>
						</ul>
					</div>
					<div class="row">
						<div class="col-md-12">
							<div class="card">
								<div class="card-header">
									<div class="card-title">请选择支付方式</div>
								</div>
								<div class="card-body">
									<div class="row">
										<div class="col-md-6 col-lg-4">
											<form id="addOrUpdateForm" method="post">

												<div class="form-group">
													<input type="radio">
													<img id="zhaopianImg" src="${pageContext.request.contextPath}/resources/assets/img/bank/微信支付.png" width="200" height="100"> 
													<input type="radio">
													<img id="zhaopianImg" src="${pageContext.request.contextPath}/resources/assets/img/bank/支付宝支付.png" width="200" height="100"> 
												</div>
												
												<div class="form-group">
													<input type="radio">
													<img id="zhaopianImg" src="${pageContext.request.contextPath}/resources/assets/img/bank/中国银行.png" width="200" height="100"> 
													<input type="radio">
													<img id="zhaopianImg" src="${pageContext.request.contextPath}/resources/assets/img/bank/中国农业银行.png" width="200" height="100"> 
												</div>
												
											</form>
										</div>
									</div>
								</div>
								<div class="card-action">
									<button id="submitBtn" type="button" class="btn btn-success">支付</button>									
								</div>

							</div>
						</div>
					</div>
				</div>
			</div>
		</div>

	</div>
	<!--   Core JS Files   -->
	<script
		src="${pageContext.request.contextPath}/resources/assets/js/core/jquery.3.2.1.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/resources/assets/js/core/popper.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/resources/assets/js/core/bootstrap.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/resources/assets/vue.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/resources/assets/js/jquery.ui.widget.js"></script>
	<script
		src="${pageContext.request.contextPath}/resources/assets/js/jquery.form.js"></script>
	<!-- jQuery UI -->
	<script
		src="${pageContext.request.contextPath}/resources/assets/js/plugin/jquery-ui-1.12.1.custom/jquery-ui.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/resources/assets/js/plugin/jquery-ui-touch-punch/jquery.ui.touch-punch.min.js"></script>

	<!-- jQuery Scrollbar -->
	<script
		src="${pageContext.request.contextPath}/resources/assets/js/plugin/jquery-scrollbar/jquery.scrollbar.min.js"></script>
	<!-- Atlantis JS -->
	<script
		src="${pageContext.request.contextPath}/resources/assets/js/atlantis.min.js"></script>

	<script>
		
		<%@ include file="utils/menu.jsp"%>
			
		<%@ include file="static/setMenu.js"%>
			
		<%@ include file="utils/baseUrl.jsp"%>
		var pageType = "pay";

		// 用户登出
		<%@ include file="static/logout.jsp"%>
		
		function pay() {
	           updateId = window.sessionStorage.getItem('id')
	           var tableName = window.sessionStorage.getItem('tableName')
	            $.ajax({ 
	                type: "POST",
	                url: baseUrl + tableName +"/update",
	                contentType: "application/json",
	                data:JSON.stringify({id: updateId, ispay: "已支付"}),
	                beforeSend: function(xhr) {xhr.setRequestHeader("token", window.sessionStorage.getItem('token'));},
	                success: function(res){    
	                    if(res.code == 0){
	                    window.sessionStorage.removeItem('id');
	                    window.sessionStorage.removeItem('tableName');
	                    alert('支付成功');
	                    window.location.href= "modules/" + tableName +"/list.jsp";
	                    }else if(res.code == 401){
	                        <%@ include file="static/toLogin.jsp"%> 	
	                    }else{
	                        alert(res.msg)
	                    }
	                },
	            });      
		}
		$(document).ready(function() {
			//设置导航栏菜单
			setMenu();
			<%@ include file="static/color.js"%>		
			<%@ include file="static/style.jsp"%>
			$('#submitBtn').on('click', function(e) {
					e.preventDefault();
					//console.log("点击了...提交按钮");
					pay();
				});
			});
			<%@ include file="static/myInfo.js"%>
	</script>
</body>
</html>