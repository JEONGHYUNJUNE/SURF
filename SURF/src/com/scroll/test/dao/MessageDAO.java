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

import com.scroll.test.dto.MessageDto;
import com.scroll.test.dto.TestDto;

import util.DBManager;

public class MessageDAO {
   public MessageDAO() {
   }

   private static MessageDAO instance = new MessageDAO();

   public static MessageDAO getInstance() {
      return instance;
   }
   public ArrayList<MessageDto> recievemessage(String userid) {
      MessageDto mdto = null;
      String sql =  "select writeid,recieveid,mcontent,mdate1,mdate2,readattr from surfmessage where recieveid = ? order by rownum desc";
      ArrayList<MessageDto> list = new ArrayList<MessageDto>();
      Connection conn = null;
      PreparedStatement pstmt = null;
      ResultSet rs = null;
      try {
         conn = DBManager.getConnection();
         pstmt = conn.prepareStatement(sql);
         pstmt.setString(1, userid);
         rs = pstmt.executeQuery();
         while (rs.next()) {
            mdto = new MessageDto();
            mdto.setWriteid(rs.getString("writeid"));
            mdto.setRecieveid(rs.getString("recieveid"));
            mdto.setMcontent(rs.getString("mcontent"));
            mdto.setMdate1(rs.getString("mdate1"));
            mdto.setMdate2(rs.getString("mdate2"));
            mdto.setReadattr(rs.getString("readattr"));
            mdto.setWritename(getname(mdto.getWriteid()));
            mdto.setRecievename(getname(mdto.getRecieveid()));
            list.add(mdto);
         }
      } catch (SQLException e) {
         e.printStackTrace();
      } finally {
         DBManager.close(conn, pstmt, rs);
      }
      return list;
   }
   public String getname(String userid) {
           String sql =  "select username from surfmember where userid=?";
         Connection conn = null;
         PreparedStatement pstmt = null;
         ResultSet rs = null;
         MessageDto mdto = null;
         String result = null;
         try {
            conn = DBManager.getConnection();
            pstmt = conn.prepareStatement(sql);
            pstmt.setString(1, userid);
            rs = pstmt.executeQuery();
            while (rs.next()) {
               mdto = new MessageDto();
               mdto.setWritename(rs.getString("username"));
               result = mdto.getWritename();
            } 
         }catch (SQLException e) {
                e.printStackTrace();
            } finally {
               DBManager.close(conn, pstmt, rs);
            }
            return result;
   }
   
   public ArrayList<MessageDto> writemessage(String userid) {
         MessageDto mdto = null;
         String sql =  "select writeid,recieveid,mcontent,mdate1,mdate2,readattr from surfmessage where writeid = ? order by rownum desc";
         ArrayList<MessageDto> list = new ArrayList<MessageDto>();
         Connection conn = null;
         PreparedStatement pstmt = null;
         ResultSet rs = null;
         try {
            conn = DBManager.getConnection();
            pstmt = conn.prepareStatement(sql);
            pstmt.setString(1, userid);
            rs = pstmt.executeQuery();
            while (rs.next()) {
               mdto = new MessageDto();
               mdto.setWriteid(rs.getString("writeid"));
               mdto.setRecieveid(rs.getString("recieveid"));
               mdto.setMcontent(rs.getString("mcontent"));
               mdto.setMdate1(rs.getString("mdate1"));
               mdto.setMdate2(rs.getString("mdate2"));
               mdto.setReadattr(rs.getString("readattr"));
               mdto.setWritename(getname(mdto.getWriteid()));
               mdto.setRecievename(getname(mdto.getRecieveid()));
               list.add(mdto);
            }
         } catch (SQLException e) {
            e.printStackTrace();
         } finally {
            DBManager.close(conn, pstmt, rs);
         }
         return list;
      }
   public void writemessage(String wid,String rid,String content) {
           String sql =  "insert into surfmessage values(?,?,?,to_char(sysdate,'YY/MM/DD'),to_char(sysdate,'HH:MI'),'0')";
         Connection conn = null;
         PreparedStatement pstmt = null;
         ResultSet rs = null;
         
         try {
            conn = DBManager.getConnection();
            pstmt = conn.prepareStatement(sql);
            pstmt.setString(1, wid);
            pstmt.setString(2, rid);
            pstmt.setString(3, content);
          
            rs = pstmt.executeQuery();
            
         }catch (SQLException e) {
            e.printStackTrace();
         } finally {
            DBManager.close(conn, pstmt, rs);
         }
         
      }
   
}