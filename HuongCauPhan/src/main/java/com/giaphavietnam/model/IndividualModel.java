package com.giaphavietnam.model;

import java.sql.Timestamp;

public class IndividualModel {
	private int individualId;
	private String fullName ;
	private int gender;
	private Timestamp dateOfBirth ;
	private Timestamp dateOfDeath ;
	private int father;
	private String branch ;
	private int parentageId ;
	private String avatar ;
	public int getIndividualId() {
		return individualId;
	}
	public void setIndividualId(int individualId) {
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
	public int getParentageId() {
		return parentageId;
	}
	public void setParentageId(int parentageId) {
		this.parentageId = parentageId;
	}
	public String getAvatar() {
		return avatar;
	}
	public void setAvatar(String avatar) {
		this.avatar = avatar;
	}
	
}
