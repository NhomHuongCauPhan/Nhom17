package com.giaphavietnam.model;

public class ImageModel {
	private int id;
	private String imageName;
	private String url;
	private int parentageId;
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getImageName() {
		return imageName;
	}
	public void setImageName(String imageName) {
		this.imageName = imageName;
	}
	public String getUrl() {
		return url;
	}
	public void setUrl(String url) {
		this.url = url;
	}
	public int getParentageId() {
		return parentageId;
	}
	public void setParentageId(int parentageId) {
		this.parentageId = parentageId;
	}
	
}
