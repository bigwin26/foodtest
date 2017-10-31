package com.food.webapp.entity;

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
	
	
	public Restaurant(int id, String name, String location, String address, String content, String genre,
			String keyword, String image, String tip) {
		super();
		this.id = id;
		this.name = name;
		this.location = location;
		this.address = address;
		this.content = content;
		this.genre = genre;
		this.keyword = keyword;
		this.image = image;
		this.tip = tip;
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



	public Restaurant() {
		super();
		// TODO Auto-generated constructor stub
	}

}

