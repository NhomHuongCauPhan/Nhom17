package com.giaphavietnam.service;

import com.giaphavietnam.model.AccountModel;

public interface IAccountService {
	public AccountModel findByUserNameAndUserPass(String userName, String password);
}
