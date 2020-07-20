package com.semi.dao;

import static common.JDBCTemplate.close;
import static common.JDBCTemplate.getConnection;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.jsoup.nodes.Document;

import com.semi.dto.StockDto;

import common.GetDocument;

public class StockDao {
	
	//
	public JSONArray getStockList(String str) {
		Connection con = getConnection();
		PreparedStatement pstm = null;
		ResultSet rs = null;
		List<StockDto> res = new ArrayList<StockDto>();
		JSONArray info = new JSONArray();;
		String sql = " SELECT * FROM STOCKBOARD WHERE STOCKNAME LIKE '%" + str + "%' ";
		try {
			pstm = con.prepareStatement(sql);
			System.out.println("03. query 준비: " + sql);
			
			rs = pstm.executeQuery();
			System.out.println("04. query 실행 및 리턴");
			
			while(rs.next()) {
				StockDto tmp = new StockDto(rs.getString("STOCKNAME"), rs.getString("STOCKCODE"));
				res.add(tmp);
			}
			
			if(res.isEmpty()) {
				JSONObject chk = new JSONObject();
				chk.put("chk", 0);
				info.add(chk);
				
				return info;
			}else {
				JSONObject chk = new JSONObject();
				chk.put("chk", 1);
				info.add(chk);
				
				for(int i=0; i<res.size(); i++) {
					GetDocument gdoc = new GetDocument();
					JSONObject jinfo = new JSONObject();
					Document doc = gdoc.getDoc(res.get(i).getStock_code());
					
					jinfo.put("stock_name", res.get(i).getStock_name());
					jinfo.put("stock_code", res.get(i).getStock_code());
					jinfo.put("price", doc.select("#chart_area > div.rate_info > div > p.no_today span.blind").get(0).text());
					jinfo.put("dod", doc.select("#chart_area > div.rate_info > div > p.no_exday > em:nth-child(2) > span.blind").get(0).text());
					//상승, 보합, 하락
					jinfo.put("dod_ud", doc.select("#chart_area > div.rate_info > div > p.no_exday > em:nth-child(2) > span.ico").get(0).text());
					jinfo.put("fluctuation", doc.select("#chart_area > div.rate_info > div > p.no_exday > em:nth-child(4) > span.blind").get(0).text());
					//+, -
					jinfo.put("fluctuation_ud", doc.select("#chart_area > div.rate_info > div > p.no_exday > em:nth-child(4) > span:nth-child(1)").get(0).text());
					jinfo.put("volume", doc.select("#chart_area > div.rate_info > table > tbody > tr:nth-child(1) > td:nth-child(3) > em > span.blind").get(0).text());
					jinfo.put("trading_val", doc.select("#chart_area > div.rate_info > table > tbody > tr:nth-child(2) > td:nth-child(3) > em > span.blind").get(0).text());
					
					info.add(jinfo);
				}
			}
			
		} catch (SQLException e) {
			System.out.println("3/4 단계 에러");
			e.printStackTrace();
		}finally {
			close(rs);
			close(pstm);
			close(con);
			System.out.println("05. db 종료\n");
		}
		
		return info;
	}

	//주식정보
	public JSONObject StockInfo(String code) {
		JSONObject info = new JSONObject();;
		GetDocument gdoc = new GetDocument();
		Document doc = gdoc.getDoc(code);
		
		info.put("stock_name", doc.select("#middle > div.h_company > div.wrap_company > h2 > a").get(0).text());
		info.put("stock_code", code);
		info.put("price", doc.select("#chart_area > div.rate_info > div > p.no_today span.blind").get(0).text());
		//전일대비
		info.put("dod", doc.select("#chart_area > div.rate_info > div > p.no_exday > em:nth-child(2) > span.blind").get(0).text());
		//상승, 보합, 하락
		info.put("dod_ud", doc.select("#chart_area > div.rate_info > div > p.no_exday > em:nth-child(2) > span.ico").get(0).text());
		//등락율
		info.put("fluctuation", doc.select("#chart_area > div.rate_info > div > p.no_exday > em:nth-child(4) > span.blind").get(0).text());
		//+, -
		info.put("fluctuation_ud", doc.select("#chart_area > div.rate_info > div > p.no_exday > em:nth-child(4) > span:nth-child(1)").get(0).text());
		//거래량
		info.put("volume", doc.select("#chart_area > div.rate_info > table > tbody > tr:nth-child(1) > td:nth-child(3) > em > span.blind").get(0).text());
		//거래대금
		info.put("trading_val", doc.select("#chart_area > div.rate_info > table > tbody > tr:nth-child(2) > td:nth-child(3) > em > span.blind").get(0).text());
		//시가총액
		info.put("price_sum", doc.select("#_market_sum").get(0).text());
		//시가총액순위
		info.put("rank", doc.select("#tab_con1 > div.first > table > tbody > tr:nth-child(2) > td > em").get(0).text());
		//상장주식수
		info.put("listed_stocks", doc.select("#tab_con1 > div.first > table > tbody > tr:nth-child(3) > td > em").get(0).text());
		
		
		return info;
	}

	//현재 주가
	public int getStockPrice(String str) {
		GetDocument gdoc = new GetDocument();
		Document doc = gdoc.getDoc(str);
		int price = 0;
		price = 
		Integer.parseInt((doc.select("#chart_area > div.rate_info > div > p.no_today span.blind").get(0).text()).replace(",", ""));
		
		System.out.println(price);
		
		return price;
	}
	
}
