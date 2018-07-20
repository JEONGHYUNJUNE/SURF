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
import com.scroll.test.dto.MemberVO;

import util.DBManager;


public class MemberDAO {
   public MemberDAO() {
   }
   
   private static MemberDAO instance = new MemberDAO();

   public static MemberDAO getInstance() {
      return instance;
   }

   public Connection getConnection() throws Exception {
      Connection conn = null;
      Context initContext = new InitialContext();
      Context envContext = (Context) initContext.lookup("java:/comp/env");
      DataSource ds = (DataSource) envContext.lookup("jdbc/myoracle");
      conn = ds.getConnection();
      return conn;
   }

   // 사용자 인증시 사용하는 메소드
   public int userCheck(String userid, String pwd) {
      System.out.println("유져체크");
      int result = -1;
      String sql = "select userpwd from surfmember where userid=?";
      Connection conn = null;
      PreparedStatement pstmt = null;
      ResultSet rs = null;
      try {
         conn = getConnection();
         pstmt = conn.prepareStatement(sql);
         pstmt.setString(1, userid);
         rs = pstmt.executeQuery();
         
         if (rs.next()) {
            if (rs.getString("userpwd") != null
                  && rs.getString("userpwd").equals(pwd)) {
               result = 1;
            } else {
               result = 0;
            }
         } else {
            result = -1;
         }
      } catch (Exception e) {
         e.printStackTrace();
      } finally {
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
      return result;
   }

   // 아이디로 회원 정보 가져오는 메소드
   public MemberVO getMember(String userid) {
      MemberVO mVo = null;
      String sql = "select * from surfmember where userid=?";
      Connection conn = null;
      PreparedStatement pstmt = null;
      ResultSet rs = null;
      try {
         conn = getConnection();
         pstmt = conn.prepareStatement(sql);
         pstmt.setString(1, userid);
         rs = pstmt.executeQuery();
         if (rs.next()) {
            mVo = new MemberVO();
            mVo.setUsername(rs.getString("username"));
            mVo.setUserid(rs.getString("userid"));
            mVo.setUserpwd(rs.getString("userpwd"));
            mVo.setEmail(rs.getString("email"));
            mVo.setPhonenum(rs.getString("phonenum"));
            mVo.setSurfaddress(rs.getString("surfaddress"));
            mVo.setProfilepic(rs.getString("profilepic"));
            mVo.setProfilebg(rs.getString("profilebg"));
         }
      } catch (Exception e) {
         e.printStackTrace();
      } finally {
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
      return mVo;
   }
   public MemberVO getsurfMember(String userid,String loc) {
	   MemberVO mVo = null;
	   String sql = "select * from surfmember where userid=? and surfaddress=?";
	   Connection conn = null;
	   PreparedStatement pstmt = null;
	   ResultSet rs = null;
	   try {
		   conn = getConnection();
		   pstmt = conn.prepareStatement(sql);
		   pstmt.setString(1, userid);
		   pstmt.setString(2, loc);
		   rs = pstmt.executeQuery();
		   if (rs.next()) {
			   mVo = new MemberVO();
			   mVo.setUsername(rs.getString("username"));
			   mVo.setUserid(rs.getString("userid"));
			   mVo.setUserpwd(rs.getString("userpwd"));
			   mVo.setEmail(rs.getString("email"));
			   mVo.setPhonenum(rs.getString("phonenum"));
			   mVo.setSurfaddress(rs.getString("surfaddress"));
			   mVo.setProfilepic(rs.getString("profilepic"));
			   mVo.setProfilebg(rs.getString("profilebg"));
		   }
	   } catch (Exception e) {
		   e.printStackTrace();
	   } finally {
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
	   return mVo;
   }

   public int confirmID(String userid) {
      int result = -1;
      String sql = "select userid from surfmember where userid=?";
      Connection conn = null;
      PreparedStatement pstmt = null;
      ResultSet rs = null;
      try {
         conn = getConnection();
         pstmt = conn.prepareStatement(sql);
         pstmt.setString(1, userid);
         rs = pstmt.executeQuery();
         if (rs.next()) {
            result = 1;
         } else {
            result = -1;
         }
      } catch (Exception e) {
         e.printStackTrace();
      } finally {
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
      return result;
   }
   public int confirmPhone(String phone) {
         int result = -1;
         String sql = "select phonenum from surfmember where phonenum=?";
         Connection conn = null;
         PreparedStatement pstmt = null;
         ResultSet rs = null;
         try {
            conn = getConnection();
            pstmt = conn.prepareStatement(sql);
            pstmt.setString(1, phone);
            rs = pstmt.executeQuery();
            if (rs.next()) {
               result = 1;
            } else {
               result = -1;
            }
         } catch (Exception e) {
            e.printStackTrace();
         } finally {
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
         return result;
      }
   public int confirmName(String name) {
         int result = -1;
         String sql = "select username from surfmember where username=?";
         Connection conn = null;
         PreparedStatement pstmt = null;
         ResultSet rs = null;
         try {
            conn = getConnection();
            pstmt = conn.prepareStatement(sql);
            pstmt.setString(1, name);
            rs = pstmt.executeQuery();
            if (rs.next()) {
               result = 1;
            } else {
               result = -1;
            }
         } catch (Exception e) {
            e.printStackTrace();
         } finally {
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
         return result;
      }
   public String getPicture(String userid) {
         String result = "";
         String sql = "select profilepic from surfmember where userid=?";
         Connection conn = null;
         PreparedStatement pstmt = null;
         ResultSet rs = null;
         try {
            conn = getConnection();
            pstmt = conn.prepareStatement(sql);
            pstmt.setString(1, userid);
            rs = pstmt.executeQuery();
            if (rs.next()) {
               result = rs.getString("profilepic");
            }
         } catch (Exception e) {
            e.printStackTrace();
         } finally {
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
         return result;
      }
   public ArrayList<MemberVO> fsearch(String username){
      String sql = "select userid,username,profilepic from surfmember where username like ?";
      ArrayList<MemberVO> userlist = new ArrayList<MemberVO>();
      MemberVO dto;
      Connection conn = null;
      PreparedStatement pstmt = null;
      ResultSet rs = null;
      try {
         conn = getConnection();
            pstmt = conn.prepareStatement(sql);
            pstmt.setString(1, "%"+username+"%");
            
            rs = pstmt.executeQuery();
            while (rs.next()) {
                dto = new MemberVO();
                dto.setUserid(rs.getString("userid"));
                dto.setUsername(rs.getString("username"));
                dto.setProfilepic(rs.getString("profilepic"));
                
                userlist.add(dto);
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
      return userlist;
   }
   
   public String IdFind(String name,String phone) {
         String result = "fail";
         String sql = "select userid from surfmember where username=? and phonenum = ?";
         Connection conn = null;
         PreparedStatement pstmt = null;
         ResultSet rs = null;
         try {
            conn = getConnection();
            pstmt = conn.prepareStatement(sql);
            pstmt.setString(1, name);
            pstmt.setString(2, phone);
            rs = pstmt.executeQuery();
            if (rs.next()) {
              MemberVO mVo = new MemberVO();
                mVo.setUserid(rs.getString("userid"));
               result = mVo.getUserid();
            } else {
               result = "fail";
            }
         } catch (Exception e) {
            e.printStackTrace();
         } finally {
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
         return result;
      }
   public String PwFind(String userid, String name,String email) {
         String result = "fail";
         String sql = "select userpwd from surfmember where userid = ? and username=? and email = ?";
         Connection conn = null;
         PreparedStatement pstmt = null;
         ResultSet rs = null;
         try {
            conn = getConnection();
            pstmt = conn.prepareStatement(sql);
            pstmt.setString(1, userid);
            pstmt.setString(2, name);
            pstmt.setString(3, email);
            rs = pstmt.executeQuery();
            if (rs.next()) {
              MemberVO mVo = new MemberVO();
                mVo.setUserpwd(rs.getString("userpwd"));
               result = mVo.getUserpwd();
            } else {
               result = "fail";
            }
         } catch (Exception e) {
            e.printStackTrace();
         } finally {
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
         return result;
      }

   public void insertMember(String userid,String pw,String name,String email,String phone) {
         String sql = "insert into surfmember(userid,userpwd,username,email,phonenum) values(?,?,?,?,?)";
         Connection conn = null;
         PreparedStatement pstmt = null;
         try {
            conn = getConnection();
            pstmt = conn.prepareStatement(sql);
            pstmt.setString(1, userid);
            pstmt.setString(2, pw);
            pstmt.setString(3, name);
            pstmt.setString(4, email);
            pstmt.setString(5, phone);
            pstmt.executeUpdate();
         } catch (Exception e) {
            e.printStackTrace();
         } finally {
            try {
               if (pstmt != null)
                  pstmt.close();
               if (conn != null)
                  conn.close();
            } catch (Exception e) {
               e.printStackTrace();
            }
         }
        
      }
   public void PwChange(String userid,String pw) {
         String sql = "update surfmember set userpwd=? where userid=?";
         Connection conn = null;
         PreparedStatement pstmt = null;
         try {
            conn = getConnection();
            pstmt = conn.prepareStatement(sql);
            pstmt.setString(1, pw);
            pstmt.setString(2, userid);
            
            pstmt.executeUpdate();
         } catch (Exception e) {
            e.printStackTrace();
         } finally {
            try {
               if (pstmt != null)
                  pstmt.close();
               if (conn != null)
                  conn.close();
            } catch (Exception e) {
               e.printStackTrace();
            }
         }
        
      }
   public void SurfChange(String userid,String loc) {
	   String sql = "update surfmember set surfaddress=? where userid=?";
	   Connection conn = null;
	   PreparedStatement pstmt = null;
	   try {
		   conn = getConnection();
		   pstmt = conn.prepareStatement(sql);
		   pstmt.setString(1, loc);
		   pstmt.setString(2, userid);
		   
		   pstmt.executeUpdate();
	   } catch (Exception e) {
		   e.printStackTrace();
	   } finally {
		   try {
			   if (pstmt != null)
				   pstmt.close();
			   if (conn != null)
				   conn.close();
		   } catch (Exception e) {
			   e.printStackTrace();
		   }
	   }
	   
   }
   public void picupdate(String profilepic,  String userid) {
         int result = -1;
         String sql = "update surfmember set profilepic = ? where userid=?";
         Connection conn = null;
         PreparedStatement pstmt = null;
         try {
             conn = getConnection();
                  pstmt = conn.prepareStatement(sql);
                  pstmt.setString(1, profilepic);
                  pstmt.setString(2, userid);
            result = pstmt.executeUpdate();
         } catch (Exception e) {
            e.printStackTrace();
         } finally {
            try {
               if (pstmt != null)
                  pstmt.close();
               if (conn != null)
                  conn.close();
            } catch (Exception e) {
               e.printStackTrace();
            }
         }
      }
   public void bgupdate(String profilebg,  String userid) {
      int result = -1;
      String sql = "update surfmember set profilebg = ? where userid=?";
      Connection conn = null;
      PreparedStatement pstmt = null;
      try {
          conn = getConnection();
               pstmt = conn.prepareStatement(sql);
               pstmt.setString(1, profilebg);
               pstmt.setString(2, userid);
         result = pstmt.executeUpdate();
      } catch (Exception e) {
         e.printStackTrace();
      } finally {
         try {
            if (pstmt != null)
               pstmt.close();
            if (conn != null)
               conn.close();
         } catch (Exception e) {
            e.printStackTrace();
         }
      }
   }
   public ArrayList<MemberVO> randomfriend(String userid) {
	   MemberVO mVO = null;
	   String sql =  "select userid,username from surfmember where userid not in (select userid from friendlist_"+userid+") and userid != '"+userid+"'and surfaddress in (select surfaddress from surfmember where userid = '"+userid+"')";
	   ArrayList<MemberVO> list = new ArrayList<MemberVO>();
	   Connection conn = null;
	   Statement stmt = null;
	   ResultSet rs = null;
	   try {
		   conn = DBManager.getConnection();
		   stmt = conn.createStatement();
		   rs = stmt.executeQuery(sql);
		   while (rs.next()) {
			   mVO = new MemberVO();
			   mVO.setUserid(rs.getString("userid"));
			   mVO.setUsername(rs.getString("username"));
			   list.add(mVO);
		   }
	   } catch (SQLException e) {
		   e.printStackTrace();
	   } finally {
		   DBManager.close(conn, stmt, rs);
	   }
	   return list;
   }
   
   public void ProfileUpdate(String userid,String pw,String name,String email,String phone) {
       String sql = "update surfmember set userpwd=?,username=?,email=?,phonenum=? where userid=?";
       Connection conn = null;
       PreparedStatement pstmt = null;
       try {
          conn = getConnection();
          pstmt = conn.prepareStatement(sql);
          pstmt.setString(1, pw);
          pstmt.setString(2, name);
          pstmt.setString(3, email);
          pstmt.setString(4, phone);
          pstmt.setString(5, userid);
          pstmt.executeUpdate();
       } catch (Exception e) {
          e.printStackTrace();
       } finally {
          try {
             if (pstmt != null)
                pstmt.close();
             if (conn != null)
                conn.close();
          } catch (Exception e) {
             e.printStackTrace();
          }
       }
      
    }
 public void delmember(String userid) {
       String sql = "delete from surfmember where userid = ?";
       Connection conn = null;
       PreparedStatement pstmt = null;
       try {
          conn = getConnection();
          pstmt = conn.prepareStatement(sql);
          pstmt.setString(1, userid);
          pstmt.executeUpdate();
       } catch (Exception e) {
          e.printStackTrace();
       } finally {
          try {
             if (pstmt != null)
                pstmt.close();
             if (conn != null)
                conn.close();
          } catch (Exception e) {
             e.printStackTrace();
          }
       }
      
    }
 public ArrayList<MemberVO> getUserid() {
     ArrayList<MemberVO> list = new ArrayList<MemberVO>();
   MemberVO mVo = null;
   String sql = "select userid from surfmember";
   Connection conn = null;
   Statement stmt = null;
   ResultSet rs = null;
   try {
      conn = getConnection();
      stmt = conn.createStatement();
      rs = stmt.executeQuery(sql);
      while (rs.next()) {
            mVo = new MemberVO();
            mVo.setUserid(rs.getString("userid"));
            list.add(mVo);
       }
   } catch (Exception e) {
      e.printStackTrace();
   } finally {
      try {
         if (rs != null)
            rs.close();
         if (stmt != null)
            stmt.close();
         if (conn != null)
            conn.close();
      } catch (Exception e) {
         e.printStackTrace();
      }
   }
   return list;
}
 public void friendnamechange(String userid, String name) {
     ArrayList<MemberVO> list = getUserid();
       MemberVO mVo = new MemberVO();
     mVo = getMember(userid);
     for(int i = 0;i<list.size();i++) {
     String table = "friendlist_"+list.get(i).getUserid();
       String sql = "update "+table+" set username = ? where userid = ?";
     Connection conn = null;
     PreparedStatement pstmt = null;
     try {
        conn = getConnection();
        pstmt = conn.prepareStatement(sql);
        pstmt.setString(1, name);
        pstmt.setString(2, userid);
        pstmt.executeUpdate();
     } catch (Exception e) {
        e.printStackTrace();
     } finally {
        try {
           if (pstmt != null)
              pstmt.close();
           if (conn != null)
              conn.close();
        } catch (Exception e) {
           e.printStackTrace();
        }
     }
     }
  }
   /*public int insertMember(MemberVO mVo) {
      int result = -1;
      String sql = "insert into member02 values(?, ?, ?, ?, ?, ?)";
      Connection conn = null;
      PreparedStatement pstmt = null;
      try {
         conn = getConnection();
         pstmt = conn.prepareStatement(sql);
         pstmt.setString(1, mVo.getName());
         pstmt.setString(2, mVo.getUserid());
         pstmt.setString(3, mVo.getPwd());
         pstmt.setString(4, mVo.getEmail());
         pstmt.setString(5, mVo.getPhone());
         pstmt.setInt(6, mVo.getAdmin());
         result = pstmt.executeUpdate();
      } catch (Exception e) {
         e.printStackTrace();
      } finally {
         try {
            if (pstmt != null)
               pstmt.close();
            if (conn != null)
               conn.close();
         } catch (Exception e) {
            e.printStackTrace();
         }
      }
      return result;
   }

   public int updateMember(MemberVO mVo) {
      int result = -1;
      String sql = "update member02 set pwd=?, email=?,"
            + "phone=?, admin=? where userid=?";
      Connection conn = null;
      PreparedStatement pstmt = null;
      try {
         conn = getConnection();
         pstmt = conn.prepareStatement(sql);
         pstmt.setString(1, mVo.getPwd());
         pstmt.setString(2, mVo.getEmail());
         pstmt.setString(3, mVo.getPhone());
         pstmt.setInt(4, mVo.getAdmin());
         pstmt.setString(5, mVo.getUserid());
         result = pstmt.executeUpdate();
      } catch (Exception e) {
         e.printStackTrace();
      } finally {
         try {
            if (pstmt != null)
               pstmt.close();
            if (conn != null)
               conn.close();
         } catch (Exception e) {
            e.printStackTrace();
         }
      }
      return result;
   }
   
   public int deleteMember(MemberVO mVo) {
      int result = -1;
      String sql = "delete from surfmember where userid=?";
      Connection conn = null;
      PreparedStatement pstmt = null;
      try {
         conn = getConnection();
         
         pstmt = conn.prepareStatement(sql);
         pstmt.setString(1, mVo.getUserid());
         
         result = pstmt.executeUpdate();
      } catch (Exception e) {
         e.printStackTrace();
      } finally {
         try {
            if (pstmt != null)
               pstmt.close();
            if (conn != null)
               conn.close();
         } catch (Exception e) {
            e.printStackTrace();
         }
      }
      return result;
   }

   public ArrayList<MemberVO> getMemberAll(){
      ArrayList<MemberVO> list = new ArrayList<MemberVO>();
      int result = -1;
      String sql = "select * from member02";
      Connection conn = null;
      PreparedStatement pstmt = null;
      ResultSet rs = null;
      MemberVO memver = null;
      try {
         conn = getConnection();
         pstmt = conn.prepareStatement(sql);
         result = pstmt.executeUpdate();
         rs = pstmt.executeQuery();
         while(rs.next()){
            MemberVO dto =  new MemberVO();
            dto.setUserid(rs.getString("USERID"));
            dto.setName(rs.getString("NAME"));
            dto.setEmail(rs.getString("EMAIL"));
            dto.setPhone(rs.getString("PHONE"));
            dto.setPwd(rs.getString("PWD"));
            dto.setAdmin(Integer.parseInt(rs.getString("ADMIN")));
            list.add(dto);
         }
      } catch (Exception e) {
         e.printStackTrace();
      } finally {
         try {
            if (pstmt != null)
               pstmt.close();
            if (conn != null)
               conn.close();
         } catch (Exception e) {
            e.printStackTrace();
         }
      }*/
   /*   return list;

   }*/
}