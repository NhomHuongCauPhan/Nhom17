package com.giaphavietnam.service.impl;

import java.util.ArrayList;

import javax.inject.Inject;

import com.giaphavietnam.dao.INewsDAO;
import com.giaphavietnam.model.NewModel;
import com.giaphavietnam.service.INewsService;

public class NewsService implements INewsService {

	@Inject
	private INewsDAO inewsdao;
	
	@Override
	public ArrayList<NewModel> findAll() {
		return inewsdao.findAll();
	}

	@Override
	public NewModel findByViews(long views) {
		return inewsdao.findByViews(views);
	}

	@Override
	public long save(NewModel news) {
		return inewsdao.save(news);
	}

	@Override
	public void update(NewModel news) {
		inewsdao.update(news);
	}

	@Override
	public void delete(NewModel news) {
		inewsdao.delete(news);
	}

}
