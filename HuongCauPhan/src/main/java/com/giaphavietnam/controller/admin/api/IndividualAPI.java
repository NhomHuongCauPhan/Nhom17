package com.giaphavietnam.controller.admin.api;

import java.io.IOException;

import javax.inject.Inject;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.giaphavietnam.model.IndividualModel;
import com.giaphavietnam.service.IIndividualService;
import com.giaphavietnam.utils.HttpUtil;

@WebServlet(urlPatterns= {"/api-admin-individual"})
public class IndividualAPI extends HttpServlet{
	private static final long serialVersionUID = 1L;
	
	@Inject private IIndividualService individualService;
	
	@Override
	protected void doDelete(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		ObjectMapper mapper = new ObjectMapper();
		req.setCharacterEncoding("utf-8");
		resp.setContentType("application/json");
		IndividualModel individual = HttpUtil.of(req.getReader()).toModel(IndividualModel.class);
		if(individualService.findBro(individual.getIndividualId())!=null) {
			mapper.writeValue(resp.getOutputStream(), "false");
		}else {
		individualService.delete(individual);
		mapper.writeValue(resp.getOutputStream(), "true");
		}
	}
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		ObjectMapper mapper = new ObjectMapper();
		req.setCharacterEncoding("utf-8");
		resp.setContentType("application/json");
		IndividualModel individualNew = HttpUtil.of(req.getReader()).toModel(IndividualModel.class);
		individualService.update(individualNew);
		mapper.writeValue(resp.getOutputStream(), individualNew);
	}
	@Override
	protected void doPut(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		ObjectMapper mapper = new ObjectMapper();
		req.setCharacterEncoding("utf-8");
		resp.setContentType("application/json");
		IndividualModel individualNew = HttpUtil.of(req.getReader()).toModel(IndividualModel.class);
		IndividualModel individualcheck = individualService.findBranch(individualNew.getBranch(),individualNew.getParentageId());
		if(individualcheck!=null) {
			mapper.writeValue(resp.getOutputStream(), "false");
		}else {
			long id = individualService.save(individualNew);
			mapper.writeValue(resp.getOutputStream(), "true");
		}
		
	}
}
