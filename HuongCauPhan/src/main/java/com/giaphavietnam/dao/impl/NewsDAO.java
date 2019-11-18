package com.giaphavietnam.dao.impl;

import java.util.ArrayList;

import com.giaphavietnam.dao.INewsDAO;
import com.giaphavietnam.mapper.NewsMapper;
import com.giaphavietnam.model.NewModel;

public class NewsDAO extends AbstractDAO<NewModel> implements INewsDAO{

	@Override
	public ArrayList<NewModel> findAll() {
		StringBuilder sql= new StringBuilder("Select * from news");
		ArrayList<NewModel> news = query(sql.toString(),new NewsMapper());
		return news.isEmpty()?null:news;
	}

	@Override
	public ArrayList<NewModel> findNewDate() {
		StringBuilder sql = new StringBuilder("select * from news order by create_date desc limit 3");
		ArrayList<NewModel> news= query(sql.toString(),new NewsMapper());
		return news.isEmpty()?null:news;
	}

	@Override
	public ArrayList<NewModel> findByTopViews() {
		StringBuilder sql= new StringBuilder("select  * from news order by views desc limit 2");
		ArrayList<NewModel> news=query(sql.toString(),new NewsMapper());
		return news.isEmpty()?null:news;
	}
	@Override
	public NewModel findById(long id) {
		StringBuilder sql= new StringBuilder("select  * from news");
		sql.append(" where id=?");
		ArrayList<NewModel> news=query(sql.toString(),new NewsMapper(),id);
		return news.isEmpty()?null:news.get(0);
	}
	@Override
	public long save(NewModel news) {
		StringBuilder sql = new StringBuilder("insert into news(content,parentage_id,create_date,views,title)");
		sql.append("values(?,?,?,?,?)");
		return insert(sql.toString(),news.getContent(),news.getParentage_id(),news.getCreate_date(),news.getViews(),news.getTitle());
	}

	@Override
	public void update(NewModel news) {
		StringBuilder sql = new StringBuilder("update news SET content=?,title=? WHERE id=?");
		update(sql.toString(),news.getContent(),news.getTitle(),news.getNewsID());
	}

	@Override
	public void delete(NewModel news) {
		StringBuilder sql = new StringBuilder("delete from news");
		sql.append("where id=?");
		delete(sql.toString(),news.getNewsID());
	}


	@Override
	public ArrayList<NewModel> findByIdPare(long id,int page, int itemsPerPage) {
		StringBuilder sql= new StringBuilder("select  * from news");
		sql.append(" where parentage_id=? LIMIT ?,?" );
		ArrayList<NewModel> news=query(sql.toString(),new NewsMapper(),id,(page - 1) * itemsPerPage,itemsPerPage);
		return news.isEmpty()?null:news;
	}

	@Override
	public int countNews(long id) {
		StringBuilder sql= new StringBuilder("select count(id) from news");
		sql.append(" where  parentage_id=?");
		int news=count(sql.toString(), id);
		return news;
	}
	public static void main(String[] args) {
		NewsDAO a= new NewsDAO();
		ArrayList<NewModel> arr= a.findAll();
			System.out.println(arr.get(0).getTitle());
	
	}

	@Override
	public void updateViews(NewModel news) {
		StringBuilder sql = new StringBuilder("update news SET views=?+1 WHERE id=?");
		update(sql.toString(),news.getViews(),news.getNewsID());
	}
}
