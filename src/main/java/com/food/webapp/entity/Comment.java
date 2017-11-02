package com.food.webapp.entity;

import java.util.Date;

public class Comment {
	private int id;
	private String content;
	private Date regDate;
	private int memberId;
	private int restaurant;
	
	
	public Comment() {
		super();
		// TODO Auto-generated constructor stub
	}
	public Comment(int id, String content, Date regDate, int memberId, int restaurant) {
		super();
		this.id = id;
		this.content = content;
		this.regDate = regDate;
		this.memberId = memberId;
		this.restaurant = restaurant;
	}
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public Date getRegDate() {
		return regDate;
	}
	public void setRegDate(Date regDate) {
		this.regDate = regDate;
	}
	public int getMemberId() {
		return memberId;
	}
	public void setMemberId(int memberId) {
		this.memberId = memberId;
	}
	public int getRestaurant() {
		return restaurant;
	}
	public void setRestaurant(int restaurant) {
		this.restaurant = restaurant;
	}
}
