package com.food.webapp.dao.mybatis;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import com.food.webapp.dao.LikeDao;

public class MyBatisLikeDao implements LikeDao {
	
	@Autowired
	private SqlSessionTemplate sqlSession;

	@Override
	public int check(int restaurantId, String memberId) {
		LikeDao likeDao = sqlSession.getMapper(LikeDao.class);
		int result = likeDao.check(restaurantId,memberId);
		return result;
	}

	@Override
	public int insert(int restaurantId, String memberId) {
		LikeDao likeDao = sqlSession.getMapper(LikeDao.class);
		int result = likeDao.insert(restaurantId,memberId);
		return result;
	}

	@Override
	public int delete(int restaurantId, String memberId) {
		LikeDao likeDao = sqlSession.getMapper(LikeDao.class);
		int result = likeDao.delete(restaurantId,memberId);
		System.out.println(result);
		return result;
	}

	@Override
	public int count(int restaurantId) {
		LikeDao likeDao = sqlSession.getMapper(LikeDao.class);
		int result = likeDao.count(restaurantId);
		return result;
	}
}