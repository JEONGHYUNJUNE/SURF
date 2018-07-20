package com.scroll.test.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

import com.scroll.test.dto.TestDto;

import util.DBManager;

public class TestDao {
   public TestDao() {
   }

   private static TestDao instance = new TestDao();

   public static TestDao getInstance() {
      return instance;
   }
   
/*   public ArrayList<TestDto> listC() {
      TestDto dto = null;
      String sql =  "select name,Tdate,content from testScroll where rownum<=5";
      ArrayList<TestDto> list = new ArrayList<TestDto>();
      Connection conn = null;
      Statement stmt = null;
      ResultSet rs = null;
      
      try {
         conn = DBManager.getConnection();
         stmt = conn.createStatement();
         rs = stmt.executeQuery(sql);
         while (rs.next()) {
            dto = new TestDto();
            dto.setName(rs.getString("name"));
            dto.setDate(rs.getString("Tdate"));
            dto.setContent(rs.getString("content"));
            list.add(dto);
         }
      } catch (SQLException e) {
         e.printStackTrace();
      } finally {
         DBManager.close(conn, stmt, rs);
      }
      return list;
   }*/
   public ArrayList<TestDto> listScroll(int num,String userid) {
	      TestDto dto = null;
	      String sql =  "Select Tnum,writerID,name,Tdate,content,videorealname,picrealname,link from(select rownum as rnum,surfboard.* from surfboard where writerID = '"+userid+"' or writerid in  (select userid from friendlist_"+userid+") order by tnum desc)a where a.rnum>? and a.rnum<=?" ;
	      ArrayList<TestDto> list = new ArrayList<TestDto>();
	      Connection conn = null;
	      PreparedStatement pstmt = null;
	      ResultSet rs = null;
	      try {
	         conn = DBManager.getConnection();
	         pstmt = conn.prepareStatement(sql);
	         pstmt.setInt(1, num);
	         pstmt.setInt(2, num+4);
	         rs = pstmt.executeQuery();
	         while (rs.next()) {
	            dto = new TestDto();
	            dto.setTnum(rs.getInt("Tnum"));
	            dto.setUserid(rs.getString("writerID"));
	            dto.setName(rs.getString("name"));
	            dto.setDate(rs.getString("Tdate"));
	            dto.setContent(rs.getString("content"));
	            dto.setVideorealname(rs.getString("videorealname"));
	            dto.setPicrealname(rs.getString("picrealname"));
	            dto.setLink(rs.getString("link"));
	            list.add(dto);
	         }
	      } catch (SQLException e) {
	         e.printStackTrace();
	      } finally {
	         DBManager.close(conn, pstmt, rs);
	      }
	      return list;
	   }
   public ArrayList<TestDto> myScroll(int num,String userid) {
	   TestDto dto = null;
	   String sql =  "Select Tnum,writerID,name,Tdate,content,videorealname,picrealname,link from(select rownum as rnum,surfboard.* from surfboard where writerID = '"+userid+"' order by tnum desc)a where a.rnum>? and a.rnum<=?" ;
	   ArrayList<TestDto> list = new ArrayList<TestDto>();
	   Connection conn = null;
	   PreparedStatement pstmt = null;
	   ResultSet rs = null;
	   try {
		   conn = DBManager.getConnection();
		   pstmt = conn.prepareStatement(sql);
		   pstmt.setInt(1, num);
		   pstmt.setInt(2, num+4);
		   rs = pstmt.executeQuery();
		   while (rs.next()) {
			   dto = new TestDto();
			   dto.setTnum(rs.getInt("Tnum"));
			   dto.setUserid(rs.getString("writerID"));
			   dto.setName(rs.getString("name"));
			   dto.setDate(rs.getString("Tdate"));
			   dto.setContent(rs.getString("content"));
			   dto.setVideorealname(rs.getString("videorealname"));
			   dto.setPicrealname(rs.getString("picrealname"));
			   dto.setLink(rs.getString("link"));
			   list.add(dto);
		   }
	   } catch (SQLException e) {
		   e.printStackTrace();
	   } finally {
		   DBManager.close(conn, pstmt, rs);
	   }
	   return list;
   }
   public ArrayList<TestDto> friendscroll(int num,String userid) {
	   TestDto dto = null;
	   String sql =  "Select Tnum,writerID,name,Tdate,content,videorealname,picrealname,link,p from(select rownum as rnum,surfboard.* from surfboard where writerID = '"+userid+"' order by tnum desc)a where a.rnum >? and a.rnum <=? ";
	   ArrayList<TestDto> list = new ArrayList<TestDto>();
	   Connection conn = null;
	   PreparedStatement pstmt = null;
	   ResultSet rs = null;
	   try {
		   conn = DBManager.getConnection();
		   pstmt = conn.prepareStatement(sql);
		   pstmt.setInt(1, num);
		   pstmt.setInt(2, num+4);
		   rs = pstmt.executeQuery();
		   while (rs.next()) {
			   dto = new TestDto();
			   dto.setTnum(rs.getInt("Tnum"));
			   dto.setUserid(rs.getString("writerID"));
			   dto.setName(rs.getString("name"));
			   dto.setDate(rs.getString("Tdate"));
			   dto.setContent(rs.getString("content"));
			   dto.setVideorealname(rs.getString("videorealname"));
			   dto.setPicrealname(rs.getString("picrealname"));
			   dto.setLink(rs.getString("link"));
			   list.add(dto);
		   }
	   } catch (SQLException e) {
		   e.printStackTrace();
	   } finally {
		   DBManager.close(conn, pstmt, rs);
	   }
	   return list;
   }
  
