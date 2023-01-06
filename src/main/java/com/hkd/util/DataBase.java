package com.hkd.util;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

public class DataBase {
static String driver="com.mysql.cj.jdbc.Driver";
static String url="jdbc:mysql://localhost:3306/buyweb?characterEncoding=utf-8&serverTimezone=UTC";
static String user="root";
static String pwd="Root@123";
public static Connection conn=null;
static Statement sm=null;
ResultSet rs=null;
static {
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
}
//ʵ�ֲ�ѯ
public ResultSet getResult(String sql) {
	try {
		rs=sm.executeQuery(sql);
	} catch (SQLException e) {
		// TODO Auto-generated catch block
		e.printStackTrace();
	}
	return rs;
}
//ʵ����ɾ��
public void executeDML(String sql) throws SQLException {
	
		sm.executeUpdate(sql);
	
}
public void closeDb() {
	try {
		if(rs!=null)
			rs.close();
		if(sm!=null)
			sm.close();
		if(conn!=null)
			conn.close();
	} catch (SQLException e) {
		// TODO Auto-generated catch block
		e.printStackTrace();
	}
}
}
