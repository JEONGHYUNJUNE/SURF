package com.scroll.test.model;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.scroll.test.dao.FriendDAO;
import com.scroll.test.dao.MemberDAO;
import com.scroll.test.dao.MessageDAO;
/**
 * Servlet implementation class join
 */
@WebServlet("/messagewrite.do")
public class messagewrite extends HttpServlet {
   private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public messagewrite() {
        super();
        // TODO Auto-generated constructor stub
    }

   protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
      // TODO Auto-generated method stub
      MessageDAO mdao = new MessageDAO();
      String wid = request.getParameter("wid");
      String rid = request.getParameter("rid");
      String content = request.getParameter("content");
      mdao.writemessage(wid, rid, content);
      response.getWriter().write("success");
   }
}