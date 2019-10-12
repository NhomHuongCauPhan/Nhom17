package com.giaphavietnam.dao.impl;

import java.util.ArrayList;

import com.giaphavietnam.dao.IIndividualDAO;
import com.giaphavietnam.mapper.IndividualMapper;
import com.giaphavietnam.model.IndividualModel;

public class IndividualDAO extends AbstractDAO<IndividualModel> implements IIndividualDAO {

	@Override
	public ArrayList<IndividualModel> findAll(long parentageId) {
		StringBuilder sql = new StringBuilder("select * from individual");
		sql.append(" where parentage_id=?");
		ArrayList<IndividualModel> prt = query(sql.toString(),new IndividualMapper(),parentageId);
		return prt.isEmpty()?null:prt;
	}

	@Override
	public long save(IndividualModel individualNew) {
		
		return 0;
	}

	@Override
	public void update(IndividualModel individualNew) {
		

	}

	@Override
	public void delete(IndividualModel individual) {
		StringBuilder sql = new StringBuilder("delete from individual");
		sql.append(" where individual_id=?");
		this.update(sql.toString(), individual.getIndividualId());
	}

	@Override
	public IndividualModel findById(long individualId) {
		StringBuilder sql = new StringBuilder("select * from individual");
		sql.append(" where individual_id=?");
		ArrayList<IndividualModel> prt = query(sql.toString(),new IndividualMapper(),individualId);
		return prt.isEmpty()?null:prt.get(0);
	}

	@Override
	public IndividualModel findBro(long father) {
		StringBuilder sql = new StringBuilder("select * from individual");
		sql.append(" where father=?");
		ArrayList<IndividualModel> prt = query(sql.toString(),new IndividualMapper(),father);
		return prt.isEmpty()?null:prt.get(0);
	}

}
