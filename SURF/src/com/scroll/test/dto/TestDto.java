package com.scroll.test.dto;

import java.sql.Date;

public class TestDto {
   private String userid;
   private String name;
   private String date;
   private String content;
   private String videorealname;
   private String picrealname;
   private String link;
   private int p;
   private String username;
   private int bnum;
   private int rnum;
   private String rcontent;
   private String rdate;
   public String getLink() {
      return link;
   }
   public void setLink(String link) {
      this.link = link;
   }
   public String getUserid() {
      return userid;
   }
   public void setUserid(String userid) {
      this.userid = userid;
   }
   private int tnum ;
   
   public int getTnum() {
      return tnum;
   }
   public void setTnum(int tnum) {
      this.tnum = tnum;
   }
   public String getPicrealname() {
      return picrealname;
   }
   public void setPicrealname(String picrealname) {
      this.picrealname = picrealname;
   }
   public String getVideorealname() {
      return videorealname;
   }
   public void setVideorealname(String videorealname) {
      this.videorealname = videorealname;
   }
   private int rownum;
   public String getName() {
      return name;
   }
   public void setName(String name) {
      this.name = name;
   }
   public String getDate() {
      return date;
   }
   public void setDate(String date) {
      this.date = date;
   }
   public String getContent() {
      return content;
   }
   public void setContent(String content) {
      this.content = content;
   }
   public int getRownum() {
      return rownum;
   }
   public void setRownum(int rownum) {
      this.rownum = rownum;
   }
   public int getP() {
      return p;
   }
   public void setP(int p) {
      this.p = p;
   }
   public String getUsername() {
      return username;
   }
   public void setUsername(String username) {
      this.username = username;
   }
   public int getBnum() {
      return bnum;
   }
   public void setBnum(int bnum) {
      this.bnum = bnum;
   }
   public int getRnum() {
      return rnum;
   }
   public void setRnum(int rnum) {
      this.rnum = rnum;
   }
   public String getRcontent() {
      return rcontent;
   }
   public void setRcontent(String rcontent) {
      this.rcontent = rcontent;
   }
   public String getRdate() {
      return rdate;
   }
   public void setRdate(String rdate) {
      this.rdate = rdate;
   }
   
}