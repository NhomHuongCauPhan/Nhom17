package com.giaphavietnam.service;

import java.util.ArrayList;

import com.giaphavietnam.model.NewModel;

public interface INewsService {
	public  ArrayList<NewModel> findAll();
	public ArrayList<NewModel> findByTopViews();
	public ArrayList<NewModel> findNewDate();
	public ArrayList<NewModel> findByIdPare(long id,int page, int itemsPerPage);
	public int countNews(long id);
	public NewModel findById(long id);
	public long save(NewModel news) ;
	public void update(NewModel news);
	public void updateViews(NewModel news);
	public void delete(NewModel news);
}
