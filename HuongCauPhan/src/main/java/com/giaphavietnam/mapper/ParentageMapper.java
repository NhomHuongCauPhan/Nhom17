package com.giaphavietnam.mapper;

import java.sql.ResultSet;
import java.sql.SQLException;

import com.giaphavietnam.model.ParentageModel;

public class ParentageMapper implements RowMapper<ParentageModel> {

	@Override
	public ParentageModel mapRow(ResultSet rs) {
		ParentageModel item = new ParentageModel();
		try {
			item.setAccountId(rs.getInt("account_id"));
			item.setAddress(rs.getString("address"));
			item.setAncestor(rs.getString("ancestor"));
			item.setCulturalAutumnDay(rs.getDate("cultural_autumn_day"));
			item.setCulturalSpringDay(rs.getDate("cultural_spring_day"));
			item.setHead_of_parentage_name(rs.getString("head_of_parentage_name"));
			item.setHeadOfParentageEmail(rs.getString("head_of_parentage_email"));
			item.setHeadOfParentageNumber(rs.getString("head_of_parentage_number"));
			item.setHistoryOfParentage(rs.getString("history_of_parentage"));
			item.setParentageId(rs.getInt("parentage_id"));
			item.setParentageName(rs.getString("parentage_name"));
		} catch (SQLException e) {
			System.out.println(e.getMessage());
		}
		return item;
	}

}
