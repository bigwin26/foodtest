package com.food.webapp.dao.mybatis;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;

import com.food.webapp.dao.CommentDao;
import com.food.webapp.entity.Comment;


public class MyBatisCommentDao implements CommentDao {
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	@Override
	public int insert(Comment comment) {
		
		CommentDao commentDao = sqlSession.getMapper(CommentDao.class);
		int result = commentDao.insert(comment);
		return result;
	}

	@Override
	public int edit(Comment comment) {
		CommentDao commentDao = sqlSession.getMapper(CommentDao.class);
		int result = commentDao.edit(comment);
		return result;
	}

	@Override
	public int delete(int id) {
		CommentDao commentDao = sqlSession.getMapper(CommentDao.class);
		int result = commentDao.delete(id);
		return result;
	}
	
	
}