   public ArrayList<TestDto> friendscroll2(int num,String userid) {
	   TestDto dto = null;
	   String sql =  "Select Tnum,writerID,name,Tdate,content,videorealname,picrealname,link,p from(select rownum as rnum,surfboard.* from surfboard where writerID = '"+userid+"' and p=1 order by tnum desc)a where a.rnum >? and a.rnum <=? and p = 1 ";
	   ArrayList<TestDto> list = new ArrayList<TestDto>();
	   Connection conn = null;
	   PreparedStatement pstmt = null;
	   ResultSet rs = null;
	   try {
		   conn = DBManager.getConnection();
		   pstmt = conn.prepareStatement(sql);
		   pstmt.setInt(1, num);
		   pstmt.setInt(2, num+4);
		   rs = pstmt.executeQuery();
		   while (rs.next()) {
			   dto = new TestDto();
			   dto.setTnum(rs.getInt("Tnum"));
			   dto.setUserid(rs.getString("writerID"));
			   dto.setName(rs.getString("name"));
			   dto.setDate(rs.getString("Tdate"));
			   dto.setContent(rs.getString("content"));
			   dto.setVideorealname(rs.getString("videorealname"));
			   dto.setPicrealname(rs.getString("picrealname"));
			   dto.setLink(rs.getString("link"));
			   list.add(dto);
		   }
	   } catch (SQLException e) {
		   e.printStackTrace();
	   } finally {
		   DBManager.close(conn, pstmt, rs);
	   }
	   return list;
   }
   public ArrayList<TestDto> listtest(String userid) {
      TestDto dto = null;
      String sql =  "select Tnum,writerID,name,Tdate,content,videorealname,picrealname,link from (select * from surfboard order by tnum desc) where rownum<=7 and (writerID ='"+userid+"'or writerid in  (select userid from friendlist_"+userid+" where attrb=0))";
      ArrayList<TestDto> list = new ArrayList<TestDto>();
      Connection conn = null;
      Statement stmt = null;
      ResultSet rs = null;
      try {
         conn = DBManager.getConnection();
         stmt = conn.createStatement();
         rs = stmt.executeQuery(sql);
         while (rs.next()) {
            dto = new TestDto();
            dto.setTnum(rs.getInt("Tnum"));
            dto.setUserid(rs.getString("writerID"));
            dto.setName(rs.getString("name"));
            dto.setDate(rs.getString("Tdate"));
            dto.setContent(rs.getString("content"));
            dto.setVideorealname(rs.getString("videorealname"));
            dto.setPicrealname(rs.getString("picrealname"));
            dto.setLink(rs.getString("link"));
            list.add(dto);
         }
      } catch (SQLException e) {
         e.printStackTrace();
      } finally {
         DBManager.close(conn, stmt, rs);
      }
      return list;
   }
   public ArrayList<TestDto> listtest() {
      TestDto dto = null;
      String sql =  "select Tnum,writerID,name,Tdate,content,videorealname,picrealname,link,p from (select * from surfboard order by tnum desc) where rownum<=7 ";
      ArrayList<TestDto> list = new ArrayList<TestDto>();
      Connection conn = null;
      Statement stmt = null;
      ResultSet rs = null;
      try {
         conn = DBManager.getConnection();
         stmt = conn.createStatement();
         rs = stmt.executeQuery(sql);
         while (rs.next()) {
            dto = new TestDto();
            dto.setTnum(rs.getInt("Tnum"));
            dto.setUserid(rs.getString("writerID"));
            dto.setName(rs.getString("name"));
            dto.setDate(rs.getString("Tdate"));
            dto.setContent(rs.getString("content"));
            dto.setVideorealname(rs.getString("videorealname"));
            dto.setPicrealname(rs.getString("picrealname"));
            dto.setLink(rs.getString("link"));
            dto.setP(rs.getInt("p"));
            list.add(dto);
         }
      } catch (SQLException e) {
         e.printStackTrace();
      } finally {
         DBManager.close(conn, stmt, rs);
      }
      return list;
   }
   public ArrayList<TestDto> mylist(String userid) {
	   TestDto dto = null;
	   String sql =  "select Tnum,writerID,name,Tdate,content,videorealname,picrealname,link,p from (select * from surfboard order by tnum desc) where writerid='"+userid+"' and rownum<=7 ";
	   ArrayList<TestDto> list = new ArrayList<TestDto>();
	   Connection conn = null;
	   Statement stmt = null;
	   ResultSet rs = null;
	   try {
		   conn = DBManager.getConnection();
		   stmt = conn.createStatement();
		   rs = stmt.executeQuery(sql);
		   while (rs.next()) {
			   dto = new TestDto();
			   dto.setTnum(rs.getInt("Tnum"));
			   dto.setUserid(rs.getString("writerID"));
			   dto.setName(rs.getString("name"));
			   dto.setDate(rs.getString("Tdate"));
			   dto.setContent(rs.getString("content"));
			   dto.setVideorealname(rs.getString("videorealname"));
			   dto.setPicrealname(rs.getString("picrealname"));
			   dto.setLink(rs.getString("link"));
			   dto.setP(rs.getInt("p"));
			   list.add(dto);
		   }
	   } catch (SQLException e) {
		   e.printStackTrace();
	   } finally {
		   DBManager.close(conn, stmt, rs);
	   }
	   return list;
   }
   public ArrayList<TestDto> friendlist(String userid) {
	   TestDto dto = null;
	   String sql =  "select Tnum,writerID,name,Tdate,content,videorealname,picrealname,link,p from (select * from surfboard order by tnum desc) where rownum<=7 and writerid= '"+userid+"'";
	   ArrayList<TestDto> list = new ArrayList<TestDto>();
	   Connection conn = null;
	   Statement stmt = null;
	   ResultSet rs = null;
	   try {
		   conn = DBManager.getConnection();
		   stmt = conn.createStatement();
		   rs = stmt.executeQuery(sql);
		   while (rs.next()) {
			   dto = new TestDto();
			   dto.setTnum(rs.getInt("Tnum"));
			   dto.setUserid(rs.getString("writerID"));
			   dto.setName(rs.getString("name"));
			   dto.setDate(rs.getString("Tdate"));
			   dto.setContent(rs.getString("content"));
			   dto.setVideorealname(rs.getString("videorealname"));
			   dto.setPicrealname(rs.getString("picrealname"));
			   dto.setLink(rs.getString("link"));
			   dto.setP(rs.getInt("p"));
			   list.add(dto);
		   }
	   } catch (SQLException e) {
		   e.printStackTrace();
	   } finally {
		   DBManager.close(conn, stmt, rs);
	   }
	   return list;
   }
   public ArrayList<TestDto> listtest2() {
	   TestDto dto = null;
	   String sql =  "select Tnum,writerID,name,Tdate,content,videorealname,picrealname,link,p from (select * from surfboard order by tnum desc) where rownum<=7 and p=1";
	   ArrayList<TestDto> list = new ArrayList<TestDto>();
	   Connection conn = null;
	   Statement stmt = null;
	   ResultSet rs = null;
	   try {
		   conn = DBManager.getConnection();
		   stmt = conn.createStatement();
		   rs = stmt.executeQuery(sql);
		   while (rs.next()) {
			   dto = new TestDto();
			   dto.setTnum(rs.getInt("Tnum"));
			   dto.setUserid(rs.getString("writerID"));
			   dto.setName(rs.getString("name"));
			   dto.setDate(rs.getString("Tdate"));
			   dto.setContent(rs.getString("content"));
			   dto.setVideorealname(rs.getString("videorealname"));
			   dto.setPicrealname(rs.getString("picrealname"));
			   dto.setLink(rs.getString("link"));
			   dto.setP(rs.getInt("p"));
			   list.add(dto);
		   }
	   } catch (SQLException e) {
		   e.printStackTrace();
	   } finally {
		   DBManager.close(conn, stmt, rs);
	   }
	   return list;
   }
   public ArrayList<TestDto> friendlist2(String userid) {
	   TestDto dto = null;
	   String sql =  "select Tnum,writerID,name,Tdate,content,videorealname,picrealname,link,p from (select * from surfboard order by tnum desc) where rownum<=7 and p=1 and writerid = '"+userid+"'";
	   ArrayList<TestDto> list = new ArrayList<TestDto>();
	   Connection conn = null;
	   Statement stmt = null;
	   ResultSet rs = null;
	   try {
		   conn = DBManager.getConnection();
		   stmt = conn.createStatement();
		   rs = stmt.executeQuery(sql);
		   while (rs.next()) {
			   dto = new TestDto();
			   dto.setTnum(rs.getInt("Tnum"));
			   dto.setUserid(rs.getString("writerID"));
			   dto.setName(rs.getString("name"));
			   dto.setDate(rs.getString("Tdate"));
			   dto.setContent(rs.getString("content"));
			   dto.setVideorealname(rs.getString("videorealname"));
			   dto.setPicrealname(rs.getString("picrealname"));
			   dto.setLink(rs.getString("link"));
			   dto.setP(rs.getInt("p"));
			   list.add(dto);
		   }
	   } catch (SQLException e) {
		   e.printStackTrace();
	   } finally {
		   DBManager.close(conn, stmt, rs);
	   }
	   return list;
   }

