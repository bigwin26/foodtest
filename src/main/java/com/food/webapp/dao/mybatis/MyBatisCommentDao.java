package com.food.webapp.dao.mybatis;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;

import com.food.webapp.dao.CommentDao;
import com.food.webapp.entity.CmtImage;
import com.food.webapp.entity.Comment;
import com.food.webapp.entity.CommentView;
import com.food.webapp.entity.RestaurantMenu;


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

	@Override
	public int getNextId() {
		CommentDao commentDao = sqlSession.getMapper(CommentDao.class);
		return commentDao.getNextId();
	}

	@Override
	public int insertCmtImage(CmtImage cmtImage) {
		CommentDao commentDao = sqlSession.getMapper(CommentDao.class);
		int result = commentDao.insertCmtImage(cmtImage);
		return result;
	}

	@Override
	public int insertMenuImage(RestaurantMenu restaurantMenu) {
		CommentDao commentDao = sqlSession.getMapper(CommentDao.class);
		int result = commentDao.insertMenuImage(restaurantMenu);
		return result;
	}
	
	@Override
	public List<CommentView> getCmt(int id, int page) {
		CommentDao commentDao = sqlSession.getMapper(CommentDao.class);
		List<CommentView> list = commentDao.getCmt(id, page);
		return list;
	}

	@Override
	public int cmtCount(int id) {
		CommentDao commentDao = sqlSession.getMapper(CommentDao.class);
		return commentDao.cmtCount(id);
	}

	@Override
	public List<CmtImage> cmtImageList(int id) {
		CommentDao commentDao = sqlSession.getMapper(CommentDao.class);
		List<CmtImage> list = commentDao.cmtImageList(id);
		return list;
	}
	
	
}


