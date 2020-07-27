package com.semi.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import com.semi.dto.BoardDto;

import common.JDBCTemplate;

public class BoardDao extends JDBCTemplate{

	
//	//현재시간 가져오기
//	public String getDate() {
//		Connection con = getConnection();
//		PreparedStatement pstm = null;
//		ResultSet rs = null;
//		String sql = " SELECT NOW() ";
//		
//		try {
//			pstm = con.prepareStatement(sql);
//			
//			rs = pstm.executeQuery();
//			
//			if(rs.next()) {
//				return rs.getString(1);
//			}
//			
//		} catch (SQLException e) {
//			
//			e.printStackTrace();
//		}
//		
//		return "";
//	}
	
	//boadrNum 게시글 번호 가져오기
	public int getNext() {
		Connection con = getConnection();
		PreparedStatement pstm = null;
		ResultSet rs = null;
		String sql = " SELECT BOARDNUM FROM BOARD ORDER BY BOARDNUM DESC ";
		
		try {
			pstm = con.prepareStatement(sql);
			
			rs = pstm.executeQuery();
			if(rs.next()) {
				return rs.getInt(1) + 1;
			}
			//첫번째 게시물일 경우
			return 1;
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(pstm);
			close(con);
		}
		
		return -1;
	}
	
	//글 작성하기
	public int boardWrite(String boardTitle, String userID, String boardContent) {
		Connection con = getConnection();
		PreparedStatement pstm = null;
		int res = 0;
		String sql = " INSERT INTO BOARD VALUES(BOARDNUMSQ.NEXTVAL, ?, ?, SYSDATE, ?, ?) ";
		
		try {
			pstm = con.prepareStatement(sql);
			pstm.setString(1, boardTitle);
			pstm.setString(2, userID);
			pstm.setString(3, boardContent);
			pstm.setInt(4, 1);
			System.out.println(boardTitle);
			System.out.println(userID);
			System.out.println(boardContent);
			res = pstm.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
			
		}finally {
			close(pstm);
			close(con);
		}
		
		return res;
	}
	
//	//글 작성하기
//	public int boardWrite(BoardDto dto) {
//		Connection con = getConnection();
//		PreparedStatement pstm = null;
//		int res = 0;
//		String sql = " INSERT INTO BOARD VALUES(?, ?,) ";
//		
//		try {
//			pstm = con.prepareStatement(sql);
//			pstm.setString(2, dto.getBoardTitle());
//			pstm.setString(3, dto.getBoardContent());
//			System.out.println("03. query 준비: "+sql);
//			
//			res = pstm.executeUpdate();
//			System.out.println("04. query 실행 및 리턴");
//			
//			if(res>0) {
//				commit(con);
//			}
//			
//		} catch (SQLException e) {
//			System.out.println("3/4 단계 오류");
//			e.printStackTrace();
//		}finally {
//			close(pstm);
//			close(con);
//			System.out.println("05. db 종료 \n");
//		}
//		
//		return res;
//	}
	
	//글목록 가져오기
	public ArrayList<BoardDto> getList(int pageNumber){
		Connection con = getConnection();
		PreparedStatement pstm = null;
		ResultSet rs = null;
		int pageNum = pageNumber * 10;
		
//		String sql = " SELECT * FROM (SELECT * FROM BOARD WHERE BOARDAVAILABLE = 1 ORDER BY BOARDNUM DESC) WHERE BOARDNUM > ? AND BOARDNUM < ? ";
		String sql = " SELECT * FROM BOARD WHERE BOARDAVAILABLE = 1 ORDER BY BOARDNUM DESC ";
		ArrayList<BoardDto> list = new ArrayList<BoardDto>();
		
		try {
			pstm = con.prepareStatement(sql);
//			pstm.setInt(1, pageNumber - 1);
//			pstm.setInt(2, pageNum+1);
			System.out.println("03. query 준비 : "+sql);
			
			rs = pstm.executeQuery();
			System.out.println("04. query 실행 및 리턴");
			
			while (rs.next()) {
				BoardDto dto = new BoardDto();
				dto.setBoardNum(rs.getInt(1));
				dto.setBoardTitle(rs.getString(2));
				dto.setUserID(rs.getString(3));
				dto.setBoardDate(rs.getString(4));
				dto.setBoardContent(rs.getString(5));
				dto.setBoardAvailable(rs.getInt(6));
				list.add(dto);
			}
			
		} catch (SQLException e) {
			System.out.println("3/4단계 에러");
			e.printStackTrace();
		}finally {
			close(rs);
			close(pstm);
			close(con);
			System.out.println("05. 종료");
		}
		return list;
	}
	//10단위로 페이징 처리를 하기 위한 함수
//	public boolean nextPage(int pageNumber) {
//		Connection con = getConnection();
//		PreparedStatement pstm = null;
//		ResultSet rs = null;
//		String sql = "";
//		
//		if(pageNumber == 1) {
//			sql = " SELECT * FROM BOARD WHERE BOARDNUM = ? BOARDAVAILABLE = 1 "
//					+ " ORDER BY BOARDNUM DESC ROWNUM 10 ";
//			
//		}else {
//			sql = " SELECT * FROM BOARD WHERE BOARDNUM < ? BOARDAVAILABLE = 1 "
//					+ " ORDER BY BOARDNUM DESC ROWNUM 10 ";
//		}
//		
//		
//		ArrayList<BoardDto> list = new ArrayList<BoardDto>();
//		
//		System.out.println(pageNumber);
//		
//		try {
//			pstm = con.prepareStatement(sql);
//			pstm.setInt(1, getNext() - (pageNumber - 1) * 10);
//			rs = pstm.executeQuery();
//			if(rs.next()) {
//				return true;
//			}
//		} catch (SQLException e) {
//			
//			e.printStackTrace();
//		}finally {
//			close(pstm);
//			close(con);
//		}
//		return false;
//	}
	
