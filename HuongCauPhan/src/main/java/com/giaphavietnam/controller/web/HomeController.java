package com.giaphavietnam.controller.web;

import com.giaphavietnam.constant.SystemConstant;
import com.giaphavietnam.model.NewModel;
import com.giaphavietnam.model.ParentageModel;
import com.giaphavietnam.service.IIndividualService;
import com.giaphavietnam.service.INewsService;
import com.giaphavietnam.service.IParentageService;
import com.giaphavietnam.utils.FormUtil;

import javax.inject.Inject;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

@WebServlet(urlPatterns = {"/trang-chu", "/cac-dong-ho", "/thong-bao", "/thong-tin-dong-ho","/tin-hot"})
public class HomeController extends HttpServlet {
    private static final long serialVersionUID = 1L;

    @Inject
    private IIndividualService iIndividualService;
    @Inject
    private IParentageService iParentageService;
    @Inject
    private INewsService newsService;
    public void doGet(HttpServletRequest req, HttpServletResponse res) throws IOException, ServletException {
        if (req.getRequestURI().endsWith("trang-chu")) {
            String action = req.getParameter("action");
            if (action != null && action.equalsIgnoreCase("logout")) {
                req.getSession().removeAttribute(SystemConstant.MODEL);
            }
            ArrayList<NewModel> arrNewsTop=newsService.findByTopViews();
			ArrayList<NewModel> arrNewDate=newsService.findNewDate();
			req.setAttribute("arrNewsTop", arrNewsTop);
			req.setAttribute("arrNewDate", arrNewDate);
            RequestDispatcher rd = req.getRequestDispatcher("/view/web/home.jsp");
            rd.forward(req, res);
        } else if (req.getRequestURI().endsWith("cac-dong-ho")) {
           List<ParentageModel> listPrt = iParentageService.findAll();
            for (ParentageModel parentageModel : listPrt) {
                if (parentageModel != null) {
                    int totalMember = iIndividualService.findAll(parentageModel.getParentageId()).size();
                    parentageModel.setTotalMember(totalMember);
                    parentageModel = FormUtil.toModel(ParentageModel.class, req);
                    parentageModel.setListResult(listPrt);
                    req.setAttribute("totalMember", parentageModel.getTotalMember());
                    req.setAttribute(SystemConstant.PARENTAGEMODEL, parentageModel);
                } else {
                    return;
                }
            }
            RequestDispatcher rd = req.getRequestDispatcher("/view/web/parentages.jsp");
            rd.forward(req, res);
        } else if (req.getRequestURI().endsWith("thong-bao")) {
            RequestDispatcher rd = req.getRequestDispatcher("/view/web/alerts.jsp");
            rd.forward(req, res);
        } else if (req.getRequestURI().endsWith("thong-tin-dong-ho")) {
            RequestDispatcher rd = req.getRequestDispatcher("/view/web/parentageinfo.jsp");
            rd.forward(req, res);
        }else if (req.getRequestURI().endsWith("tin-hot")) {
        	long id = Long.valueOf(req.getParameter("newID"));
        	NewModel onlyOne = newsService.findById(id);
        	req.setAttribute("onlyOne", onlyOne);
            RequestDispatcher rd = req.getRequestDispatcher("/view/web/news.jsp");
            rd.forward(req, res);
        }
    }
}
