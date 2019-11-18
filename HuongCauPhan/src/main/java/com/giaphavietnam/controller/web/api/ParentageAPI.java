package com.giaphavietnam.controller.web.api;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.giaphavietnam.model.ParentageModel;
import com.giaphavietnam.service.impl.ParentageService;
import com.giaphavietnam.utils.HttpUtil;

import javax.inject.Inject;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

@WebServlet(urlPatterns = {"/api-parentage"})
public class ParentageAPI extends HttpServlet {
    private static final long serialVersionUID = 1L;
    @Inject
    private ParentageService parentageService;

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        ObjectMapper mapper = new ObjectMapper();
        req.setCharacterEncoding("utf-8");
        resp.setContentType("application/json");
        /*ParentageModel parentageNew = HttpUtil.of(req.getReader()).toModel(ParentageModel.class);
        parentageService.update(parentageNew);*/
        mapper.writeValue(resp.getOutputStream(), parentageService.findAll());
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        ObjectMapper mapper = new ObjectMapper();
        req.setCharacterEncoding("utf-8");
        resp.setContentType("application/json");
        String data = HttpUtil.of(req.getReader()).getValue();
        List<ParentageModel> listPrt = parentageService.findAll(data);
        mapper.writeValue(resp.getOutputStream(), listPrt);
    }

    @Override
    protected void doPut(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        ObjectMapper mapper = new ObjectMapper();
        req.setCharacterEncoding("utf-8");
        resp.setContentType("application/json");
        ParentageModel parentageNew = HttpUtil.of(req.getReader()).toModel(ParentageModel.class);
        parentageService.update(parentageNew);
        mapper.writeValue(resp.getOutputStream(), "Success");
    }
}
