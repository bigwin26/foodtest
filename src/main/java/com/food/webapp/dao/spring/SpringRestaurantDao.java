package com.food.webapp.dao.spring;

import java.util.Date;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;

import com.food.webapp.dao.MemberDao;
import com.food.webapp.dao.RestaurantDao;
import com.food.webapp.entity.Member;
import com.food.webapp.entity.Restaurant;


public class SpringRestaurantDao implements RestaurantDao {

	@Autowired
	private JdbcTemplate template;

	/*@Override
	public int insert(int id, String pwd, String nickNname, String email, Date regDate, int image, int role,
			String point, String mentor) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int insert(Member member) {
		// TODO Auto-generated method stub
		return 0;
	}*/

	@Override
	public int insert(String name, String location, String address, String content, String mainImage, String menuImage,
			String tip) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int insert(Restaurant restaurant) {
		// TODO Auto-generated method stub
		return 0;
	}


}