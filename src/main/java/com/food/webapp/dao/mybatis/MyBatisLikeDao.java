package com.food.webapp.dao.mybatis;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import com.food.webapp.dao.LikeDao;
import com.food.webapp.dao.RestaurantDao;
import com.food.webapp.entity.Restaurant;

public class MyBatisLikeDao implements LikeDao {
	
	@Autowired
	private SqlSessionTemplate sqlSession;

	@Override
	public int check(String memberId) {
		LikeDao likeDao = sqlSession.getMapper(LikeDao.class);
		int result = likeDao.check(memberId);
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

	@Override
	public List<Restaurant> getList(String memberId) {
		LikeDao likeDao = sqlSession.getMapper(LikeDao.class);
		List<Restaurant> list = likeDao.getList(memberId);
		return list;
	}
}