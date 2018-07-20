package com.scroll.test.model;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.scroll.test.dao.MemberDAO;

/**
 * Servlet implementation class idcheck
 */
@WebServlet("/pwchange.do")
public class pwchange extends HttpServlet {
   private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public pwchange() {
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
      String pw = request.getParameter("pw");
      int num = Integer.parseInt(request.getParameter("num"));
      if(num == 0) {
         pw = "^"+pw;
      }
      dao.PwChange(userid,pw);
      response.getWriter().write("success");
   }

   /**
    * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
    */
   protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
      // TODO Auto-generated method stub
      doGet(request, response);
   }

}