package com.hkd.dao;

import java.sql.SQLException;
import java.util.ArrayList;

import com.hkd.entity.Userinfo;



public interface UserinfoDao {
	
	public ArrayList<Userinfo> checkByName(String username,String password);
	
	public ArrayList<Userinfo> checkByName(String username);
	
	public void insertSignon(String username,String password) throws SQLException;
	
	public ArrayList<Userinfo> getAllSignon();
	
	public void updateSignon(String uname,String pwd) throws SQLException;
	
	public void deleteSignon(String uname) throws SQLException;

}
