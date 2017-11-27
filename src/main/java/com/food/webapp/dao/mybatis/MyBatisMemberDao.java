package com.food.webapp.dao.mybatis;

import java.util.Date;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;

import com.food.webapp.dao.MemberDao;
import com.food.webapp.entity.Member;


public class MyBatisMemberDao implements MemberDao {
	
	@Autowired
	private SqlSessionTemplate sqlsession;

	@Override
	public int insert(String pwd, String nickName, String email, Date regDate, String image, String role, String point, String mentor) {
		
		return insert(new Member(pwd,nickName,email,regDate, role, role, mentor, mentor));
	}

	@Override
	public int insert(Member member) {
		
		MemberDao memberDao = sqlsession.getMapper(MemberDao.class);
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

	@Override
	public int pointUp(String id) {
		// TODO Auto-generated method stub
		return 0;
	}
	public Member get(String loginEmail) {
		MemberDao memberDao = sqlsession.getMapper(MemberDao.class);
		
		return memberDao.get(loginEmail);
	}

	@Override
	public int sameCheckId(Member member) throws Exception {
		MemberDao memberDao = sqlsession.getMapper(MemberDao.class);
		return memberDao.sameCheckId(member);
	}
	@Override
	public Object getMember(String nickName) {
		MemberDao memberDao = sqlsession.getMapper(MemberDao.class);
		return memberDao.getMember(nickName);
	}
	
	@Override
	public List<Member> getListAdmin(int page, String field, String query) {
		MemberDao memberDao = sqlsession.getMapper(MemberDao.class);
		return memberDao.getListAdmin(page, field, query);
	}

	@Override
	public int getCountAdmin(String field, String query) {
		MemberDao memberDao = sqlsession.getMapper(MemberDao.class);
		return memberDao.getCountAdmin(field, query);
	}

	@Override
	public int delete(int id) {
		MemberDao memberDao = sqlsession.getMapper(MemberDao.class);
		return memberDao.delete(id);
	}

	@Override
	public Member detail(int id) {
		MemberDao memberDao = sqlsession.getMapper(MemberDao.class);
		return memberDao.detail(id);
	}
}


