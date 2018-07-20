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
@WebServlet("/replyview.do")
public class replyview extends HttpServlet {
   private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public replyview() {
        super();
        // TODO Auto-generated constructor stub
    }

   protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
      // TODO Auto-generated method stub
      request.setCharacterEncoding("UTF-8");
      response.setContentType("text/html;charset=UTF-8");
      int bnum = Integer.parseInt(request.getParameter("bnum"));
      response.getWriter().write(getJSON(bnum));
   }
   
   public String getJSON(int bnum) {
      StringBuffer result = new StringBuffer("");
      result.append("{\"result\":[");
      TestDao dao = new TestDao();
      ArrayList<TestDto> userlist = dao.replyview(bnum);
      for(int i = 0; i<userlist.size(); i++) {
         result.append("[\"" + userlist.get(i).getUserid()+"\",");
         result.append("\""+userlist.get(i).getUsername()+"\",");
         result.append("\""+userlist.get(i).getRdate()+"\",");
         result.append("\""+userlist.get(i).getRnum()+"\",");
         result.append("\""+userlist.get(i).getBnum()+"\",");
         result.append("\""+userlist.get(i).getRcontent()+"\"],");
      }
      result.append("]}");
      return result.toString();
   }

}