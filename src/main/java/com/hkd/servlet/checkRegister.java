package com.hkd.servlet;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import com.hkd.doimp.UserinfoDaoImp;
import com.hkd.entity.Userinfo;
@WebServlet("/checkRegister")
public class checkRegister extends HttpServlet {	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		this.doPost(request, response);
	}
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {		
		String name=request.getParameter("uname");
		UserinfoDaoImp sdi=new UserinfoDaoImp();
		ArrayList<Userinfo> slist=sdi.checkByName(name);
		PrintWriter out = response.getWriter();		
		if(slist.size()>0)
			out.print("1");
		else
			out.print("0");
		out.flush();
		out.close();	
	}
}
