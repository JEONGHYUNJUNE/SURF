package com.scroll.test.model;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.scroll.test.dao.MemberDAO;
import com.scroll.test.dto.MemberVO;

/**
 * Servlet implementation class fsearch
 */
@WebServlet("/fsearch.do")
public class fsearch extends HttpServlet {
   private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public fsearch() {
        super();
        // TODO Auto-generated constructor stub
    }

   protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
      // TODO Auto-generated method stub
      request.setCharacterEncoding("UTF-8");
      response.setContentType("text/html;charset=UTF-8");
      String username = request.getParameter("username");
      response.getWriter().write(getJSON(username));
   }
   
   public String getJSON(String username) {
      if(username == null) username = "";
      StringBuffer result = new StringBuffer("");
      result.append("{\"result\":[");
      MemberDAO dao = new MemberDAO();
      ArrayList<MemberVO> userlist = dao.fsearch(username);
      for(int i = 0; i<userlist.size(); i++) {
         result.append("[\"" + userlist.get(i).getUserid()+"\",");
         result.append("\""+userlist.get(i).getUsername()+"\",");
         result.append("\""+userlist.get(i).getProfilepic()+"\"],");
      }
      result.append("]}");
      return result.toString();
   }

}