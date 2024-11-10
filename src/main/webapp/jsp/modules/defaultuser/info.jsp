<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="zh-cn">
<head>
<%@ include file="../../static/head.jsp"%>
<link
	href="http://www.bootcss.com/p/bootstrap-datetimepicker/bootstrap-datetimepicker/css/datetimepicker.css"
	rel="stylesheet">
<script type="text/javascript" charset="utf-8">
	window.UEDITOR_HOME_URL = "${pageContext.request.contextPath}/resources/ueditor/"; //UEDITOR_HOME_URL、config、all这三个顺序不能改变
</script>
<script type="text/javascript" charset="utf-8"
	src="${pageContext.request.contextPath}/resources/ueditor/ueditor.config.js"></script>
<script type="text/javascript" charset="utf-8"
	src="${pageContext.request.contextPath}/resources/ueditor/ueditor.all.min.js"></script>
<script type="text/javascript" charset="utf-8"
	src="${pageContext.request.contextPath}/resources/ueditor/lang/zh-cn/zh-cn.js"></script>

</head>
<body>
	<div class="wrapper compact-wrapper">
		<%@ include file="../../static/mainHeader.jsp"%>
		<!-- Sidebar -->
		<%@ include file="../../static/sidebar.jsp"%>
		<div class="main-panel">
			<div class="content">
				<div class="page-inner">
					<div class="page-header">
						<ul class="breadcrumbs">
							<li class="nav-home"><a href="#"> <i
									class="flaticon-home"></i>
							</a></li>
							<li class="separator"><i class="flaticon-right-arrow"></i></li>
							<li class="nav-item"><a href="#">员工信息</a></li>
						</ul>
					</div>
					<div class="row">
						<div class="col-md-12">
							<div class="card">
								<div class="card-header">
									<div class="card-title"></div>
								</div>
								<div class="card-body">
									<div class="row">
										<div class="col-md-6 col-lg-4">
											<form id="addOrUpdateForm" method="post">
												<input id="updateId" name="id" type="hidden">
												<div class="form-group">
													<label>用户名</label> <input id="username"
														v-model="ruleForm.username" readonly>
												</div>

												<div class="form-group">
													<label>密码</label> <input id="mima" v-model="ruleForm.mima"
														readonly>
												</div>

												<div class="form-group">
													<label>姓名</label> <input id="name"
														v-model="ruleForm.name" readonly>
												</div>

												<div class="form-group">
													<label>性别</label> <input id="sex"
														v-model="ruleForm.sex" readonly>
												</div>

												<div class="form-group">
													<label>手机</label> <input id="phone"
														v-model="ruleForm.phone" readonly>
												</div>

												<div class="form-group">
													<label>邮箱</label> <input id="email"
														v-model="ruleForm.email" readonly>
												</div>

												<div class="form-group">
													<label>照片</label> <img id="pictureImg" src="" width="100"
														height="100">
												</div>

												<div class="form-group">
													<label>创建时间</label> <input id="addtime"
														v-model="ruleForm.addtime" readonly>
												</div>
											</form>
										</div>
									</div>
								</div>
								<div class="card-action">
									<button id="exitBtn" type="button">返回</button>
								</div>

							</div>
						</div>
					</div>
				</div>
			</div>
		</div>

		<!-- Custom template | don't include it in your project! -->
		<!-- End Custom template -->
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
		src="${pageContext.request.contextPath}/resources/assets/js/jquery.fileupload.js"></script>
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
	<script type="text/javascript" charset="utf-8"
		src="${pageContext.request.contextPath}/resources/assets/js/validate/jquery.validate.min.js"></script>
	<script type="text/javascript" charset="utf-8"
		src="${pageContext.request.contextPath}/resources/assets/js/validate/messages_zh.js"></script>
	<script type="text/javascript" charset="utf-8"
		src="${pageContext.request.contextPath}/resources/assets/js/validate/card.js"></script>
	<script type="text/javascript" charset="utf-8"
		src="${pageContext.request.contextPath}/resources/assets/datetimepicker/bootstrap-datetimepicker.min.js"></script>
	<!-- Atlantis DEMO methods, don't include it in your project! -->
	<!--<script src="${pageContext.request.contextPath}/resources/assets/js/setting-demo2.js"></script> -->
	<script>
		
	<%@ include file="../../utils/menu.jsp"%>
		
	<%@ include file="../../static/setMenu.js"%>
		
	<%@ include file="../../utils/baseUrl.jsp"%>
		var tableName = "defaultuser";
		var pageType = "info";
		var updateId = "";

		var ruleForm = {};
		var vm = new Vue({
			el : '#addOrUpdateForm',
			data : {
				ruleForm : {},
			},
			beforeCreate : function() {
				var id = window.sessionStorage.getItem("id");
				if (id != null && id != "" && id != "null") {
					$.ajax({
						type : "GET",
						url : baseUrl + "defaultuser/info/" + id,
						beforeSend : function(xhr) {
							xhr.setRequestHeader("token", window.sessionStorage
									.getItem('token'));
						},
						success : function(res) {
							if (res.code == 0) {
								vm.ruleForm = res.data;
							} else if (res.code == 401) {
								<%@ include file="../../static/toLogin.jsp"%>
							} else {
								alert(res.msg)
							}
						},
					});
				}
			},
			methods : {}
		});


		// 获取当前详情
		function getDetails() {
			var id = window.sessionStorage.getItem("id");
			if (id != null && id != "" && id != "null") {
				$("#submitBtn").addClass("修改");
				$.ajax({
					type : "GET",
					url : baseUrl + "defaultuser/info/" + id,
					beforeSend : function(xhr) {
						xhr.setRequestHeader("token", window.sessionStorage
								.getItem('token'));
					},
					success : function(res) {
						if (res.code == 0) {
							ruleForm = res.data
							showImg();
						} else if (res.code == 401) {
							<%@ include file="../../static/toLogin.jsp"%>
						} else {
							alert(res.msg);
						}
					},
				});
			} else {
				$("#submitBtn").addClass("新增");
			}
		}
		//图片显示
		function showImg() {
			var pictureFileName = "\"" + ruleForm.picture + "\"";
			$("#pictureImg").attr("src",
					baseUrl + "upload/" + ruleForm.picture);
		}
		function exit() {
			window.sessionStorage.removeItem("id");
			window.location.href = "list.jsp";
		}

		$(document).ready(function() {
			$('#projectName').html(projectName)
			//设置左上角系统名
			if(projectName.length >14){
				$('.logo-header h2').html(projectName.substring(0,13)+'..')
			}else{
				$('.logo-header h2').html(projectName)
			}
			//设置右上角用户名
			$('.user-box .u-text h4').html(window.sessionStorage.getItem('username'))
			setMenu();
			<%@ include file="../../static/color.js"%>
		
			<%@ include file="../../static/style.jsp"%>
			$('#exitBtn').on('click', function(e) {
					e.preventDefault();
					exit();
				});
			getDetails();

		});
	</script>
</body>
</html>