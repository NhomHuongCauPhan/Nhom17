package com.giaphavietnam.controller.admin.api;

import java.io.IOException;

import javax.inject.Inject;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.giaphavietnam.model.AccountModel;
import com.giaphavietnam.service.impl.AccountService;
import com.giaphavietnam.utils.HttpUtil;

@WebServlet(urlPatterns= {"/api-admin-account"})
public class AccountAPI extends HttpServlet{
	private static final long serialVersionUID = 1L;
	
	@Inject AccountService acountService;
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		System.out.println("hahahhahahah");
		ObjectMapper mapper = new ObjectMapper();
		req.setCharacterEncoding("utf-8");
		resp.setContentType("application/json");
		AccountModel accountModel = HttpUtil.of(req.getReader()).toModel(AccountModel.class);
		accountModel = acountService.findByUserNameAndUserPass(accountModel.getAccountName(), accountModel.getPassword());
		
		mapper.writeValue(resp.getOutputStream(), accountModel);
	}
	
	
}