   public void insert(String userid,String username,String contents, String filename,String realfilename,String videoname,String realvideoname,String link,String pub) { //글쓰기 테스트
         String sql = "insert into surfboard "
               + "VALUES(surfboard_seq.nextval,"+"'"+userid+"','"+username+"','"+contents+"',to_char(sysdate,'yy/mm/dd,HH24:MI'),"
               + "'"+filename+"','"+realfilename+"','"+videoname+"','"+realvideoname+"','"+link+"','"+pub+"')";
         System.out.println(sql);
         Connection conn = null;
         Statement stmt = null;
         try {
            conn = DBManager.getConnection();
            stmt = conn.createStatement();
            stmt.executeQuery(sql);
         } catch (Exception e) {
            e.printStackTrace();
         } finally {
            try {
               if (stmt != null)
                  stmt.close();
               if (conn != null)
                  conn.close();
            } catch (Exception e) {
               e.printStackTrace();
            }
         }
      }
   
   public int selecttnum() {
	   String sql =  "select tnum from surfboard where rownum = 1 order by tnum desc";
	   Connection conn = null;
	      Statement stmt = null;
	      ResultSet rs = null;
	      int tnum = 0;
	      try {
	         conn = DBManager.getConnection();
	        stmt = conn.createStatement();
	        rs = stmt.executeQuery(sql);
	        if(rs.next()) {
	        	tnum = rs.getInt("tnum");
	        }
	      } catch (SQLException e) {
	         e.printStackTrace();
	      } finally {
	         DBManager.close(conn, stmt, rs);
	      }
	  return tnum;
   }
   
