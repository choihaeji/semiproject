package com.semi.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.semi.dao.BoardDao;
import com.semi.dao.MemberDao;
import com.semi.dto.BoardDto;

@WebServlet("/Board.do")
public class BoardController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
    public BoardController() {
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");
		
		String command = request.getParameter("command");
		System.out.println("[command: "+command+"]");
		
		BoardDao dao = new BoardDao();
		
		if(command.equals("boardlist")) {
			response.sendRedirect("boardlist.jsp");
		}
		else if(command.equals("boardview")) {
			int boardNum = Integer.parseInt(request.getParameter("boardNum"));
			
			request.setAttribute("boardNum", boardNum);
			dispatch("boardview.jsp",request,response);
		}
		else if(command.equals("delete")){
			int boardNum = Integer.parseInt(request.getParameter("boardNum"));
			int res = dao.delete(boardNum);
			
			if(res>0) {
				System.out.println("삭제 성공");
				jsResponse("글 삭제 성공", "boardlist.jsp", response);
			}
			else {
				System.out.println("삭제 실패");
				jsResponse("글 삭제 실패","boardview.jsp?boardNum="+boardNum, response);
			}
		}
		else if(command.equals("update")) {
			int boardNum = Integer.parseInt(request.getParameter("boardNum"));
			String boardTitle = request.getParameter("boardTitle");
			String boardContent = request.getParameter("boardContent");
			
			int res = dao.update(boardNum, boardTitle, boardContent);
			
			if(res>0) {
				System.out.println("수정 성공");
				jsResponse("글 수정 성공", "board.do?command=boardview&boardNum="+boardNum, response);
			}
			else {
				System.out.println("수정 실패");
				jsResponse("글 수정 실패","boardupdate.jsp?boardNum="+boardNum, response);
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
	
	private void dispatch(String url, HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		RequestDispatcher dispatch = request.getRequestDispatcher(url);
		
		dispatch.forward(request, response);
		
	}
	
}
