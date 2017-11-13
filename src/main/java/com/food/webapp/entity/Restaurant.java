package com.food.webapp.entity;

import java.util.Date;

public class Restaurant {
	
	private int id;
	private String name;
	private String location;
	private String address;
	private String content;
	private String genre;
	private String keyword;
	private String image;
	private String tip;
	private int memberId;
	private int lastMemberId;
	private Date regDate;
	private int ok;
	
	

	public Restaurant() {
		super();
		// TODO Auto-generated constructor stub
	}

	public int getMemberId() {
		return memberId;
	}

	public void setMemberId(int memberId) {
		this.memberId = memberId;
	}

	public int getLastMemberId() {
		return lastMemberId;
	}

	public void setLastMemberId(int lastMemberId) {
		this.lastMemberId = lastMemberId;
	}

	public Restaurant(String name, String location, String address, String content, String genre,
			String keyword, String image, String tip, int memberId, int lastMemberId, Date regDate, int ok) {
		super();
		
		this.name = name;
		this.location = location;
		this.address = address;
		this.content = content;
		this.genre = genre;
		this.keyword = keyword;
		this.image = image;
		this.tip = tip;
		this.memberId = memberId;
		this.lastMemberId = lastMemberId;
		this.regDate = regDate;
		this.ok = ok;
	}

	public Date getRegDate() {
		return regDate;
	}

	public void setRegDate(Date regDate) {
		this.regDate = regDate;
	}




	public int getId() {
		return id;
	}



	public void setId(int id) {
		this.id = id;
	}



	public String getName() {
		return name;
	}



	public void setName(String name) {
		this.name = name;
	}



	public String getLocation() {
		return location;
	}



	public void setLocation(String location) {
		this.location = location;
	}



	public String getAddress() {
		return address;
	}



	public void setAddress(String address) {
		this.address = address;
	}



	public String getContent() {
		return content;
	}



	public void setContent(String content) {
		this.content = content;
	}



	public String getGenre() {
		return genre;
	}



	public void setGenre(String genre) {
		this.genre = genre;
	}



	public String getKeyword() {
		return keyword;
	}



	public void setKeyword(String keyword) {
		this.keyword = keyword;
	}



	public String getImage() {
		return image;
	}



	public void setImage(String image) {
		this.image = image;
	}



	public String getTip() {
		return tip;
	}



	public void setTip(String tip) {
		this.tip = tip;
	}

	
	public int getOk() {
		return ok;
	}

	
	public void setOk(int ok) {
		this.ok = ok;
	}

	

}

