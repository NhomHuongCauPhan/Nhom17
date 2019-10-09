package com.giaphavietnam.dao;

import com.giaphavietnam.model.ParentageModel;

public interface IParentageDAO {
	public ParentageModel findByAccountId(long id);
	public long save(ParentageModel parentageNew);
	public void update(ParentageModel parentageNew);
}
