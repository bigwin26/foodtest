package com.food.webapp.dao.mybatis;

import java.util.Date;
import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;

import com.food.webapp.dao.RestaurantDao;
import com.food.webapp.entity.CmtImage;
import com.food.webapp.entity.CommentView;
import com.food.webapp.entity.Restaurant;
import com.food.webapp.entity.RestaurantMenu;
import com.food.webapp.entity.RestaurantView;

public class MyBatisRestaurantDao implements RestaurantDao {

	@Autowired
	private SqlSessionTemplate sqlSession;
	
	@Override
	public List<Restaurant> getListAdmin(int page, String field, String query, int ok) {
		RestaurantDao restaurantDao = sqlSession.getMapper(RestaurantDao.class);
		List<Restaurant> list = restaurantDao.getListAdmin(page, field, query, ok);
		
		return list;
	}
	
	@Override
	public List<Restaurant> getList(int page, String field, String query) {
		RestaurantDao restaurantDao = sqlSession.getMapper(RestaurantDao.class);
		List<Restaurant> list = restaurantDao.getList(page, field, query);
		
		return list;
	}
	
	@Override
	public List<Restaurant> getOkList() {
		RestaurantDao restaurantDao = sqlSession.getMapper(RestaurantDao.class);
		List<Restaurant> list = restaurantDao.getOkList();
		
		return list;
	}
	
	@Override
	public RestaurantView get(int id) {
		RestaurantDao restaurantDao = sqlSession.getMapper(RestaurantDao.class);
		return restaurantDao.get(id);
	}
	
	@Override
	public int getCountAdmin(@Param("field")String field, @Param("query")String query, @Param("ok")int ok) {
		RestaurantDao restaurantDao = sqlSession.getMapper(RestaurantDao.class);
		int result = restaurantDao.getCountAdmin(field, query, ok);
		
		return result;
	}
	
	/*@Override
	public int getCountAdmin(Restaurant restaurant) {
		RestaurantDao restaurantDao = sqlSession.getMapper(RestaurantDao.class);
		int result = restaurantDao.getCountAdmin(restaurant);
		
		return result;
	}*/
	
	/*@Override
	public int getCountAdmin(int ok) {
		RestaurantDao restaurantDao = sqlSession.getMapper(RestaurantDao.class);
		int result = restaurantDao.getCountAdmin(ok);
		
		return result;
	}*/
	
	@Override
	public int getCount() {
		RestaurantDao restaurantDao = sqlSession.getMapper(RestaurantDao.class);
		int result = restaurantDao.getCount();
		
		return result;
	}
	
	@Override
	public int insert(Restaurant restaurant) {
		RestaurantDao restaurantDao = sqlSession.getMapper(RestaurantDao.class);
		int result = restaurantDao.insert(restaurant);
		
		return result;
	}

	@Override
	public int insert(String name, String location, String address, String content,int time, String genre, String keyword, String image, String tip, int memberId, int lastMemberId, Date regDate, int ok, String phoneNumber) {
		
		return insert(new Restaurant(name, location, address, content, time, genre, keyword, image, tip, memberId, lastMemberId, regDate, ok, phoneNumber));
	}


	@Override
	public int getNextId() {
		RestaurantDao restaurantDao = sqlSession.getMapper(RestaurantDao.class);
		
		return restaurantDao.getNextId();
	}

	@Override
	public RestaurantView getPrev(int id) {
		RestaurantDao restaurantDao = sqlSession.getMapper(RestaurantDao.class);
		
		return restaurantDao.getPrev(id);
	}

	@Override
	public RestaurantView getNext(int id) {
		RestaurantDao restaurantDao = sqlSession.getMapper(RestaurantDao.class);
		
		return restaurantDao.getNext(id);
	}

/*	@Override
	public List<CommentView> getCmt(int id, int page) {
		RestaurantDao restaurantDao = sqlSession.getMapper(RestaurantDao.class);
		List<CommentView> list = restaurantDao.getCmt(id, page);
		
		return list;
	}

	@Override
	public int cmtCount(int id) {
		RestaurantDao restaurantDao = sqlSession.getMapper(RestaurantDao.class);
		
		return restaurantDao.cmtCount(id);
	}

	@Override
	public List<CmtImage> cmtImageList(int id) {
		RestaurantDao restaurantDao = sqlSession.getMapper(RestaurantDao.class);
		List<CmtImage> list = restaurantDao.cmtImageList(id);
		return list;
	}*/

	@Override
	public int okRestaurant(int id, String name, String date, int ok) {
		
		return okRestaurant(new Restaurant(id, name, date, ok));
	}

	@Override
	public int okRestaurant(Restaurant restaurant) {
		RestaurantDao restaurantDao = sqlSession.getMapper(RestaurantDao.class);
		
		int result = restaurantDao.okRestaurant(restaurant);
		
		return result;
	}

	@Override
	public List<RestaurantMenu> menuImageList(int id) {
		RestaurantDao restaurantDao = sqlSession.getMapper(RestaurantDao.class);
		List<RestaurantMenu> list = restaurantDao.menuImageList(id);
		return list;
	}

	@Override
	public int deleteOk(int id) {
		RestaurantDao restaurantDao = sqlSession.getMapper(RestaurantDao.class);
		int result = restaurantDao.deleteOk(id);
		return result;
	}

}
