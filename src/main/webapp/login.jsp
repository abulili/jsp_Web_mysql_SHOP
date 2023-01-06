<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<!--引入BootStrap的CSS-->
<link rel="stylesheet" href="css/bootstrap.css" type="text/css" />
<!--引入JQuery的JS文件：JQuery的JS文件要在BootStrap的js的文件的前面引入-->
<script type="text/javascript" src="js/jquery-1.11.3.min.js"></script>
<!--引入BootStrap的JS的文件-->
<script type="text/javascript" src="js/bootstrap.js"></script>
<link rel="stylesheet" type="text/css" href="./css/base.css"/>
<link rel="stylesheet" type="text/css" href="./css/login.css"/>
</head>
<body>
	<div class="wrapper">
		<div class="logo">
			<img src="./image/logo.png">&nbsp;
			<span class="head-text">欢迎登录</span>
		</div>
	</div>
	<%
			if(session.getAttribute("info")!=null)
			{
				String info=(String)session.getAttribute("info");
				out.print(info);
			}			
	%>
	<div class="content">
		<div class="content-inner">
			<div class="login-box">
				<div class="login-content">
					<form action="DoLogin" method="post" class="form-login" role="form">
						<div class="login-input"><label class="login-name login-label"></label><input type="text" name="uname" class="login-text" id="inputEmail3" placeholder="用户名"></div>
						<div class="login-input"><label class="login-pwd login-label"></label><input type="text" name="pwd" class="login-text" id="inputPassword3" placeholder="密码"></div>
						<div class="forget"><span class="forget-pwd"><a href="#">忘记密码</a></span></div>
						<div class="btn"><input type="submit" value="登     陆" class="btn-sub"></div>
					</form>
				</div>
				<div class="register-box"><a href="register.jsp">立即注册</a></div>
			</div>
		</div>
	</div>
	
	<div class="footer">
		<div class="links">
			<a href="https://github.com/" target="_blank">友情链接</a>
			|
			<a href="https://桉念.xyz/" target="_blank">关于我们</a>
		</div>
		<div class="copyright">
            Copyright © 2022-2022 202020201204 版权所有
        </div>
	</div>
</body>
</html>