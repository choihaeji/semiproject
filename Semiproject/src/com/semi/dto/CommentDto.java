package com.semi.dto;

import java.util.Date;

public class CommentDto {
   private int boardNo;
   private int comment_No;
   private String comment_Content;
   private String comment_Id;
   private String regdate;
   
   public CommentDto() {
      super();
   }
   
   public CommentDto(int boardNo, int comment_No, String comment_Content, String comment_Id, String regdate) {
      super();
      this.boardNo = boardNo;
      this.comment_No = comment_No;
      this.comment_Content = comment_Content;
      this.comment_Id = comment_Id;
      this.regdate = regdate;
   }

   public CommentDto(int boardNo, String comment_Content, String comment_Id) {
      this.boardNo = boardNo;
      this.comment_Content = comment_Content;
      this.comment_Id = comment_Id;
   }

   public int getBoardNo() {
      return boardNo;
   }

   public void setBoardNo(int boardNo) {
      this.boardNo = boardNo;
   }

   public int getComment_No() {
      return comment_No;
   }

   public void setComment_No(int comment_No) {
      this.comment_No = comment_No;
   }

   public String getComment_Content() {
      return comment_Content;
   }

   public void setComment_Content(String comment_Content) {
      this.comment_Content = comment_Content;
   }

   public String getComment_Id() {
      return comment_Id;
   }

   public void setComment_Id(String comment_Id) {
      this.comment_Id = comment_Id;
   }

   public String getRegdate() {
      return regdate;
   }

   public void setRegdate(String regdate) {
      this.regdate = regdate;
   }

   @Override
   public String toString() {
      return "CommentDto [boardNo=" + boardNo + ", comment_No=" + comment_No + ", comment_Content=" + comment_Content
            + ", comment_Id=" + comment_Id + ", regdate=" + regdate + "]";
   }
   
}