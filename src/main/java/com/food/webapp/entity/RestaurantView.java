package com.food.webapp.entity;

import java.util.Date;

public class RestaurantView extends Restaurant {
	
	private String writerName;
	private String writerImage;
	private String lastWriter;
	private int countCmt;
	private int countLiked;
	private double avgPoint;
	
	public RestaurantView() {
		super();
		// TODO Auto-generated constructor stub
	}

	public RestaurantView(int id, String name, String location, String address, String content, int time, String genre,
			String keyword, String image, String tip, int memberId, int lastMemberId, Date regDate, int ok, String phoneNumber) {
		super( name, location, address, content, time, genre, keyword, image, tip, memberId, lastMemberId, regDate, ok, phoneNumber);
		// TODO Auto-generated constructor stub
	}

	public RestaurantView(String writerName, String writerImage, String lastWriter, int countCmt, int countLiked,
			double avgPoint) {
		super();
		this.writerName = writerName;
		this.writerImage = writerImage;
		this.lastWriter = lastWriter;
		this.countCmt = countCmt;
		this.countLiked = countLiked;
		this.avgPoint = avgPoint;
	}
	public String getWriterImage() {
		return writerImage;
	}
	public void setWriterImage(String writerImage) {
		this.writerImage = writerImage;
	}
	public double getAvgPoint() {
		return avgPoint;
	}
	public void setAvgPoint(double avgPoint) {
		this.avgPoint = avgPoint;
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

