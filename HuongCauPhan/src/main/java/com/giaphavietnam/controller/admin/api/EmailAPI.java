package com.giaphavietnam.controller.admin.api;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.giaphavietnam.model.EmailModel;
import com.giaphavietnam.utils.EmailUtil;
import com.giaphavietnam.utils.HttpUtil;

@WebServlet(urlPatterns = { "/api-admin-email" })
public class EmailAPI extends HttpServlet{
	private static final long serialVersionUID = 1L;
	protected void doPut(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		ObjectMapper mapper = new ObjectMapper();
		req.setCharacterEncoding("utf-8");
		resp.setContentType("application/json");
		EmailModel email = HttpUtil.of(req.getReader()).toModel(EmailModel.class);
		EmailUtil.sendEmail(email.getReciever(), email.getHeader(), email.getContent());
		mapper.writeValue(resp.getOutputStream(), "true");
	}
}
