package com.food.webapp.dao;



import java.util.Date;
import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.food.webapp.entity.CommentView;
import com.food.webapp.entity.Restaurant;
import com.food.webapp.entity.RestaurantView;

public interface RestaurantDao {

	List<Restaurant> getList(@Param("page")int page, @Param("field")String field, String query);
	List<Restaurant> getListAll();
	int getCount();
	RestaurantView get(int id);
	RestaurantView getPrev(int id);
	RestaurantView getNext(int id);
	int getNextId();
	int insert(String name, String location, String address, String content,int time, String genre, String keyword, String image, String tip,int memberId, int lastMemberId, Date regDate, int ok);
	int insert(Restaurant restaurant);
	List<CommentView> getCmt(@Param("id")int id, @Param("page")int page);
	int cmtCount(int id);
	int okRestaurant(int id, String name, String date);
	int okRestaurant(Restaurant restaurant);
}
