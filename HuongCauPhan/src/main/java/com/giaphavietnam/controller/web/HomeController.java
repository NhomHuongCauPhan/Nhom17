package com.giaphavietnam.controller.web;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.giaphavietnam.constant.SystemConstant;

@WebServlet(urlPatterns= {"/trang-chu","/cac-dong-ho","/thong-bao","/thong-tin-dong-ho"})
public class HomeController extends HttpServlet{
	private static final long serialVersionUID = 1L;
    
	public void doGet(HttpServletRequest req, HttpServletResponse res)throws IOException, ServletException {
		if (req.getRequestURI().endsWith("trang-chu")) {
			String action = req.getParameter("action");
			if(action!=null&&action.equalsIgnoreCase("logout")){
				req.getSession().removeAttribute(SystemConstant.MODEL);
			}
			RequestDispatcher rd = req.getRequestDispatcher("/view/web/home.jsp");
			rd.forward(req, res);
		}else if (req.getRequestURI().endsWith("cac-dong-ho")) {
			RequestDispatcher rd = req.getRequestDispatcher("/view/web/parentages.jsp");
			rd.forward(req, res);
		}else if (req.getRequestURI().endsWith("thong-bao")) {
			RequestDispatcher rd = req.getRequestDispatcher("/view/web/alerts.jsp");
			rd.forward(req, res);
		}else if (req.getRequestURI().endsWith("thong-tin-dong-ho")) {
			RequestDispatcher rd = req.getRequestDispatcher("/view/web/parentageinfo.jsp");
			rd.forward(req, res);
		}
		
	}
}
