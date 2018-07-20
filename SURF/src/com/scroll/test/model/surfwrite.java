package com.scroll.test.model;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.Enumeration;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;
import com.scroll.test.dao.TestDao;
import com.scroll.test.dto.TestDto;
import com.surf.command.BInsertCommand;


@WebServlet("/write.do")
public class surfwrite extends HttpServlet {
	private static final long serialVersionUID = 1L;
    public surfwrite() {
        super();
    }
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		BCommand command = null;
		MultipartRequest multi = null;
		String viewPage = null;
		String uri = request.getRequestURI();
		String conPath = request.getContextPath();
		String cmd = uri.substring(conPath.length());
		String uploadPath = request.getRealPath("/file_upload");

		int maxSize = 1024 * 1024 * 10;// 10M
		String file = "";
		String file2 = "";
		String orginFile = "";
		String orginFile2 = "";
		System.out.println("cmd:" + cmd);
		response.setCharacterEncoding("UTF-8"); 
		response.setContentType("text/html; charset=UTF-8");

		PrintWriter out = response.getWriter();
		
		
		try {
			multi = new MultipartRequest(request, uploadPath, maxSize, "UTF-8", new DefaultFileRenamePolicy());
			System.out.println("multi"+multi);
			Enumeration files = multi.getFileNames();
		/*	String names = (String) files.nextElement();*/
			int a = 0;
			while(files.hasMoreElements()) {
				if(a!=0) {
					String names2 = (String) files.nextElement();
					file2 = multi.getFilesystemName(names2);
					orginFile2 = multi.getOriginalFileName(names2);
				}else {
				String names = (String) files.nextElement();
			file = multi.getFilesystemName(names);
			orginFile = multi.getOriginalFileName(names);}
			a++;
			}
			System.out.println(file);
			System.out.println(orginFile);
			System.out.println(orginFile2);
			System.out.println(multi.getParameter("link"));
			System.out.println(multi.getParameter("contents"));
			System.out.println(multi.getParameter("userid"));
			if(orginFile==null) {
				orginFile="no";
			}else {
				orginFile = "file_upload/"+file; 
			}
			
			if(orginFile2==null) {
				orginFile2="no";
				System.out.println("널값변경");
			}else {
				orginFile2 = "file_upload/"+file2; 
			}

			System.out.println(orginFile);
			System.out.println(orginFile2);
			
			String userid= multi.getParameter("userid");
			
			request.setAttribute("filename", file2);
			request.setAttribute("realfilename", orginFile2);
			request.setAttribute("videoname", file);
			request.setAttribute("realvideoname", orginFile);
			request.setAttribute("username", multi.getParameter("username"));
			request.setAttribute("contents", multi.getParameter("contents"));
			request.setAttribute("pub", multi.getParameter("pub"));
			request.setAttribute("userid", multi.getParameter("userid"));
			request.setAttribute("link", multi.getParameter("link"));
			
			command = new BInsertCommand();
			command.execute(request, response);
			viewPage = "feed.do?userid="+userid;

		} catch (Exception e) {
			System.out.println("오류입니다."+e.getMessage());
			viewPage="view.do";
		}
		response.sendRedirect(viewPage);
			
	}
}
