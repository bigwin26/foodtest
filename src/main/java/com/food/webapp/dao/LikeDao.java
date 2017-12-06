package com.food.webapp.dao;

<<<<<<< HEAD
import org.apache.ibatis.annotations.Param;

public interface LikeDao{

	public int Check(@Param("restaurantId")int restaurantId, @Param("memberId")String memberId);

	public int Insert(@Param("restaurantId")int restaurantId, @Param("memberId")String memberId);

	public int delete(@Param("restaurantId")int restaurantId, @Param("memberId")String memberId);
=======
public interface LikeDao {
	
int like(String restaurantId, String memberId);
int unlike(String restaurantId, String memberId);

>>>>>>> refs/remotes/origin/master
}
