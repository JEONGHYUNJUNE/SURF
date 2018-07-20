package com.surf.command;
import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.scroll.test.dao.TestDao;
import com.scroll.test.model.BCommand;


public class BInsertCommand implements BCommand {
	public BInsertCommand(){
		
	}
	public void execute(HttpServletRequest request,HttpServletResponse response)throws IOException {
		TestDao dao=new TestDao();
		dao.insert((String)request.getAttribute("userid"),
	            (String)request.getAttribute("username"),
	            ((String) request.getAttribute("contents")).trim().replace("\r\n", "<br/>"), 
	            //글 작성시 엔터가 \r\n으로 입력되므로 <br>로 replace 시켜  줄바꿈을 처리하고 글 앞뒤의 공백은 제거한다.
	            (String)request.getAttribute("filename"),
	            (String)request.getAttribute("realfilename"),
	            (String)request.getAttribute("videoname"),
	            (String)request.getAttribute("realvideoname"),
	            (String)request.getAttribute("link"),
	            (String)request.getAttribute("pub")
				);
		
		int tnum = dao.selecttnum(); 
		System.out.println(tnum+"좋아요테이블 생성번호");
		dao.liketable(tnum);			//게시물 번호를 받아와서 좋아요 테이블을 생성
	}
}
