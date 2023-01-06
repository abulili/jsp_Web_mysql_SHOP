package com.hkd.doimp;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import com.hkd.dao.UserinfoDao;
import com.hkd.entity.Userinfo;
import com.hkd.util.DataBase;

public class UserinfoDaoImp extends DataBase implements UserinfoDao{

	@Override
	public ArrayList<Userinfo> checkByName(String username, String password) {
    String sql="select * from userinfo where username='"+username+"' and password='"+password+"'";
		
		ArrayList<Userinfo> list=new ArrayList<Userinfo> ();
		ResultSet rs=this.getResult(sql);
		try {
			while(rs.next())
			{
				Userinfo signon=new Userinfo();
				signon.setUserName(rs.getString("username"));
				signon.setPassword(rs.getString("password"));
				list.add(signon);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return list;
	}

	

	@Override
	public void insertSignon(String username, String password) throws SQLException {
		String sql="insert into userinfo values('"+username+"','"+password+"')";
		this.executeDML(sql);
		
		}



	@Override
	public ArrayList<Userinfo> getAllSignon() {
		
	    String sql="select * from userinfo";
			
			ArrayList<Userinfo> list=new ArrayList<Userinfo> ();
			ResultSet rs=this.getResult(sql);
			try {
				while(rs.next())
				{
					Userinfo signon=new Userinfo();
					signon.setUserName(rs.getString("username"));
					signon.setPassword(rs.getString("password"));
					list.add(signon);
					
				}
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			return list;
		
	}



	@Override
	public void updateSignon(String uname,String pwd) throws SQLException {
		String sql="update userinfo set password='"+pwd+"' where username='"+uname+"'";
		this.executeDML(sql);
		
	}



	@Override
	public void deleteSignon(String uname) throws SQLException {
		String sql="delete from userinfo where username='"+uname+"'";
		this.executeDML(sql);
		
	}



	@Override
	public ArrayList<Userinfo> checkByName(String username) {

	    String sql="select * from userinfo where username='"+username+"'";			
			ArrayList<Userinfo> list=new ArrayList<Userinfo> ();
			ResultSet rs=this.getResult(sql);
			try {
				while(rs.next())
				{
					Userinfo signon=new Userinfo();
					signon.setUserName(rs.getString("username"));
					signon.setPassword(rs.getString("password"));
					list.add(signon);
					
				}
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			return list;		
	}	

}
