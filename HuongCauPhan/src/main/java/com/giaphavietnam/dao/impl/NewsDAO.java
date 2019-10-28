package com.giaphavietnam.dao.impl;

import java.util.ArrayList;

import com.giaphavietnam.dao.INewsDAO;
import com.giaphavietnam.mapper.IndividualMapper;
import com.giaphavietnam.mapper.NewsMapper;
import com.giaphavietnam.model.IndividualModel;
import com.giaphavietnam.model.NewModel;

public class NewsDAO extends AbstractDAO<NewModel> implements INewsDAO{

	@Override
	public ArrayList<NewModel> findAll() {
		StringBuilder sql= new StringBuilder("Select * from news");
		
		ArrayList<NewModel> news = query(sql.toString(),new NewsMapper());
		return news.isEmpty()?null:news;
	}

	@Override
	public NewModel findByViews(long views) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public long save(NewModel news) {
		StringBuilder sql = new StringBuilder("insert into news(content,parentage_id,create_date,views");
		sql.append("values(?,?,?,?)");
		return insert(sql.toString(),news.getContent(),news.getParentage_id(),news.getCreate_date(),news.getViews());

	}

	@Override
	public void update(NewModel news) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void delete(NewModel news) {
		// TODO Auto-generated method stub
		
	}
	
}
