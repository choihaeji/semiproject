package com.semi.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.semi.dto.MemberDto;

@WebServlet("/TradeController")
public class TradeController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public TradeController() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");
		
		String command = request.getParameter("command");
		
		HttpSession session = request.getSession();
		MemberDto login = (MemberDto)session.getAttribute("dto");
		String loginid = login.getId();
		
		if(command.equals("index")) {
			response.sendRedirect("index.jsp'");
		}else if(command.equals("trading")) {
			
			if(loginid == null) {
				//로그인 폼으로 보내주기 (로그인폼 수정해야함)
				jsResponse("로그인이 필요한 서비스 입니다.","member.do?command=loginform",response);
			}else {
				dispatch("trading.jsp",request,response);
			}
		}else if(command.equals("tradesell")) {
			//매도
		}else if(command.equals("tradebuy")) {
			//매수
		}
			
		
	
	}



	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}
	
	private void jsResponse(String msg, String url, HttpServletResponse response) throws IOException {
		String s = "<script type='text/javascript'>"
				+ "alert('"+msg+"');"
				+ "location.href='"+url+"';"
				+ "</script>";
		
		PrintWriter out = response.getWriter();
		out.print(s);
	}
	
	private void dispatch(String url, HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		RequestDispatcher dispatch = request.getRequestDispatcher(url);
		dispatch.forward(request, response);
	}
}
