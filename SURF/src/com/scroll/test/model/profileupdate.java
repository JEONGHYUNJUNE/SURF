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
 * Servlet implementation class idcheck
 */
@WebServlet("/pfupdate.do")
public class profileupdate extends HttpServlet {
   private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public profileupdate() {
        super();
        // TODO Auto-generated constructor stub
    }

   /**
    * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
    */
   protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
      // TODO Auto-generated method stub
      MemberDAO dao = MemberDAO.getInstance();
      String userid = request.getParameter("userid");
      String pw = request.getParameter("userpw");
      String name = request.getParameter("username");
      String phone = request.getParameter("userphone");
      String email = request.getParameter("useremail");
      String attr = request.getParameter("attr");
      String url = "option.do?userid="+userid;
      
      if(attr.equals("이름")) {
      dao.friendnamechange(userid, name);   
      dao.ProfileUpdate(userid, pw, name, email, phone);
      }else {
      dao.ProfileUpdate(userid, pw, name, email, phone);
      }
      if(attr.equals("비밀번호")) {
         url = "index.html";
      }
      else {
         MemberVO mvo =dao.getMember(userid);
           HttpSession session = request.getSession();
           session.setAttribute("loginUser", mvo);
           session.setMaxInactiveInterval(900);
      }
      response.sendRedirect(url);
   }
}