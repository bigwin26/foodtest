package com.food.webapp.dao;


import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.food.webapp.entity.Restaurant;

public interface LikeDao{

	public int check(@Param("memberId")String memberId);

	public int insert(@Param("restaurantId")int restaurantId, @Param("memberId")String memberId);

	public int delete(@Param("restaurantId")int restaurantId, @Param("memberId")String memberId);
	
	public int count(@Param("restaurantId")int restaurantId);
	
	List<Restaurant> getList(@Param("memberId")String memberId);
}
