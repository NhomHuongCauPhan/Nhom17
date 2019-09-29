package com.giaphavietnam.mapper;

import java.sql.ResultSet;
import java.sql.SQLException;

import com.giaphavietnam.model.ImageModel;

public class ImageMapper implements RowMapper<ImageModel> {

	@Override
	public ImageModel mapRow(ResultSet rs) {
		ImageModel item = new ImageModel();
		try {
			item.setId(rs.getLong("id"));

			item.setImageName(rs.getString("image_name"));
			item.setParentageId(rs.getInt("parentage_id"));
			item.setUrl(rs.getString("url"));
		} catch (SQLException e) {
			System.out.println(e.getMessage());
		}
		return item;
	}

}
