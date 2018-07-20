package com.surf.command;
import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.scroll.test.dao.MemberDAO;
import com.scroll.test.model.BCommand;


public class BbgupdateCommand implements BCommand {
	public BbgupdateCommand(){
		
	}
	public void execute(HttpServletRequest request,HttpServletResponse response)throws IOException {
		MemberDAO dao=new MemberDAO();
		dao.bgupdate(
	            (String)request.getAttribute("realfilename"),
	            (String)request.getAttribute("userid")
				);
	}
}
