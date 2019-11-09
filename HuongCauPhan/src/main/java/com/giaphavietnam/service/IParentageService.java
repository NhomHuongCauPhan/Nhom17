package com.giaphavietnam.service;

import com.giaphavietnam.model.ParentageModel;

import java.util.List;

public interface IParentageService {
	List<ParentageModel> findAll();
	List<ParentageModel> findAll(String data);
	public ParentageModel findByAccountId(long id);
	public long save(ParentageModel parentageNew);
	public void update(ParentageModel parentageNew);
}
