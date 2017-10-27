package com.food.webapp.dao;


import java.util.Date;

import com.food.webapp.entity.Member;
import com.food.webapp.entity.Restaurant;

public interface RestaurantDao {

	int insert( String name,
	 String location,
	 String address,
	 String content,
	 String mainImage,
	 String menuImage,
	 String tip);

	int insert(Restaurant restaurant);
}
