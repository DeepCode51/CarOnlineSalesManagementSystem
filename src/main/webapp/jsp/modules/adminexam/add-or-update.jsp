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
							<li class="nav-item"><a href="#">当前 第 1 题，剩余 0 题， 共 0 题</a>
							</li>
							<li onclick="exit()" class="nav-item">
								<a href="#">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;退出</a>
							</li>
						</ul>
					</div>
					<div class="row">
						<div class="col-md-12">
							<div class="card">
								<div class="card-header">
									<div class="card-title" style="color: red;">剩余 00 分钟 00 秒</div>
								</div>
								<div class="card-body">
									<div class="row">
										<div class="col-md-6 col-lg-4">
											<form id="addOrUpdateForm" method="post">
												<div class="form-group">
													<label>题目</label>
													<textarea class="form-control" id="questionname" rows="3">
													</textarea>
												</div>

												<div id="optionsArea" class="form-group">
													<label>选项</label>
													<textarea class="form-control" rows="3" readonly></textarea>
												</div>

												<div id="answerArea" class="form-group">
													<label>答案</label>
												</div>

												<div id="yourAnswer" class="form-group" style="display: none;">
													<label>你的答案</label> <input readonly> <label
														style="color: red;!important">正确</label>
												</div>

												<div id="analysis" class="form-group" style="display: none;">
													<label>解析</label>
													<textarea class="form-control" rows="2" placeholder="解析"
														readonly></textarea>
												</div>
												<div id="result" class="form-group" style="display: none;">
													<label>考试成绩</label> <input readonly>
												</div>

											</form>
										</div>
									</div>
								</div>
								<div class="card-action">
									<button id="submitBtn" type="button" class="btn btn-warning">提交</button>
									<button id="nextBtn" type="button" class="btn btn-success">下一题</button>
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
		var tableName = "defaultuser";
		var pageType = "add-or-update";
		var updateId = "";
		var ruleForm = {};
		var questions = [];
		var current = 1;
		var total = 0;
		var paperId;
		var userId;
		var time = 0;
		var score = 0;

		// 用户登出
		<%@include file = "../../static/logout.jsp" %>


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
				//设置导航栏菜单
				setMenu();
			<%@include file = "../../static/color.js" %>		
			<%@include file = "../../static/style.jsp" %>
					$('#submitBtn').on('click', function (e) {
						e.preventDefault();
						//console.log("点击了...提交按钮");
						submitAnswer();
					});
				$('#nextBtn').on('click', function (e) {
					e.preventDefault();
					//console.log("点击了...提交按钮");
					next();
				});
				init();
			<%@include file = "../../static/myInfo.js" %>
		});
		//初始化准备
		function init() {
			//获取试卷id
			paperId = window.sessionStorage.getItem('paperid');
			window.sessionStorage.removeItem('paperid');
			//获取当前用户id
			getUserId();
			//获取当前试卷题目
			getQuestions();
		}
		//获取当前用户id
		function getUserId() {
			var accountTableName = window.sessionStorage.getItem('accountTableName')
			$.ajax({
				type: "GET",
				url: baseUrl + accountTableName + "/session",
				beforeSend: function (xhr) { xhr.setRequestHeader("token", window.sessionStorage.getItem('token')); },
				success: function (res) {
					if (res.code == 0) {
						//将用户id保存到全局变量中
						userId = res.data.id
						//删除旧考试记录
						reWrite();
					}
					else if (res.code == 401) {<%@include file = "../../static/toLogin.jsp" %>}
					else { alert(res.msg); }
				},
			});
		}

		//获取当前试卷题目
		function getQuestions() {
			$.ajax({
				type: "GET",
				url: baseUrl + "examquestion/page",
				data: {
					sort: "id",
					paperid: paperId,
				},
				beforeSend: function (xhr) { xhr.setRequestHeader("token", window.sessionStorage.getItem('token')); },
				success: function (res) {
					if (res.code == 0) {
						//将题目保存到全局变量						
						questions = res.data.list;
						total = questions.length;
						//获取时间
						getExamTime();
					} else if (res.code == 401) {<%@include file = "../../static/toLogin.jsp" %>}
					else { alert(res.msg); }
				},
			});
		}

		//渲染题目
		function showQuestion() {
			$('#nextBtn').hide();
			//更新考试进度信息
			setProgressMsg();
			//隐藏选项表单项
			$('#optionsArea').hide();
			var question = questions[current - 1];
			//将字符串转成json
			var answerOptions = $.parseJSON(question.options);
			//展示题目类型和分值
			var questionType = '';
			switch (question.type) {
				case 0:
					questionType = '(单选题';
					break;
				case 1:
					questionType = '(多选题';
					break;
				case 2:
					questionType = '(判断题';
					break;
				case 3:
					questionType = '(填空题';
					break;
				default:
					console.log('该题目类型未能识别');
			}
			$('#questionname').val(questionType + " " + question.score + " 分) " + question.questionname);
			//清空作答区域
			$('#answerArea').children().remove()
			if (question.type == 0 || question.type == 2) {
				//单选题和判断题
				$('#answerArea').append("<label>答案</label><select id=\"answerSelect\" class=\"form-control\"></select>");
				for (var i = 0; i < answerOptions.length; i++) {
					var option = document.createElement('option');
					option.setAttribute('class', 'answerOption');
					option.setAttribute('value', answerOptions[i].code);
					option.innerHTML = answerOptions[i].text;
					$('#answerSelect').append(option)
				}
			} else if (question.type == 1) {
				var str = ''
				for (var i = 0; i < answerOptions.length; i++) {
					str = str + answerOptions[i].code + '. ' + answerOptions[i].text + '  ';
				}
				$('#optionsArea textarea').val(str)
				//展示选项表单
				$('#optionsArea').show();
				//渲染答案输入框			
				$('#answerArea').append("<input id=\"answer\" class=\"form-control\" placeholder=\"多个答案用英文逗号隔开\">")
			} else if (question.type == 3) {
				//渲染答案输入框	
				$('#answerArea').append("<textarea id=\"answer\" class=\"form-control\" rows=\"2\" placeholder=\"请输入答案\"></textarea>");
			}
			$('#answerArea').show();
		}

		//设置题目进度文本
		function setProgressMsg() {
			var remain = total - current;
			var msg = "当前第 " + current + " 题,剩余 " + remain + " 题,共 " + total + "题."
			$('.breadcrumbs li a').html(msg)
		}

		//获取考试时间
		function getExamTime() {
			$.ajax({
				type: "GET",
				url: baseUrl + "exampaper/info/" + paperId,
				contentType: "application/json",
				beforeSend: function (xhr) { xhr.setRequestHeader("token", window.sessionStorage.getItem('token')); },
				success: function (res) {
					if (res.code == 0) {
						//将考试时间保存到全局变量
						time = res.data.time;
						//每秒更新一次剩余时间
						self.setInterval("setTimeMsg()", 1000);
						console.log("time: " + time)
						//定时结束考试
						setTimeout(function () { examFinish() }, time * 1000);
						//渲染题目
						showQuestion();
					} else if (res.code == 401) {
						<%@include file = "../../static/toLogin.jsp" %>
					} else {
						alert(res.msg)
					}
				},
			});
		}

		//设置时间信息
		function setTimeMsg() {
			if (time > 0) {
				time--;
				var min = parseInt(time / 60);
				var second = time % 60;
				var str = "剩余 " + min + " 分钟, " + second + " 秒";
				$('.card .card-header .card-title').html(str);
			} else {
				$('.card .card-header .card-title').html('考试结束');
			}
		}

		//提交当前题目答案
		function submitAnswer() {
			var question = questions[current - 1];
			var answerStr = '';
			var myScore = 0;
			if (question.type == 0 || question.type == 2) {
				var index = document.getElementById("answerSelect").selectedIndex;
				var answerOptions = document.getElementById("answerSelect").options;
				answerStr = answerOptions[index].value
			} else {
				answerStr = $('#answer').val();
			}
			if (answerStr == question.answer) {
				myScore = question.score;
			}

			$.ajax({
				type: "POST",
				url: baseUrl + "examrecord/save",
				contentType: "application/json",
				data: JSON.stringify({
					analysis: question.analysis,
					answer: question.answer,
					myanswer: answerStr,
					myscore: myScore,
					options: question.options,
					paperid: paperId,
					papername: question.papername,
					questionid: question.id,
					questionname: question.questionname,
					score: question.score,
					userid: userId,
				}),
				beforeSend: function (xhr) { xhr.setRequestHeader("token", window.sessionStorage.getItem('token')); },
				success: function (res) {
					if (res.code == 0) {
						score += myScore;
						$('#yourAnswer input').val(answerStr);
						if (answerStr == question.answer) {
							$('#yourAnswer input').next().html("正确");
						} else {
							$('#yourAnswer input').next().html("错误");
						}
						showResult();
					} else if (res.code == 401) {
						<%@include file = "../../static/toLogin.jsp" %>
					} else {
						alert(res.msg)
					}
				},

			});
		}

		//提交答案后显示结果和解析
		function showResult() {
			//隐藏选项表单项
			$('#optionsArea').hide();
			//隐藏作答区域
			$('#answerArea').hide();
			$('#analysis textarea').html(questions[current - 1].analysis);
			$('#yourAnswer').show();
			$('#analysis').show();
			$('#nextBtn').show();
			$('#submitBtn').hide();
			if (current == total) {
				$('#nextBtn').html("查看考试成绩");
			}
		}
		//继续下一题
		function next() {
			if (current == total) {
				examFinish();
			} else {
				$('#nextBtn').hide();
				$('#submitBtn').show();
				//隐藏答案解析
				$('#yourAnswer').hide();
				$('#analysis').hide();
				current++;
				showQuestion();
			}
		}
		//考试结束，展示成绩
		function examFinish() {
			console.log("考试结束 ");
			$('form div').hide();
			$('#result input').val(score + '分');
			$('#result').show();
			$('#result input').show();
			$('#submitBtn').remove();
			$('.card-action').append("<button type=\"button\" class=\"btn btn-success\" onclick=\"exit()\">退出</button>");
			$('#nextBtn').remove();
			time = 0;
		}
		//退出考试
		function exit() {
			var flag = confirm("真的要退出吗?");
			if (flag) {
				window.location.href = baseUrl + "jsp/modules/kaoshijilu/list.jsp";
			}
		}
		//重新考试，删除该份试卷之前的考试记录
		function reWrite() {
			$.ajax({
				type: "GET",
				url: baseUrl + "examrecord/deleteRecords",
				data: {
					userid: userId,
					paperid: paperId,
				},
				beforeSend: function (xhr) { xhr.setRequestHeader("token", window.sessionStorage.getItem('token')); },
				success: function (res) {
					if (res.code == 0) {

					} else if (res.code == 401) {<%@include file = "../../static/toLogin.jsp" %>}
					else {/*alert(res.msg)*/; }
				},
			});
		}	
	</script>
</body>

</html>