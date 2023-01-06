package com.hkd.dao;

import java.sql.SQLException;
import java.util.ArrayList;

import com.hkd.entity.Account;



public interface AccountDao {
	
	public void insertAccount(String userid,String email,String addr1,String phone ) throws SQLException;

	public ArrayList<Account> selectAccount(String userid);
}
