package com.food.webapp.dao;



import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.food.webapp.entity.Restaurant;

public interface RestaurantDao {

	List<Restaurant> getList(@Param("page")int page, String field, String query);
	Restaurant get(int id);
	Restaurant getPrev(int id);
	Restaurant getNext(int id);
	int getCount();
	int insert(String name, String location, String address, String content, String genre, String keyword, String image, String tip);
	int insert(Restaurant restaurant);
	int getNextId();
}
