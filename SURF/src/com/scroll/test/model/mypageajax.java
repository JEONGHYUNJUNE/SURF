package com.scroll.test.model;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.scroll.test.dto.MemberVO;
import com.scroll.test.dto.TestDto;
import com.scroll.test.dao.TestDao;



@WebServlet("/maypageajax.do")
public class mypageajax extends HttpServlet {
   private static final long serialVersionUID = 1L;
  
   protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
      System.out.println("test1����");
      request.setCharacterEncoding("UTF-8");
      response.setContentType("text/html;charset=UTF-8");
      String num = request.getParameter("num");
      System.out.println(num);
/*      String userid = request.getParameter("userid");*/
         MemberVO mvo = new MemberVO();
         HttpSession session = request.getSession();
            mvo = (MemberVO)session.getAttribute("loginUser");
         String userid = mvo.getUserid();
         if(userid !=null) {
            response.getWriter().write(getJSON(num,userid));
         }
   }
   public String getJSON(String num,String userid) {
      int num1 = Integer.parseInt(num);
      System.out.println(num1);
      String userid1 = userid;
      StringBuffer result = new StringBuffer("");
      result.append("{\"result\":[");
      TestDao dao = TestDao.getInstance();
      TestDto dto = new TestDto();
      ArrayList<TestDto> dtos = dao.myScroll(num1,userid1);
      System.out.println(dtos);
      
      for(int i = 0;i<dtos.size();i++) {
         result.append("[\"" + dtos.get(i).getName()+"\",");
         result.append("\""+dtos.get(i).getDate()+"\",");
         result.append("\""+dtos.get(i).getLink()+"\",");
         result.append("\""+dtos.get(i).getPicrealname()+"\",");
         result.append("\""+dtos.get(i).getTnum()+"\",");
         result.append("\""+dtos.get(i).getUserid()+"\",");
         result.append("\""+dtos.get(i).getVideorealname()+"\",");
         result.append("\""+dtos.get(i).getContent()+"\"],");
         
      }
      result.append("]}");
      return result.toString();
   }
}