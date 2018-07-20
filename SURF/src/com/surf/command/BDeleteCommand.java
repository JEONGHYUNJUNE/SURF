package com.surf.command;
import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.scroll.test.dao.TestDao;
import com.scroll.test.model.BCommand;



public class BDeleteCommand implements BCommand {
   public BDeleteCommand(){
      
   }
   
   public void execute(HttpServletRequest request,HttpServletResponse response)throws IOException {
      TestDao dao=new TestDao();
      dao.surfdel((String)request.getAttribute("tnum"));
   }


}