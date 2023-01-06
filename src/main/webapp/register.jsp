<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<html>
<head>
<meta charset="UTF-8">
<!--BootStrap设计的页面支持响应式的 -->
<meta name="viewport" content="width=device-width, initial-scale=1">
<title></title>
<!--引入BootStrap的CSS-->
<link rel="stylesheet" href="css/bootstrap.css" type="text/css" />
<!--引入JQuery的JS文件：JQuery的JS文件要在BootStrap的js的文件的前面引入-->
<script type="text/javascript" src="js/jquery-1.11.3.min.js"></script>
<!--引入BootStrap的JS的文件-->
<script type="text/javascript" src="js/bootstrap.js"></script>
<link rel="stylesheet" type="text/css" href="./css/base.css"/>
<link rel="stylesheet" type="text/css" href="./css/register.css"/>
<script type="text/javascript">		
$(document).ready(function(){
 $("#uname").blur(function()
{
	var name = $("#uname").val();			
	var info=$("#info");			
	if(name == ""){
		alert("请输入用户名");
		return false;
	}else{
		$.ajax({
			url:"checkRegister",
			type:"post",
			contentType:"application/x-www-form-urlencoded",
			data:"uname="+name,		          
            success:function(str){
					if(str==0){
					info[0].innerHTML = "用户名不存在，可以使用";								
				}else{
					info[0].innerHTML="用户名已经存在";							
				}		            		
			},
			error:function()
			{
				alert("error");					
			}				
		});
	}			
}		
);
}
);
</script>
</head>
<body>
		<div class="wrapper">
			<div class="logo">
				<img src="./image/logo.png">&nbsp;
				<span class="head-text">注册</span>
				<b class="login-a">已有账号,<a href="login.jsp" style="color:red;">去登录></a></b>
			</div>
		</div>
		<!--body-->
		<div class="content">
			<div class="rebox">
				<form class="form-horizontal" role="form" action="DoRegister">
					<div class="form-group" style="margin-left: 200px;">
						<div class="col-sm-5">
							<label for="inputEmail3" class="col-sm-2 control-label">用&nbsp;户&nbsp;名</label>
							<input type="text" class="form-control" placeholder=" 用户名" class="login-label"
								name="uname" id="uname" />
						</div>
						<div id="info" style="display: inline"></div>
					</div>
					<div class="form-group" style="margin-left: 200px">
						<div class="col-sm-5">
							<label for="inputPassword3" class="col-sm-2 control-label" class="login-label">密&nbsp;&nbsp;&nbsp;&nbsp;码</label>
							<input type="password" class="form-control" id="inputPassword3"
								placeholder=" 密码" name="pwd">
						</div>
					</div>
					<div class="form-group" style="margin-left: 200px;">
						<div class="col-sm-5">
							<label for="inputEmail3" class="col-sm-2 control-label" class="login-label">邮&nbsp;&nbsp;&nbsp;&nbsp;箱</label>
							<input type="text" class="form-control" placeholder=" 邮箱"
								name="email">
						</div>
					</div>
					<div class="form-group" style="margin-left: 200px;">
						<div class="col-sm-5">
							<label for="inputEmail3" class="col-sm-2 control-label" class="login-label">电&nbsp;&nbsp;&nbsp;&nbsp;话</label>
							<input type="text" class="form-control" placeholder=" 电话"
								name="phone">
						</div>
					</div>
					<div class="form-group" style="margin-left: 200px;">
						<div class="col-sm-5">
							<label for="inputEmail3" class="col-sm-2 control-label" class="login-label">常用地址</label>
							<input type="text" class="form-control" placeholder=" 常用地址"
								name="addr1">
						</div>
					</div>
					<div class="form-group" style="margin-left: 200px;">
						<div class="col-sm-offset-2 col-sm-10">
							<button type="submit" class="btn btn-default">注册</button>
						</div>
					</div>
				</form>
			</div>
		</div>
		<div>
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
		</div>
</body>
</html>
