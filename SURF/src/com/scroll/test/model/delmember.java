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
import com.scroll.test.dto.MessageDto;
import com.scroll.test.dto.TestDto;
import com.scroll.test.dao.FriendDAO;
import com.scroll.test.dao.MemberDAO;
import com.scroll.test.dao.MessageDAO;
import com.scroll.test.dao.TestDao;


@WebServlet("/delmember.do")
public class delmember extends HttpServlet {
   private static final long serialVersionUID = 1L;
       
    public delmember() {
        super();
    }
   protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
      MemberDAO mdao = new MemberDAO();
         String userid = request.getParameter("userid");
         mdao.delmember(userid);
         RequestDispatcher dispatcher = request.getRequestDispatcher("index.html");
         dispatcher.forward(request, response);
   }

   protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
      MemberDAO mdao = new MemberDAO();
      String userid = request.getParameter("userid");
      mdao.delmember(userid);
      RequestDispatcher dispatcher = request.getRequestDispatcher("index.html");
      dispatcher.forward(request, response);
   }
}