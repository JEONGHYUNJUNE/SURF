package com.scroll.test.model;

import java.io.IOException;
import java.net.URLDecoder;
import java.net.URLEncoder;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.scroll.test.dao.MemberDAO;

/**
 * Servlet implementation class memberpic
 */
@WebServlet("/profile.do")
public class memberpic extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public memberpic() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String userid = request.getParameter("userid");
		MemberDAO dao = new MemberDAO();
		String url = dao.getPicture(userid);
		  response.setHeader("Content-Type", "text/html; charset=UTF-8");
		URLEncoder.encode(url, "UTF-8");
		response.getWriter().write(url);
	}
}
