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
	public CommentView(String writerName, String restaurantName) {
		super();
		this.writerName = writerName;
		this.restaurantName = restaurantName;
	}
	public CommentView() {
		super();
		// TODO Auto-generated constructor stub
	}
	public CommentView(int id, String content, Date regDate, int memberId, int restaurant) {
		super(id, content, regDate, memberId, restaurant);
		// TODO Auto-generated constructor stub
	}
	
}
