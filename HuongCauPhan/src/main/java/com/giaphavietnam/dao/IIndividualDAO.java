package com.giaphavietnam.dao;

import java.util.ArrayList;
import java.util.List;

import com.giaphavietnam.model.IndividualModel;

public interface IIndividualDAO {
	public ArrayList<IndividualModel> findAll(long parentageId);
	public IndividualModel findById(long individualId);
	public ArrayList<IndividualModel> findBro(long father);
	public IndividualModel findBranch(String branch, long prtid);
	public long save(IndividualModel individualNew);
	public void update(IndividualModel individualNew);
	public void delete(IndividualModel individual);
	public IndividualModel findBranch(long parentageId);
	public List<IndividualModel> search(IndividualModel data);
}
