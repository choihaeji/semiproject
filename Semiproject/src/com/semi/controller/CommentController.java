package com.semi.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.semi.dao.CommentDao;
import com.semi.dto.CommentDto;

@WebServlet("/Comment")
public class CommentController extends HttpServlet {
   private static final long serialVersionUID = 1L;
       
    public CommentController() {
        super();
    }

   protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
      String command = request.getParameter("command");
      System.out.println("[command: "+command+"]");
      
      CommentDao dao = new CommentDao();
      
      if(command.equals("insert")) {
         int boardNum = Integer.parseInt(request.getParameter("boardNum"));
         String comment_Content = request.getParameter("commentContent");
         String comment_Id = request.getParameter("commentID");
         
         CommentDto dto = new CommentDto(boardNum,comment_Content,comment_Id);
         
         int res = dao.writeComment(dto);
         
         if(res>0) {
            System.out.println("댓글 작성 완료");
            jsResponse("댓글 작성 완료","boardview.jsp?boardNum="+boardNum,response);
         }
         
         else {
            System.out.println("댓글 작성 실패");
            jsResponse("댓글 작성 실패","boardview.jsp?boardNum="+boardNum,response);
         }
      }
      else if(command.equals("delete")) {
          int comment_No = Integer.parseInt(request.getParameter("commentNo"));
          int boardNum = Integer.parseInt(request.getParameter("boardNum"));
          
          int res = dao.deleteComment(comment_No);
          
          if(res>0) {
             System.out.println("댓글 삭제 완료");
             jsResponse("댓글 삭제 완료","boardview.jsp?boardNum="+boardNum,response);
          }
          
          else {
             System.out.println("댓글 삭제 실패");
             jsResponse("댓글 삭제 실패","boardview.jsp?boardNum="+boardNum,response);
          }
       }
   }

   protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
      doGet(request, response);
   }
   
   private void jsResponse(String msg, String url, HttpServletResponse response) throws IOException {
      String s = "<script type='text/javascript'>"+
            "alert('"+msg+"');"+
            "location.href='"+url+"';"+
            "</script>";
         
      PrintWriter out = response.getWriter();
      out.print(s);
   }
}