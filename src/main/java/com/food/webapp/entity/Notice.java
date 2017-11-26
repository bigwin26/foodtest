package com.food.webapp.entity;

import java.util.Date;

public class Notice {
	private String id;
	private String title;
	private String content;
	private String writerName;
	private Date regDate;
	private int hit;
	private String fileName;

	public Notice() {

	}   

	

	public Notice(String id, String title, String content, String writerName, Date regDate, int hit, String fileName) {
		super();
		this.id = id;
		this.title = title;
		this.content = content;
		this.writerName = writerName;
		this.regDate = regDate;
		this.hit = hit;
		this.fileName = fileName;
	}



	public Notice(String title, String content, String writerName) {
		this.title = title;
		this.content = content;
		this.writerName = writerName;
	}



	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}

	public String getWriterName() {
		return writerName;
	}

	public void setWriterName(String writerName) {
		this.writerName = writerName;
	}

	public Date getRegDate() {
		return regDate;
	}
	public void setRegDate(Date regDate) {
		this.regDate = regDate;
	}
	public int getHit() {
		return hit;
	}
	public void setHit(int hit) {
		this.hit = hit;
	}



	public String getFileName() {
		return fileName;
	}



	public void setFileName(String fileName) {
		this.fileName = fileName;
	}


}