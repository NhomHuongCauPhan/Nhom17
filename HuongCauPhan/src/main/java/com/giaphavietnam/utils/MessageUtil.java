package com.giaphavietnam.utils;

import javax.servlet.http.HttpServletRequest;

public class MessageUtil {
	public static void showMessage(HttpServletRequest rq) {
		if(rq.getParameter("message")!=null) {
			String alert = "";
			String message = "";
			String mess = rq.getParameter("message");
			
			if(mess.equalsIgnoreCase("insert_success")) {
				alert = "success";
				message = "Insert success";
			}else if(mess.equalsIgnoreCase("update_success")) {
				alert = "success";
				message = "Update success";
			}else if(mess.equalsIgnoreCase("delete_success")) {
				alert = "success";
				message = "Delete success";
			}else if(mess.equalsIgnoreCase("error_system")) {
				alert = "danger";
				message = "Error system";
			}
			
			rq.setAttribute("message", message);
			rq.setAttribute("alert", alert);
		}
	}
}
