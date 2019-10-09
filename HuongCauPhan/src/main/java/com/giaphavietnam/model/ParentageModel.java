package com.giaphavietnam.model;

import java.sql.Date;


public class ParentageModel {
	private long parentageId ;
	private String parentageName ;
	private String head_of_parentage_name ;
	private String address ;
	private Date culturalSpringDay ;
	private Date culturalAutumnDay ;
	private String headOfParentageNumber ;
	private String headOfParentageEmail ;
	private String ancestor ;
	private String historyOfParentage ;
	private long accountId ;
	public long getParentageId() {
		return parentageId;
	}
	public void setParentageId(long parentageId) {
		this.parentageId = parentageId;
	}
	public String getParentageName() {
		return parentageName;
	}
	public void setParentageName(String parentageName) {
		this.parentageName = parentageName;
	}
	public String getHead_of_parentage_name() {
		return head_of_parentage_name;
	}
	public void setHead_of_parentage_name(String head_of_parentage_name) {
		this.head_of_parentage_name = head_of_parentage_name;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public Date getCulturalSpringDay() {
		return culturalSpringDay;
	}
	public void setCulturalSpringDay(Date culturalSpringDay) {
		this.culturalSpringDay = culturalSpringDay;
	}
	public Date getCulturalAutumnDay() {
		return culturalAutumnDay;
	}
	public void setCulturalAutumnDay(Date culturalAutumnDay) {
		this.culturalAutumnDay = culturalAutumnDay;
	}
	public String getHeadOfParentageNumber() {
		return headOfParentageNumber;
	}
	public void setHeadOfParentageNumber(String headOfParentageNumber) {
		this.headOfParentageNumber = headOfParentageNumber;
	}
	public String getHeadOfParentageEmail() {
		return headOfParentageEmail;
	}
	public void setHeadOfParentageEmail(String headOfParentageEmail) {
		this.headOfParentageEmail = headOfParentageEmail;
	}
	public String getAncestor() {
		return ancestor;
	}
	public void setAncestor(String ancestor) {
		this.ancestor = ancestor;
	}
	public String getHistoryOfParentage() {
		return historyOfParentage;
	}
	public void setHistoryOfParentage(String historyOfParentage) {
		this.historyOfParentage = historyOfParentage;
	}
	public long getAccountId() {
		return accountId;
	}
	public void setAccountId(long accountId) {
		this.accountId = accountId;
	}
	
}