	//뷰 화면. 글 내용 불러오는 함수
	public BoardDto getBoardview(int boardNum) {
		Connection con = getConnection();
		PreparedStatement pstm = null;
		ResultSet rs = null;		
		BoardDto dto = new BoardDto();
		String sql = " SELECT * FROM BOARD WHERE BOARDNUM=? ";
		try {
			pstm = con.prepareStatement(sql);
			pstm.setInt(1, boardNum);
			System.out.println("03. query 준비 : "+sql);
			
			rs = pstm.executeQuery();
			System.out.println("04. query 실행 및 리턴");
			
			if (rs.next()) {
				dto.setBoardNum(rs.getInt(1));
				dto.setBoardTitle(rs.getString(2));
				dto.setUserID(rs.getString(3));
				dto.setBoardDate(rs.getString(4));
				dto.setBoardContent(rs.getString(5));
				dto.setBoardAvailable(rs.getInt(6));
			}
		} catch (Exception e) {
			System.out.println("3/4단계 에러");
			e.printStackTrace();
		}finally {
			close(rs);
			close(pstm);
			close(con);
			System.out.println("05. 종료");
		}
		
		return dto;
	}
	
	//글 수정하기
	public int update(int boardNum, String boardTitle, String boardContent) {
		Connection con = getConnection();
		PreparedStatement pstm = null;
		int res=0;
		String sql = " UPDATE BOARD SET BOARDTITLE=?, BOARDCONTENT=? WHERE BOARDNUM=? ";
		try {
			pstm = con.prepareStatement(sql);
			pstm.setString(1, boardTitle);
			pstm.setString(2, boardContent);
			pstm.setInt(3, boardNum);
			System.out.println("03.query 준비 : "+sql);
			
			res = pstm.executeUpdate();
			System.out.println("04.query 실행 및 리턴");
			
			if(res>0) {
				commit(con);
			}
		} catch (Exception e) {
			System.out.println("3/4단계 에러");
					e.printStackTrace();
		}finally {
			close(pstm);
			close(con);
			System.out.println("05. 종료");
		}
		
		return res; // 데이터베이스 오류
	}
	
	//삭제하기
	public int delete(int boardNum) {
		Connection con = getConnection();
		PreparedStatement pstm = null;
		int res=0;
		String sql = " UPDATE BOARD SET BOARDAVAILABLE = 0 WHERE BOARDNUM = ? ";
		try {
			pstm = con.prepareStatement(sql);   
			pstm.setInt(1, boardNum);
			System.out.println("03. query 준비 : "+sql);

			res=pstm.executeUpdate();
			System.out.println("04. query 실행 및 리턴");
			
			if(res>0) {
				commit(con);
			}
		} catch (Exception e) {
			System.out.println("3/4단계 에러");
			e.printStackTrace();
		}
		finally {
			close(pstm);
			close(con);
			System.out.println("05. 종료");
		}
		
		return res; // 데이터베이스 오류
	}

	
	
	
	
	
	
	
	
	
	
	
	
}
