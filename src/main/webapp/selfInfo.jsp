<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ page import="com.hkd.doimp.GoodsDaoImp" %>
<%@ page import="com.hkd.entity.Goods" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.DriverManager" %>
<%@ page import="java.sql.ResultSet" %>
<%@ page import="java.sql.SQLException" %>
<%@ page import="java.sql.Statement" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="css/bootstrap.css" type="text/css" />
<!--引入JQuery的JS文件：JQuery的JS文件要在BootStrap的js的文件的前面引入-->
<script type="text/javascript" src="js/jquery-1.11.3.min.js"></script>
<script type="text/javascript" src="js/vue.js"></script>
<!--引入BootStrap的JS的文件-->
<script type="text/javascript" src="js/bootstrap.js"></script>
<link rel="stylesheet" type="text/css" href="./css/base.css">
<link rel="stylesheet" type="text/css" href="./css/common.css">
<link rel="stylesheet" type="text/css" href="./css/index.css">
<link rel="stylesheet" type="text/css" href="./css/selfInfo.css"/>
<style>
   body{
    margin: 0;
    padding: 0;
   }
   .lunbo{
    width:100%;
    height:720px;
    background-image: url(./image/1.png);/*背景图片*/
    background-size:100% 100%; 
   }
  </style>
</head>
<body>
	<div class="shortcut">
        <div class="wrapper">
            <!-- 因为每一个a都相同 -->
            <ul>
            	<li>
            		<%
					if(session.getAttribute("user")!=null)
					{
						String uname=(String)session.getAttribute("user");
						out.print("<a href='DoInvalidate'>欢迎"+uname + " 注销</a>");
					}
					else
					{
						out.print("<a href='login.jsp'>登录</a>");
						 RequestDispatcher rd = request.getRequestDispatcher("login.jsp"); 
						 rd.forward(request,response); 
					}
					%>
            	</li>
            	<li><a href="register.jsp">免费注册</a></li>
            	<li><a href="buycar.jsp">全部商品</a></li>
                <li><a href="selfInfo.jsp">我的淘宝</a></li>
                <li><a href="realCar.jsp">购物车</a></li>
                <li><a href="#">收藏夹</a></li>
                <li><a href="#"><span></span>联系客服</a></li>
            </ul>
        </div>
    </div>
    <div class="header wrapper">
        <div class="logo">
            <h1><a href="index.jsp">购物网站</a></h1>
        </div>
        <div class="nav">
            <ul>
                <li><a href="index.jsp">首页</a></li>
                <li><a href="#">猫天</a></li>
                <li><a href="#">聚划算</a></li>
                <li><a href="#">猫超</a></li>
                <li><a href="#">司法拍卖</a></li>
                <li><a href="#">旅行</a></li>
                <li><a href="#">特卖</a></li>
            </ul>
        </div>
        <div class="search">
            <input type="text" placeholder="回车键搜索商品种类" id="input"  onkeydown="if(event.keyCode==13) dosome()" style="width:100%">
            <span></span>
            <script type="text/javascript">  
                var dosome = function(){  
                    document.location.href ='doSerach.jsp?species=' + $("#input").val();  
                    return false;
                }  
            </script> 
        </div>
        <div class="car">
            <span>0</span>
        </div>
    </div>

<div class="middle">
	<div class="content">
			<div class="rebox">
				<form class="form-horizontal" role="form" action='doUpdate.jsp'>
					<div class="form-group" style="margin-left: 200px;">
						<div class="col-sm-5">
							<label for="inputEmail3" class="col-sm-2 control-label">用&nbsp;户&nbsp;名</label>
							<input type="text" class="form-control" placeholder=<%=(String)session.getAttribute("user")%> class="login-label"
								name="uname" id="uname" readonly="readonly"/>
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
							<button type="submit" class="btn btn-default">修改</button>
						</div>
					</div>
				</form>
			</div>
		</div>
</div>
    <div class="footer">
        <div class="wrapper">
            <div class="top">
                <ul>
                    <li>
                        <!-- 通过伪元素添加标签实现精灵图 -->
                        <span>价格亲民</span>
                    </li>
                    <li>
                        <span>品类齐全</span>
                    </li>
                    <li>
                        <span>多仓直发</span>
                    </li>
                </ul>
            </div>
            <div class="bottom">
                <p>
                    <a href="#">关于我们</a> |
                    <a href="#">联系我们</a> |
                    <a href="#">联系客服</a> |
                    <a href="#">合作招商</a> |
                    <a href="#">隐私政策</a>
                </p>
                <p>copyRight @ 202020201204</p>
            </div>
        </div>
    </div>
</body>
</html>