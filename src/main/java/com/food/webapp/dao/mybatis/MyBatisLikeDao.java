package com.food.webapp.dao.mybatis;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;

import com.food.webapp.dao.CommentDao;
import com.food.webapp.dao.LikeDao;
import com.food.webapp.entity.CmtImage;
import com.food.webapp.entity.Comment;
import com.food.webapp.entity.RestaurantMenu;


public class MyBatisLikeDao implements LikeDao {
	
	@Autowired
	private SqlSessionTemplate sqlSession;

	@Override
	public int Check(int restaurantId, String memberId) {
		LikeDao likeDao = sqlSession.getMapper(LikeDao.class);
		int result = likeDao.Check(restaurantId,memberId);
		return result;
	}

	@Override
	public int Insert(int restaurantId, String memberId) {
		LikeDao likeDao = sqlSession.getMapper(LikeDao.class);
		int result = likeDao.Insert(restaurantId,memberId);
		return result;
	}

	@Override
	public int delete(int restaurantId, String memberId) {
		LikeDao likeDao = sqlSession.getMapper(LikeDao.class);
		int result = likeDao.delete(restaurantId,memberId);
		System.out.println(result);
		return result;
	}
}


