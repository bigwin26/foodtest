package com.food.webapp.dao;

import org.apache.ibatis.annotations.Param;

public interface LikeDao{

	public int Check(@Param("restaurantId")int restaurantId, @Param("memberId")String memberId);

	public int Insert(@Param("restaurantId")int restaurantId, @Param("memberId")String memberId);

	public int delete(@Param("restaurantId")int restaurantId, @Param("memberId")String memberId);
}
