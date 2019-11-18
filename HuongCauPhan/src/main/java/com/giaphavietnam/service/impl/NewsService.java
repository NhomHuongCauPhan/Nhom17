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
	public ArrayList<NewModel> findByTopViews() {
		return inewsdao.findByTopViews();
	}
	@Override
	public NewModel findById(long id) {
		return inewsdao.findById(id);
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

	@Override
	public ArrayList<NewModel> findNewDate() {
		return inewsdao.findNewDate();
	}
	public static void main(String[] args) {
		NewsService a= new NewsService();
		ArrayList<NewModel> arr= a.findByTopViews();
		for(int i=0; i<arr.size(); i++)
			System.out.println(arr.get(i).getNewsID());
	}

	@Override
	public ArrayList<NewModel> findByIdPare(long id,int page, int itemsPerPage) {
		return inewsdao.findByIdPare(id,page,itemsPerPage);
	}

	@Override
	public int countNews(long id) {
		return inewsdao.countNews(id);
	}

	@Override
	public void updateViews(NewModel news) {
		inewsdao.updateViews(news);
	}


	
}
