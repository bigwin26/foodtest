package com.food.webapp.entity;

import java.util.Date;

public class RestaurantView extends Restaurant {
	
	private String writerName;
	private String lastWriter;
	private int countCmt;
	private int countLiked;
	
	public RestaurantView() {
		super();
	
	}
	
	public RestaurantView(int id, String name, String location, String address, String content, String genre,
			String keyword, String image, String tip, Date regDate) {
		super(name, location, address, content, genre, keyword, image, tip, regDate);
		// TODO Auto-generated constructor stub
	}

	public RestaurantView(String writerName, String lastWriter, int countCmt, int countLiked) {
		super();
		this.writerName = writerName;
		this.lastWriter = lastWriter;
		this.countCmt = countCmt;
		this.countLiked = countLiked;
	}
	
	public String getWriterName() {
		return writerName;
	}
	public void setWriterName(String writerName) {
		this.writerName = writerName;
	}
	public String getLastWriter() {
		return lastWriter;
	}
	public void setLastWriter(String lastWriter) {
		this.lastWriter = lastWriter;
	}
	public int getCountCmt() {
		return countCmt;
	}
	public void setCountCmt(int countCmt) {
		this.countCmt = countCmt;
	}
	public int getCountLiked() {
		return countLiked;
	}
	public void setCountLiked(int countLiked) {
		this.countLiked = countLiked;
	}
	
}

