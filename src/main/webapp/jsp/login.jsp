<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="zh-cn">

    <head>

        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <title>登录</title>

        <!-- CSS -->
        <!--<link rel="stylesheet" href="http://fonts.googleapis.com/css?family=Roboto:400,100,300,500">-->
        <link rel="stylesheet" href="assets/bootstrap/css/bootstrap.min.css">
        <link rel="stylesheet" href="assets/font-awesome/css/font-awesome.min.css">
		<link rel="stylesheet" href="assets/css/form-elements.css">
        <link rel="stylesheet" href="assets/css/style.css">

        <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
        <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
        <!--[if lt IE 9]>
            <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
            <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
        <![endif]-->

        <!-- Favicon and touch icons -->
        <link rel="shortcut icon" href="assets/ico/favicon.png">
        <link rel="apple-touch-icon-precomposed" sizes="144x144" href="assets/ico/apple-touch-icon-144-precomposed.png">
        <link rel="apple-touch-icon-precomposed" sizes="114x114" href="assets/ico/apple-touch-icon-114-precomposed.png">
        <link rel="apple-touch-icon-precomposed" sizes="72x72" href="assets/ico/apple-touch-icon-72-precomposed.png">
        <link rel="apple-touch-icon-precomposed" href="assets/ico/apple-touch-icon-57-precomposed.png">

    </head>

    <body>

		<!-- Top menu -->
		<nav class="navbar navbar-inverse navbar-no-bg" role="navigation">
			<div class="container">
				<div class="navbar-header">
					<button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#top-navbar-1">
						<span class="sr-only">Toggle navigation</span>
						<span class="icon-bar"></span>
						<span class="icon-bar"></span>
						<span class="icon-bar"></span>
					</button>
					<a class="navbar-brand" href="index.html">Bootstrap Flat Registration Form Template</a>
				</div>
				<!-- Collect the nav links, forms, and other content for toggling -->
				<div class="collapse navbar-collapse" id="top-navbar-1">
				</div>
			</div>
		</nav>

        <!-- Top content -->
        <div class="top-content">
        	<div class="copyrights">Collect from <a href="http://www.cssmoban.com/"  title="网站模板">网站模板</a></div>
            <div class="inner-bg">
                <div class="container">
                    <div class="row">
                        <div class="col-sm-7 text">
                            <div class="description">
                            </div>
                        </div>
                        <div class="col-sm-5 form-box">
                        	<div class="form-top">
                        		<div class="form-top-left">
                        			<h3>请先登录</h3>
                            		<p>在下方填写您的登录信息</p>
                        		</div>
                        		<div class="form-top-right">
                        			<i class="fa fa-pencil"></i>
                        		</div>
                        		<div class="form-top-divider"></div>
                            </div>
                            <div class="form-bottom">
			                    <form role="form" action="" method="post" id="loginForm">
			                    	<div class="form-group">
			                    		<label class="sr-only" for="username">账号</label>
			                        	<input type="text" name="username" placeholder="请输入账号" class="form-control" id="username">
			                        </div>
			                        <div class="form-group">
			                        	<label class="sr-only" for="password">密码</label>
			                        	<input type="password" name="password" placeholder="请输入密码" class="form-control" id="password">
			                        </div>
			                        <div class="form-group" id="rolesGroup">
			                        </div>
			                        <button type="submit" class="btn" onclick="login()">登 录</button>
			                        																					<a href="modules/yonghu/register.jsp">用户注册</a>
																																																																																																																																																																																																																																																																													                    </form>
		                    </div>
                        </div>
                    </div>
                </div>
            </div>
            
        </div>


        <!-- Javascript -->
        <script src="assets/js/jquery-1.11.1.min.js"></script>
        <script src="assets/bootstrap/js/bootstrap.min.js"></script>
        <script src="assets/js/jquery.backstretch.min.js"></script>
        <script src="assets/js/retina-1.1.0.min.js"></script>
        <script src="assets/js/scripts.js"></script>
        <script src="${pageContext.request.contextPath}/resources/assets/js/jquery.form.js"></script>
        
        <script type="text/javascript">
		 <%@ include file="utils/menu.jsp"%>	
		 <%@ include file="utils/baseUrl.jsp"%>	
		 var role = "";
		 var accountTableName = "";
	  	 //渲染角色选择
	  	 function setRoleOption(){
	  		 for(var i=0;i<menus.length;i++){
	  			 var checkbox = document.createElement('input');
	  			 checkbox.setAttribute('type','radio');
	  			 checkbox.setAttribute('name','chk');
	  			 checkbox.setAttribute('value',menus[i].roleName);
	  			 var attr = "checkRole(" + "\'" + menus[i].roleName  + "\',\'"+  menus[i].tableName + "\')";
	  			 checkbox.setAttribute('onclick',attr);
	  			 var text = document.createTextNode(menus[i].roleName);
	  			 $('#rolesGroup').append(checkbox);
	  			 $('#rolesGroup').append(text);
	  		 }
	  	 }
	  	 function checkRole(roleName,tableName){
			role = roleName;
			$('#loginForm').attr('action',baseUrl + tableName+ '/login');
			accountTableName = tableName;
	  	 }
		  function login() {
			  $("#loginForm").ajaxForm(function (res) {
				  if(role == "" || role == null){
					  alert("请选择角色后再登录");
				  }else{
					  if(res.code == 0) {
						  alert("登录成功");
						  var username = $('#username').val();
						  window.sessionStorage.setItem('accountTableName',accountTableName);
						  window.sessionStorage.setItem('username',username);
						  window.sessionStorage.setItem('token', res.token);
						  window.sessionStorage.setItem('role', role);
						  window.location.href="${pageContext.request.contextPath}/index.jsp";
					  }
					  else{
						  alert(res.msg);
					  }
				  }
				  
			  });
		  }
		  function ready(){
			  setRoleOption();
			  //$('#loginForm').attr('action',baseUrl+'users/login')
		  }
		  document.addEventListener("DOMContentLoaded", ready);
	  </script>
        
        <!--[if lt IE 10]>
            <script src="assets/js/placeholder.js"></script>
        <![endif]-->

    </body>

</html>