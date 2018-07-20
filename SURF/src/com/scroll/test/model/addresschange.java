package com.scroll.test.model;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.scroll.test.dao.MemberDAO;
import com.scroll.test.dto.MemberVO;

/**
 * Servlet implementation class addresschange
 */
@WebServlet("/addresschange.do")
public class addresschange extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public addresschange() {
        super();
        // TODO Auto-generated constructor stub
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		MemberDAO dao = MemberDAO.getInstance();
		
		String userid = request.getParameter("userid");
		String loc = request.getParameter("loc");
		System.out.println(userid);
		System.out.println(loc);
		dao.SurfChange(userid, loc);
		MemberVO mvo =dao.getMember(userid);
        HttpSession session = request.getSession();
        session.setAttribute("loginUser", mvo);
		String viewpage = "info.do?userid="+userid;
		response.sendRedirect(viewpage);	
	
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
		
		
	}

}
