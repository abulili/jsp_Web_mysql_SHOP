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
<head><meta charset="utf-8">
<title>部门详情</title>
<!--引入JQuery的JS文件：JQuery的JS文件要在BootStrap的js的文件的前面引入-->
<script type="text/javascript" src="js/jquery-1.11.3.min.js"></script>
<script type="text/javascript" src="js/vue.js"></script>
<!--引入BootStrap的JS的文件-->
<script type="text/javascript" src="js/bootstrap.js"></script>
<link rel="stylesheet" type="text/css" href="./css/base.css">
<link rel="stylesheet" type="text/css" href="./css/common.css">
<link rel="stylesheet" type="text/css" href="./css/index.css">
<link rel="stylesheet" type="text/css" href="./css/car.css">
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
<% 
String species = request.getParameter("species");
String driver="com.mysql.cj.jdbc.Driver";
String url="jdbc:mysql://localhost:3306/buyweb?characterEncoding=utf-8&serverTimezone=UTC";
String user="root";
String pwd="Root@123";
Connection conn=null;
Statement sm=null;
ResultSet rs= null;
try {
	Class.forName(driver);
	conn=DriverManager.getConnection(url,user,pwd);
	sm=conn.createStatement();
} catch (ClassNotFoundException e) {
	// TODO Auto-generated catch block
	e.printStackTrace();
} catch (SQLException e) {
	// TODO Auto-generated catch block
	e.printStackTrace();
}
String sql = "select * from goods where species='" + species + "'";
rs = sm.executeQuery(sql);
%>
<div class="middle">
	
		<%
		if(!rs.next()){
			out.print("<h1>找不到相关内容呢</h1>");
			out.print("<a href='buycar.jsp' style='color:#e85f5b'>查找其它内容🔍</a>");
		}
		else {
		while(rs.next()) 
		{
		%>
		<table>
		<tr>
			<td>编号</td>
			<td>名称</td>
			<td>价格</td>
			<td>店家</td>
			<td>种类</td>
			<td>  </td>
		</tr>
			<tr>
				<td name="vid"><%=rs.getString("vid") %></td>
				<td name="name"><%=rs.getString("name") %></td>
				<td name="price"><%=rs.getString("price") %></td>
				<td name="hosts"><%=rs.getString("hosts") %></td>
				<td name="species"><%=rs.getString("species") %></td>
				<!-- <script>
				a=document.getElementById('vid').innerText;
				alter(a);
				</script> -->
				<td class="tddel"><a href="dodel.jsp?vid=<%=rs.getString("vid")%>"><b class="del">对此商品不感兴趣？移除此商品</b></a></td>
			</tr>
		
		<% 
		} 
		}
		%>
	</table>
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
