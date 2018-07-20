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
import javax.servlet.http.HttpSession;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;
import com.scroll.test.dao.MemberDAO;
import com.scroll.test.dao.TestDao;
import com.scroll.test.dto.MemberVO;
import com.scroll.test.dto.TestDto;
import com.surf.command.BInsertCommand;
import com.surf.command.BpicupdateCommand;


@WebServlet("/picupdate.do")
public class picupdate extends HttpServlet {
	private static final long serialVersionUID = 1L;
    public picupdate() {
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
		String filename = "";
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
			Enumeration file = multi.getFileNames();
			String names = (String) file.nextElement();
			filename = multi.getFilesystemName(names);
			orginFile = multi.getOriginalFileName(names);
			if(orginFile==null) {
				orginFile="img/profile.png";
			}else {
				orginFile = "file_upload/"+filename;
					
			}
			System.out.println(filename); //이미지
			System.out.println(orginFile); //이미지
			System.out.println(multi.getParameter("userid"));
			
			request.setAttribute("realfilename",orginFile);
			request.setAttribute("userid", multi.getParameter("userid"));
			
			command = new BpicupdateCommand();       // 업데이트를 먼저 시켜줌 디비가 변경
			command.execute(request, response);
			
			MemberDAO mDao = MemberDAO.getInstance();      //해당 유저의 프로필사진주소를 디비에서  다시 가져와 세션을 변경해줌
	 		String userid = multi.getParameter("userid");
			MemberVO mvo =mDao.getMember(userid);
			HttpSession session = request.getSession();
			session.setAttribute("loginUser", mvo);
			
	
			viewPage = "info.do?userid="+userid;

		} catch (Exception e) {
			System.out.println("오류입니다."+e.getMessage());
			viewPage="view.do";
		}
			response.sendRedirect(viewPage);
	}
}
