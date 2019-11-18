package com.giaphavietnam.dao;

import java.util.ArrayList;

import com.giaphavietnam.mapper.RowMapper;



public interface GenericDAO<T> {
	 ArrayList<T> query(String sql, RowMapper<T> rowMapper, Object... paremeters);
	 void update(String sql, Object...parameters);
	 void delete(String sql, Object...parameters);
	 Long insert(String sql, Object...parameters);
	 int count(String sql,  Object...parameters);
}
