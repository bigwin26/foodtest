package com.food.webapp.dao.mybatis;

import java.util.List;

import com.food.webapp.dao.RestaurantDao;
import com.food.webapp.entity.Restaurant;

public class MyBatisRestaurantDao implements RestaurantDao {


	@Override
	public int insert(Restaurant restaurant) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int insert(String name, String location, String address, String content, String genre, String keyword,
			String image, String tip) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public List<Restaurant> getList(int page, String query, String field) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public Restaurant get(int id) {
		// TODO Auto-generated method stub
		return null;
	}

	

}