   public void liketable(int tnum) {
	      String sql =  "create table like"+tnum+"(" + 
	            "userid varchar2(30) UNIQUE )";
	      Connection conn = null;
	      Statement stmt = null;
	      ResultSet rs = null;
	      System.out.println(tnum);
	      try {
	         conn = DBManager.getConnection();
	        stmt = conn.createStatement();
	        rs = stmt.executeQuery(sql);
	      
	      } catch (SQLException e) {
	         e.printStackTrace();
	      } finally {
	         DBManager.close(conn, stmt, rs);
	      }
	  
	   }
   public void likeplus(int tnum , String userid) { 
       String sql = "insert into like"+tnum+" values('"+userid+"')";
       Connection conn = null;
       Statement stmt = null;
       try {
          conn = DBManager.getConnection();
          stmt = conn.createStatement();
          stmt.executeQuery(sql);
       } catch (Exception e) {
          e.printStackTrace();
          System.out.println("이미 좋아요");
          likem( tnum ,  userid);
       } finally {
          try {
             if (stmt != null)
                stmt.close();
             if (conn != null)
                conn.close();
          } catch (Exception e) {
             e.printStackTrace();
            
          }
       }
    }
   public void likem(int tnum , String userid) { 
	   String sql = "delete from like"+tnum+" where userid = '"+userid+"'";
	   Connection conn = null;
	   Statement stmt = null;
	   try {
		   conn = DBManager.getConnection();
		   stmt = conn.createStatement();
		   stmt.executeQuery(sql);
	   } catch (Exception e) {
		   e.printStackTrace();
	   } finally {
		   try {
			   if (stmt != null)
				   stmt.close();
			   if (conn != null)
				   conn.close();
		   } catch (Exception e) {
			   e.printStackTrace();
			   
		   }
	   }
   }
   public String likeview(int tnum) { 
       String sql = "select count(*) from like"+tnum;
       Connection conn = null;
	      Statement stmt = null;
	      ResultSet rs = null;
	      String likesu="0";
	      try {
	         conn = DBManager.getConnection();
	        stmt = conn.createStatement();
	        rs = stmt.executeQuery(sql);
	        if(rs.next()) {
	        	likesu = rs.getString("count(*)");	       
	        	}
	      } catch (SQLException e) {
	         e.printStackTrace();
	      } finally {
	         DBManager.close(conn, stmt, rs);
	      }
	      return likesu;
	  
    }
   public ArrayList<TestDto> likeid(int tnum) { 
	   String sql = "select userid from like"+tnum;
	   Connection conn = null;
	   Statement stmt = null;
	   ResultSet rs = null;
	   TestDto dto =null;
	   ArrayList<TestDto> list = new ArrayList<TestDto>();
	   try {
		   conn = DBManager.getConnection();
		   stmt = conn.createStatement();
		   rs = stmt.executeQuery(sql);
		   while(rs.next()) {
			   dto =  new TestDto();
			   dto.setUserid(rs.getString("userid"));   
			   list.add(dto);
		   }
		
	   } catch (SQLException e) {
		   e.printStackTrace();
	   } finally {
		   DBManager.close(conn, stmt, rs);
	   }
	   return list;
	   
   }
   public void replywrite(String userid,String username,String content,int bnum) { //글쓰기 테스트
       String sql = "insert into surfreply(userid,username,content,bnum,rnum) values('"+userid+"','"+username+"','"+content+"','"+bnum+"',surfreply_seq.nextVal)";
       Connection conn = null;
       Statement stmt = null;
       try {
          conn = DBManager.getConnection();
          stmt = conn.createStatement();
          stmt.executeQuery(sql);
       } catch (Exception e) {
          e.printStackTrace();
       } finally {
          try {
             if (stmt != null)
                stmt.close();
             if (conn != null)
                conn.close();
          } catch (Exception e) {
             e.printStackTrace();
          }
       }
    }
   public void delreply(int rnum) {
       String sql = "delete from surfreply where rnum="+rnum;
       Connection conn = null;
       Statement stmt = null;
       try {
          conn = DBManager.getConnection();
          stmt = conn.createStatement();
          stmt.executeQuery(sql);
       } catch (Exception e) {
          e.printStackTrace();
       } finally {
          try {
             if (stmt != null)
                stmt.close();
             if (conn != null)
                conn.close();
          } catch (Exception e) {
             e.printStackTrace();
          }
       }
    }
   public ArrayList<TestDto> replyview(int bnum){
       String sql = "select userid,username,content,to_char(rdate,'YYYY/MM/DD,HH24:MI'),rnum,bnum,rownum from surfreply where  bnum = ? order by rnum";
       ArrayList<TestDto> replylist = new ArrayList<TestDto>();
       TestDto dto;
       Connection conn = null;
       PreparedStatement pstmt = null;
       ResultSet rs = null;
       try {
          conn = DBManager.getConnection();
          pstmt = conn.prepareStatement(sql);
          pstmt.setInt(1, bnum);
          rs = pstmt.executeQuery();
             while (rs.next()) {
                 dto = new TestDto();
                 dto.setUserid(rs.getString("userid"));
                 dto.setUsername(rs.getString("username"));
                 dto.setRcontent(rs.getString("content"));
                 dto.setRdate(rs.getString("to_char(rdate,'YYYY/MM/DD,HH24:MI')"));
                 dto.setRnum(rs.getInt("rnum"));
                 dto.setBnum(rs.getInt("bnum"));
                 dto.setP(rs.getInt("rownum"));
                 
                 replylist.add(dto);
              }
       }catch(Exception e) {
          e.printStackTrace();
       }finally {
             try {
                   if (rs != null)
                      rs.close();
                   if (pstmt != null)
                      pstmt.close();
                   if (conn != null)
                      conn.close();
                } catch (Exception e) {
                   e.printStackTrace();
                }
             }
       return replylist;
    }
 
     public void surfdel(String tnum) {
          String sql = "delete from surfboard where tnum='"+tnum+"'";
          System.out.println(sql);
          Connection conn = null;
          Statement stmt = null;
          try {
             conn = DBManager.getConnection();
             stmt = conn.createStatement();
             stmt.executeQuery(sql);
          } catch (Exception e) {
             e.printStackTrace();
          } finally {
             try {
                if (stmt != null)
                   stmt.close();
                if (conn != null)
                   conn.close();
             } catch (Exception e) {
                e.printStackTrace();
             }
          }
       }

   
   
}