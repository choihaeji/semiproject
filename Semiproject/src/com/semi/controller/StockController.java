package com.semi.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;

import com.semi.dao.StockDao;

@WebServlet("/StockController")
public class StockController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public StockController() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");
		
		String command = request.getParameter("command");
		StockDao sd = new StockDao();
		
		if(command.equals("stock_search_list")) {
			String str = request.getParameter("stock");
			PrintWriter out = response.getWriter();
			
			//주식명 검색
			JSONArray listInfo = sd.getStockList(str);
			System.out.println(listInfo);
			out.println(listInfo.toJSONString());
			
		}else if(command.equals("stockSelOne")) {
			String code = request.getParameter("stockCode");
			PrintWriter out = response.getWriter();
			System.out.println(code);
			
			JSONObject stockInfo = sd.StockInfo(code); 
			System.out.println(stockInfo);
			out.println(stockInfo.toJSONString());
		}else if(command.equals("stock_rank")) {
			String page = request.getParameter("page");
			String kos = request.getParameter("kos");
			
			System.out.println(page);
			System.out.println(kos);
			
			if(page == null) {
				page = "1";
			}
			if(kos == null) {
				kos = "p";
			}
			
			System.out.println(page);
			System.out.println(kos);
			
			JSONObject rank = sd.getStockRank(page ,kos);
			System.out.println(rank.toString());
			
			request.setAttribute("rank", rank);
			RequestDispatcher dispatch = request.getRequestDispatcher("stock_list.jsp?kos="+ kos +"&page="+page);
			dispatch.forward(request, response);
		}
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
