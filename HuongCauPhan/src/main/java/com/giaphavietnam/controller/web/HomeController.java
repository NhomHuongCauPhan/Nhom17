package com.giaphavietnam.controller.web;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.giaphavietnam.constant.SystemConstant;

@WebServlet(urlPatterns= {"/trang-chu"})
public class HomeController extends HttpServlet{
	private static final long serialVersionUID = 1L;
    
	public void doGet(HttpServletRequest req, HttpServletResponse res)throws IOException, ServletException {
		String action = req.getParameter("action");
		if(action!=null&&action.equalsIgnoreCase("logout")){
			req.getSession().removeAttribute(SystemConstant.MODEL);
		}
		RequestDispatcher rd = req.getRequestDispatcher("/view/web/home.jsp");
		rd.forward(req, res);
	}
}
