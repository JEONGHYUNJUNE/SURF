package com.scroll.test.model;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.scroll.test.dao.FriendDAO;

/**
 * Servlet implementation class frienddelete
 */
@WebServlet("/fdelete.do")
public class frienddelete extends HttpServlet {
   private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public frienddelete() {
        super();
        // TODO Auto-generated constructor stub
    }

   /**
    * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
    */
   protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
      // TODO Auto-generated method stub
      FriendDAO fdao = new FriendDAO();
      String loginid = request.getParameter("loginid");
      String fid = request.getParameter("fid");
      fdao.deletefriend(loginid, fid);
      response.getWriter().write("success");
      
   
   }
}