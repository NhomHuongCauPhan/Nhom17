package com.giaphavietnam.controller.admin.api;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

@MultipartConfig
@WebServlet(urlPatterns = { "/api-admin-image" })
public class ImageAPI extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String fileimg = uploadFile(req);
		String flag = req.getParameter("flag");
		String id = req.getParameter("id");
		
		if(flag==null) {
			resp.sendRedirect(req.getContextPath() + "/quan-tri/sua-gia-pha?image1="+fileimg+"&id="+id);
		}else {
			resp.sendRedirect(req.getContextPath() + "/quan-tri/sua-gia-pha?image="+fileimg+"&id="+id);
		}
		
		
	}

	private String uploadFile(HttpServletRequest request) throws IOException, ServletException {

		String fileName = "";
		try {
			Part filePart = request.getPart("real");
			if (filePart == null) {
				filePart = request.getPart("real1");
			}
			

			fileName = (String) getFileName(filePart);
			String applicationPath = request.getServletContext().getRealPath("");
			String basePath = applicationPath + "template\\adimgs" + File.separator;
			
			InputStream inputStream = null;
			OutputStream outputStream = null;
			try {
				File outputFilePath = new File(basePath + fileName);
				inputStream = filePart.getInputStream();
				outputStream = new FileOutputStream(outputFilePath);
				int read = 0;
				final byte[] bytes = new byte[1024];
				while ((read = inputStream.read(bytes)) != -1) {
					outputStream.write(bytes, 0, read);
				}
			} catch (Exception e) {
				e.printStackTrace();
				fileName = "";
			} finally {
				if (inputStream != null) {
					inputStream.close();
				}
				if (outputStream != null) {
					outputStream.close();
				}
			}

		} catch (Exception e) {
			fileName = "";
		}

		return fileName;
	}

	private String getFileName(Part part) {
		for (String content : part.getHeader("content-disposition").split(";")) {
			if (content.trim().startsWith("filename")) {
				return content.substring(content.indexOf('=') + 1).trim().replace("\"", "");
			}
		}

		return null;
	}
}
