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

import com.scroll.test.dao.MemberDAO;
import com.scroll.test.dto.FriendDto;
import com.scroll.test.dto.MemberVO;




@WebServlet("/login.do")
public class LoginServlet extends HttpServlet {
   private static final long serialVersionUID = 1L;
    public LoginServlet() {
        super();
    }
   protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
      String url = "index.html";
      HttpSession session = request.getSession();
      if(session.getAttribute("loginUser") != null) {
         //이미 로그인 된 사용자이면 
         url = "webfeed.jsp" ; //메인으로 이동
      }
      RequestDispatcher dispatcher = request.getRequestDispatcher(url);
   dispatcher.forward(request, response);
   }
   protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
      String url = "index.jsp";
      String userid = request.getParameter("userid");
      String pwd = request.getParameter("userpwd");
      MemberDAO mDao = MemberDAO.getInstance();
      System.out.println(userid);
      System.out.println(pwd);
      request.setAttribute("userid",userid);
      ArrayList<MemberVO> mVO = mDao.randomfriend(userid);
      request.setAttribute("randomfriend",mVO);
      System.out.println(mVO);
      
      int result = mDao.userCheck(userid, pwd);
      
      
      if(result ==1) {
         MemberVO mvo =mDao.getMember(userid);
         HttpSession session = request.getSession();
         session.setAttribute("loginUser", mvo);
         session.setMaxInactiveInterval(900);
         if(userid.equals("admin")) {                              //관리자 계정
            System.out.println("아이디"+userid);
            url = "adminstart.jsp";
            }else {
         url = "feed.do";
         System.out.println("아이디"+userid);
         System.out.println("주소"+url);
            }
      }else if (result == 0) {
         request.setAttribute("message", "SURF 비밀번호가 일치하지 않습니다. 입력한 내용을 다시 확인해 주세요.");
      }else if (result == -1) {
         request.setAttribute("message", "SURF에 존재 하지 않는 아이디입니다.");
      }
      System.out.println(result);
      RequestDispatcher dispatcher = request.getRequestDispatcher(url);
      dispatcher.forward(request, response);
      
   }
}