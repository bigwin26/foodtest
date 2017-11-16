package com.food.webapp.entity;

import java.util.Date;

public class Comment {
	private int id;
	private String content;
	private Date regDate;
	private int point;
	private int memberId;
	private int restaurantId;
	


	public int getPoint() {
		return point;
	}
	public void setPoint(int point) {
		this.point = point;
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
	public int getRestaurantId() {
		return restaurantId;
	}
	public void setRestaurantId(int restaurantId) {
		this.restaurantId = restaurantId;
	}
	public Comment() {
		super();
		// TODO Auto-generated constructor stub
	}
	public Comment(int id, String content, Date regDate, int point, int memberId, int restaurantId) {
		super();
		this.id = id;
		this.content = content;
		this.regDate = regDate;
		this.point = point;
		this.memberId = memberId;
		this.restaurantId = restaurantId;
	}

}
