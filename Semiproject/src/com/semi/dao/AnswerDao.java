package com.semi.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.semi.dto.AnswerDto;

import common.JDBCTemplate;

public class AnswerDao extends JDBCTemplate {

	//전체 출력
	public List<AnswerDto> selectAll(){
		Connection con = getConnection();
		PreparedStatement pstm = null;
		ResultSet rs = null;
		List<AnswerDto> res = new ArrayList<AnswerDto>();
		String sql = " SELECT * FROM ANSWERBOARD ORDER BY GROUPNO DESC, GROUPSQ ";
		
		try {
			pstm = con.prepareStatement(sql);
			System.out.println("03. query 준비: " + sql);
			
			rs = pstm.executeQuery();
			System.out.println("04. query 실행 및 리턴");
			
			//while문에서 할것
			//1. Dto를 생성해서 디비에 저장된 1번데이터부터 컬럼을 하나하나 가져와서 담을거임.
			//2. 그것들을 다시 list에 add.
			while(rs.next()) {
				AnswerDto dto = new AnswerDto();
				dto.setBoardno(rs.getInt(1));
				dto.setGroupno(rs.getInt(2));
				dto.setGroupsq(rs.getInt(3));
				dto.setTitletab(rs.getInt(4));
				dto.setTitle(rs.getString(5));
				dto.setContent(rs.getString(6));
				dto.setWriter(rs.getString(7));
				dto.setRegdate(rs.getDate(8));
				
				//dto를 list에 추가해줘야 list에 차곡차곡 담고나서 리턴을 해줄거임.
				res.add(dto);
			}
			
		} catch (SQLException e) {
			System.out.println("3/4 단계 에러");
			e.printStackTrace();
		}finally {
			//db를 모두 사용했으니 닫아주자
			close(rs);
			close(pstm);
			close(con);
			System.out.println("05 db 종료 \n");
		}
		
		return res;
	}
	
	//글 등록
	public int insert(AnswerDto dto) {
		//BOARDNOSQ.NEXTVAL, GROUPNOSQ.NEXTVAL, 1, 0 은 고정으로 함.
		
		Connection con = getConnection();
		//쿼리문을 실행하기위한 객체
		PreparedStatement pstm = null;
		int res = 0;
		String sql = " INSERT INTO ANSWERBOARD VALUES(BOARDNOSQ.NEXTVAL, GROUPNOSQ.NEXTVAL, "
						+" 1, 0, ?, ?, ?, SYSDATE) ";
		
		try {
			pstm = con.prepareStatement(sql);
			pstm.setString(1, dto.getTitle());
			pstm.setString(2, dto.getContent());
			pstm.setString(3, dto.getWriter());
			System.out.println("03. query 준비: " + sql);
			
			//실행한 결과값 넣어주기.
			res = pstm.executeUpdate();
			System.out.println("04. query 실행 및 리턴");
			
			if(res>0) {
				commit(con);
			}
			
		} catch (SQLException e) {
			System.out.println("3/4 단계 에러");
			e.printStackTrace();
		}finally {
			close(pstm);
			close(con);
			System.out.println("05. db 종료 \n");
		}
		
		return res;
	}
	
	//글 조회
	public AnswerDto selectOne(int boardno) {
		Connection con = getConnection();
		PreparedStatement pstm = null;
		ResultSet rs = null;
		AnswerDto res = new AnswerDto();
		String sql = " SELECT * FROM ANSWERBOARD WHERE BOARDNO=?  ";
		
		try {
			pstm = con.prepareStatement(sql);
			pstm.setInt(1, boardno);
			System.out.println("03. query 준비: " + sql);
			
			rs = pstm.executeQuery();
			System.out.println("04. query 실행 및 리턴");
			
			//res에 담아주기.
			while(rs.next()) {
				res.setBoardno(rs.getInt(1));
				res.setGroupno(rs.getInt(2));
				res.setGroupsq(rs.getInt(3));
				res.setTitletab(rs.getInt(4));
				res.setTitle(rs.getString(5));
				res.setContent(rs.getString(6));
				res.setWriter(rs.getString(7));
				res.setRegdate(rs.getDate(8));
				
			}
			
		} catch (SQLException e) {
			System.out.println("3/4 단계 에러");
			e.printStackTrace();
		}finally {
			close(rs);
			close(pstm);
			close(con);
			System.out.println("05. db 종료 \n");
		}
		return res;
	}
	
    //answer - update
	public int updateAnswer(int parentgroupno, int parentgroupsq) {
		Connection con = getConnection();
		PreparedStatement pstm = null;
		int res = 0;
		String sql = " UPDATE ANSWERBOARD SET GROUPSQ = GROUPSQ + 1 "
					 + " WHERE GROUPNO=? AND GROUPSQ>? ";
		
		String sql2 = " UPDATE ANSWERBOARD SET GROUPSQ = GROUPSQ + 1 "
					   + " WHERE GROUPNO = ( SELECT GROUPNO FROM ANSWERBOARD WHERE BOARDNO=? ) AND "
					   + "           GROUPSQ > ( SELECT GROUPSQ FROM ANSWERBOARD WHERE BOARDNO=? ) ";
		
		try {
			pstm = con.prepareStatement(sql);
			pstm.setInt(1, parentgroupno);
			pstm.setInt(2, parentgroupsq);
			System.out.println("03. query 준비: " + sql);
			
			res = pstm.executeUpdate();
			System.out.println("04. query 실행 및 리턴");
			
			if(res>0) {
				commit(con);
			}
			
		} catch (SQLException e) {
			System.out.println("3/4 실행 오류");
			e.printStackTrace();
		}finally {
			close(pstm);
			close(con);
			System.out.println("05. db 종료 \n");
		}
		
		return res;
	}
	
	//answer - insert
	public int insertAnswer(AnswerDto dto) {
		Connection con = getConnection();
		PreparedStatement pstm = null;
		int res = 0;
		String sql = " INSERT INTO ANSWERBOARD "
					 + " VALUES(BOARDNOSQ.NEXTVAL, ?, ?, ?, ?, ?, ?, SYSDATE) ";
		
		try {
			pstm = con.prepareStatement(sql);
			pstm.setInt(1, dto.getGroupno());
			//부모의 sq니깐 +1을 해줘야함.
			pstm.setInt(2, dto.getGroupsq()+1);
			//마찬가지
			pstm.setInt(3, dto.getTitletab()+1);
			pstm.setString(4, dto.getTitle());
			pstm.setString(5, dto.getContent());
			pstm.setString(6, dto.getWriter());
			System.out.println("03. query 준비: " + sql);
			
			res = pstm.executeUpdate();
			System.out.println("04. query 실행 및 리턴");
			if(res>0) {
				commit(con);
			}
			
		} catch (SQLException e) {
			System.out.println("3/4 단계 오류");
			e.printStackTrace();
		}finally {
			close(pstm);
			close(con);
			System.out.println("05. db 종료 \n");
		}
		
		return res;
	}
	
	
	
	
	
	
	
	
	
}
