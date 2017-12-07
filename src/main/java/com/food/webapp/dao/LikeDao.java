package com.food.webapp.dao;


import org.apache.ibatis.annotations.Param;

public interface LikeDao{

	public int check(@Param("restaurantId")int restaurantId, @Param("memberId")String memberId);

	public int insert(@Param("restaurantId")int restaurantId, @Param("memberId")String memberId);

	public int delete(@Param("restaurantId")int restaurantId, @Param("memberId")String memberId);
	
	public int count(@Param("restaurantId")int restaurantId);
}
