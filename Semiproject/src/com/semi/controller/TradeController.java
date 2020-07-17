package com.semi.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.json.simple.JSONArray;

import com.semi.dao.MemberDao;
import com.semi.dao.StockDao;
import com.semi.dao.TradeDao;
import com.semi.dto.MemberDto;
import com.semi.dto.StockDto;
import com.semi.dto.TradeDto;

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
		System.out.println("command: "+command);
		
		HttpSession session = request.getSession();
		
		MemberDao memberDao = new MemberDao();
		TradeDao tradeDao = new TradeDao();
		StockDao stockDao = new StockDao();
		
		MemberDto login = (MemberDto)session.getAttribute("dto");
		System.out.println("login: "+login);
		
		
		if(command.equals("trading")) {
			//모의거래폼
			if(login != null) {				
				String loginid = login.getId();
				String loginpw = login.getPw();

				MemberDto member = memberDao.login(loginid,loginpw);
				List<TradeDto> trade = tradeDao.holdingStock(loginid);			
				
				request.setAttribute("member", member);
				request.setAttribute("trade", trade);
				dispatch("trading.jsp",request,response);	
			}else {
				//로그인 폼으로 보내주기 (command값 수정해야됨)
				jsResponse("로그인이 필요한 서비스 입니다.","index.jsp",response);
			}
			
			dispatch("trading.jsp",request,response);
			
		}else if(command.equals("tradesell")) {
			//매도버튼 클릭시(아이디,종목명,현재가,수량)
			String stockName = request.getParameter("stockName");
			int price = Integer.parseInt(request.getParameter("price"));
			int countsell = Integer.parseInt(request.getParameter("countsell"));
			String loginid = login.getId();
			TradeDto membertd = new TradeDto(loginid,stockName,countsell,price);
			
			int res = tradeDao.sell(membertd);
			
			if(res>0) {
				jsResponse("매도에 성공하셨습니다.","trading.jsp",response);
			}else {
				
			}
			
		}else if(command.equals("tradebuyform")) {
			//기업검색 후 기업검색 뿌려주기
			String stockName = request.getParameter("stockName");
			
		
			
		}else if(command.equals("tradebuy")) {
			//매수버튼 클릭시(아이디,종목명,현재가,수량)

			String stockName = request.getParameter("stockName");
			int price = Integer.parseInt(request.getParameter("price"));
			int countbuy = Integer.parseInt(request.getParameter("countbuy"));
			String loginid = login.getId();
			
			TradeDto membertd = new TradeDto(loginid,stockName,countbuy,price);
			
			if(price*countbuy>login.getAccount()) {
				//충전가능한 페이지로 보내줌(수정해야함)
				jsResponse("잔액이 부족합니다.","trade.do?command=trading",response);
			}else {
				int res = tradeDao.buy(membertd);
				
				if(res>0) {
					jsResponse("매수에 성공하셨습니다.","trade.do?command=tradebuyform",response);
				}else {
					jsResponse("매수에 실패하셨습니다.","trade.do?command=tradebuyform",response);
				}
			}
				
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
