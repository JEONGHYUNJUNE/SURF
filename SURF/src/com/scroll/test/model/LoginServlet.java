package com.scroll.test.model;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.scroll.test.dao.MemberDAO;
import com.scroll.test.dto.FriendDto;
import com.scroll.test.dto.MemberVO;




@WebServlet("/login.do")
public class LoginServlet extends HttpServlet {
   private static final long serialVersionUID = 1L;
    public LoginServlet() {
        super();
    }
   protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
      String url = "index.html";
      HttpSession session = request.getSession();
      if(session.getAttribute("loginUser") != null) {
         //�̹� �α��� �� ������̸� 
         url = "webfeed.jsp" ; //�������� �̵�
      }
      RequestDispatcher dispatcher = request.getRequestDispatcher(url);
   dispatcher.forward(request, response);
   }
   protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
      String url = "index.jsp";
      String userid = request.getParameter("userid");
      String pwd = request.getParameter("userpwd");
      MemberDAO mDao = MemberDAO.getInstance();
      System.out.println(userid);
      System.out.println(pwd);
      request.setAttribute("userid",userid);
      ArrayList<MemberVO> mVO = mDao.randomfriend(userid);
      request.setAttribute("randomfriend",mVO);
      System.out.println(mVO);
      
      int result = mDao.userCheck(userid, pwd);
      
      
      if(result ==1) {
         MemberVO mvo =mDao.getMember(userid);
         HttpSession session = request.getSession();
         session.setAttribute("loginUser", mvo);
         session.setMaxInactiveInterval(900);
         if(userid.equals("admin")) {                              //������ ����
            System.out.println("���̵�"+userid);
            url = "adminstart.jsp";
            }else {
         url = "feed.do";
         System.out.println("���̵�"+userid);
         System.out.println("�ּ�"+url);
            }
      }else if (result == 0) {
         request.setAttribute("message", "SURF ��й�ȣ�� ��ġ���� �ʽ��ϴ�. �Է��� ������ �ٽ� Ȯ���� �ּ���.");
      }else if (result == -1) {
         request.setAttribute("message", "SURF�� ���� ���� �ʴ� ���̵��Դϴ�.");
      }
      System.out.println(result);
      RequestDispatcher dispatcher = request.getRequestDispatcher(url);
      dispatcher.forward(request, response);
      
   }
}