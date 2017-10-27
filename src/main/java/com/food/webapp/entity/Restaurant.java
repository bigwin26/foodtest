package com.food.webapp.entity;

public class Restaurant {
	
	private int id;
	private String name;
	private String location;
	private String address;
	private String content;
	private String mainImage;
	private String menuImage;
	private String tip;
	
	
	public Restaurant() {
		super();
		// TODO Auto-generated constructor stub
	}


	public Restaurant(int id, String name, String location, String address, String content, String mainImage,
			String menuImage, String tip) {
		super();
		this.id = id;
		this.name = name;
		this.location = location;
		this.address = address;
		this.content = content;
		this.mainImage = mainImage;
		this.menuImage = menuImage;
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


	public String getMainImage() {
		return mainImage;
	}


	public void setMainImage(String mainImage) {
		this.mainImage = mainImage;
	}


	public String getMenuImage() {
		return menuImage;
	}


	public void setMenuImage(String menuImage) {
		this.menuImage = menuImage;
	}


	public String getTip() {
		return tip;
	}


	public void setTip(String tip) {
		this.tip = tip;
	}
}
