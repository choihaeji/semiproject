package com.semi.dao;

import com.semi.dto.TradeDto;
import static common.JDBCTemplate.*;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class TradeDao {
	public TradeDto viewTrade(String id) {
		Connection con = getConnection();
		PreparedStatement pstm = null;
		ResultSet rs = null;
		TradeDto res = new TradeDto();
		String sql = " SELECT CODE, STOCKNAME, HOLDING, STATUS FROM TRADE_BOARD WHERE ID=? ";
		
		try {
			pstm = con.prepareStatement(sql);
			pstm.setString(1, id);
			System.out.println("03. query 준비 : " + sql);
			
			rs = pstm.executeQuery();
			System.out.println("04. query 실행 및 리턴");
			
			while (rs.next()) {
				res.setstockName(rs.getString(1));
				res.setHolding(rs.getInt(2));
				res.setStatus(rs.getString(3));
			}
		} catch (SQLException e) {
			System.out.println("3단계 / 4단계 오류");
			e.printStackTrace();
		} finally {
			close(rs);
			close(pstm);
			close(con);
		}
		
		
		return res;
	}
	
	public int countTrade(String id) {
		Connection con = getConnection();
		PreparedStatement pstm = null;
		ResultSet rs = null;
		int count = 0;
		String sql = " SELECT COUNT(*) FROM TRADE_BOARD WHERE ID=? ";
		
		try {
			pstm = con.prepareStatement(sql);
			pstm.setString(1, id);
			System.out.println("03. query 준비 : " + sql);
			
			rs = pstm.executeQuery();
			System.out.println("04. query 실행 및 리턴");
			
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
			
			int updateres = updateBuy(membertd);
			
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
	
	//매도시 매수 보유량 update
	public int updateBuy(TradeDto membertd) {
		int update = 0;
		
		
		
		
	
		
		
		return 0;
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
	
}
