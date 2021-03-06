package com.giaphavietnam.dao.impl;

import java.util.ArrayList;
import java.util.List;

import com.giaphavietnam.dao.IIndividualDAO;
import com.giaphavietnam.mapper.IndividualMapper;
import com.giaphavietnam.model.IndividualModel;

public class IndividualDAO extends AbstractDAO<IndividualModel> implements IIndividualDAO {

	@Override
	public ArrayList<IndividualModel> findAll(long parentageId) {
		StringBuilder sql = new StringBuilder("select * from individual");
		sql.append(" where parentage_id=?");
		sql.append(" order by branch");
		ArrayList<IndividualModel> prt = query(sql.toString(),new IndividualMapper(),parentageId);
		return prt.isEmpty()?null:prt;
	}

	@Override
	public long save(IndividualModel individualNew) {
		StringBuilder sql = new StringBuilder("insert into individual(fullname,gender,date_of_birth,date_of_death,father,branch,parentage_id,avatar)");
		sql.append(" values(?,?,?,?,?,?,?,?)");
		return insert(sql.toString(), individualNew.getFullName(), individualNew.getGender(), individualNew.getDateOfBirth(), individualNew.getDateOfDeath(), individualNew.getFather(), individualNew.getBranch(),individualNew.getParentageId(), individualNew.getAvatar());
	}

	@Override
	public void update(IndividualModel individualNew) {
		StringBuilder sql = new StringBuilder("update individual set");
		sql.append(" fullname=?,");
		sql.append(" gender=?,");
		sql.append(" date_of_birth=?,");
		sql.append(" date_of_death=?,");
		sql.append(" avatar=?");
		sql.append(" where individual_id=?");
		this.update(sql.toString(), individualNew.getFullName(),individualNew.getGender(),individualNew.getDateOfBirth(),individualNew.getDateOfDeath(),individualNew.getAvatar(),individualNew.getIndividualId());
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
	public ArrayList<IndividualModel> findBro(long father) {
		StringBuilder sql = new StringBuilder("select * from individual");
		sql.append(" where father=?");
		ArrayList<IndividualModel> prt = query(sql.toString(),new IndividualMapper(),father);
		return prt.isEmpty()?null:prt;
	}

	@Override
	public IndividualModel findBranch(String branch, long prtid) {
		StringBuilder sql = new StringBuilder("select * from individual");
		sql.append(" where branch=?");
		sql.append(" and parentage_id=?");
		ArrayList<IndividualModel> prt = query(sql.toString(),new IndividualMapper(),branch, prtid);
		return prt.isEmpty()?null:prt.get(0);
	}

	@Override
	public IndividualModel findBranch(long parentageId) {
		StringBuilder sql = new StringBuilder("SELECT * FROM individual where parentage_id=? ");
		sql.append("order by father desc limit 1");
		ArrayList<IndividualModel> prt = query(sql.toString(),new IndividualMapper(),parentageId);
		return prt.isEmpty()?null:prt.get(0);
	}

	@Override
	public List<IndividualModel> search(IndividualModel data) {
		StringBuilder sql = new StringBuilder("SELECT * FROM individual where parentage_id="+data.getParentageId());
		if(data.getGender()!=2) {
			sql.append(" and gender="+data.getGender());
		}
		if(data.getFullName()!="") {
			sql.append(" and fullname like '%"+data.getFullName()+"%'");
		}
		
		ArrayList<IndividualModel> prt = query(sql.toString(),new IndividualMapper());
		return prt.isEmpty()?null:prt;
	}

}
