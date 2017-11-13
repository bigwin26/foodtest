package com.food.webapp.entity;

public class CmtImage {
	private int id;
	private String src;
	private int CommentId;
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
	public int getCommentId() {
		return CommentId;
	}
	public void setCommentId(int commentId) {
		CommentId = commentId;
	}
	public int getMemberId() {
		return memberId;
	}
	public void setMemberId(int memberId) {
		this.memberId = memberId;
	}
	public CmtImage() {
		super();
		// TODO Auto-generated constructor stub
	}
	public CmtImage(int id, String src, int commentId, int memberId) {
		super();
		this.id = id;
		this.src = src;
		CommentId = commentId;
		this.memberId = memberId;
	}
}
