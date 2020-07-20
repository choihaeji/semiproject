package com.semi.dao;

import com.semi.dto.TradeDto;

import static common.JDBCTemplate.*;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

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
				res.setEnt(rs.getString(1));
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
}
