package com.food.webapp.entity;

import java.util.Date;

public class Member {

	private int id;
	private String pwd;
	private String nickName;
	private String email;
	private Date regDate;
	private String image;
	private String role;
	private String point;
	private String mentor;
	
	public Member() {
	}

	public Member(String pwd, String nickName, String email, Date regDate, String image, String role, String point,
			String mentor) {
		super();
		this.pwd = pwd;
		this.nickName = nickName;
		this.email = email;
		this.regDate = regDate;
		this.image = image;
		this.role = role;
		this.point = point;
		this.mentor = mentor;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getPwd() {
		return pwd;
	}

	public void setPwd(String pwd) {
		this.pwd = pwd;
	}

	public String getnickName() {
		return nickName;
	}

	public void setnickName(String nickName) {
		this.nickName = nickName;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public Date getRegDate() {
		return regDate;
	}

	public void setRegDate(Date regDate) {
		this.regDate = regDate;
	}

	public String getImage() {
		return image;
	}

	public void setImage(String image) {
		this.image = image;
	}

	public String getRole() {
		return role;
	}

	public void setRole(String role) {
		this.role = role;
	}

	public String getPoint() {
		return point;
	}

	public void setPoint(String point) {
		this.point = point;
	}

	public String getMentor() {
		return mentor;
	}

	public void setMentor(String mentor) {
		this.mentor = mentor;
	}

}
