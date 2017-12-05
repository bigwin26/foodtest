package com.food.webapp.dao.mybatis;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;

import com.food.webapp.dao.LikeDao;

public class MyBatisLikeDao implements LikeDao {

	@Autowired
	private SqlSessionTemplate sqlSession;
	
	public int like(String restaurantId, String memberId) {
		
		LikeDao likeDao = sqlSession.getMapper(LikeDao.class);
		likeDao.like(restaurantId, memberId);
		
		return 1;
	}

	public int unlike(String restaurantId, String memberId) {		
		
		LikeDao likeDao = sqlSession.getMapper(LikeDao.class);
		likeDao.unlike(restaurantId, memberId);
		return 0;
	}

}
