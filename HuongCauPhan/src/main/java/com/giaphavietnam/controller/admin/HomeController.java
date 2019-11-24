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
import com.giaphavietnam.model.NewModel;
import com.giaphavietnam.model.ParentageModel;
import com.giaphavietnam.service.IIndividualService;
import com.giaphavietnam.service.INewsService;
import com.giaphavietnam.service.IParentageService;
import com.giaphavietnam.utils.GenerateTree;

@WebServlet(urlPatterns = {"/quan-tri/mat-khau","/quan-tri/tai-khoan", "/quan-tri","/quan-tri/dong-ho","/quan-tri/mail", "/quan-tri/pha-do", "/quan-tri/sua-gia-pha", "/quan-tri/album", "/quan-tri/bai-viet","/quan-tri/quan-ly-tin","/quan-tri/sua-tin" })
public class HomeController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	@Inject 
	private IParentageService parentageService;
	@Inject 
	private IIndividualService individualService;
	@Inject 
	private INewsService newsService;
	public void doGet(HttpServletRequest req, HttpServletResponse res) throws IOException, ServletException {
		AccountModel model = (AccountModel) req.getSession().getAttribute(SystemConstant.MODEL);
		ParentageModel prt = parentageService.findByAccountId(model.getId());
		if(prt!=null) {
			req.setAttribute(SystemConstant.PARENTAGEMODEL, prt);
		}
		if(model!=null) {
			req.setAttribute("account", model);
		}
		
		if (req.getRequestURI().endsWith("dong-ho")) {
			int sotv = individualService.findAll(prt.getParentageId()).size();
			req.setAttribute("sotv", sotv);
			RequestDispatcher rd = req.getRequestDispatcher("/view/admin/parentage.jsp");
			rd.forward(req, res);
		}else if (req.getRequestURI().endsWith("tai-khoan")) {
			int sotv = individualService.findAll(prt.getParentageId()).size();
			req.setAttribute("sotv", sotv);
			RequestDispatcher rd = req.getRequestDispatcher("/view/admin/accountae.jsp");
			rd.forward(req, res);
		}else if (req.getRequestURI().endsWith("mat-khau")) {
			int sotv = individualService.findAll(prt.getParentageId()).size();
			req.setAttribute("sotv", sotv);
			RequestDispatcher rd = req.getRequestDispatcher("/view/admin/tpw.jsp");
			rd.forward(req, res);
		}
		else if (req.getRequestURI().endsWith("pha-do")) {
			String familyTree;
			if(prt!=null){
				ArrayList<IndividualModel> list = individualService.findAll(prt.getParentageId());
				IndividualModel age = individualService.findAge(prt.getParentageId());
				familyTree = GenerateTree.viewIndividual(list,1);
				req.setAttribute("prid", prt.getParentageId());
				req.setAttribute("prlife", age.getBranch().split("\\.").length);
			}else{
				familyTree = "<div class=\"alert alert-danger\" role=\"alert\">\r\n" + 
						"Chưa có dòng họ!\r\n" + 
						"</div>";
			}
			
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
		else if(req.getRequestURI().endsWith("quan-ly-tin")) {
//			//phântrang
	        int itemsPerPage = 5;
	        int page = 1;
	        int totalItem = newsService.countNews(1);
	        int lastPage = 1;
	        int range = 5;
	        int middle = (int) Math.ceil((float) range / 2);
	        int min = 1;
	        int max = range;
	        String pageRequest = req.getParameter("page");
	        if (pageRequest == null) {
	            lastPage = (int) Math.ceil((float) totalItem / itemsPerPage);
	            if (lastPage <= range) {
	                min = 1;
	                page = 1;
	                max = lastPage;
	            }
	            if (lastPage > range) {
	                min = 1;
	                page = 1;
	                max = range;
	            }

	        } else { // if user request a page
	            page = Integer.parseInt(pageRequest);
	            lastPage = (int) Math.ceil((float) totalItem / itemsPerPage);
	            if (page <= 0) {
	                page = 1;
	            }
	            if (page > lastPage) {
	                page = lastPage;
	            }
	            if (lastPage <= range) {
	                min = 1;
	                max = lastPage;
	            } else {
	                if (page >= middle + 1) {
	                    if (page + middle - 1 <= lastPage) {
	                        min = page - middle + 1;
	                        max = page + middle - 1;
	                    } else {
	                        max = lastPage;
	                        min = max - range + 1;
	                    }

	                }
	            }
	        }
	        req.setAttribute("page", page);
	        req.setAttribute("lastPage", lastPage);
	        req.setAttribute("min", min);
	        req.setAttribute("max", max);
//			// end ph�n trang
	        if(prt!=null) {
	        	ArrayList<NewModel> newsByIDPare= newsService.findByIdPare(prt.getParentageId(),page,itemsPerPage);
		        req.setAttribute("newsParent", newsByIDPare);
	        }	     
			RequestDispatcher rd = req.getRequestDispatcher("/view/admin/manageNews.jsp");
			rd.forward(req, res);
		}
		else if(req.getRequestURI().endsWith("sua-tin")) {
			long id=  Long.valueOf(req.getParameter("newID"));
			NewModel onlyOne= newsService.findById(id);
			req.setAttribute("onlyOne", onlyOne);
			RequestDispatcher rd = req.getRequestDispatcher("/view/admin/editNews.jsp");
			rd.forward(req, res);
		}
		else{
			if(prt!=null){
				ArrayList<IndividualModel> model1= individualService.findAll(prt.getParentageId());
				int sotv = model1.size();
				req.setAttribute("sotv", sotv);
			}
			
			RequestDispatcher rd = req.getRequestDispatcher("/view/admin/parentage.jsp");
			rd.forward(req, res);
		}
		
	}
}
