package com.giaphavietnam.service;

import java.util.ArrayList;

import com.giaphavietnam.model.IndividualModel;

public interface IIndividualService {
	public ArrayList<IndividualModel> findAll(long parentageId);
	public IndividualModel findById(long individualId);
	public IndividualModel findBro(long father);
	public long save(IndividualModel individualNew);
	public void update(IndividualModel individualNew);
	public void delete(IndividualModel individual);
}