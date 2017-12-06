package com.food.webapp.entity;

public class Liked {
	private int restaurantId;
	private String memberId;
	
	public Liked() {
	}
	
	public Liked(int restaurantId, String memberId) {
		super();
		this.restaurantId = restaurantId;
		this.memberId = memberId;
	}
	public int getRestaurantId() {
		return restaurantId;
	}
	public void setRestaurantId(int restaurantId) {
		this.restaurantId = restaurantId;
	}
	public String getMemberId() {
		return memberId;
	}
	public void setMemberId(String memberId) {
		this.memberId = memberId;
	}
}
