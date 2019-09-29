package com.giaphavietnam.mapper;

import java.sql.ResultSet;
import java.sql.SQLException;

import com.giaphavietnam.model.AccountModel;

public class AccountMapper implements RowMapper<AccountModel> {

	@Override
	public AccountModel mapRow(ResultSet rs) {
		AccountModel item = new AccountModel();
		try {
			item.setAccountName(rs.getString("account_name"));

			item.setId(rs.getLong("id"));
			item.setPassword(rs.getString("password"));
			item.setRole(rs.getInt("role"));
			item.setStatus(rs.getInt("status"));
		} catch (SQLException e) {
			System.out.println(e.getMessage());
		}
		return item;
	}

}
