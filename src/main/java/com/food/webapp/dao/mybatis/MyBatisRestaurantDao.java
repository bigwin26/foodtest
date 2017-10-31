package com.food.webapp.dao.mybatis;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;

import com.food.webapp.dao.RestaurantDao;
import com.food.webapp.entity.Restaurant;

public class MyBatisRestaurantDao implements RestaurantDao {

	@Override
	public int insert(String name, String location, String address, String content, String mainImage, String menuImage,
			String tip) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int insert(Restaurant restaurant) {
		// TODO Auto-generated method stub
		return 0;
	}

	

}
