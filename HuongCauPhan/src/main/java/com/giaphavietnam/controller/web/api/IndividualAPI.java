package com.giaphavietnam.controller.web.api;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.giaphavietnam.model.IndividualModel;
import com.giaphavietnam.service.IIndividualService;
import com.giaphavietnam.utils.HttpUtil;

import javax.inject.Inject;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

@WebServlet(urlPatterns = {"/api-individual"})
public class IndividualAPI extends HttpServlet {

    @Inject
    private IIndividualService iIndividualService;

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        ObjectMapper mapper = new ObjectMapper();
        req.setCharacterEncoding("utf-8");
        resp.setContentType("application/json");
        String prtId = HttpUtil.of(req.getReader()).getValue();
        String str[]=prtId.split("-");
        String str1=str[0];
        String str2=str[1];
        List<IndividualModel> individualModels=iIndividualService.findAll(Long.parseLong(str2));
        mapper.writeValue(resp.getOutputStream(),individualModels);
    }
}
