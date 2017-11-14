package com.food.webapp.entity;

public class RestaurantMenu {
	private int id;
	private String src;
	private int restaurantId;
	private int memberId;
	
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getSrc() {
		return src;
	}
	public void setSrc(String src) {
		this.src = src;
	}
	public int getRestaurantId() {
		return restaurantId;
	}
	public void setRestaurantId(int restaurantId) {
		this.restaurantId = restaurantId;
	}
	public RestaurantMenu() {
		super();
		// TODO Auto-generated constructor stub
	}
	public int getMemberId() {
		return memberId;
	}
	public void setMemberId(int memberId) {
		this.memberId = memberId;
	}
	public RestaurantMenu(int id, String src, int restaurantId, int memberId) {
		super();
		this.id = id;
		this.src = src;
		this.restaurantId = restaurantId;
		this.memberId = memberId;
	}
	
}
