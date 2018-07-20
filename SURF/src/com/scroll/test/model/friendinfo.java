package com.scroll.test.model;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.scroll.test.dao.FriendDAO;
import com.scroll.test.dao.MemberDAO;
import com.scroll.test.dao.MessageDAO;
import com.scroll.test.dao.TestDao;
import com.scroll.test.dto.FriendDto;
import com.scroll.test.dto.MemberVO;
import com.scroll.test.dto.MessageDto;
import com.scroll.test.dto.TestDto;


@WebServlet("/friendinfo.do")
public class friendinfo extends HttpServlet {
   private static final long serialVersionUID = 1L;
       
    public friendinfo() {
        super();
    }
   protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
      TestDto dto = new TestDto();
      MemberDAO mdao = new MemberDAO();
        FriendDto fdto = new FriendDto();
         FriendDAO fdao = new FriendDAO();
         String userid = (String)request.getParameter("userid");
         String fuserid = (String)request.getParameter("fuserid");
         if(fuserid=="") {
	    	  fuserid="testid18";
	    	  System.out.println(fuserid);
	      }

         MemberVO mvo =mdao.getMember(fuserid);
          request.setAttribute("fuser", mvo);
          HttpSession session = request.getSession();
          session.setAttribute("fuserid", mvo.getUserid());
          
         
          ArrayList<FriendDto> fdtos4 = fdao.friendalllist(userid);
          ArrayList<FriendDto> fdtos3 = fdao.memberalllist(userid);
         ArrayList<FriendDto> fdtos = fdao.friendlist(userid);
         ArrayList<FriendDto> fdtos2 = fdao.friendsendlist(userid);
         ArrayList<FriendDto> fdtos1 = fdao.friendreceivelist(userid);
         ArrayList<MemberVO> mVO = mdao.randomfriend(userid);
         request.setAttribute("randomfriend",mVO);
         request.setAttribute("friendlist",fdtos);
         request.setAttribute("friendalllist",fdtos4);
         request.setAttribute("memberalllist",fdtos3);
         request.setAttribute("sendlist",fdtos2);
         request.setAttribute("receivelist",fdtos1);
         MessageDto mdto = new MessageDto();
         MessageDAO mdao1 = new MessageDAO();
         ArrayList<MessageDto> recieve = mdao1.recievemessage(userid);
         ArrayList<MessageDto> write = mdao1.writemessage(userid);
         request.setAttribute("rmessagelist", recieve);
         request.setAttribute("wmessagelist", write);
      TestDao dao = TestDao.getInstance();
      
      ArrayList<TestDto> dtos = dao.friendlist(fuserid);
      ArrayList<TestDto> dtos2 = dao.friendlist2(fuserid);
      
      request.setAttribute("list",dtos);
      request.setAttribute("list2",dtos2);
      System.out.println(dtos2.toString());
      
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
          MessageDto mdto = new MessageDto();
          MessageDAO mdao1 = new MessageDAO();
          ArrayList<MessageDto> recieve = mdao1.recievemessage(userid);
          ArrayList<MessageDto> write = mdao1.writemessage(userid);
          request.setAttribute("rmessagelist", recieve);
          request.setAttribute("wmessagelist", write);
         
         ArrayList<FriendDto> fdtos = fdao.friendlist(userid);
         ArrayList<FriendDto> fdtos2 = fdao.friendsendlist(userid);
         ArrayList<FriendDto> fdtos1 = fdao.friendreceivelist(userid);
         request.setAttribute("friendlist",fdtos);
         request.setAttribute("sendlist",fdtos2);
         request.setAttribute("receivelist",fdtos1);
      
      TestDao dao = TestDao.getInstance();
      ArrayList<TestDto> dtos = dao.friendlist(fuserid);
      ArrayList<TestDto> dtos2 = dao.friendlist2(fuserid);
      
      request.setAttribute("list",dtos);
      request.setAttribute("list2",dtos2);
      System.out.println(dtos2+"친구공개");
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