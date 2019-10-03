package com.giaphavietnam.service.impl;

import javax.inject.Inject;

import com.giaphavietnam.dao.IAccountDAO;
import com.giaphavietnam.model.AccountModel;
import com.giaphavietnam.service.IAccountService;

public class AccountService implements IAccountService{
    
	@Inject
	private IAccountDAO acc;
	@Override
	public AccountModel findByUserNameAndUserPass(String userName, String password) {
		return acc.findByUserNameAndUserPass(userName, password);
	}

}
