package com.food.webapp.dao;

public interface LikeDao {
	
int like(String restaurantId, String memberId);
int unlike(String restaurantId, String memberId);

}
