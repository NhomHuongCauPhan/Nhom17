package com.giaphavietnam.service;

import com.giaphavietnam.model.ParentageModel;

public interface IParentageService {
	public ParentageModel findByAccountId(long id);
	public long save(ParentageModel parentageNew);
	public void update(ParentageModel parentageNew);
}
