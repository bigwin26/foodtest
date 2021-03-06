package com.food.webapp.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.food.webapp.entity.CmtImage;
import com.food.webapp.entity.Comment;
import com.food.webapp.entity.CommentView;
import com.food.webapp.entity.RestaurantMenu;

public interface CommentDao{
	
	public int insert(Comment comment);
	public int delete(int id);
	int getNextId();
	public int insertCmtImage(CmtImage cmtImage);
	public int insertMenuImage(RestaurantMenu restaurantMenu);
	List<CommentView> getCmt(@Param("id")int id, @Param("page")int page);
	CommentView get(@Param("id")int id);
	int cmtCount(int id);
	List<CmtImage> cmtImageList(int id);
	public int update(@Param("id")String id, @Param("point")int point, @Param("content")String content);
}
