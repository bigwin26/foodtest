package com.food.webapp.dao;

import com.food.webapp.entity.CmtImage;
import com.food.webapp.entity.Comment;

public interface CommentDao {
	
	public int insert(Comment comment);
	public int edit(Comment comment);
	public int delete(int id);
	int getNextId();
	
	public int insertCmtImage(CmtImage cmtImage);
}
