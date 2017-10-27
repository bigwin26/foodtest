package com.food.webapp.entity;

import java.util.Date;

public class Member {

	private int id;
	private String pwd;
	private String nickNname;
	private String email;
	private Date regDate;
	private int image;
	private int role;
	private String point;
	private String mentor;
	
	public Member() {
	}

	public Member(int id, String pwd, String nickNname, String email, Date regDate, int image, int role, String point,
			String mentor) {
		super();
		this.id = id;
		this.pwd = pwd;
		this.nickNname = nickNname;
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

	public String getNickNname() {
		return nickNname;
	}

	public void setNickNname(String nickNname) {
		this.nickNname = nickNname;
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

	public int getImage() {
		return image;
	}

	public void setImage(int image) {
		this.image = image;
	}

	public int getRole() {
		return role;
	}

	public void setRole(int role) {
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
