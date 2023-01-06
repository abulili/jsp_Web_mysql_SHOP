package com.hkd.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.hkd.doimp.AccountDaoImp;
import com.hkd.doimp.UserinfoDaoImp;
import com.hkd.util.DataBase;



/**
 * Servlet implementation class DoRegister
 */
@WebServlet("/DoRegister")
public class DoRegister extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public DoRegister() {
        super();
        // TODO Auto-generated constructor stub
    }
	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setCharacterEncoding("utf-8");
		PrintWriter out=response.getWriter();		
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
				System.out.println("wronggg");
				DataBase.conn.rollback();
				out.print("<script>alert('wrong')</script>");				
				out.print("<script>window.location.href='register.jsp'</script>");
			} catch (SQLException e1) {
				// TODO Auto-generated catch block
				e1.printStackTrace();
			}
		}
	}
	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
