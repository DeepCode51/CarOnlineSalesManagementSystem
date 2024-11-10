<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="zh-cn">
<head>
	<%@ include file="../../static/head.jsp"%>
	<link href="http://www.bootcss.com/p/bootstrap-datetimepicker/bootstrap-datetimepicker/css/datetimepicker.css" rel="stylesheet">
		<script type="text/javascript" charset="utf-8">
	    window.UEDITOR_HOME_URL = "${pageContext.request.contextPath}/resources/ueditor/"; //UEDITOR_HOME_URL、config、all这三个顺序不能改变
		</script>
		<script type="text/javascript" charset="utf-8" src="${pageContext.request.contextPath}/resources/ueditor/ueditor.config.js"></script>
		<script type="text/javascript" charset="utf-8" src="${pageContext.request.contextPath}/resources/ueditor/ueditor.all.min.js"></script>
	  	<script type="text/javascript" charset="utf-8" src="${pageContext.request.contextPath}/resources/ueditor/lang/zh-cn/zh-cn.js"></script>
		
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
								<a href="${pageContext.request.contextPath}/index.jsp">
									<i class="flaticon-home"></i>
								</a>
							</li>
							<li class="separator">
								<i class="flaticon-right-arrow"></i>
							</li>
							<li class="nav-item">
								<a href="${pageContext.request.contextPath}/jsp/modules/cheliangxinxi/list.jsp">车辆信息</a>
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
												<label>车辆编号</label>
												
												<input id="cheliangbianhao" name="cheliangbianhao" class="form-control" value="" readonly>
												</div>	
											<div class="form-group">
												<label>车辆名称</label>
												
												<input id="cheliangmingcheng" name="cheliangmingcheng" class="form-control" placeholder="车辆名称">
												</div>	
											<div class="form-group">
												<label>车辆品牌</label>
												
												<select id="cheliangpinpaiSelect" name="cheliangpinpai" class="form-control">
													</select>
												</div>	
											<div class="form-group">
												<label>车辆类型</label>
												
												<select id="cheliangleixingSelect" name="cheliangleixing" class="form-control">
													</select>
												</div>	
											<div class="form-group">
												<label>汽车图片</label>
												
													<img id="qichetupianImg" src="" width="100" height="100">
													<input name="file" type="file" id="qichetupianupload" class="form-control-file">
													<input name="qichetupian" id="qichetupian-input" type="hidden">
												</div>	
											<div class="form-group">
												<label>车辆颜色</label>
												
												<select id="cheliangyanseSelect" name="cheliangyanse" class="form-control">
													</select>
												</div>	
											<div class="form-group">
												<label>换挡方式</label>
												
												<select id="huandangfangshiSelect" name="huandangfangshi" class="form-control">
															<option value=" "></option>
													 																		<option class="huandangfangshiOption" value="自动挡">
																自动挡
															</option>
																	<option class="huandangfangshiOption" value="手动挡">
																手动挡
															</option>
															</select>
												</div>	
											<div class="form-group">
												<label>车辆天窗</label>
												
												<select id="cheliangtianchuangSelect" name="cheliangtianchuang" class="form-control">
															<option value=" "></option>
													 																		<option class="cheliangtianchuangOption" value="无天窗">
																无天窗
															</option>
																	<option class="cheliangtianchuangOption" value="有天窗">
																有天窗
															</option>
															</select>
												</div>	
											<div class="form-group">
												<label>车座</label>
												
												<select id="chezuoSelect" name="chezuo" class="form-control">
															<option value=" "></option>
													 																		<option class="chezuoOption" value="两座">
																两座
															</option>
																	<option class="chezuoOption" value="四座">
																四座
															</option>
																	<option class="chezuoOption" value="五座">
																五座
															</option>
																	<option class="chezuoOption" value="七座">
																七座
															</option>
																	<option class="chezuoOption" value="其他">
																其他
															</option>
															</select>
												</div>	
											<div class="form-group">
												<label>汽车排量</label>
												
												<input id="qichepailiang" name="qichepailiang" class="form-control" placeholder="汽车排量">
												</div>	
											<div class="form-group">
												<label>车辆价格</label>
												
												<input id="cheliangjiage" name="cheliangjiage" class="form-control" placeholder="车辆价格">
												</div>	
											<div class="form-group">
												<label>车辆库存</label>
												
												<input id="cheliangkucun" name="cheliangkucun" class="form-control" placeholder="车辆库存">
												</div>	
											<div class="form-group">
												
											</div>	
											<div class="form-group">
												
											</div>	
											<div class="form-group">
												
											</div>	

																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																		<div class="form-group">
													<label>车辆详情</label>
													<input id="cheliangxiangqingupload" name="file" type="file">
													<script id="cheliangxiangqingEditor" type="text/plain" style="width:800px;height:230px;"></script>
													<script type="text/javascript">
														//建议使用工厂方法getEditor创建和引用编辑器实例，如果在某个闭包下引用该编辑器，直接调用UE.getEditor('editor')就能拿到相关的实例
													//相见文档配置属于你自己的编译器
													var cheliangxiangqingUe = UE.getEditor('cheliangxiangqingEditor', {
														toolbars: [
															[
																'undo', //撤销
																'bold', //加粗
																'redo', //重做
																'underline', //下划线
																'horizontal', //分隔线
																'inserttitle', //插入标题
																'cleardoc', //清空文档
																'fontfamily', //字体
																'fontsize', //字号
																'paragraph', //段落格式
																'inserttable', //插入表格
																'justifyleft', //居左对齐
																'justifyright', //居右对齐
																'justifycenter', //居中对
																'justifyjustify', //两端对齐
																'forecolor', //字体颜色
																'fullscreen', //全屏
																'edittip ', //编辑提示
																'customstyle', //自定义标题
																]
															]
														});
													</script>
													<input type="hidden" name="cheliangxiangqing" id="cheliangxiangqing-input">
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
	<script src="${pageContext.request.contextPath}/resources/assets/js/plugin/jquery-ui-1.12.1.custom/jquery-ui.min.js"></script>
	<script src="${pageContext.request.contextPath}/resources/assets/js/plugin/jquery-ui-touch-punch/jquery.ui.touch-punch.min.js"></script>
	
	<!-- jQuery Scrollbar -->
	<script src="${pageContext.request.contextPath}/resources/assets/js/plugin/jquery-scrollbar/jquery.scrollbar.min.js"></script>
	<!-- Atlantis JS -->
	<script src="${pageContext.request.contextPath}/resources/assets/js/atlantis.min.js"></script>
	<script type="text/javascript" charset="utf-8" src="${pageContext.request.contextPath}/resources/assets/js/validate/jquery.validate.min.js"></script>
	<script type="text/javascript" charset="utf-8" src="${pageContext.request.contextPath}/resources/assets/js/validate/messages_zh.js"></script>
	<script type="text/javascript" charset="utf-8" src="${pageContext.request.contextPath}/resources/assets/js/validate/card.js"></script>
	<script type="text/javascript" charset="utf-8" src="${pageContext.request.contextPath}/resources/assets/datetimepicker/bootstrap-datetimepicker.min.js"></script>
	<!-- Atlantis DEMO methods, don't include it in your project! -->
	<!--<script src="${pageContext.request.contextPath}/resources/assets/js/setting-demo2.js"></script> -->
	
	<script>
		<%@ include file="../../utils/menu.jsp"%>
		<%@ include file="../../static/setMenu.js"%>
		<%@ include file="../../utils/baseUrl.jsp"%>   

		var tableName = "cheliangxinxi";
		var pageType = "add-or-update";
		var updateId = "";
		var crossTableId = -1;
		var crossTableName = '';
		var ruleForm = {};
		var crossRuleForm = {};
																																																																													
					      				      							var cheliangpinpaiOptions = [];
			      							var cheliangleixingOptions = [];
			      				      							var cheliangyanseOptions = [];
			      				      				      				      				      				      				      				      				      				      	
									function cheliangbianhaoUuid(){
					if($("#cheliangbianhao").val() == null || $("#cheliangbianhao").val() == "null" || $("#cheliangbianhao").val() == ""){
						$("#cheliangbianhao").attr("value",Math.round(new Date().getTime()/1000));
					}
				}							
																	//普通下拉框渲染
				function cheliangpinpaiSelect(){	
					http("option/qichepinpai/cheliangpinpai","GET",{},(res)=>{
						if(res.code == 0){
							cheliangpinpaiOptions = res.data;
							var cheliangpinpaiSelect = document.getElementById('cheliangpinpaiSelect');
							for(var i=0;i<cheliangpinpaiOptions.length;i++){
								var cheliangpinpaiOption = document.createElement('option');
								cheliangpinpaiOption.setAttribute('name','cheliangpinpaiOption');
								cheliangpinpaiOption.setAttribute('value',cheliangpinpaiOptions[i]);
								cheliangpinpaiOption.innerHTML = cheliangpinpaiOptions[i];
								
								if(ruleForm.cheliangpinpai == cheliangpinpaiOptions[i]){
									cheliangpinpaiOption.setAttribute('selected','selected');
								}
								cheliangpinpaiSelect.appendChild(cheliangpinpaiOption);
							}
						}
					});
				}
												//普通下拉框渲染
				function cheliangleixingSelect(){	
					http("option/qicheleixing/cheliangleixing","GET",{},(res)=>{
						if(res.code == 0){
							cheliangleixingOptions = res.data;
							var cheliangleixingSelect = document.getElementById('cheliangleixingSelect');
							for(var i=0;i<cheliangleixingOptions.length;i++){
								var cheliangleixingOption = document.createElement('option');
								cheliangleixingOption.setAttribute('name','cheliangleixingOption');
								cheliangleixingOption.setAttribute('value',cheliangleixingOptions[i]);
								cheliangleixingOption.innerHTML = cheliangleixingOptions[i];
								
								if(ruleForm.cheliangleixing == cheliangleixingOptions[i]){
									cheliangleixingOption.setAttribute('selected','selected');
								}
								cheliangleixingSelect.appendChild(cheliangleixingOption);
							}
						}
					});
				}
																	//普通下拉框渲染
				function cheliangyanseSelect(){	
					http("option/qicheyanse/cheliangyanse","GET",{},(res)=>{
						if(res.code == 0){
							cheliangyanseOptions = res.data;
							var cheliangyanseSelect = document.getElementById('cheliangyanseSelect');
							for(var i=0;i<cheliangyanseOptions.length;i++){
								var cheliangyanseOption = document.createElement('option');
								cheliangyanseOption.setAttribute('name','cheliangyanseOption');
								cheliangyanseOption.setAttribute('value',cheliangyanseOptions[i]);
								cheliangyanseOption.innerHTML = cheliangyanseOptions[i];
								
								if(ruleForm.cheliangyanse == cheliangyanseOptions[i]){
									cheliangyanseOption.setAttribute('selected','selected');
								}
								cheliangyanseSelect.appendChild(cheliangyanseOption);
							}
						}
					});
				}
																																																				var ruleForm = {};
		var vm = new Vue({
		  el: '#addOrUpdateForm',
		  data:{
			  ruleForm : {},
			},
		  beforeCreate: function(){
			  var id = window.sessionStorage.getItem("id");
				if(id != null && id != "" && id != "null"){
					$.ajax({ 
		                type: "GET",
		                url: baseUrl + "cheliangxinxi/info/" + id,
		                beforeSend: function(xhr) {xhr.setRequestHeader("token", window.sessionStorage.getItem('token'));},
		                success: function(res){               	
		                	if(res.code == 0){
		                		vm.ruleForm = res.data;
				    		}else if(res.code == 401) {
				    			<%@ include file="../../static/toLogin.jsp"%>    
				    		}else{ alert(res.msg)}
		                },
		            });
				}
			},
			methods: { }
	  	});
		// 文件上传
		function upload(){
																																								$('#qichetupianupload').fileupload({
						url: baseUrl + 'file/upload',
						headers:{ token: window.sessionStorage.getItem("token")},
						dataType: 'json',
						done: function (e, data) {						
							document.getElementById('qichetupian-input').setAttribute('value',baseUrl+"upload/"+data.result.file);
							if(document.getElementById('qichetupianFileName') != null){
								document.getElementById('qichetupianFileName').innerHTML = data.result.file +"";
							}						
							$("#qichetupianImg").attr("src",baseUrl+"upload/"+data.result.file);
						}
					});
																																																																	$('#cheliangxiangqingupload').fileupload({
						url: baseUrl + 'file/upload',
						headers:{ token: window.sessionStorage.getItem("token")},
						dataType: 'json',
						done: function (e, data) {	
							UE.getEditor('cheliangxiangqingEditor').execCommand('insertHtml','<img src=\"'+ baseUrl +'upload/'+ data.result.file + '\" width=900 height=560 >');					
						}
					});
																							}  
		// 表单提交
		function submit() {
			if(validform() ==true && compare() == true){
				let data = {};
				getContent();
				let value = $('#addOrUpdateForm').serializeArray();
				$.each(value, function (index, item) { 
							data[item.name] = item.value;
						});
				let json = JSON.stringify(data);
				//console.log('json : ',json);
				var urlParam;
				var successMes = '';
				if(updateId!=null && updateId!="null" && updateId!=''){
					urlParam = 'update';
					successMes = '修改成功';
				}else{				
					urlParam = 'save';
					successMes = '添加成功';
				}
				httpJson("cheliangxinxi/"+urlParam,"POST",data,(res)=>{
					if(res.code == 0){
						window.sessionStorage.removeItem('id');	
						let flag = true;
																																																																																																																																																																																																															if(flag){
							alert(successMes);
						}					
						if(window.sessionStorage.getItem('onlyme') != null && window.sessionStorage.getItem('onlyme') == true){
							window.sessionStorage.removeItem('onlyme');
							window.location.href="${pageContext.request.contextPath}/index.jsp";
						}else{
							window.location.href="list.jsp";
						}
					}
				});
			}else{
				alert("表单未填完整或有错误");
			}
		}
		// 填充富文本框
		function setContent(){
																																																																																		if(ruleForm.cheliangxiangqing != null && ruleForm.cheliangxiangqing != 'null' && ruleForm.cheliangxiangqing != ''){
						var cheliangxiangqingMes = '' + ruleForm.cheliangxiangqing;
						var cheliangxiangqingUeditor = UE.getEditor('cheliangxiangqingEditor');
						cheliangxiangqingUeditor.ready(function() {
							cheliangxiangqingUeditor.setContent(cheliangxiangqingMes);
						});
				}
																				}  
		// 获取富文本框内容
		function getContent(){
																																																																																		if(UE.getEditor('cheliangxiangqingEditor').hasContents()){
					$('#cheliangxiangqing-input').attr('value',UE.getEditor('cheliangxiangqingEditor').getPlainTxt());
				}
																				}
		// 表单校验
		function validform() {
			return $("#addOrUpdateForm").validate({ 
				rules: {
					           				       			 	           										    cheliangmingcheng: {
														},
						       			 	           										    cheliangpinpai: {
														},
						       			 	           										    cheliangleixing: {
														},
						       			 	           										    qichetupian: {
														},
						       			 	           										    cheliangyanse: {
														},
						       			 	           										    huandangfangshi: {
														},
						       			 	           										    cheliangtianchuang: {
														},
						       			 	           										    chezuo: {
														},
						       			 	           										    qichepailiang: {
														},
						       			 	           										    cheliangjiage: {
															digits: true,
														},
						       			 	           										    cheliangkucun: {
															digits: true,
														},
						       			 	           										    cheliangxiangqing: {
														},
						       			 	           										    thumbsupnum: {
															digits: true,
														},
						       			 	           										    crazilynum: {
															digits: true,
														},
						       			 					},
				messages: {
																													cheliangmingcheng: {
														},
																								cheliangpinpai: {
														},
																								cheliangleixing: {
														},
																								qichetupian: {
														},
																								cheliangyanse: {
														},
																								huandangfangshi: {
														},
																								cheliangtianchuang: {
														},
																								chezuo: {
														},
																								qichepailiang: {
														},
																								cheliangjiage: {
															digits: "请输入整数",
														},
																								cheliangkucun: {
															digits: "请输入整数",
														},
																								cheliangxiangqing: {
														},
																								thumbsupnum: {
															digits: "请输入整数",
														},
																								crazilynum: {
															digits: "请输入整数",
														},
															}
			}).form();
		}
		// 添加表单校验方法
		function addValidation(){
			jQuery.validator.addMethod("isPhone", function(value, element) {
					var length = value.length;
					var mobile = /^(((13[0-9]{1})|(15[0-9]{1})|(18[0-9]{1})|(17[0-9]{1}))+\d{8})$/;
					return this.optional(element) || (length == 11 && mobile.test(value));
			}, "请填写正确的手机号码");
			jQuery.validator.addMethod("isIdCardNo", function(value, element) {
				return this.optional(element) || idCardNoUtil.checkIdCardNo(value);
			}, "请正确输入您的身份证号码");
		}
		// 获取当前详情
		function getDetails() {
			var id = window.sessionStorage.getItem("id");
			if(id != null && id != "" && id != "null"){
				$("#submitBtn").addClass("修改");
				updateId = id;
				window.sessionStorage.removeItem('id');
				http("cheliangxinxi/info/" + id,"GET",{},(res)=>{
					if(res.code == 0){
						ruleForm = res.data
						setSelectOption();
						// 设置图片src
						showImg();
						// 数据填充
						dataBind();
						// 富文本框回显	
						setContent();
																																																					cheliangpinpaiSelect();
																												cheliangleixingSelect();
																																									cheliangyanseSelect();
																																																																																																																																								//注册表单验证
						$(validform());
					}
				});
			}else{
															cheliangbianhaoUuid();
																													cheliangpinpaiSelect();	
																				cheliangleixingSelect();	
																													cheliangyanseSelect();	
																																																																																																		//注册表单验证
				$(validform());
			}
		}
		// 下拉框选项回显
		function setSelectOption(){
																																																																																																														}
		// 关联下拉框改变
		function lvSelectChange(level){
			let data = {};
			let value = $('#addOrUpdateForm').serializeArray();
			$.each(value, function (index, item) { 
			            data[item.name] = item.value;
			        });
							
											
											
											
											
											
											
											
											
											
											
											
											
											
											
										
		}
		// 清除可能会重复渲染的selection
		function clear(className){
			var elements = document.getElementsByClassName(className);
        	for(var i = elements.length - 1; i >= 0; i--) { 
        	  elements[i].parentNode.removeChild(elements[i]); 
        	}
		}
		function dateTimePick(){
			$.fn.datetimepicker.dates['zh-CN'] = { 
		            days: ["星期日", "星期一", "星期二", "星期三", "星期四", "星期五", "星期六", "星期日"],
		            daysShort: ["周日", "周一", "周二", "周三", "周四", "周五", "周六", "周日"],
		            daysMin:  ["日", "一", "二", "三", "四", "五", "六", "日"],
		            months: ["一月", "二月", "三月", "四月", "五月", "六月", "七月", "八月", "九月", "十月", "十一月", "十二月"],
		            monthsShort: ["一月", "二月", "三月", "四月", "五月", "六月", "七月", "八月", "九月", "十月", "十一月", "十二月"],
		            today: "今天",
		            suffix: [],
		            meridiem: ["上午", "下午"]
		    };
																																																																																																												
		}

		function calculation(){
			//积
			var x = 0;
			//和
			var y = 0;
			var flag = 0;
																																																																																																														}
		function calculationSE(colName){
			//单列求和接口
			http("cheliangxinxi"+colName,"GET",{
				tableName: "cheliangxinxi",
				columnName: colName
			},(res)=>{
				if(res.code == 0){
					$("#"+colName).attr("value",res.data);
				}
			});
		}

		function calculationPre(){
			//进入该页面就填充"单列求和"的列
																																																																																																														}
		function dataBind(){
			$("#updateId").val(ruleForm.id);	
												$("#cheliangbianhao").val(ruleForm.cheliangbianhao);	
																$("#cheliangmingcheng").val(ruleForm.cheliangmingcheng);	
																var cheliangpinpaiOptions = document.getElementsByClassName("cheliangpinpaiOption");
					for(var cheliangpinpaiCount = 0; cheliangpinpaiCount < cheliangpinpaiOptions.length;cheliangpinpaiCount++){
						if(cheliangpinpaiOptions[cheliangpinpaiCount].getAttribute('value') == ruleForm.cheliangpinpai){
							cheliangpinpaiOptions[cheliangpinpaiCount].setAttribute('selected','selected');
						}
					}
																var cheliangleixingOptions = document.getElementsByClassName("cheliangleixingOption");
					for(var cheliangleixingCount = 0; cheliangleixingCount < cheliangleixingOptions.length;cheliangleixingCount++){
						if(cheliangleixingOptions[cheliangleixingCount].getAttribute('value') == ruleForm.cheliangleixing){
							cheliangleixingOptions[cheliangleixingCount].setAttribute('selected','selected');
						}
					}
																$("#qichetupian-input").val(ruleForm.qichetupian);
																var cheliangyanseOptions = document.getElementsByClassName("cheliangyanseOption");
					for(var cheliangyanseCount = 0; cheliangyanseCount < cheliangyanseOptions.length;cheliangyanseCount++){
						if(cheliangyanseOptions[cheliangyanseCount].getAttribute('value') == ruleForm.cheliangyanse){
							cheliangyanseOptions[cheliangyanseCount].setAttribute('selected','selected');
						}
					}
																var huandangfangshiOptions = document.getElementsByClassName("huandangfangshiOption");
					for(var huandangfangshiCount = 0; huandangfangshiCount < huandangfangshiOptions.length;huandangfangshiCount++){
						if(huandangfangshiOptions[huandangfangshiCount].getAttribute('value') == ruleForm.huandangfangshi){
							huandangfangshiOptions[huandangfangshiCount].setAttribute('selected','selected');
						}
					}
																var cheliangtianchuangOptions = document.getElementsByClassName("cheliangtianchuangOption");
					for(var cheliangtianchuangCount = 0; cheliangtianchuangCount < cheliangtianchuangOptions.length;cheliangtianchuangCount++){
						if(cheliangtianchuangOptions[cheliangtianchuangCount].getAttribute('value') == ruleForm.cheliangtianchuang){
							cheliangtianchuangOptions[cheliangtianchuangCount].setAttribute('selected','selected');
						}
					}
																var chezuoOptions = document.getElementsByClassName("chezuoOption");
					for(var chezuoCount = 0; chezuoCount < chezuoOptions.length;chezuoCount++){
						if(chezuoOptions[chezuoCount].getAttribute('value') == ruleForm.chezuo){
							chezuoOptions[chezuoCount].setAttribute('selected','selected');
						}
					}
																$("#qichepailiang").val(ruleForm.qichepailiang);	
																$("#cheliangjiage").val(ruleForm.cheliangjiage);	
																$("#cheliangkucun").val(ruleForm.cheliangkucun);	
																$("#cheliangxiangqing").val(ruleForm.cheliangxiangqing);	
											
											
									}
		//图片显示
		function showImg(){
																																								var qichetupianFileName = "\"" + ruleForm.qichetupian + "\"";
					$("#qichetupianImg").attr("src",ruleForm.qichetupian);
																																																																															}		
       //跨表

        //跨表
        function crossTable(){
            crossTableName = window.sessionStorage.getItem('crossTableName');
			crossTableId = window.sessionStorage.getItem('crossTableId');
            if(crossTableName != null && crossTableName != '' && crossTableId != null && crossTableId != '' && crossTableId != -1){
				http(crossTableName + "/info/" + crossTableId,"GET",{},(res)=>{
					if(res.code == 0){
						crossRuleForm = res.data;
						$('#updateId').val(crossTableId);
												if(res.data != null && res.data != '' && res.data.cheliangbianhao != null && res.data.cheliangbianhao != ''){

															$("#cheliangbianhao").val(res.data.cheliangbianhao);
													}
												if(res.data != null && res.data != '' && res.data.cheliangmingcheng != null && res.data.cheliangmingcheng != ''){

															$("#cheliangmingcheng").val(res.data.cheliangmingcheng);
													}
												if(res.data != null && res.data != '' && res.data.cheliangpinpai != null && res.data.cheliangpinpai != ''){

															var cheliangpinpaiOptions = document.getElementsByClassName("cheliangpinpaiOption");
								for(var cheliangpinpaiCount = 0; cheliangpinpaiCount < cheliangpinpaiOptions.length;cheliangpinpaiCount++){
									if(cheliangpinpaiOptions[cheliangpinpaiCount].getAttribute('value') == res.data.cheliangpinpai){
										cheliangpinpaiOptions[cheliangpinpaiCount].setAttribute('selected','selected');
									}
								}
													}
												if(res.data != null && res.data != '' && res.data.cheliangleixing != null && res.data.cheliangleixing != ''){

															var cheliangleixingOptions = document.getElementsByClassName("cheliangleixingOption");
								for(var cheliangleixingCount = 0; cheliangleixingCount < cheliangleixingOptions.length;cheliangleixingCount++){
									if(cheliangleixingOptions[cheliangleixingCount].getAttribute('value') == res.data.cheliangleixing){
										cheliangleixingOptions[cheliangleixingCount].setAttribute('selected','selected');
									}
								}
													}
												if(res.data != null && res.data != '' && res.data.qichetupian != null && res.data.qichetupian != ''){

															$("#qichetupianImg").attr("src",res.data.qichetupian);
								$("#qichetupian-input").val(res.data.qichetupian);
													}
												if(res.data != null && res.data != '' && res.data.cheliangyanse != null && res.data.cheliangyanse != ''){

															var cheliangyanseOptions = document.getElementsByClassName("cheliangyanseOption");
								for(var cheliangyanseCount = 0; cheliangyanseCount < cheliangyanseOptions.length;cheliangyanseCount++){
									if(cheliangyanseOptions[cheliangyanseCount].getAttribute('value') == res.data.cheliangyanse){
										cheliangyanseOptions[cheliangyanseCount].setAttribute('selected','selected');
									}
								}
													}
												if(res.data != null && res.data != '' && res.data.huandangfangshi != null && res.data.huandangfangshi != ''){

															var huandangfangshiOptions = document.getElementsByClassName("huandangfangshiOption");
								for(var huandangfangshiCount = 0; huandangfangshiCount < huandangfangshiOptions.length;huandangfangshiCount++){
									if(huandangfangshiOptions[huandangfangshiCount].getAttribute('value') == res.data.huandangfangshi){
										huandangfangshiOptions[huandangfangshiCount].setAttribute('selected','selected');
									}
								}
													}
												if(res.data != null && res.data != '' && res.data.cheliangtianchuang != null && res.data.cheliangtianchuang != ''){

															var cheliangtianchuangOptions = document.getElementsByClassName("cheliangtianchuangOption");
								for(var cheliangtianchuangCount = 0; cheliangtianchuangCount < cheliangtianchuangOptions.length;cheliangtianchuangCount++){
									if(cheliangtianchuangOptions[cheliangtianchuangCount].getAttribute('value') == res.data.cheliangtianchuang){
										cheliangtianchuangOptions[cheliangtianchuangCount].setAttribute('selected','selected');
									}
								}
													}
												if(res.data != null && res.data != '' && res.data.chezuo != null && res.data.chezuo != ''){

															var chezuoOptions = document.getElementsByClassName("chezuoOption");
								for(var chezuoCount = 0; chezuoCount < chezuoOptions.length;chezuoCount++){
									if(chezuoOptions[chezuoCount].getAttribute('value') == res.data.chezuo){
										chezuoOptions[chezuoCount].setAttribute('selected','selected');
									}
								}
													}
												if(res.data != null && res.data != '' && res.data.qichepailiang != null && res.data.qichepailiang != ''){

															$("#qichepailiang").val(res.data.qichepailiang);
													}
												if(res.data != null && res.data != '' && res.data.cheliangjiage != null && res.data.cheliangjiage != ''){

															$("#cheliangjiage").val(res.data.cheliangjiage);
													}
												if(res.data != null && res.data != '' && res.data.cheliangkucun != null && res.data.cheliangkucun != ''){

															$("#cheliangkucun").val(res.data.cheliangkucun);
													}
												if(res.data != null && res.data != '' && res.data.cheliangxiangqing != null && res.data.cheliangxiangqing != ''){

															$("#cheliangxiangqing").val(res.data.cheliangxiangqing);
													}
												if(res.data != null && res.data != '' && res.data.thumbsupnum != null && res.data.thumbsupnum != ''){

							
																				}
												if(res.data != null && res.data != '' && res.data.crazilynum != null && res.data.crazilynum != ''){

							
																				}
											}
				});  
            }
            window.sessionStorage.removeItem('crossTableName');
			window.sessionStorage.removeItem('crossTableId');
        }
		
		//跨表更新字段
		function crossTableUpdate(){
			let flag = crossTableUpdateValidation();
			if(flag){
				httpJson(crossTableName + "/update","POST",{
					id: crossTableId,
																																																																																																																																																																														},(res)=>{
					if(res.code == 0){
						console.log('跨表更新成功');
						return true;
					}
				});   
			}
			return false;
		}

		//跨表更新前验证
		function crossTableUpdateValidation(){
			//防止减法导致库存负值
																																																																																																															return true;
		}
		function readonly(){
			if(window.sessionStorage.getItem('role') != '管理员'){
				$('#jifen').attr('readonly','readonly');
				$('#money').attr('readonly','readonly');
			}
		}

		//比较大小
		function compare(){
			var largerVal = null;
			var smallerVal = null;
																																																																																																if(largerVal !=null && smallerVal != null){
				if(largerVal<=smallerVal){
					alert(smallerName+'不能大于等于'+largerName);
					return false;
				}
			}
			return true;
		}		

		// 用户登出
        <%@ include file="../../static/logout.jsp"%>

		$(document).ready(function() { 
			$('#projectName').html(projectName)
			//设置导航栏菜单
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
			//初始化日期插件
			dateTimePick();
			//添加表单校验信息文本
			addValidation();
			getDetails();
			//初始化上传按钮
			upload();
			//单列求和
			calculationPre();
			//跨表
			crossTable();
			$('#submitBtn').on('click', function(e) {
			    e.preventDefault();
			    //console.log("点击了...提交按钮");
			    submit();
			});	
			<%@ include file="../../static/myInfo.js"%>
			readonly();
		});
	</script>
</body>
</html>