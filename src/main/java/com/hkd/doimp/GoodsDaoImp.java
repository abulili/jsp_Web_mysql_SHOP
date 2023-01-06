package com.hkd.doimp;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import com.hkd.dao.GoodsDao;
import com.hkd.entity.Goods;
import com.hkd.util.DataBase;

public class GoodsDaoImp extends DataBase implements GoodsDao{

	@Override
	public ArrayList<Goods> FindGoods(String species) {
    String sql="select * from goods where species='"+species+"'";
		
		ArrayList<Goods> list=new ArrayList<Goods> ();
		ResultSet rs=this.getResult(sql);
		try {
			while(rs.next())
			{
				Goods signon=new Goods();
				signon.setVid("vid");
				signon.setName("name");
				signon.setPrice("price");
				signon.setHosts("hosts");
				signon.setSpecies("specices");
				list.add(signon);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return list;
	}
	
	public ArrayList<Goods> FindVid(String vid) {
	    String sql="select * from goods where vid='"+vid+"'";
			
			ArrayList<Goods> list=new ArrayList<Goods> ();
			ResultSet rs=this.getResult(sql);
			try {
				while(rs.next())
				{
					Goods signon=new Goods();
					signon.setVid("vid");
					signon.setName("name");
					signon.setPrice("price");
					signon.setHosts("hosts");
					signon.setSpecies("specices");
					list.add(signon);
				}
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			return list;
		}

	

	@Override
	public void insertGoods(String vid, String name, String prices, String hosts, String species) throws SQLException {
		String sql="insert into userinfo values('"+vid+"','"+ name + "','" + prices + "','" + hosts + "','" + species +"')";
		this.executeDML(sql);
		
	}



	@Override
	public ArrayList<Goods> getAllGoods() {
		
	    String sql="select * from goods";
			
			ArrayList<Goods> list=new ArrayList<Goods> ();
			ResultSet rs=this.getResult(sql);
			try {
				while(rs.next())
				{
					Goods signon=new Goods();
					signon.setVid(rs.getString("vid"));
					signon.setName(rs.getString("name"));
					signon.setPrice(rs.getString("price"));
					signon.setHosts(rs.getString("hosts"));
					signon.setSpecies(rs.getString("species"));
					list.add(signon);
					
				}
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			return list;
		
	}



	@Override
	public void updateGoods(String vid,String price) throws SQLException {
		String sql="update Goods set prices='"+price+"' where vid='"+vid+"'";
		this.executeDML(sql);
		
	}



	@Override
	public ArrayList<Goods> deleteGoods(String vid) throws SQLException {
		String sql="delete from goods where vid='"+vid+"'";
		this.executeDML(sql);
		
		sql="select * from goods where vid='"+vid+"'";			
		ArrayList<Goods> list=new ArrayList<Goods> ();
		ResultSet rs=this.getResult(sql);
		try {
			while(rs.next())
			{
				Goods signon=new Goods();
				signon.setVid(rs.getString("vid"));
				signon.setName(rs.getString("name"));
				signon.setPrice(rs.getString("price"));
				signon.setHosts(rs.getString("hosts"));
				signon.setSpecies(rs.getString("species"));
				list.add(signon);
				
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return list;	
	}



	@Override
	public ArrayList<Goods> FindName(String name) {

	    String sql="select * from goods where name='"+name+"'";			
			ArrayList<Goods> list=new ArrayList<Goods> ();
			ResultSet rs=this.getResult(sql);
			try {
				while(rs.next())
				{
					Goods signon=new Goods();
					signon.setVid(rs.getString("vid"));
					signon.setName(rs.getString("name"));
					signon.setPrice(rs.getString("price"));
					signon.setHosts(rs.getString("hosts"));
					signon.setSpecies(rs.getString("species"));
					list.add(signon);
					
				}
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			return list;		
	}	

}
