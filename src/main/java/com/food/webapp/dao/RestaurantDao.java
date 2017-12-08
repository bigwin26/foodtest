package com.food.webapp.dao;



import java.util.Date;
import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.food.webapp.entity.CmtImage;
import com.food.webapp.entity.CommentView;
import com.food.webapp.entity.Restaurant;
import com.food.webapp.entity.RestaurantMenu;
import com.food.webapp.entity.RestaurantView;

public interface RestaurantDao {

	List<Restaurant> getListAdmin(@Param("page")int page, @Param("field")String field, String query, @Param("ok")int ok);
	List<Restaurant> getList(@Param("page")int page, @Param("field")String field, String query);
	List<Restaurant> getOkList();
	int getCount();
	//int getCountAdmin(@Param("field")String field, String query, Restaurant restaurant);
	int getCountAdmin(@Param("field")String field, @Param("query")String query, @Param("ok")int ok);
	//int getCountAdmin(Restaurant restaurant);
	//int getCountAdmin(int ok);
	RestaurantView get(int id);
	RestaurantView getPrev(int id);
	RestaurantView getNext(int id);
	int getNextId();
	int insert(String name, String location, String address, String content,int time, String genre, String keyword, String image, String tip,int memberId, int lastMemberId, Date regDate, int ok,String phoneNumber);
	int insert(Restaurant restaurant);
	/*List<CommentView> getCmt(@Param("id")int id, @Param("page")int page);
	int cmtCount(int id);
	List<CmtImage> cmtImageList(int id);*/
	int okRestaurant(int id, String name, String date, int ok);
	int okRestaurant(Restaurant restaurant);
	List<RestaurantMenu> menuImageList(int id);
	int deleteOk(int id);
}
