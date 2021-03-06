package com.giaphavietnam.filter;

import java.io.IOException;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.giaphavietnam.constant.SystemConstant;
import com.giaphavietnam.model.AccountModel;
import com.giaphavietnam.utils.SessionUtil;

public class AuthorizationFilter implements Filter{
	
	private ServletContext context;
	
	@Override
	public void init(FilterConfig filterConfig) throws ServletException {
		this.context = filterConfig.getServletContext();
	}

	@Override
	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain)
			throws IOException, ServletException {
		HttpServletRequest rq = (HttpServletRequest)request;
		HttpServletResponse res = (HttpServletResponse)response;
		String url = rq.getRequestURI();
		if(url.contains("/quan-tri")) {
			AccountModel model = (AccountModel)SessionUtil.getInstance().getValue(rq, SystemConstant.MODEL);
			if(model!=null) {
				if(model.getRole()==SystemConstant.USER) {
					chain.doFilter(request, response); 	
				}
			}else {
				res.sendRedirect(rq.getContextPath()+"/trang-chu?message=not_login");
			}
		}else {
			chain.doFilter(request, response);
		}
		
	}

	@Override
	public void destroy() {
		// TODO Auto-generated method stub
		
	}

}
