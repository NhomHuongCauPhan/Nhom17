package com.giaphavietnam.controller.admin.api;

import java.io.IOException;

import javax.inject.Inject;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.giaphavietnam.model.NewModel;
import com.giaphavietnam.model.ParentageModel;
import com.giaphavietnam.service.impl.NewsService;
import com.giaphavietnam.utils.HttpUtil;
@WebServlet(urlPatterns= {"/api-admin-news"})
public class NewsAPI extends HttpServlet{

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	@Inject private NewsService newsService;
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// TODO Auto-generated method stub
		super.doGet(req, resp);
	}
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// TODO Auto-generated method stub
		super.doPost(req, resp);
	}
	@Override
	protected void doPut(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		ObjectMapper mapper = new ObjectMapper();
		req.setCharacterEncoding("utf-8");
		resp.setContentType("application/json");
		NewModel news = HttpUtil.of(req.getReader()).toModel(NewModel.class);
		newsService.save(news);
		mapper.writeValue(resp.getOutputStream(), "Success");
	}
	
}
