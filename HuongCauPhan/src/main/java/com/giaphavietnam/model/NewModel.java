package com.giaphavietnam.model;

import java.sql.Date;

public class NewModel {
	private long newsID;
	private String content;
	private long parentage_id;
	private Date create_date;
	private long views;
	private String title;
	public long getViews() {
		return views;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public void setViews(long views) {
		this.views = views;
	}
	public long getNewsID() {
		return newsID;
	}
	public void setNewsID(long newsID) {
		this.newsID = newsID;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public long getParentage_id() {
		return parentage_id;
	}
	public void setParentage_id(long parentage_id) {
		this.parentage_id = parentage_id;
	}
	public Date getCreate_date() {
		return create_date;
	}
	public void setCreate_date(Date create_date) {
		this.create_date = create_date;
	}

}
