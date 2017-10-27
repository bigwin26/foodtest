package com.food.webapp.dao.spring;

import java.util.Date;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;

import com.food.webapp.dao.MemberDao;
import com.food.webapp.entity.Member;


public class SpringRestaurantDao implements MemberDao {

	@Autowired
	private JdbcTemplate template;

	@Override
	public int insert(int id, String pwd, String nickNname, String email, Date regDate, int image, int role,
			String point, String mentor) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int insert(Member member) {
		// TODO Auto-generated method stub
		return 0;
	}


}