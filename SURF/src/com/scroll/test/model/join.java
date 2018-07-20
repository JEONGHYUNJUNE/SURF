package com.scroll.test.model;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.scroll.test.dao.FriendDAO;
import com.scroll.test.dao.MemberDAO;
/**
 * Servlet implementation class join
 */
@WebServlet("/join.do")
public class join extends HttpServlet {
   private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public join() {
        super();
        // TODO Auto-generated constructor stub
    }

   /**
    * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
    */
   protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
      // TODO Auto-generated method stub
      MemberDAO dao = MemberDAO.getInstance();
      FriendDAO fdao = new FriendDAO();
      String userid = request.getParameter("userid");
      String pwd = request.getParameter("pwd");
      String name = request.getParameter("name");
      String email = request.getParameter("email");
      String phone = request.getParameter("phone");
      fdao.addfriendtable(userid);
      fdao.addfriendSeq(userid);
      dao.insertMember(userid, pwd, name, email, phone);
      response.getWriter().write("¼º°ø");
   }

   /**
    * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
    */
   protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
      // TODO Auto-generated method stub
   
   }

}