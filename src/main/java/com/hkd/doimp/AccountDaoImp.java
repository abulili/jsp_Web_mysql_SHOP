package com.hkd.doimp;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import com.hkd.dao.AccountDao;
import com.hkd.entity.Account;
import com.hkd.util.DataBase;

public class AccountDaoImp extends DataBase implements AccountDao{

	@Override
	public void insertAccount(String userid, String email, String addr1, String phone) throws SQLException {
		
		String sql=" insert into account(userid,email,addr1,phone) values('"+userid+"','"+email+"','"+addr1+"','"+phone+"')";
			this.executeDML(sql);
	}
	public ArrayList<Account> selectAccount(String userid) {
		String sql="select * from account where userid='"+userid+"'";
		ResultSet rs=this.getResult(sql);
		ArrayList<Account> list=new ArrayList<Account>();
		try {
				while(rs.next())
				{
					Account account=new Account();
					account.setUserid(rs.getString("userid"));
					account.setEmail(rs.getString("email"));
					account.setAddr1(rs.getString("addr1"));
					account.setPhone(rs.getString("phone"));
					list.add(account);
					
				}
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			
		return list;
	}
}
