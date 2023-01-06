package com.hkd.dao;

import java.sql.SQLException;
import java.util.ArrayList;

import com.hkd.entity.Goods;



public interface GoodsDao {
	
	public ArrayList<Goods> FindGoods(String species);
	
	public ArrayList<Goods> FindVid(String vid);
	
	public ArrayList<Goods> FindName(String name);
	
	public void insertGoods(String vid,String name, String prices, String hosts, String species) throws SQLException;
	
	public ArrayList<Goods> getAllGoods();
	
	public void updateGoods(String vid,String price) throws SQLException;
	
	public ArrayList<Goods> deleteGoods(String vid) throws SQLException;

}
