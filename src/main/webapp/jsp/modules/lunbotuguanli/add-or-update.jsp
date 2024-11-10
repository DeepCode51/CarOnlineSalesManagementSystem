<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="zh-cn">

<head>
	<%@ include file="../../static/head.jsp"%>
	<link href="http://www.bootcss.com/p/bootstrap-datetimepicker/bootstrap-datetimepicker/css/datetimepicker.css"
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
							<li class="nav-home">
								<a href="#">
									<i class="flaticon-home"></i>
								</a>
							</li>
							<li class="separator">
								<i class="flaticon-right-arrow"></i>
							</li>
							<li class="nav-item">
								<a href="#">轮播图信息</a>
							</li>
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
													<label>name</label>
													<input class="form-control" name="name" id="name">
												</div>
												<div class="form-group">
													<label>value</label>
													<img id="valueImg" src="" width="100" height="100">
													<input name="file" type="file" id="valueupload"
														class="form-control-file">
													<input name="value" id="value-input" type="hidden">
												</div>
											</form>
										</div>
									</div>
								</div>
								<div class="card-action">
									<button id="submitBtn" type="button" onclick="submit()"
										class="btn btn-success">提交</button>
									<button class="btn btn-danger">取消</button>
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
	<script src="${pageContext.request.contextPath}/resources/assets/js/core/jquery.3.2.1.min.js"></script>
	<script src="${pageContext.request.contextPath}/resources/assets/js/core/popper.min.js"></script>
	<script src="${pageContext.request.contextPath}/resources/assets/js/core/bootstrap.min.js"></script>
	<script src="${pageContext.request.contextPath}/resources/assets/vue.min.js"></script>
	<script src="${pageContext.request.contextPath}/resources/assets/js/jquery.ui.widget.js"></script>
	<script src="${pageContext.request.contextPath}/resources/assets/js/jquery.fileupload.js"></script>
	<script src="${pageContext.request.contextPath}/resources/assets/js/jquery.form.js"></script>
	<!-- jQuery UI -->
	<script
		src="${pageContext.request.contextPath}/resources/assets/js/plugin/jquery-ui-1.12.1.custom/jquery-ui.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/resources/assets/js/plugin/jquery-ui-touch-punch/jquery.ui.touch-punch.min.js"></script>

	<!-- jQuery Scrollbar -->
	<script
		src="${pageContext.request.contextPath}/resources/assets/js/plugin/jquery-scrollbar/jquery.scrollbar.min.js"></script>
	<!-- Atlantis JS -->
	<script src="${pageContext.request.contextPath}/resources/assets/js/atlantis.min.js"></script>
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
		<%@include file = "../../utils/menu.jsp" %>
		<%@include file = "../../static/setMenu.js" %>
		<%@include file = "../../utils/baseUrl.jsp" %>   

		var tableName = "config";
		var pageType = "add-or-update";
		var updateId = "";
		var ruleForm = {};

		// 表单提交
		function submit() {
			if (validform() == true) {
				let data = {};
				let value = $('#addOrUpdateForm').serializeArray();
				$.each(value, function (index, item) {
					data[item.name] = item.value;
				});
				var urlParam;
				var successMes = '';
				if (updateId != null && updateId != "null" && updateId != '') {
					urlParam = 'update';
					successMes = '修改成功';
				} else {
					urlParam = 'save';
					successMes = '添加成功';
				}
				httpJson("config/" + urlParam, "POST", data, (res) => {
					if (res.code == 0) {
						window.sessionStorage.removeItem('id');
						window.location.href = "list.jsp";
						alert(successMes);
					}
				});
			} else {
				alert("表单未填完整或有错误");
			}
		}

		// 表单校验
		function validform() {
			return $("#addOrUpdateForm").validate({
				rules: {},
				messages: {}
			}).form();
		}
		// 获取当前详情
		function getDetails() {
			var id = window.sessionStorage.getItem("id");
			if (id != null && id != "" && id != "null") {
				updateId = id;
				$("#updateId").val(id);
				window.sessionStorage.removeItem('id');
				http("config/info/" + id, "GET", {}, (res) => {
					if (res.code == 0) {
						ruleForm = res.data;
						showImg();
						dataBind();
						//注册表单验证
						$(validform());
					}
				});
			} else {
				//注册表单验证
				$(validform());
			}
		}
		function upload() {
			$('#valueupload').fileupload({
				url: baseUrl + 'file/upload',
				headers: { token: window.sessionStorage.getItem("token") },
				dataType: 'json',
				done: function (e, data) {
					document.getElementById('value-input').setAttribute('value', baseUrl + "upload/" + data.result.file);
					$("#valueImg").attr("src", baseUrl + "upload/" + data.result.file);
				}
			});
		}
		//图片显示
		function showImg() {
			var valueFileName = "\"" + ruleForm.value + "\"";
			$("#valueImg").attr("src", ruleForm.value);
		}
		function dataBind() {
			$('#updateId').val(ruleForm.id);
			$('#name').val(ruleForm.name);
			$('#value-input').val(ruleForm.value);
		}
		$(document).ready(function () {
			$('#projectName').html(projectName)
			//设置左上角系统名
			if (projectName.length > 14) {
				$('.logo-header h2').html(projectName.substring(0, 13) + '..')
			} else {
				$('.logo-header h2').html(projectName)
			}
			//设置右上角用户名
			$('.user-box .u-text h4').html(window.sessionStorage.getItem('username'))
			setMenu();
			<%@include file = "../../static/color.js" %>
			<%@include file = "../../static/style.jsp" %>
				getDetails();
			upload();
		});
	</script>
</body>

</html>