package com.food.webapp.entity;

public class RealTime {
	
	private int id;
	private String name;
	
	
	public RealTime() {
		
	}
	
	public RealTime(int id, String name) {
		this.id = id;
		this.name = name;
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
	
	

}
