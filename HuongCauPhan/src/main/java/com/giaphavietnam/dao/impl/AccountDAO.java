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

	@Override
	public Long save(AccountModel model) {
		StringBuilder sql= new StringBuilder("insert into account(account_name,password,role,status) values(?,?,?,?)");
		return  insert(sql.toString(),model.getAccountName(),model.getPassword(), model.getRole(), model.getStatus());
	}

	@Override
	public void update(AccountModel accountModel) {
		StringBuilder sql= new StringBuilder("update account set password = ? where account_name = ?");
		update(sql.toString(),accountModel.getPassword(),accountModel.getAccountName());
	}

	

}
