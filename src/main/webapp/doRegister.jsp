<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ page import="com.hkd.doimp.UserinfoDaoImp" %>
<%@ page import="com.hkd.doimp.AccountDaoImp" %>
<%@ page import="com.hkd.util.DataBase" %>
<%@ page import="java.sql.SQLException" %>
<%
request.setCharacterEncoding("utf-8");
response.setCharacterEncoding("utf-8");	
String uname=request.getParameter("uname");
String pwd=request.getParameter("pwd");
String email=request.getParameter("email");
String phone=request.getParameter("phone");
String addr1=request.getParameter("addr1");
UserinfoDaoImp sdi=new UserinfoDaoImp();
AccountDaoImp adi=new AccountDaoImp();		
try {
	DataBase.conn.setAutoCommit(false);			
	sdi.insertSignon(uname, pwd);			
	adi.insertAccount(uname, email, addr1, phone);			
	DataBase.conn.commit();
	out.print("<script>alert('right')</script>");					
	out.print("<script>window.location.href='login.jsp'</script>");
} catch (SQLException e) {
	try {
		System.out.println("插入有误，进行回滚");
		DataBase.conn.rollback();
		out.print("<script>alert('wrong')</script>");				
		out.print("<script>window.location.href='register.jsp'</script>");
	} catch (SQLException e1) {
		// TODO Auto-generated catch block
		e1.printStackTrace();
	}
}

%>