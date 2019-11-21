package com.giaphavietnam.model;

public class AccountModel {
	private long id;
	private String accountName; 
	private String password;
	private int role;
	private int status;
	
	@Override
	public String toString() {
		return "AccountModel [id=" + id + ", accountName=" + accountName + ", password=" + password + ", role=" + role
				+ ", status=" + status + "]";
	}
	public long getId() {
		return id;
	}
	public void setId(long id) {
		this.id = id;
	}
	public String getAccountName() {
		return accountName;
	}
	public void setAccountName(String accountName) {
		this.accountName = accountName;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public int getRole() {
		return role;
	}
	public void setRole(int role) {
		this.role = role;
	}
	public int getStatus() {
		return status;
	}
	public void setStatus(int status) {
		this.status = status;
	}
	
}
