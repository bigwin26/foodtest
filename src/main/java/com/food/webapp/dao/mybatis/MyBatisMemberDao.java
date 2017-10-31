package com.food.webapp.dao.mybatis;

import java.util.Date;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;

import com.food.webapp.dao.MemberDao;
import com.food.webapp.entity.Member;


public class MyBatisMemberDao implements MemberDao {
	
	@Autowired
	private MemberDao memberDao;

	@Override
	public int insert(int id, String pwd, String nickNname, String email, Date regDate, int image, int role,
			String point, String mentor) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int insert(Member member) {
		return memberDao.insert(member);
	}

	@Override
	public Member login(String email, String pwd) {
		// TODO Auto-generated method stub
		return null;
	}

	/*@Override
	public Member Login(String email, String passwd) {
        return ""memberDao.Login(email, passwd);
    }*/
}
