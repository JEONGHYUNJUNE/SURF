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


@WebServlet("/option.do")
public class optionpage extends HttpServlet {
   private static final long serialVersionUID = 1L;
       
    public optionpage() {
        super();
    }
   protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
      TestDto dto = new TestDto();
      MemberDAO mDao = new MemberDAO();
      MessageDto mdto = new MessageDto();
      MessageDAO mdao = new MessageDAO();
        FriendDto fdto = new FriendDto();
         FriendDAO fdao = new FriendDAO();
         String userid = (String)request.getParameter("userid");
         ArrayList<FriendDto> fdtos = fdao.friendlist(userid);
         ArrayList<FriendDto> fdtos2 = fdao.friendsendlist(userid);
         ArrayList<FriendDto> fdtos1 = fdao.friendreceivelist(userid);
         request.setAttribute("friendlist",fdtos);
         request.setAttribute("sendlist",fdtos2);
         request.setAttribute("receivelist",fdtos1);
         ArrayList<MessageDto> recieve = mdao.recievemessage(userid);
         ArrayList<MessageDto> write = mdao.writemessage(userid);
         ArrayList<MemberVO> mVO = mDao.randomfriend(userid);
         request.setAttribute("randomfriend",mVO);
         request.setAttribute("rmessagelist", recieve);
         request.setAttribute("wmessagelist", write);
      RequestDispatcher dispatcher = request.getRequestDispatcher("optionpage.jsp");
      dispatcher.forward(request, response);
   }

   protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
      TestDto dto = new TestDto();
      MemberDAO mDao = new MemberDAO();
      MessageDto mdto = new MessageDto();
      MessageDAO mdao = new MessageDAO();
        FriendDto fdto = new FriendDto();
         FriendDAO fdao = new FriendDAO();
         String userid = (String)request.getAttribute("userid");
         ArrayList<FriendDto> fdtos = fdao.friendlist(userid);
         ArrayList<FriendDto> fdtos2 = fdao.friendsendlist(userid);
         ArrayList<FriendDto> fdtos1 = fdao.friendreceivelist(userid);
         request.setAttribute("friendlist",fdtos);
         request.setAttribute("sendlist",fdtos2);
         request.setAttribute("receivelist",fdtos1);
         ArrayList<MemberVO> mVO = mDao.randomfriend(userid);
         request.setAttribute("randomfriend",mVO);
         ArrayList<MessageDto> recieve = mdao.recievemessage(userid);
         ArrayList<MessageDto> write = mdao.writemessage(userid);
         request.setAttribute("rmessagelist", recieve);
         request.setAttribute("wmessagelist", write);
      RequestDispatcher dispatcher = request.getRequestDispatcher("optionpage.jsp");
      dispatcher.forward(request, response);
            /*TestDto dto = new TestDto();
         
            
            TestDao dao = TestDao.getInstance();
            ArrayList<TestDto> dtos = dao.listC();
            request.setAttribute("list",dtos);
            RequestDispatcher dispatcher = request.getRequestDispatcher("infiniteScrollTest.jsp");
            dispatcher.forward(request, response);*/
   }
}