package com.semi.dao;

import static common.JDBCTemplate.*;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.semi.dto.TradeDto;

public class TradeDao {

	Connection con = getConnection();
	PreparedStatement pstm = null;
	
	//매도시
	public int sell(TradeDto membertd) {		
		int res = 0;
		//매도시 trade table에 insert
		String sellSql = " INSERT INTO TRADE_BOARD VALUES(TRADENOSQ.NEXTVAL,?,?,?,?,'매도') ";
		
		try {
			pstm = con.prepareStatement(sellSql);
			pstm.setString(1, membertd.getId());
			pstm.setString(2, membertd.getstockName());
			pstm.setInt(3, membertd.getHolding());
			pstm.setInt(4, membertd.getPrice());
			System.out.println("03. 쿼리 준비: "+sellSql);
			
			res = pstm.executeUpdate();
			
			List<TradeDto> comfirm = comfirm(membertd);
			if(comfirm!=null) {
				updateBuy(membertd);
			}
			
			if(res>0) {
				commit(con);
			}
		} catch (SQLException e) {
			System.out.println("3/4단계 오류");
			e.printStackTrace();
		}finally {
			close(pstm);
			close(con);
			System.out.println("05. db종료");
		}
		
		return res;
	}
	
	//매도시 테이블에 같은이름을 가진 주식을 가지고 있는지 
	public List<TradeDto> comfirm(TradeDto membertd){
		List<TradeDto> res = new ArrayList<>();
		ResultSet rs = null;
		
		String select = " SELECT * FROM TRADE_BOARD WHERE ID=? AND STATUS='매수' AND STOCKNAME=? ";
		
		try {
			pstm = con.prepareStatement(select);
			pstm.setString(1, membertd.getId());
			pstm.setString(2, membertd.getstockName());
			System.out.println("03. 쿼리준비: "+select);
			
			rs = pstm.executeQuery();
			
			while(rs.next()) {
				TradeDto tmp = new TradeDto();
				tmp.setTradeNo(rs.getInt(1));
				tmp.setId(rs.getString(2));
				tmp.setstockName(rs.getString(3));
				tmp.setHolding(rs.getInt(4));
				tmp.setPrice(rs.getInt(5));
				
				res.add(tmp);
			}
		
		} catch (SQLException e) {
			System.out.println("3/4단계 오류");
			e.printStackTrace();
		}finally {
			close(rs);
			close(pstm);
			close(con);
			System.out.println("05. db종료");
		}
		
		return res;
	}
	
	//매도시 매수 보유량 update
	public void updateBuy(TradeDto membertd) {
		int update = 0;
		String updateBoardSql = " UPDATE TRADE_BOARD SET HOLDING = HOLIDNG-? WHERE ID=? AND STOCKNAME=? AND STATUS='매수'";
		
		try {
			pstm = con.prepareStatement(updateBoardSql);
			pstm.setInt(1, membertd.getHolding());
			pstm.setString(2, membertd.getId());
			pstm.setString(3, membertd.getstockName());
			System.out.println("03.쿼리준비: "+updateBoardSql);
			
			update = pstm.executeUpdate();
			
			if(update>0) {
				commit(con);
			}
		} catch (SQLException e) {
			System.out.println("3/4단계 오류");
			e.printStackTrace();
		}finally {
			close(pstm);
			close(con);
			System.out.println("05. db종료");
		}
	}
	
	//매수시
	public int buy(TradeDto membertd) {
		int res =0;
		//매수시 trade table에 insert
		String buySql = " INESRT INTO TRADE_BOARD VALUES(TRADENOSQ.NEXTVAL,?,?,?,?,'매수') ";
		
		try {
			pstm = con.prepareStatement(buySql);
			pstm.setString(1, membertd.getId());
			pstm.setString(2, membertd.getstockName());
			pstm.setInt(3, membertd.getHolding());
			pstm.setInt(4, membertd.getPrice());
			System.out.println("03. 쿼리 준비: "+buySql);
			
			res = pstm.executeUpdate();
		
			if(res>0) {
				commit(con);
			}
		} catch (SQLException e) {
			System.out.println("3/4 단계 오류");
			e.printStackTrace();
		}finally {
			close(pstm);
			close(con);
			System.out.println("05. db종료");
		}
		
		return res;
	}
	
	//보유 주식 리스트
	public List<TradeDto> holdingStock(String id){
		
		ResultSet rs = null;
		List<TradeDto> res = new ArrayList<>();
		//보유주식 리스트 
		String selectAllSql = " SELECT * FROM TRADE_BOARD WHERE ID=? AND STATUS='매수' ";
		
		try {
			pstm = con.prepareStatement(selectAllSql);
			pstm.setString(1, id);
			System.out.println("03.query 준비: "+selectAllSql);
			
			rs = pstm.executeQuery();
			while(rs.next()) {
				TradeDto tmp = new TradeDto();
				tmp.setTradeNo(rs.getInt(1));
				tmp.setId(rs.getString(2));
				tmp.setstockName(rs.getString(3));
				tmp.setHolding(rs.getInt(4));
				tmp.setPrice(rs.getInt(5));
				
				res.add(tmp);
			}
		
		
		} catch (SQLException e) {
			System.out.println("3/4단계 오류");
			e.printStackTrace();
		}finally {
			close(rs);
			close(pstm);
			close(con);
			System.out.println("05.db 종료");
		}
		
		
		return res;
	}
	
	//주식명 코드로 변환
	public String transCode(String stockName) {
		String code = null;
		ResultSet rs = null;
		//주식이름 코드로 변환
		String selectCode = " SELECT STOCKCODE FROM STOCKBOARD WHERE STOCKNAME = ? ";
		
		try {
			pstm = con.prepareStatement(selectCode);
			pstm.setString(1, stockName);
			
			rs = pstm.executeQuery();
			
			while(rs.next()) {				
				code = rs.getString(1);
			}
			System.out.println("stockName :"+stockName+", code: "+code);
			
		} catch (SQLException e) {
			System.out.println("3/4단계 오류");
			e.printStackTrace();
		}finally {
			close(rs);
			close(pstm);
			close(con);
			System.out.println("05.db 종료");
		}
		
		return code;
	}
	
	//보유 주식 개수
	public int countTrade(String id) {
		Connection con = getConnection();
		PreparedStatement pstm = null;
		ResultSet rs = null;
		int count = 0;
		String sql = " SELECT COUNT(*) FROM TRADE_BOARD WHERE=? ";
		
		try {
			pstm = con.prepareStatement(sql);
			pstm.setString(1, id);
			
			rs = pstm.executeQuery();
			while (rs.next()) {
				count = rs.getInt(1);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rs);
			close(pstm);
			close(con);
		}
		return count;
	}
}
