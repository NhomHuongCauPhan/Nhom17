package com.giaphavietnam.dao;

import com.giaphavietnam.model.ParentageModel;

import java.util.List;

public interface IParentageDAO {
	public List<ParentageModel> findAll();
	List<ParentageModel> findAll(String data);
	List<ParentageModel> findByPrtId(long prtId);
	public ParentageModel findByAccountId(long id);
	public long save(ParentageModel parentageNew);
	public void update(ParentageModel parentageNew);
}
