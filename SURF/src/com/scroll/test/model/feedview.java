package com.scroll.test.model;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.scroll.test.dto.FriendDto;
import com.scroll.test.dto.MemberVO;
import com.scroll.test.dto.MessageDto;
import com.scroll.test.dto.TestDto;
import com.scroll.test.dao.FriendDAO;
import com.scroll.test.dao.MemberDAO;
import com.scroll.test.dao.MessageDAO;
import com.scroll.test.dao.TestDao;


@WebServlet("/feed.do")
public class feedview extends HttpServlet {
   private static final long serialVersionUID = 1L;
       
    public feedview() {
        super();
    }

   protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
      TestDto dto = new TestDto();
      FriendDto fdto = new FriendDto();
      FriendDAO fdao = new FriendDAO();
      MemberDAO mDao = new MemberDAO();
      TestDao dao = TestDao.getInstance();
      MessageDto mdto = new MessageDto();
      MessageDAO mdao = new MessageDAO();
      String userid = request.getParameter("userid");
      ArrayList<TestDto> dtos = dao.listtest(userid);
      ArrayList<FriendDto> fdtos = fdao.friendlist(userid);
      ArrayList<FriendDto> fdtos2 = fdao.friendsendlist(userid);
      ArrayList<FriendDto> fdtos1 = fdao.friendreceivelist(userid);
      ArrayList<MessageDto> recieve = mdao.recievemessage(userid);
      ArrayList<MessageDto> write = mdao.writemessage(userid);
      ArrayList<MemberVO> mVO = mDao.randomfriend(userid);
      request.setAttribute("randomfriend",mVO);
      request.setAttribute("rmessagelist", recieve);
      request.setAttribute("wmessagelist", write);
      request.setAttribute("friendlist",fdtos);
      request.setAttribute("sendlist",fdtos2);
      request.setAttribute("receivelist",fdtos1);
      request.setAttribute("list",dtos);
      RequestDispatcher dispatcher = request.getRequestDispatcher("webfeed.jsp");
      dispatcher.forward(request, response);
   }

   protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
         
      TestDto dto = new TestDto();
      FriendDto fdto = new FriendDto();
      FriendDAO fdao = new FriendDAO();
      TestDao dao = TestDao.getInstance();
      MessageDto mdto = new MessageDto();
      MessageDAO mdao = new MessageDAO();
      String userid = (String)request.getAttribute("userid");
      ArrayList<TestDto> dtos = dao.listtest(userid);
      ArrayList<FriendDto> fdtos = fdao.friendlist(userid);
      ArrayList<FriendDto> fdtos2 = fdao.friendsendlist(userid);
      ArrayList<FriendDto> fdtos1 = fdao.friendreceivelist(userid);
      ArrayList<MessageDto> recieve = mdao.recievemessage(userid);
      ArrayList<MessageDto> write = mdao.writemessage(userid);
      request.setAttribute("rmessagelist", recieve);
      request.setAttribute("wmessagelist", write);
      request.setAttribute("friendlist",fdtos);
      request.setAttribute("sendlist",fdtos2);
      request.setAttribute("receivelist",fdtos1);
      request.setAttribute("list",dtos);
      
      RequestDispatcher dispatcher = request.getRequestDispatcher("webfeed.jsp");
      dispatcher.forward(request, response);
   }
}