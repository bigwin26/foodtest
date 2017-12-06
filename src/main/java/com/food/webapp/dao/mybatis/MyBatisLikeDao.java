package com.food.webapp.dao.mybatis;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;

<<<<<<< HEAD
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


=======
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
>>>>>>> refs/remotes/origin/master
