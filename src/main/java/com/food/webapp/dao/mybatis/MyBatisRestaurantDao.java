package com.food.webapp.dao.mybatis;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;

import com.food.webapp.dao.RestaurantDao;
import com.food.webapp.entity.Restaurant;

public class MyBatisRestaurantDao implements RestaurantDao {

	@Autowired
	private SqlSessionTemplate sqlSession;
	
	@Override
	public List<Restaurant> getList(int page, String query, String field) {
		RestaurantDao restaurantDao = sqlSession.getMapper(RestaurantDao.class);
		List<Restaurant> list = restaurantDao.getList(page, field, query);
		
		return list;
	}
	
	@Override
	public Restaurant get(int id) {
		// TODO Auto-generated method stub
		return null;
	}
	
	@Override
	public int getCount() {
		RestaurantDao restaurantDao = sqlSession.getMapper(RestaurantDao.class);
		int result = restaurantDao.getCount();
		
		return result;
	}
	
	@Override
	public int insert(Restaurant restaurant) {
		RestaurantDao restaurantDao = sqlSession.getMapper(RestaurantDao.class);
		int result = restaurantDao.insert(restaurant);
		
		return result;
	}

	@Override
	public int insert(String name, String location, String address, String content, String genre, String keyword, String image, String tip) {
		
		return insert(new Restaurant(name, location, address, content, genre, keyword, image, tip));
	}


	@Override
	public int getNextId() {
		// TODO Auto-generated method stub
		return 0;
	}

	

}
