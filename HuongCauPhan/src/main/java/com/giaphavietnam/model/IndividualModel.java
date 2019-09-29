package com.giaphavietnam.model;

import java.sql.Timestamp;

public class IndividualModel {
	private long individualId;
	private String fullName ;
	private int gender;
	private Timestamp dateOfBirth ;
	private Timestamp dateOfDeath ;
	private int father;
	private String branch ;
	private long parentageId ;
	private String avatar ;
	public long getIndividualId() {
		return individualId;
	}
	public void setIndividualId(long individualId) {
		this.individualId = individualId;
	}
	public String getFullName() {
		return fullName;
	}
	public void setFullName(String fullName) {
		this.fullName = fullName;
	}
	public int getGender() {
		return gender;
	}
	public void setGender(int gender) {
		this.gender = gender;
	}
	public Timestamp getDateOfBirth() {
		return dateOfBirth;
	}
	public void setDateOfBirth(Timestamp dateOfBirth) {
		this.dateOfBirth = dateOfBirth;
	}
	public Timestamp getDateOfDeath() {
		return dateOfDeath;
	}
	public void setDateOfDeath(Timestamp dateOfDeath) {
		this.dateOfDeath = dateOfDeath;
	}
	public int getFather() {
		return father;
	}
	public void setFather(int father) {
		this.father = father;
	}
	public String getBranch() {
		return branch;
	}
	public void setBranch(String branch) {
		this.branch = branch;
	}
	public long getParentageId() {
		return parentageId;
	}
	public void setParentageId(long parentageId) {
		this.parentageId = parentageId;
	}
	public String getAvatar() {
		return avatar;
	}
	public void setAvatar(String avatar) {
		this.avatar = avatar;
	}
	
}
