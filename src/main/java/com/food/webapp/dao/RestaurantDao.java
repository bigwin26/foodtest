package com.food.webapp.dao;



import java.util.Date;
import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.food.webapp.entity.Restaurant;
import com.food.webapp.entity.RestaurantView;

public interface RestaurantDao {

	List<Restaurant> getList(@Param("page")int page, String field, String query);
	RestaurantView get(int id);
	RestaurantView getPrev(int id);
	RestaurantView getNext(int id);
	int getCount();
	int insert(String name, String location, String address, String content, String genre, String keyword, String image, String tip, Date regDate);
	int insert(Restaurant restaurant);
	int getNextId();
}
