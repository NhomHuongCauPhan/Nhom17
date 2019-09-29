package com.giaphavietnam.model;

public class ImageModel {
	private Long id;
	private String imageName;
	private String url;
	private long parentageId;
	public Long getId() {
		return id;
	}
	public void setId(Long id) {
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
	public long getParentageId() {
		return parentageId;
	}
	public void setParentageId(long parentageId) {
		this.parentageId = parentageId;
	}
	
}
