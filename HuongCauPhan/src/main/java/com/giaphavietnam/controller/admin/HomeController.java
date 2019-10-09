package com.giaphavietnam.controller.admin;

import java.io.IOException;

import javax.inject.Inject;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.giaphavietnam.constant.SystemConstant;
import com.giaphavietnam.model.AccountModel;
import com.giaphavietnam.model.ParentageModel;
import com.giaphavietnam.service.IParentageService;

@WebServlet(urlPatterns = { "/quan-tri","/quan-tri/dong-ho", "/quan-tri/pha-do", "/quan-tri/sua-gia-pha", "/quan-tri/album", "/quan-tri/bai-viet" })
public class HomeController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	@Inject 
	private IParentageService parentageService;
	

	public void doGet(HttpServletRequest req, HttpServletResponse res) throws IOException, ServletException {
		AccountModel model = (AccountModel) req.getSession().getAttribute(SystemConstant.MODEL);
		ParentageModel prt = parentageService.findByAccountId(model.getId());
		if(prt!=null) {
			req.setAttribute("ParentageModel", prt);
		}
		
		if (req.getRequestURI().endsWith("dong-ho")) {
			RequestDispatcher rd = req.getRequestDispatcher("/view/admin/parentage.jsp");
			rd.forward(req, res);
		}
		else if (req.getRequestURI().endsWith("pha-do")) {
			RequestDispatcher rd = req.getRequestDispatcher("/view/admin/familytree.jsp");
			rd.forward(req, res);
		}
		else if (req.getRequestURI().endsWith("sua-gia-pha")) {
			RequestDispatcher rd = req.getRequestDispatcher("/view/admin/edittree.jsp");
			rd.forward(req, res);
		}
		else if (req.getRequestURI().endsWith("album")) {
			
			RequestDispatcher rd = req.getRequestDispatcher("/view/admin/album.jsp");
			rd.forward(req, res);
		}
		else if (req.getRequestURI().endsWith("bai-viet")) {
			RequestDispatcher rd = req.getRequestDispatcher("/view/admin/edittree.jsp");
			rd.forward(req, res);
		}
		else{
			RequestDispatcher rd = req.getRequestDispatcher("/view/admin/parentage.jsp");
			rd.forward(req, res);
		}
		
	}
}
