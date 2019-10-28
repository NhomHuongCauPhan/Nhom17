package com.giaphavietnam.service;

import java.util.ArrayList;

import com.giaphavietnam.model.NewModel;

public interface INewsService {
	public  ArrayList<NewModel> findAll();
	public NewModel findByViews(long views);
	public long save(NewModel news) ;
	public void update(NewModel news);
	public void delete(NewModel news);
}
