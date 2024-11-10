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
							<li class="nav-home"><a href="${pageContext.request.contextPath}/index.jsp"> <i
										class="flaticon-home"></i>
								</a></li>
							<li class="separator"><i class="flaticon-right-arrow"></i></li>
							<li class="nav-item"><a
									href="${pageContext.request.contextPath}/jsp/modules/liuyanbanguanli/list.jsp">留言板管理</a>
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
													<label>留言人用户名</label>
													<input id="username" name="username" class="form-control"
														readonly="readonly">
												</div>
												<div class="form-group">
													<label>留言内容</label>
													<textarea id="content-input" name="content" class="form-control"
														rows="5" readonly="readonly">
												</textarea>
												</div>
												<div class="form-group">
													<label>回复内容</label>
													<textarea id="reply-input" name="reply" class="form-control"
														rows="5">
												</textarea>
												</div>
											</form>
										</div>
									</div>
								</div>
								<div class="card-action">
									<button id="submitBtn" type="button" class="btn btn-success">提交</button>
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

		var tableName = "liuyanbanguanli";
		var pageType = "add-or-update";
		var updateId = "";
		var crossTableId = -1;
		var crossTableName = '';
		var ruleForm = {};
		var crossRuleForm = {};


		var ruleForm = {};
		var vm = new Vue({
			el: '#addOrUpdateForm',
			data: {
				ruleForm: {},
			},
			beforeCreate: function () {
				var id = window.sessionStorage.getItem("id");
				if (id != null && id != "" && id != "null") {
					$.ajax({
						type: "GET",
						url: baseUrl + "messages/info/" + id,
						beforeSend: function (xhr) { xhr.setRequestHeader("token", window.sessionStorage.getItem('token')); },
						success: function (res) {
							if (res.code == 0) {
								vm.ruleForm = res.data;
							} else if (res.code == 401) {
				    			<%@include file = "../../static/toLogin.jsp" %>    
				    		} else { alert(res.msg) }
						},
					});
				}
			},
			methods: {}
		});

		// 表单提交
		function submit() {
			if (validform() == true) {
				let data = {};
				let value = $('#addOrUpdateForm').serializeArray();
				$.each(value, function (index, item) {
					data[item.name] = item.value;
				});
				let json = JSON.stringify(data);
				//console.log('json : ',json);
				var urlParam;
				var successMes = '';
				if (updateId != null && updateId != "null" && updateId != '') {
					urlParam = 'update';
					successMes = '回复成功';
				} else {
					urlParam = 'save';
					successMes = '添加成功';
				}
				httpJson("messages/" + urlParam, "POST", data, (res) => {
					if (res.code == 0) {
						window.sessionStorage.removeItem('id');
						let flag = true; if (flag) {
							alert(successMes);
						}
						if (window.sessionStorage.getItem('onlyme') != null && window.sessionStorage.getItem('onlyme') == true) {
							window.sessionStorage.removeItem('onlyme');
							window.location.href = "${pageContext.request.contextPath}/index.jsp";
						} else {
							window.location.href = "list.jsp";
						}
					}
				});
			} else {
				alert("表单未填完整或有错误");
			}
		}

		// 表单校验
		function validform() {
			return $("#addOrUpdateForm").validate({
				rules: {
					content: {},
					reply: {},
				},
				messages: {
					content: {},
					reply: {},
				}
			}).form();
		}

		// 获取当前详情
		function getDetails() {
			var id = window.sessionStorage.getItem("id");
			if (id != null && id != "" && id != "null") {
				$("#submitBtn").addClass("修改");
				updateId = id;
				window.sessionStorage.removeItem('id');
				http("messages/info/" + id, "GET", {}, (res) => {
					if (res.code == 0) {
						ruleForm = res.data
						// 数据填充
						dataBind();																																																														//注册表单验证
						$(validform());
					}
				});
			} else {
				//注册表单验证
				$(validform());
			}
		}

		function dataBind() {
			$("#updateId").val(ruleForm.id);
			$("#username").val(ruleForm.username);
			$("#content-input").val(ruleForm.content);
			$("#reply-input").val(ruleForm.reply);
		}

		// 用户登出
        <%@include file = "../../static/logout.jsp" %>

			$(document).ready(function () {
				$('#projectName').html(projectName)
				//设置导航栏菜单
				setMenu();
				//设置左上角系统名
				if (projectName.length > 14) {
					$('.logo-header h2').html(projectName.substring(0, 13) + '..')
				} else {
					$('.logo-header h2').html(projectName)
				}
				//设置右上角用户名
				$('.user-box .u-text h4').html(window.sessionStorage.getItem('username'))
					<%@include file = "../../static/color.js" %>
			<%@include file = "../../static/style.jsp" %>
					getDetails();
				$('#submitBtn').on('click', function (e) {
					e.preventDefault();
					//console.log("点击了...提交按钮");
					submit();
				});	
			<%@include file = "../../static/myInfo.js" %>

		});
	</script>
</body>

</html>