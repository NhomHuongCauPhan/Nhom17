package com.giaphavietnam.mapper;

import java.sql.ResultSet;

import com.giaphavietnam.model.NewModel;

public class NewsMapper implements RowMapper<NewModel>{

	@Override
	public NewModel mapRow(ResultSet rs) {
		NewModel item= new NewModel();
		try {
			item.setNewsID(rs.getLong("id"));
			item.setContent(rs.getString("content"));
			item.setParentage_id(rs.getLong("parentage_id"));
			item.setCreate_date(rs.getDate("create_date"));
			item.setViews(rs.getLong("views"));
		} catch (Exception e) {
			System.out.println(e.getMessage());
		}
		return item;
	}
	
}
