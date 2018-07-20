package com.surf.command;
import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.scroll.test.dao.MemberDAO;
import com.scroll.test.model.BCommand;


public class BpicupdateCommand implements BCommand {
	public BpicupdateCommand(){
		
	}
	public void execute(HttpServletRequest request,HttpServletResponse response)throws IOException {
		MemberDAO dao=new MemberDAO();
		dao.picupdate(
	            (String)request.getAttribute("realfilename"),
	            (String)request.getAttribute("userid")
				);
	}
}
