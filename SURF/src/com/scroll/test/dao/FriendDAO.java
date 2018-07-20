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

import com.scroll.test.dto.FriendDto;
import com.scroll.test.dto.TestDto;

import util.DBManager;

public class FriendDAO {
   public FriendDAO() {
   }

   private static FriendDAO instance = new FriendDAO();

   public static FriendDAO getInstance() {
      return instance;
   }
   public ArrayList<FriendDto> memberalllist(String userid) {
	   FriendDto fdto = null;
	   String sql =  "select userid,username from surfmember";
	   ArrayList<FriendDto> list = new ArrayList<FriendDto>();
	   Connection conn = null;
	   Statement stmt = null;
	   ResultSet rs = null;
	   try {
		   conn = DBManager.getConnection();
		   stmt = conn.createStatement();
		   rs = stmt.executeQuery(sql);
		   while (rs.next()) {
			   fdto = new FriendDto();
			   fdto.setUserid(rs.getString("userid"));
			   fdto.setName(rs.getString("username"));
			   list.add(fdto);
		   }
	   } catch (SQLException e) {
		   e.printStackTrace();
	   } finally {
		   DBManager.close(conn, stmt, rs);
	   }
	   return list;
   }
   public ArrayList<FriendDto> randomfriend(String userid) {
	   FriendDto fdto = null;
	   String sql =  "select userid,username from surfmember where userid not in (select userid from friendlist_"+userid+");";
	   ArrayList<FriendDto> list = new ArrayList<FriendDto>();
	   Connection conn = null;
	   Statement stmt = null;
	   ResultSet rs = null;
	   try {
		   conn = DBManager.getConnection();
		   stmt = conn.createStatement();
		   rs = stmt.executeQuery(sql);
		   while (rs.next()) {
			   fdto = new FriendDto();
			   fdto.setUserid(rs.getString("userid"));
			   fdto.setName(rs.getString("username"));
			   list.add(fdto);
		   }
	   } catch (SQLException e) {
		   e.printStackTrace();
	   } finally {
		   DBManager.close(conn, stmt, rs);
	   }
	   return list;
   }
   public ArrayList<FriendDto> friendalllist(String userid) {
	   FriendDto fdto = null;
	   String sql =  "select userid,username,attrb,rownum from friendlist_"+userid;
	   ArrayList<FriendDto> list = new ArrayList<FriendDto>();
	   Connection conn = null;
	   Statement stmt = null;
	   ResultSet rs = null;
	   try {
		   conn = DBManager.getConnection();
		   stmt = conn.createStatement();
		   rs = stmt.executeQuery(sql);
		   while (rs.next()) {
			   fdto = new FriendDto();
			   fdto.setUserid(rs.getString("userid"));
			   fdto.setName(rs.getString("username"));
			   fdto.setAttr(rs.getString("attrb"));
			   fdto.setNum(rs.getString("rownum"));
			   list.add(fdto);
		   }
	   } catch (SQLException e) {
		   e.printStackTrace();
	   } finally {
		   DBManager.close(conn, stmt, rs);
	   }
	   return list;
   }
   public ArrayList<FriendDto> friendlist(String userid) {
         FriendDto fdto = null;
         String sql =  "select userid,username,fnum,attrb from friendlist_"+userid+" where attrb = 0";
         ArrayList<FriendDto> list = new ArrayList<FriendDto>();
         Connection conn = null;
         Statement stmt = null;
         ResultSet rs = null;
         try {
            conn = DBManager.getConnection();
            stmt = conn.createStatement();
            rs = stmt.executeQuery(sql);
            while (rs.next()) {
               fdto = new FriendDto();
               fdto.setUserid(rs.getString("userid"));
               fdto.setName(rs.getString("username"));
               fdto.setAttr(rs.getString("attrb"));
               fdto.setNum(rs.getString("fnum"));
               list.add(fdto);
            }
         } catch (SQLException e) {
            e.printStackTrace();
         } finally {
            DBManager.close(conn, stmt, rs);
         }
         return list;
      }
   public ArrayList<FriendDto> friendsendlist(String userid) {
         FriendDto fdto = null;
         String sql =  "select userid,username,fnum,attrb from friendlist_"+userid+" where attrb = 2";
         ArrayList<FriendDto> list = new ArrayList<FriendDto>();
         Connection conn = null;
         Statement stmt = null;
         ResultSet rs = null;
         try {
            conn = DBManager.getConnection();
            stmt = conn.createStatement();
            rs = stmt.executeQuery(sql);
            while (rs.next()) {
               fdto = new FriendDto();
               fdto.setUserid(rs.getString("userid"));
               fdto.setName(rs.getString("username"));
               fdto.setAttr(rs.getString("attrb"));
               fdto.setNum(rs.getString("fnum"));
               list.add(fdto);
            }
         } catch (SQLException e) {
            e.printStackTrace();
         } finally {
            DBManager.close(conn, stmt, rs);
         }
         return list;
      }
   public ArrayList<FriendDto> friendreceivelist(String userid) {
         FriendDto fdto = null;
         String sql =  "select userid,username,fnum,attrb from friendlist_"+userid+" where attrb = 1";
         ArrayList<FriendDto> list = new ArrayList<FriendDto>();
         Connection conn = null;
         Statement stmt = null;
         ResultSet rs = null;
         try {
            conn = DBManager.getConnection();
            stmt = conn.createStatement();
            rs = stmt.executeQuery(sql);
            while (rs.next()) {
               fdto = new FriendDto();
               fdto.setUserid(rs.getString("userid"));
               fdto.setName(rs.getString("username"));
               fdto.setAttr(rs.getString("attrb"));
               fdto.setNum(rs.getString("fnum"));
               list.add(fdto);
            }
         } catch (SQLException e) {
            e.printStackTrace();
         } finally {
            DBManager.close(conn, stmt, rs);
         }
         return list;
      }
      public void addfriendtable(String userid) {
      String sql =  "create table friendlist_"+userid+"(" + 
            "userid varchar2(30)," + 
            "username varchar2(30)," + 
            "attrb varchar2(30)," + 
            "fnum varchar2(30)" + 
            ")";
      Connection conn = null;
      Statement stmt = null;
      ResultSet rs = null;
      
      try {
         System.out.println(userid);
         conn = DBManager.getConnection();
        stmt = conn.createStatement();
        rs = stmt.executeQuery(sql);
      
      } catch (SQLException e) {
         e.printStackTrace();
      } finally {
         DBManager.close(conn, stmt, rs);
      }
  
   }
public void addfriendSeq(String userid) {
    String sql =  "create sequence "+userid+"_seq";
    String sql1 = "ALTER TABLE friendlist_"+userid+" ADD CONSTRAINTS "+userid+" FOREIGN KEY (userid) REFERENCES surfmember(userid) on delete cascade";
    Connection conn = null;
    Connection conn1 = null;
    Statement stmt = null;
    Statement stmt1 = null;
    ResultSet rs = null;
    ResultSet rs1 = null;
    try {
         System.out.println(userid);
           conn = DBManager.getConnection();
           conn1 = DBManager.getConnection();
          stmt = conn.createStatement();
          stmt1 = conn.createStatement();
          rs = stmt.executeQuery(sql);
          rs1 = stmt1.executeQuery(sql1);
    } catch (SQLException e) {
       e.printStackTrace();
    } finally {
       DBManager.close(conn, stmt, rs);
       DBManager.close(conn1, stmt1, rs1);
    }

 }
   public void addfriend(String loginid,String fid) {
         String sql =  "update friendlist_"+loginid+" set attrb=0 where userid=?";
         String sql1 = "update friendlist_"+fid+" set attrb=0 where userid=?";
         Connection conn = null;
         PreparedStatement pstmt = null;
         ResultSet rs = null;
         Connection conn1 = null;
         PreparedStatement pstmt1 = null;
         ResultSet rs1 = null;
         
         try {
            conn = DBManager.getConnection();
            pstmt = conn.prepareStatement(sql);
            pstmt.setString(1, fid);
            rs = pstmt.executeQuery();
            conn1 = DBManager.getConnection();
            pstmt1 = conn1.prepareStatement(sql1);
            pstmt1.setString(1, loginid);
            rs1 = pstmt1.executeQuery();
         
         } catch (SQLException e) {
            e.printStackTrace();
         } finally {
            DBManager.close(conn, pstmt, rs);
            DBManager.close(conn1, pstmt1, rs1);
         }
     
      }
   public void deletefriend(String loginid,String fid) {
          String sql =  "delete from friendlist_"+loginid+" where userid = ?";
          String sql1 = "delete from friendlist_"+fid+" where userid= ? ";
          Connection conn = null;
          PreparedStatement pstmt = null;
          ResultSet rs = null;
          Connection conn1 = null;
          PreparedStatement pstmt1 = null;
          ResultSet rs1 = null;
          
          try {
             conn = DBManager.getConnection();
             pstmt = conn.prepareStatement(sql);
             pstmt.setString(1, fid);
             rs = pstmt.executeQuery();
             conn1 = DBManager.getConnection();
             pstmt1 = conn1.prepareStatement(sql1);
             pstmt1.setString(1, loginid);
             rs1 = pstmt1.executeQuery();
          
          } catch (SQLException e) {
             e.printStackTrace();
          } finally {
             DBManager.close(conn, pstmt, rs);
             DBManager.close(conn1, pstmt1, rs1);
          }
      
       }
   public void addfriend1(String loginid,String fid,String fname,String loginusername) {
      String sql =  "insert into friendlist_"+loginid+" values(?,?,?,"+loginid+"_seq.nextVal) ";
      String sql1 = "insert into friendlist_"+fid+" values(?,?,?,"+fid+"_seq.nextVal) ";
      System.out.println(loginid);
      System.out.println(fid);
      Connection conn = null;
      PreparedStatement pstmt = null;
      ResultSet rs = null;
      Connection conn1 = null;
      PreparedStatement pstmt1 = null;
      ResultSet rs1 = null;
      
      try {
         conn = DBManager.getConnection();
         pstmt = conn.prepareStatement(sql);
         pstmt.setString(1, fid);
         pstmt.setString(2, fname);
         pstmt.setString(3, "2");
       
         rs = pstmt.executeQuery();
         conn1 = DBManager.getConnection();
         pstmt1 = conn1.prepareStatement(sql1);
         pstmt1.setString(1, loginid);
         pstmt1.setString(2, loginusername);
         pstmt1.setString(3, "1");
         
         rs1 = pstmt1.executeQuery();
         
      } catch (SQLException e) {
         e.printStackTrace();
      } finally {
         DBManager.close(conn, pstmt, rs);
         DBManager.close(conn1, pstmt1, rs1);
      }
      
   }

   
}