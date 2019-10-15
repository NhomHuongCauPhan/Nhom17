package com.giaphavietnam.dao;

import java.util.ArrayList;

import com.giaphavietnam.model.IndividualModel;

public interface IIndividualDAO {
	public ArrayList<IndividualModel> findAll(long parentageId);
	public IndividualModel findById(long individualId);
	public IndividualModel findBro(long father);
	public long save(IndividualModel individualNew);
	public void update(IndividualModel individualNew);
	public void delete(IndividualModel individual);
}