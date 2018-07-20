package com.scroll.test.model;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.scroll.test.dao.MemberDAO;
import com.scroll.test.dao.TestDao;
import com.scroll.test.dto.MemberVO;
import com.scroll.test.dto.TestDto;

/**
 * Servlet implementation class fsearch
 */
@WebServlet("/likeview.do")
public class likeview extends HttpServlet {
   private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public likeview() {
        super();
        // TODO Auto-generated constructor stub
    }

   protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
      // TODO Auto-generated method stub
      request.setCharacterEncoding("UTF-8");
      response.setContentType("text/html;charset=UTF-8");
      int tnum = Integer.parseInt(request.getParameter("tnum"));
      response.getWriter().write(getJSON(tnum));
      
   }
   
   public String getJSON(int tnum) {
      String result = "0";
      TestDao dao = new TestDao(); 
      result = (String)dao.likeview(tnum);
      ArrayList<TestDto> dtos = dao.likeid(tnum);
      for(int i =0; i<dtos.size();i++) {
      System.out.println(dtos.get(i).getUserid()+"좋아요아이디");
      }
      return result;
   }

}