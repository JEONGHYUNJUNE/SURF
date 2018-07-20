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
	            //�� �ۼ��� ���Ͱ� \r\n���� �ԷµǹǷ� <br>�� replace ����  �ٹٲ��� ó���ϰ� �� �յ��� ������ �����Ѵ�.
	            (String)request.getAttribute("filename"),
	            (String)request.getAttribute("realfilename"),
	            (String)request.getAttribute("videoname"),
	            (String)request.getAttribute("realvideoname"),
	            (String)request.getAttribute("link"),
	            (String)request.getAttribute("pub")
				);
		
		int tnum = dao.selecttnum(); 
		System.out.println(tnum+"���ƿ����̺� ������ȣ");
		dao.liketable(tnum);			//�Խù� ��ȣ�� �޾ƿͼ� ���ƿ� ���̺��� ����
	}
}
