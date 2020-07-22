package com.semi.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.SimpleDateFormat;

import com.semi.dto.MemberDto;

import common.JDBCTemplate;

public class MemberDao extends JDBCTemplate {

	public int insertMember(MemberDto dto) {
		Connection con = getConnection();
		PreparedStatement pstm = null;
		int res = 0;
		String sql = " INSERT INTO MEMBER VALUES(MEMBERSQ.NEXTVAL,?,?,?,?,?,?,?,?,DEFAULT,DEFAULT) ";

		try {
			pstm = con.prepareStatement(sql);
			pstm.setString(1, dto.getId());
			pstm.setString(2, dto.getPw());
			pstm.setString(3, dto.getName());
			pstm.setDate(4, java.sql.Date.valueOf(dto.getBday()));
			pstm.setString(5, dto.getGender());
			pstm.setString(6, dto.getEmail());
			pstm.setString(7, dto.getbankName());
			pstm.setString(8, dto.getbankNo());
			System.out.println("03. query 준비: " + sql);

			res = pstm.executeUpdate();
			System.out.println("04. query 실행 및 리턴");

			if (res > 0)
				commit(con);
		} catch (SQLException e) {
			System.out.println("3/4단계 에러");
			e.printStackTrace();
		} finally {
			close(pstm);
			close(con);
		}

		return res;
	}

	public String idChk(String id) {
		Connection con = getConnection();
		PreparedStatement pstm = null;
		ResultSet rs = null;
		String res = null;
		String sql = " SELECT * FROM MEMBER WHERE ID=? ";

		try {
			pstm = con.prepareStatement(sql);
			pstm.setString(1, id);
			System.out.println("03. query 준비: " + sql);

			rs = pstm.executeQuery();
			System.out.println("04. query 실행 및 리턴");

			while (rs.next()) {
				res = rs.getString(2);
			}

		} catch (SQLException e) {
			System.out.println("3/4 단계 에러");
			e.printStackTrace();
		} finally {
			close(rs);
			close(pstm);
			close(con);
			System.out.println("05. db 종료\n");
		}

		return res;
	}

	public MemberDto login(String id, String pw) {
		Connection con = getConnection();
		PreparedStatement pstm = null;
		ResultSet rs = null;
		MemberDto res = new MemberDto();
		String sql = " SELECT * FROM MEMBER WHERE ID=? AND PW=? ";

		try {
			pstm = con.prepareStatement(sql);
			pstm.setString(1, id);
			pstm.setString(2, pw);
			System.out.println("03. query 준비: " + sql);

			rs = pstm.executeQuery();
			System.out.println("04. query 실행 및 리턴");

			while (rs.next()) {
				res.setMno(rs.getInt(1));
				res.setId(rs.getString(2));
				res.setPw(rs.getString(3));
				res.setName(rs.getString(4));
				SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
				res.setBday(sdf.format(rs.getDate(5)));
				res.setGender(rs.getString(6));
				res.setEmail(rs.getString(7));
				res.setbankName(rs.getString(8));
				res.setbankNo(rs.getString(9));
				res.setAccount(rs.getInt(10));
				res.setStockAccount(rs.getInt(11));
			}

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rs);
			close(pstm);
			close(con);
		}

		return res;
	}

	public int updateMember(MemberDto dto) {
		Connection con = getConnection();
		PreparedStatement pstm = null;
		int res = 0;
		String sql = " UPDATE MEMBER SET PW=?,EMAIL=?,BANKNAME=?,BANKNO=? WHERE MEMBERNO=? ";

		try {
			pstm = con.prepareStatement(sql);
			pstm.setString(1, dto.getPw());
			pstm.setString(2, dto.getEmail());
			pstm.setString(3, dto.getbankName());
			pstm.setString(4, dto.getbankNo());
			pstm.setInt(5, dto.getMno());
			System.out.println("03. query 준비: " + sql);

			res = pstm.executeUpdate();
			System.out.println("04. query 실행 및 리턴");

			if (res > 0)
				commit(con);
		} catch (SQLException e) {
			System.out.println("3/4단계 에러");
			e.printStackTrace();
		} finally {
			close(pstm);
			close(con);
		}

		return res;
	}

	// 아이디찾기
	public MemberDto searchId(String name, String email) {
		Connection con = getConnection();
		PreparedStatement pstm = null;
		ResultSet rs = null;
		MemberDto res = null;
		String sql = " SELECT * FROM MEMBER WHERE NAME=? AND EMAIL=? ";
		try {
			pstm = con.prepareStatement(sql);
			pstm.setString(1, name);
			pstm.setString(2, email);
			System.out.println("03. query 준비: " + sql);

			rs = pstm.executeQuery();
			System.out.println("04. query 실행 및 리턴");

			while (rs.next()) {
				res = new MemberDto();
				res.setMno(rs.getInt(1));
				res.setId(rs.getString(2));
				res.setPw(rs.getString(3));
				res.setName(rs.getString(4));
				SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
				res.setBday(sdf.format(rs.getDate(5)));
				res.setGender(rs.getString(6));
				res.setEmail(rs.getString(7));
				res.setbankName(rs.getString(8));
				res.setbankNo(rs.getString(9));
				res.setAccount(rs.getInt(10));
			}

		} catch (SQLException e) {
			System.out.println("3/4 단계 에러");
			e.printStackTrace();
		} finally {
			close(rs);
			close(pstm);
			System.out.println("05. db 종료\n");
		}

		return res;
	}

	// 비밀번호 찾기
	public MemberDto searchPw(String id, String name, String email) {
		Connection con = getConnection();
		PreparedStatement pstm = null;
		ResultSet rs = null;
		MemberDto res = null;
		String sql = " SELECT * FROM MEMBER WHERE ID=? AND NAME=? AND EMAIL=? ";
		try {
			pstm = con.prepareStatement(sql);
			pstm.setString(1, id);
			pstm.setString(2, name);
			pstm.setString(3, email);
			System.out.println("03. query 준비: " + sql);

			rs = pstm.executeQuery();
			System.out.println("04. query 실행 및 리턴");

			while (rs.next()) {
				res = new MemberDto();
				res.setMno(rs.getInt(1));
				res.setId(rs.getString(2));
				res.setPw(rs.getString(3));
				res.setName(rs.getString(4));
				SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
				res.setBday(sdf.format(rs.getDate(5)));
				res.setGender(rs.getString(6));
				res.setEmail(rs.getString(7));
				res.setbankName(rs.getString(8));
				res.setbankNo(rs.getString(9));
				res.setAccount(rs.getInt(10));
			}

		} catch (SQLException e) {
			System.out.println("3/4 단계 에러");
			e.printStackTrace();
		} finally {
			close(rs);
			close(pstm);
			System.out.println("05. db 종료\n");
		}

		return res;
	}

	// 회원탈퇴
	public int getDel(MemberDto dto) {
		Connection con = getConnection();
		PreparedStatement pstm = null;
		ResultSet rs = null;
		// MemberDto res = null;
		int result = 0;
		String sql = "DELETE FROM MEMBER WHERE ID=?";

		try {
			pstm = con.prepareStatement(sql);
			pstm.setString(1, dto.getId());

			result = pstm.executeUpdate();

		} catch (Exception e) {
			System.out.println("3/4 단계 에러");
			e.printStackTrace();
		} finally {
			close(pstm);
			close(con);
			System.out.println("05. db 종료\n");
		}
		return result;
	}

}
