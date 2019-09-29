package com.giaphavietnam.dao.impl;

import java.util.ArrayList;

import com.giaphavietnam.dao.IAccountDAO;
import com.giaphavietnam.mapper.RowMapper;
import com.giaphavietnam.model.AccountModel;

public class AccountDAO extends AbstractDAO<AccountModel> implements IAccountDAO {

	@Override
	public ArrayList<AccountModel> findAll() {
		return null;
	}

	

}
