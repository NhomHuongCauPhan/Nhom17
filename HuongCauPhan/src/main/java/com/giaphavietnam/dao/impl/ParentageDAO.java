package com.giaphavietnam.dao.impl;

import java.util.ArrayList;
import java.util.List;

import com.giaphavietnam.dao.IParentageDAO;
import com.giaphavietnam.mapper.ParentageMapper;
import com.giaphavietnam.model.ParentageModel;

public class ParentageDAO extends AbstractDAO<ParentageModel> implements IParentageDAO {

	@Override
	public List<ParentageModel> findAll() {
		StringBuilder sql=new StringBuilder("SELECT * FROM parentage");
		return query(sql.toString(),new ParentageMapper());
	}

    @Override
    public List<ParentageModel> findAll(String data) {
        StringBuilder sql=new StringBuilder("SELECT * FROM parentage ");
        if(data!=null || !data.equals("")){
            sql.append(" WHERE parentage_name LIKE '%"+data+"%' or head_of_parentage_name LIKE '%"+data+"%' or ");
            sql.append("address LIKE '%"+data+"%' or head_of_parentage_number LIKE '%"+data+"%' or ");
            sql.append("head_of_parentage_email LIKE '%"+data+"%' or ancestor LIKE '%"+data+"%';");
        }
        else{
            sql.append(";");
        }
        return query(sql.toString(),new ParentageMapper(),data);
    }

	@Override
	public List<ParentageModel> findByData(String data) {
		StringBuilder sql=new StringBuilder("SELECT * FROM parentage ");
		sql.append("WHERE ");
		return query(sql.toString(),new ParentageMapper());
	}

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
		StringBuilder sql = new StringBuilder("update parentage set parentage_name = ? , head_of_parentage_name = ?,address = ? , "
				+ "cultural_spring_day = ? , cultural_autumn_day = ? , head_of_parentage_number = ? , "
				+ "head_of_parentage_email = ? , ancestor = ? , history_of_parentage = ? , account_id = ?");
		sql.append(" where parentage_id = ?");
		update(sql.toString(), parentageNew.getParentageName(),parentageNew.getHead_of_parentage_name(),parentageNew.getAddress(),parentageNew.getCulturalSpringDay(),parentageNew.getCulturalAutumnDay(),parentageNew.getHeadOfParentageNumber(),parentageNew.getHeadOfParentageEmail(),parentageNew.getAncestor(),parentageNew.getHistoryOfParentage(),parentageNew.getAccountId(),parentageNew.getParentageId());
	}

}
