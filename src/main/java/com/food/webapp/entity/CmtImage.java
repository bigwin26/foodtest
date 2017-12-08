package com.food.webapp.entity;

public class CmtImage {
	private int id;
	private String src;
	private int commentId;
	private int memberId;
	private int restaurantId;
	
	
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
	public int getCommentId() {
		return commentId;
	}
	public void setCommentId(int commentId) {
		this.commentId = commentId;
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
	public CmtImage() {
		super();
		// TODO Auto-generated constructor stub
	}
	public CmtImage(int id, String src, int commentId, int memberId, int restaurantId) {
		super();
		this.id = id;
		this.src = src;
		this.commentId = commentId;
		this.memberId = memberId;
		this.restaurantId = restaurantId;
	}
}
