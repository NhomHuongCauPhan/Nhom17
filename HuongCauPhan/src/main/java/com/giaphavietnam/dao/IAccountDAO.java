package com.giaphavietnam.dao;

import java.util.ArrayList;

import com.giaphavietnam.model.AccountModel;

public interface IAccountDAO extends GenericDAO<AccountModel> {
	ArrayList<AccountModel> findAll();
	AccountModel findByUserNameAndUserPass(String username, String password);
	Long save(AccountModel model);
}
