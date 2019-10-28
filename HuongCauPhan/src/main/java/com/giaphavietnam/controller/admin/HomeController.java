package com.giaphavietnam.controller.admin;

import java.io.IOException;
import java.util.ArrayList;

import javax.inject.Inject;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.giaphavietnam.constant.SystemConstant;
import com.giaphavietnam.model.AccountModel;
import com.giaphavietnam.model.IndividualModel;
import com.giaphavietnam.model.ParentageModel;
import com.giaphavietnam.service.IIndividualService;
import com.giaphavietnam.service.IParentageService;
import com.giaphavietnam.utils.GenerateTree;

@WebServlet(urlPatterns = { "/quan-tri","/quan-tri/dong-ho","/quan-tri/mail", "/quan-tri/pha-do", "/quan-tri/sua-gia-pha", "/quan-tri/album", "/quan-tri/bai-viet" })
public class HomeController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	@Inject 
	private IParentageService parentageService;
	@Inject 
	private IIndividualService individualService;

	public void doGet(HttpServletRequest req, HttpServletResponse res) throws IOException, ServletException {
		AccountModel model = (AccountModel) req.getSession().getAttribute(SystemConstant.MODEL);
		ParentageModel prt = parentageService.findByAccountId(model.getId());
		if(prt!=null) {
			req.setAttribute(SystemConstant.PARENTAGEMODEL, prt);
		}
		
		if (req.getRequestURI().endsWith("dong-ho")) {
			int sotv = individualService.findAll(prt.getParentageId()).size();
			req.setAttribute("sotv", sotv);
			RequestDispatcher rd = req.getRequestDispatcher("/view/admin/parentage.jsp");
			rd.forward(req, res);
		}
		else if (req.getRequestURI().endsWith("pha-do")) {
			ArrayList<IndividualModel> list = individualService.findAll(prt.getParentageId());
			String familyTree = GenerateTree.viewIndividual(list);
			req.setAttribute(SystemConstant.FAMILYTREE, familyTree);
			RequestDispatcher rd = req.getRequestDispatcher("/view/admin/familytree.jsp");
			rd.forward(req, res);
		}
		else if (req.getRequestURI().endsWith("sua-gia-pha")) {
			String strid = req.getParameter("id");
			String img = req.getParameter("image");
			String img1 = req.getParameter("image1");
			req.setAttribute("image", img);
			req.setAttribute("image1", img1); 
			
			int id = Integer.parseInt(strid);
			IndividualModel ind = individualService.findById(id);
			if(ind!=null) {
				ArrayList<IndividualModel> bro = individualService.findBro(ind.getFather());
				ArrayList<IndividualModel> child = individualService.findBro(ind.getIndividualId());
				IndividualModel parent = individualService.findById(ind.getFather());
				
				req.setAttribute("brother", bro);
				req.setAttribute("parent", parent);
				req.setAttribute("children", child);
				req.setAttribute("indorder", ind.getBranch().split("\\.").length);
				if (ind.getFullName().indexOf('&') > -1) {
					req.setAttribute("indname", ind.getFullName().split("&")[0]);
					req.setAttribute("indpartnername", ind.getFullName().split("&")[1]);
				} else {
					System.out.println(ind.getFullName());
					req.setAttribute("indname", ind.getFullName());
				}
				req.setAttribute(SystemConstant.INDIVIDUALMODEL, ind);
			}
			RequestDispatcher rd = req.getRequestDispatcher("/view/admin/edittree.jsp");
			rd.forward(req, res);
		}
		else if (req.getRequestURI().endsWith("album")) {
			RequestDispatcher rd = req.getRequestDispatcher("/view/admin/album.jsp");
			rd.forward(req, res);
		}
		else if (req.getRequestURI().endsWith("bai-viet")) {
			RequestDispatcher rd = req.getRequestDispatcher("/view/admin/news.jsp");
			rd.forward(req, res);
		}
		else if (req.getRequestURI().endsWith("mail")) {
			RequestDispatcher rd = req.getRequestDispatcher("/view/admin/email.jsp");
			rd.forward(req, res);
		}
		else{
			int sotv = individualService.findAll(prt.getParentageId()).size();
			req.setAttribute("sotv", sotv);
			RequestDispatcher rd = req.getRequestDispatcher("/view/admin/parentage.jsp");
			rd.forward(req, res);
		}
		
	}
}
