package com.giaphavietnam.dao.impl;

import java.util.ArrayList;

import com.giaphavietnam.dao.IParentageDAO;
import com.giaphavietnam.mapper.ParentageMapper;
import com.giaphavietnam.model.ParentageModel;

public class ParentageDAO extends AbstractDAO<ParentageModel> implements IParentageDAO {

	@Override
	public ParentageModel findByAccountId(long id) {
		StringBuilder sql = new StringBuilder("select * from parentage");
		sql.append(" where account_id=?");
		ArrayList<ParentageModel> prt = query(sql.toString(),new ParentageMapper(),id);
		return prt.isEmpty()?null:prt.get(0);
	}

	@Override
	public long save(ParentageModel parentageNew) {
		StringBuilder sql = new StringBuilder("insert into parentage(parentage_name,head_of_parentage_name,address,"
				+ "cultural_spring_day,cultural_autumn_day,head_of_parentage_number,"
				+ "head_of_parentage_email,ancestor,history_of_parentage,account_id) values");
		sql.append("(?,?,?,?,?,?,?,?,?,?)");
		return insert(sql.toString(), parentageNew.getParentageName(),parentageNew.getHead_of_parentage_name(),parentageNew.getAddress(),parentageNew.getCulturalSpringDay(),parentageNew.getCulturalAutumnDay(),parentageNew.getHeadOfParentageNumber(),parentageNew.getHeadOfParentageEmail(),parentageNew.getAncestor(),parentageNew.getHistoryOfParentage(),parentageNew.getAccountId());
	}

	@Override
	public void update(ParentageModel parentageNew) {
		StringBuilder sql = new StringBuilder("insert into parentage(parentage_name,head_of_parentage_name,address,"
				+ "cultural_spring_day,cultural_autumn_day,head_of_parentage_number,"
				+ "head_of_parentage_email,ancestor,history_of_parentage,account_id) values");
		sql.append("(?,?,?,?,?,?,?,?,?,?) ");
		sql.append("where parentage_id = ?");
		update(sql.toString(), parentageNew.getParentageName(),parentageNew.getHead_of_parentage_name(),parentageNew.getAddress(),parentageNew.getCulturalSpringDay(),parentageNew.getCulturalAutumnDay(),parentageNew.getHeadOfParentageNumber(),parentageNew.getHeadOfParentageEmail(),parentageNew.getAncestor(),parentageNew.getHistoryOfParentage(),parentageNew.getAccountId(),parentageNew.getParentageId());
	}

}
