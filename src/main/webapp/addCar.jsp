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
String vid = request.getParameter("vid");
String username = (String)session.getAttribute("user");
String name = request.getParameter("name");
String price = request.getParameter("price");
String hosts = request.getParameter("hosts");
String species = request.getParameter("species");
/* out.print(vid); */
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
String sql = "insert into cars values('" + username + "','" + vid + "','" + name + "','" + price + "','" + hosts + "','" + species + "')";
rs = sm.executeUpdate(sql);
out.print("<script>window.location.href='buycar.jsp'</script>");
%>