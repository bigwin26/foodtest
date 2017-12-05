package com.food.webapp.entity;

public class Like {
	
	private String memberId;
	private String restaurantId;
	
	public Like() {
	}
	
	
	public Like(String memberId, String restaurantId) {
		super();
		this.memberId = memberId;
		this.restaurantId = restaurantId;
	}


	public String getMemberId() {
		return memberId;
	}
	public void setMemberId(String memberId) {
		this.memberId = memberId;
	}
	public String getRestaurantId() {
		return restaurantId;
	}
	public void setRestaurantId(String restaurantId) {
		this.restaurantId = restaurantId;
	}
	
	

}
