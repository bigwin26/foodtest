package com.food.webapp.dao;


import java.util.Date;
import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.food.webapp.entity.Member;

public interface MemberDao {
	
	public List<Member> getListAdmin(@Param("page")int page, @Param("field")String field, @Param("query")String query);
	
	int getCountAdmin(@Param("field")String field, @Param("query")String query);
	
	int delete(int id);
	
	int edit(@Param("id")int id, @Param("nickName")String nickName, @Param("role")int role, @Param("mentor")String mentor);
	
	Member detail(int id); 

	public int insert(
			String pwd,
			String nickName,
			String email,
			Date regDate,
			String image,
			String role,
			String point,
			String mentor);

	public int insert(Member member);
	
	public Member login(String email, String pwd);
	
	int pointUp(String id);
	
	public Member get(String loginEmail);

	public int sameCheckId(Member member) throws Exception;

	public Object getMember(String nickName);
}
