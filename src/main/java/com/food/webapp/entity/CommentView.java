package com.food.webapp.entity;

import java.util.Date;

public class CommentView extends Comment {
	
	private String writerName;
	private String restaurantName;
	public String getWriterName() {
		return writerName;
	}
	public void setWriterName(String writerName) {
		this.writerName = writerName;
	}
	public String getRestaurantName() {
		return restaurantName;
	}
	public void setRestaurantName(String restaurantName) {
		this.restaurantName = restaurantName;
	}
	public CommentView() {
		super();
		// TODO Auto-generated constructor stub
	}
	public CommentView(int id, String content, Date regDate, int point, int memberId, int restaurant,String memberEmail) {
		super(id, content, regDate, point, memberId, restaurant, memberEmail);
		// TODO Auto-generated constructor stub
	}
	public CommentView(String writerName, String restaurantName) {
		super();
		this.writerName = writerName;
		this.restaurantName = restaurantName;
	}
	

	
}
