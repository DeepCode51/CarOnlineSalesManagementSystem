<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="zh-cn">
<head>
	<%@ include file="jsp/static/head.jsp"%>
</head>
<body>
	<div class="wrapper compact-wrapper">
		<%@ include file="jsp/static/mainHeader.jsp"%>
		<!-- Sidebar -->
		<%@ include file="jsp/static/sidebar.jsp"%>
		<!--面包屑-->
		<div class="main-panel">
			<div class="content">
				<div class="page-inner" style="height: 1000px;">
					
					<h1 align="center" style="margin-top: 300px;"><strong>欢迎来到xx系统</strong></h1>
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
	<script src="${pageContext.request.contextPath}/resources/assets/js/setting-demo2.js"></script>
	<script >
		<%@ include file="jsp/utils/menu.jsp"%>
		<%@ include file="jsp/utils/baseUrl.jsp"%>
		<%@ include file="jsp/static/setMenu.js"%>
		<%@ include file="jsp/static/logout.jsp"%>
		$(document).ready(function() {
			//我的后台,session信息转移
			if(window.localStorage.getItem("Token") != null && window.localStorage.getItem("Token") != 'null'){
				if(window.sessionStorage.getItem("token") == null || window.sessionStorage.getItem("token") == 'null'){
					window.sessionStorage.setItem("token",window.localStorage.getItem("Token"));
					window.sessionStorage.setItem("role",window.localStorage.getItem("role"));
					window.sessionStorage.setItem("accountTableName",window.localStorage.getItem("sessionTable"));
					window.sessionStorage.setItem("username",window.localStorage.getItem("adminName"));
				}
			}			
			$('#projectName').html(projectName)
			$('h1 strong').html('欢迎使用'+projectName)
			if(projectName.length >14){
				$('.logo-header h2').html(projectName.substring(0,13)+'..')
			}else{
				$('.logo-header h2').html(projectName)
			}
			$('.user-box .u-text h4').html(window.sessionStorage.getItem('username'))
			setMenu();
			<%@ include file="jsp/static/color.js"%>
			<%@ include file="jsp/static/style.jsp"%>
			var token = window.sessionStorage.getItem("token");
			if(token == "null" || token == null){
				alert("请登录后再操作");
				window.location.href = ("jsp/login.jsp");
			}
			<%@ include file="jsp/static/myInfo.js"%>
		});
	</script>
</body>
</html>