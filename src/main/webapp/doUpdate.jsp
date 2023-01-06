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
<%
String userid = (String)session.getAttribute("user");
String email = request.getParameter("email");
String addr1 = request.getParameter("addr1");
String phone = request.getParameter("phone");
String password = request.getParameter("pwd");
out.print(password); 
%>
<%
String driver="com.mysql.cj.jdbc.Driver";
String url="jdbc:mysql://localhost:3306/buyweb?characterEncoding=utf-8&serverTimezone=UTC";
String user="root";
String pwd="Root@123";
Connection conn=null;
Statement sm=null;
int rs= 0;
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
String sql = "update account set email='" + email + "',addr1='" + addr1 + "',phone='" + phone + "' where userid='" + userid + "'";
rs = sm.executeUpdate(sql);
sql = "update userinfo set password='" + password + "' where username='" + userid + "'";
rs = sm.executeUpdate(sql);
out.print("<script>window.location.href='selfInfo.jsp'</script>");
%>