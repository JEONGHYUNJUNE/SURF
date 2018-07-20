package com.scroll.test.model;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.surf.command.BDeleteCommand;

/**
 * Servlet implementation class surfdel
 */
@WebServlet("/delete.do")
public class surfdel extends HttpServlet {
	private static final long serialVersionUID = 1L;
    public surfdel() {
        super();
    }
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		BCommand command = null;
		String viewPage = null;

		 System.out.println(request.getParameter("tnum")+"¹ø »èÁ¦");
         request.setAttribute("tnum",request.getParameter("tnum"));
         System.out.println(request.getParameter("userid"));
         command = new BDeleteCommand();
         command.execute(request, response);
         viewPage = "feed.do?userid="+request.getParameter("userid");
 		response.sendRedirect(viewPage);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	doGet(request, response);
         
	}

}
