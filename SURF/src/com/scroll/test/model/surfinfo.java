package com.scroll.test.model;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.scroll.test.dao.FriendDAO;
import com.scroll.test.dao.MemberDAO;
import com.scroll.test.dao.TestDao;
import com.scroll.test.dto.FriendDto;
import com.scroll.test.dto.MemberVO;
import com.scroll.test.dto.TestDto;


@WebServlet("/surf.do")
public class surfinfo extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public surfinfo() {
        super();
    }
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		TestDto dto = new TestDto();
		MemberDAO mdao = new MemberDAO();
		  FriendDto fdto = new FriendDto();
	      FriendDAO fdao = new FriendDAO();
	      String userid = (String)request.getParameter("userid");
	      String fuserid = (String)request.getParameter("fuserid");
	      String loc = (String)request.getParameter("loc");
	      

	      MemberVO mvo =mdao.getsurfMember(fuserid,loc);
	       request.setAttribute("fuser", mvo);
	      
	      ArrayList<FriendDto> fdtos = fdao.friendlist(userid);
	      ArrayList<FriendDto> fdtos2 = fdao.friendsendlist(userid);
	      ArrayList<FriendDto> fdtos3 = fdao.memberalllist(userid);
	      ArrayList<FriendDto> fdtos1 = fdao.friendreceivelist(userid);
	      ArrayList<FriendDto> fdtos4 = fdao.friendalllist(userid);
	      request.setAttribute("friendalllist",fdtos4);
	      request.setAttribute("memberalllist",fdtos3);
	      request.setAttribute("friendlist",fdtos);
	      request.setAttribute("sendlist",fdtos2);
	      request.setAttribute("receivelist",fdtos1);
		
		TestDao dao = TestDao.getInstance();
		ArrayList<TestDto> dtos = dao.listtest();
		request.setAttribute("list",dtos);
		RequestDispatcher dispatcher = request.getRequestDispatcher("friendpage.jsp");
		dispatcher.forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		TestDto dto = new TestDto();
		MemberDAO mdao = new MemberDAO();
		  FriendDto fdto = new FriendDto();
	      FriendDAO fdao = new FriendDAO();
	      String userid = (String)request.getParameter("userid");
	      String fuserid = (String)request.getParameter("fuserid");
	      
	      MemberVO mvo =mdao.getMember(fuserid);
	       request.setAttribute("fuser", mvo);
	      
	      
	      ArrayList<FriendDto> fdtos = fdao.friendlist(userid);
	      ArrayList<FriendDto> fdtos2 = fdao.friendsendlist(userid);
	      ArrayList<FriendDto> fdtos1 = fdao.friendreceivelist(userid);
	      request.setAttribute("friendlist",fdtos);
	      request.setAttribute("sendlist",fdtos2);
	      request.setAttribute("receivelist",fdtos1);
		
		TestDao dao = TestDao.getInstance();
		ArrayList<TestDto> dtos = dao.listtest();
		request.setAttribute("list",dtos);
		RequestDispatcher dispatcher = request.getRequestDispatcher("friendpage.jsp");
		dispatcher.forward(request, response);
				/*TestDto dto = new TestDto();
			
				
				TestDao dao = TestDao.getInstance();
				ArrayList<TestDto> dtos = dao.listC();
				request.setAttribute("list",dtos);
				RequestDispatcher dispatcher = request.getRequestDispatcher("infiniteScrollTest.jsp");
				dispatcher.forward(request, response);*/
	}
}
