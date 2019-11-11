package com.giaphavietnam.controller.admin.api;

import java.io.IOException;
import java.util.List;

import javax.inject.Inject;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.giaphavietnam.model.IndividualModel;
import com.giaphavietnam.model.ParentageModel;
import com.giaphavietnam.service.impl.IndividualService;
import com.giaphavietnam.service.impl.ParentageService;
import com.giaphavietnam.utils.HttpUtil;

@WebServlet(urlPatterns = {"/api-search"})
public class SearchIndividualAPI extends HttpServlet{
	private static final long serialVersionUID = 1L;
    @Inject
    private IndividualService parentageService;

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        ObjectMapper mapper = new ObjectMapper();
        req.setCharacterEncoding("utf-8");
        resp.setContentType("application/json");
        IndividualModel data = HttpUtil.of(req.getReader()).toModel(IndividualModel.class);
        List<IndividualModel> list = parentageService.search(data);
        mapper.writeValue(resp.getOutputStream(), list);
    }

    @Override
    protected void doPut(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        ObjectMapper mapper = new ObjectMapper();
        req.setCharacterEncoding("utf-8");
        resp.setContentType("application/json");
        ParentageModel parentageNew = HttpUtil.of(req.getReader()).toModel(ParentageModel.class);
       // parentageService.update(parentageNew);
        mapper.writeValue(resp.getOutputStream(), "Success");
    }
}
