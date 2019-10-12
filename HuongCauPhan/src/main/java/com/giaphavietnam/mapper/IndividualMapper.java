package com.giaphavietnam.mapper;

import java.sql.ResultSet;
import java.sql.SQLException;

import com.giaphavietnam.model.IndividualModel;

public class IndividualMapper implements RowMapper<IndividualModel> {

	@Override
	public IndividualModel mapRow(ResultSet rs) {
		IndividualModel item = new IndividualModel();
		try {
			item.setAvatar(rs.getString("avatar"));
			item.setBranch(rs.getString("branch"));
			item.setDateOfBirth(rs.getDate("date_of_birth"));
			item.setDateOfDeath(rs.getDate("date_of_death"));
			item.setFather(rs.getInt("father"));
			item.setFullName(rs.getString("fullname"));
			item.setGender(rs.getInt("gender"));
			item.setIndividualId(rs.getInt("individual_id"));
			item.setParentageId(rs.getInt("parentage_id"));
		} catch (SQLException e) {
			System.out.println(e.getMessage());
		}
		return item;
	}

}
