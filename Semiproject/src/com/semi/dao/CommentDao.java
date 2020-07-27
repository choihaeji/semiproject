package com.semi.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import com.semi.dto.CommentDto;
import common.JDBCTemplate;

public class CommentDao extends JDBCTemplate{
   
   //전체 댓글 리스트 가져오기
   public ArrayList<CommentDto> getComment(int boardNum){
      Connection con = getConnection();
      PreparedStatement pstm = null;
      ResultSet rs = null;
      
      String sql = " SELECT * FROM BOARD_COMMENT WHERE BOARDNO=? ORDER BY COMMENT_NO DESC ";
      ArrayList<CommentDto> list = new ArrayList<CommentDto>();
      
      try {
         pstm = con.prepareStatement(sql);
         pstm.setInt(1, boardNum);
         System.out.println("03. query 준비 : "+sql);
         
         rs = pstm.executeQuery();
         System.out.println("04. query 실행 및 리턴");
         
         while (rs.next()) {
            CommentDto dto = new CommentDto();
            dto.setBoardNo(rs.getInt(1));
            dto.setComment_No(rs.getInt(2));
            dto.setComment_Content(rs.getString(3));
            dto.setComment_Id(rs.getString(4));
            dto.setRegdate(rs.getString(5));
            
            list.add(dto);
         }
         
      } catch (SQLException e) {
         System.out.println("3/4단계 에러");
         e.printStackTrace();
      }finally {
         close(rs);
         close(pstm);
         close(con);
         System.out.println("05. 종료");
      }
      return list;
   }
   
   //댓글 작성
   public int writeComment(CommentDto dto) {
      Connection con = getConnection();
      PreparedStatement pstm = null;
      int res=0;
      
      String sql = " INSERT INTO BOARD_COMMENT VALUES(?,COMMENTSQ.NEXTVAL,?,?,SYSDATE) ";
      
      try {
         pstm = con.prepareStatement(sql);
         pstm.setInt(1, dto.getBoardNo());
         pstm.setString(2, dto.getComment_Content());
         pstm.setString(3, dto.getComment_Id());
         System.out.println("03. query 준비 : "+sql);
         
         res = pstm.executeUpdate();
         System.out.println("04. query 실행 및 리턴");
         
         if(res>0) {
            commit(con);
         }
      } catch (SQLException e) {
         System.out.println("3/4단계 에러");
         e.printStackTrace();
      }finally {
         close(pstm);
         close(con);
         System.out.println("05. 종료");
      }
      
      return res;
   }
   
   public int deleteComment(int comment_No) {
	      Connection con = getConnection();
	      PreparedStatement pstm = null;
	      int res=0;
	      
	      String sql = " DELETE FROM BOARD_COMMENT WHERE COMMENT_NO=? ";
	      
	      try {
	         pstm = con.prepareStatement(sql);
	         pstm.setInt(1, comment_No);
	         System.out.println("03. query 준비 : "+sql);
	         
	         res = pstm.executeUpdate();
	         System.out.println("04. query 실행 및 리턴");
	         
	         if(res>0) {
	            commit(con);
	         }
	      } catch (SQLException e) {
	         System.out.println("3/4단계 에러");
	         e.printStackTrace();
	      }finally {
	         close(pstm);
	         close(con);
	         System.out.println("05. 종료");
	      }
	      
	      return res;
	   }
   
}