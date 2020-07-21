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
import javax.servlet.jsp.PageContext;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;

import com.semi.dao.MemberDao;
import com.semi.dao.StockDao;
import com.semi.dao.TradeDao;
import com.semi.dto.MemberDto;
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
		
		HttpSession session = request.getSession(true);
		
		MemberDao memberDao = new MemberDao();
		TradeDao tradeDao = new TradeDao();
		StockDao stockDao = new StockDao();
		
		JSONArray stockinfo = null;
		
		MemberDto member = new MemberDto();
		MemberDto login = new MemberDto();
		
		String stockName = null;
		String loginid = null;
		String loginpw = null;
		String code = null;
		int price = 0;
		
		if(command.equals("trading")) {
			login = (MemberDto)session.getAttribute("dto");
			System.out.println("login: "+login.getId());
			
			//모의거래폼
			if(login != null) {				
				loginid = login.getId();
				loginpw = login.getPw();

				member = memberDao.login(loginid,loginpw);
				List<TradeDto> trade = tradeDao.holdingStock(loginid);	
				
				//현재가 받아오기
				List<Integer> nowPrice = null;
				
				for(int i=0; i<trade.size();i++) {
					code = tradeDao.transCode(trade.get(i).getstockName());
					price = stockDao.getStockPrice(code);
					nowPrice.add(price);
				}
				
				request.setAttribute("member", member);
				request.setAttribute("trade", trade);
				request.setAttribute("nowPrice", nowPrice);
				dispatch("trading.jsp",request,response);
				
			}else {
				//로그인 폼으로 보내주기 (command값 수정해야됨)
				//jsResponse("로그인이 필요한 서비스 입니다.","index.jsp",response);
				dispatch("trading.jsp",request,response);
			}
			
			
		}else if(command.equals("tradesellform")) {
			
		}else if(command.equals("tradesell")) {
			login = (MemberDto)session.getAttribute("dto");
			System.out.println("login: "+login);
			//매도버튼 클릭시(아이디,종목명,현재가,수량)
			stockName = request.getParameter("stockName");
			price = Integer.parseInt(request.getParameter("price"));
			int countsell = Integer.parseInt(request.getParameter("countsell"));
			loginid = login.getId();
			
			TradeDto membertd = new TradeDto(loginid,stockName,countsell,price);
			
			int res = tradeDao.sell(membertd);
			
			if(res>0 ) {
				jsResponse("매도에 성공하셨습니다.","trade.do?command=trading",response);
			}else {
				jsResponse("매도에 실패하셨습니다.","trade.do?command=trading",response);
			}
			
		}else if(command.equals("tradebuyform")) {
			login = (MemberDto)session.getAttribute("dto");
			System.out.println("login: "+login);
			//매수폼
			//기업검색 후 기업검색 뿌려주기(매수페이지)
			
			member = memberDao.login(loginid,loginpw);
			System.out.println(member.getName());
			stockName = request.getParameter("stockName");
			System.out.println(stockName);
			code = tradeDao.transCode(stockName);
			
			if(code!=null||stockName!="") {
				price = stockDao.getStockPrice(code);
				System.out.println("code: "+code+", price:"+price);
				
				request.setAttribute("member", member);
				request.setAttribute("price", price);
				request.setAttribute("stockName", stockName);
				dispatch("tradebuying.jsp",request,response);
			}else {
				jsResponse("기업명을 입력해 주세요.","trade.do?command=trading",response);
			}
			
		}else if(command.equals("tradebuy")) {
			login = (MemberDto)session.getAttribute("dto");
			System.out.println("login: "+login);
			//매수버튼 클릭시(아이디,종목명,현재가,수량)

			String stock = request.getParameter("stock");
			int priceNow = Integer.parseInt(request.getParameter("priceNow"));
			int countbuy = Integer.parseInt(request.getParameter("countbuy"));
			System.out.println("stockName:"+stock+"price:"+priceNow);
			loginid = login.getId();
			
			TradeDto membertd = new TradeDto(loginid,stock,countbuy,priceNow);
			
			if(priceNow*countbuy>login.getAccount()) {
				
				//충전가능한 페이지로 보내줌(수정해야함)
				jsResponse("잔액이 부족합니다.","trade.do?command=trading",response);
			}else {
				int res = tradeDao.buy(membertd);
				
				if(res>0) {
					String s = "<script type='text/javascript'>"
							+ "alert('매수에 성공하셨습니다.');"
							+ "self.close();"
							+ "</script>";
					
					PrintWriter out = response.getWriter();
					out.print(s);
				}else {
					String s = "<script type='text/javascript'>"
							+ "alert('매수에 실패하셨습니다.');"
							+"self.close();"
							+ "</script>";
					
					PrintWriter out = response.getWriter();
					out.print(s);
				}
			}
				
		}else if(command.equals("ajax")) {
			int count = Integer.parseInt(request.getParameter("count"));
			price = Integer.parseInt(request.getParameter("price"));
			
			System.out.println("개수: "+count+"가격:"+price);
			int allPrice = count*price;
			
			JSONObject obj = new JSONObject();
			obj.put("allPrice", allPrice);
			System.out.println(obj);
			
			PrintWriter out = response.getWriter();
			out.print(obj.toJSONString());
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
