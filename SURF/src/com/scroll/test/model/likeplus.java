package com.scroll.test.model;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.scroll.test.dao.MemberDAO;
import com.scroll.test.dao.TestDao;

/**
 * Servlet implementation class idcheck
 */
@WebServlet("/likeplus.do")
public class likeplus extends HttpServlet {
   private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public likeplus() {
        super();
        // TODO Auto-generated constructor stub
    }

   /**
    * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
    */
   protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
      // TODO Auto-generated method stub
      TestDao dao = new TestDao();
      int tnum = Integer.parseInt(request.getParameter("tnum"));
      String userid = request.getParameter("userid");
      
      dao.likeplus(tnum,userid);
      
      
      response.getWriter().write("success");
   }

}