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
							<li class="nav-home"><a
								href="${pageContext.request.contextPath}/index.jsp"> <i
									class="flaticon-home"></i>
							</a></li>
							<li class="separator"><i class="flaticon-right-arrow"></i></li>
							<li class="nav-item"><a
								href="${pageContext.request.contextPath}/jsp/modules/defaultuser/list.jsp">注册用户信息</a>
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
													<label>用户名</label> <input id="username" name="username"
														class="form-control" placeholder="用户名">
												</div>

												<div class="form-group">
													<label>密码</label> <input id="mima" name="mima"
														class="form-control" placeholder="密码">
												</div>

												<div class="form-group">
													<label>姓名</label> <input id="name" name="name"
														class="form-control" placeholder="姓名">
												</div>

												<div class="form-group">
													<label>性别</label> <select id="sexSelect" name="sex"
														class="form-control">
														<option value=" "></option>
														<option class="sexOption" value="男">男</option>
														<option class="sexOption" value="女">女</option>
													</select>

												</div>

												<div class="form-group">
													<label>手机</label> <input id="phone" name="phone"
														class="form-control" placeholder="手机">
												</div>

												<div class="form-group">
													<label>邮箱</label> <input id="email" name="email"
														class="form-control" placeholder="邮箱">
												</div>

												<div class="form-group">
													<label>照片</label> <img id="pictureImg" src="" width="100"
														height="100"> <input name="file" type="file"
														id="pictureupload" class="form-control-file"> <label
														id="FileName">{{ruleForm.picture}}</label> <input
														name="picture" id="picture-input" type="hidden">
												</div>

												<div class="form-group">
													<label>年龄</label> <input id="age"
														name="age" type="number" class="form-control">
												</div>

												<div class="form-group">
													<label>创建时间</label> 
													<div id="addtimeDate"
														class="input-append date form_datetime">
														<input id="addtime" name="addtime" class="form-control" type="text" readonly>
													</div>
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
		var pageType = "add-or-update";
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
		// 文件上传
		function upload() {
			$('#pictureupload')
					.fileupload(
							{
								url : baseUrl + 'file/upload',
								headers : {
									token : window.sessionStorage
											.getItem("token")
								},
								dataType : 'json',
								done : function(e, data) {
									document.getElementById('picture-input')
											.setAttribute('value',
													data.result.file);
									document.getElementById('pictureFileName').innerHTML = data.result.file
											+ "";
									$("#pictureImg").attr(
											"src",
											baseUrl + "upload/"
													+ data.result.file);

								}
							});
		}
		// 表单提交
		function submit() {
			if (validform() == true) {
				let data = {};
				getContent();
				let value = $('#addOrUpdateForm').serializeArray();
				$.each(value, function(index, item) {
					data[item.name] = item.value;
				});
				let json = JSON.stringify(data);
				//console.log('json : ',json);
				var urlParam;
				var successMes = '';
				if (updateId != null && updateId != "null" && updateId != '') {
					urlParam = 'update';
					successMes = '修改成功';
				} else {
					urlParam = 'save';
					successMes = '添加成功';
				}
				$.ajax({
					type : "POST",
					url : baseUrl + "defaultuser/" + urlParam,
					contentType : "application/json",
					data : json,
					beforeSend : function(xhr) {
						xhr.setRequestHeader("token", window.sessionStorage
								.getItem('token'));
					},
					success : function(res) {
						if (res.code == 0) {
							window.sessionStorage.removeItem('id');
							alert(successMes);
							window.location.href = "list.jsp";
						} else if (res.code == 401) {
							<%@ include file="../../static/toLogin.jsp"%>
						} else {
							alert(res.msg)
						}
					},
				});
			} else {
				alert("表单未填完整或有错误");
			}
		}

		// 表单校验
		function validform() {
			return $("#addOrUpdateForm").validate({
				rules : {
					mima : {
						required : true,
					},
					username : {
						required : true,
					},
					sex : {},
					phone : {
						isPhone : true,
					},
					email : {
						email : true,
					},
					picture : {},
					age : {},
					beizhu : {},
					addtime : {},
				},
				messages : {
					mima : {
						required : "密码不能为空",
					},
					username : {
						required : "姓名不能为空",
					},
					sex : {},
					phone : {
						isPhone : "请输入正确格式的手机号码",
					},
					email : {
						email : "请输入正确格式的邮箱",
					},
					picture : {},
					age : {},
					addtime : {},
				}
			}).form();
		}
		// 添加表单校验方法
		function addValidation() {
			jQuery.validator
					.addMethod(
							"isPhone",
							function(value, element) {
								var length = value.length;
								var mobile = /^(((13[0-9]{1})|(15[0-9]{1})|(18[0-9]{1})|(17[0-9]{1}))+\d{8})$/;
								return this.optional(element)
										|| (length == 11 && mobile.test(value));
							}, "请填写正确的手机号码");
			jQuery.validator.addMethod("isIdCardNo", function(value, element) {
				return this.optional(element)
						|| idCardNoUtil.checkIdCardNo(value);
			}, "请正确输入您的身份证号码");
		}
		// 获取当前详情
		function getDetails() {
			var id = window.sessionStorage.getItem("id");
			if (id != null && id != "" && id != "null") {
				$("#submitBtn").addClass("修改");
				updateId = id;
				window.sessionStorage.removeItem('id');
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
							setSelectOption();
							// 设置图片src
							showImg();
							// 数据填充
							dataBind();
							// 富文本框回显	
							setContent();
							//注册表单验证
							$(validform());
						} else if (res.code == 401) {
							<%@ include file="../../static/toLogin.jsp"%>
						} else {
							alert(res.msg);
						}
					},
				});
			} else {
				//注册表单验证
				$(validform());
			}
		}
		// 下拉框选项回显
		function setSelectOption() {
		}

		// 清除可能会重复渲染的selection
		function clear(className) {
			var elements = document.getElementsByClassName(className);
			for (var i = elements.length - 1; i >= 0; i--) {
				elements[i].parentNode.removeChild(elements[i]);
			}
		}
		function dateTimePick() {
			$.fn.datetimepicker.dates['zh-CN'] = {
				days : [ "星期日", "星期一", "星期二", "星期三", "星期四", "星期五", "星期六", "星期日" ],
				daysShort : [ "周日", "周一", "周二", "周三", "周四", "周五", "周六", "周日" ],
				daysMin : [ "日", "一", "二", "三", "四", "五", "六", "日" ],
				months : [ "一月", "二月", "三月", "四月", "五月", "六月", "七月", "八月",
						"九月", "十月", "十一月", "十二月" ],
				monthsShort : [ "一月", "二月", "三月", "四月", "五月", "六月", "七月", "八月",
						"九月", "十月", "十一月", "十二月" ],
				today : "今天",
				suffix : [],
				meridiem : [ "上午", "下午" ]
			};
		}

		function dataBind() {
			$("#updateId").val(ruleForm.id);
			$("#username").val(ruleForm.username);
			$("#mima").val(ruleForm.mima);
			$("#name").val(ruleForm.name);
			var sexOptions = document
					.getElementsByClassName("sexOption");
			for (var sexCount = 0; sexCount < sexOptions.length; sexCount++) {
				if (sexOptions[sexCount].getAttribute('value') == ruleForm.sex) {
					sexOptions[sexCount].setAttribute('selected',
							'selected');
				}
			}
			$("#phone").val(ruleForm.phone);
			$("#email").val(ruleForm.email);
			$("#picture-input").val(ruleForm.picture);
			$("#age").val(ruleForm.age);
			$("#addtime").val(ruleForm.addtime);
		}
		//图片显示
		function showImg() {
			var pictureFileName = "\"" + ruleForm.picture + "\"";
			$("#pictureImg").attr("src",
					baseUrl + "upload/" + ruleForm.picture);
		}

		// 用户登出
		<%@ include file="../../static/logout.jsp"%>
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
			//设置导航栏菜单
			setMenu();
		<%@ include file="../../static/color.js"%>
		
		<%@ include file="../../static/style.jsp"%>
		//初始化日期插件
			dateTimePick();
			//添加表单校验信息文本
			addValidation();
			getDetails();
			//初始化上传按钮
			upload();
			$('#submitBtn').on('click', function(e) {
				e.preventDefault();
				//console.log("点击了...提交按钮");
				submit();
			});
		});
	</script>
</body>
</html>