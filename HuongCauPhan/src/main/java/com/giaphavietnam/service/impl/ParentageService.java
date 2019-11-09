package com.giaphavietnam.service.impl;

import javax.inject.Inject;

import com.giaphavietnam.dao.IParentageDAO;
import com.giaphavietnam.model.ParentageModel;
import com.giaphavietnam.service.IParentageService;

import java.util.List;

public class ParentageService implements IParentageService {
	@Inject
	private IParentageDAO parentageDAO;

	@Override
	public List<ParentageModel> findAll() {
		return parentageDAO.findAll();
	}

	@Override
	public List<ParentageModel> findAll(String data) {
		return parentageDAO.findAll(data);
	}

	@Override
	public ParentageModel findByAccountId(long id) {	
		return parentageDAO.findByAccountId(id);
	}
	@Override
	public long save(ParentageModel parentageNew) {
		return parentageDAO.save(parentageNew);
	}
	public void update(ParentageModel parentageNew) {
		parentageDAO.update(parentageNew);
	}

}
