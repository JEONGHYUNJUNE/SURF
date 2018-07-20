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
@WebServlet("/replywrite.do")
public class replywrite extends HttpServlet {
   private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public replywrite() {
        super();
        // TODO Auto-generated constructor stub
    }

   /**
    * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
    */
   protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
      // TODO Auto-generated method stub
      TestDao dao = new TestDao();
      String userid = request.getParameter("userid");
      String username = request.getParameter("username");
      int bnum = Integer.parseInt(request.getParameter("bnum"));
      String content = request.getParameter("content");
      
      dao.replywrite(userid,username,content,bnum);
      
      
      response.getWriter().write("success");
   }

}