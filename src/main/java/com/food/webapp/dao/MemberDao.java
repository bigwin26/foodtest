package com.food.webapp.dao;


import java.util.Date;

import com.food.webapp.entity.Member;

public interface MemberDao {

	public int insert(int id,
	String pwd,
	 String nickNname,
	 String email,
	 Date regDate,
	 int image,
	 int role,
	 String point,
	 String mentor);

	public int insert(Member member);
	
	public Member login(String email, String pwd);
}
