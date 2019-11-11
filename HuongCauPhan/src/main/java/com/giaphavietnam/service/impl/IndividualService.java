package com.giaphavietnam.service.impl;

import java.util.ArrayList;

import javax.inject.Inject;

import com.giaphavietnam.dao.IIndividualDAO;
import com.giaphavietnam.model.IndividualModel;
import com.giaphavietnam.service.IIndividualService;

public class IndividualService implements IIndividualService {
	
	@Inject private IIndividualDAO individualDAO;
	@Override
	public ArrayList<IndividualModel> findAll(long parentageId) {
		return individualDAO.findAll(parentageId);
	}

	@Override
	public long save(IndividualModel individualNew) {
		return individualDAO.save(individualNew);
	}

	@Override
	public void update(IndividualModel individualNew) {
		individualDAO.update(individualNew);
	}

	@Override
	public void delete(IndividualModel individual) {
		individualDAO.delete(individual);
	}

	@Override
	public IndividualModel findById(long individualId) {
		return individualDAO.findById(individualId);
	}

	@Override
	public ArrayList<IndividualModel> findBro(long father) {
		return individualDAO.findBro(father);
	}

	@Override
	public IndividualModel findBranch(String branch) {
		return individualDAO.findBranch(branch);
	}

	@Override
	public IndividualModel findAge(long parentageId) {
		return individualDAO.findBranch(parentageId);
	}

}
