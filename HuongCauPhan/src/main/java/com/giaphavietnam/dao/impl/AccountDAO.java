package com.giaphavietnam.dao.impl;

import java.util.ArrayList;

import com.giaphavietnam.dao.IAccountDAO;
import com.giaphavietnam.mapper.AccountMapper;
import com.giaphavietnam.model.AccountModel;

public class AccountDAO extends AbstractDAO<AccountModel> implements IAccountDAO {

	@Override
	public ArrayList<AccountModel> findAll() {
		return null;
	}

	@Override
	public AccountModel findByUserNameAndUserPass(String userName, String password) {
		StringBuilder sql= new StringBuilder("select * from account");
		sql.append(" where account_name=? and password=?");
		ArrayList<AccountModel> user = query(sql.toString(),new AccountMapper(),userName,password);
		return user.isEmpty()?null:user.get(0);
	}

	

}
