package com.semi.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.semi.dao.MemberDao;
import com.semi.dto.MemberDto;

@WebServlet("/member")
public class MemberController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public MemberController() {
		super();
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String command = request.getParameter("command");
		System.out.println("[command: " + command + "]");

		MemberDao dao = new MemberDao();
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");

		if (command.equals("insertmember")) {
			String id = request.getParameter("id");
			String pw = request.getParameter("pw");
			String name = request.getParameter("name");
			String bday = request.getParameter("bday");
			String gender = request.getParameter("gender");
			String email = request.getParameter("email_id") + request.getParameter("email_url");
			String bankName = request.getParameter("bank_name");
			String bankNo = request.getParameter("bank_no");

			System.out.println("ID: " + id);
			System.out.println("PW: " + pw);
			System.out.println("NAME: " + name);
			System.out.println("BDAY: " + bday);
			System.out.println("GEND: " + gender);
			System.out.println("EMAIL: " + email);
			System.out.println("B_NAME: " + bankName);
			System.out.println("B_NO: " + bankNo);

			MemberDto dto = new MemberDto(id, pw, name, bday, gender, email, bankName, bankNo);

			int res = dao.insertMember(dto);

			if (res > 0) {
				System.out.println("\ninsert 성공!");
				jsResponse("회원가입 성공", "login.jsp", response);
			}

			else {
				System.out.println("\ninsert 실패!");
				jsResponse("회원가입 실패", "registform.jsp", response);
			}
		} else if (command.equals("idchk")) {
			String id = request.getParameter("id");
			String res = dao.idChk(id);

			boolean idnotused = true;

			if (res != null) {
				idnotused = false;
			}
			response.sendRedirect("idchk.jsp?idnotused=" + idnotused);
		} else if (command.equals("registform")) {
			response.sendRedirect("registform.jsp");
		} else if (command.equals("login")) {
			String id = request.getParameter("id");
			String pw = request.getParameter("pw");

			MemberDto dto = dao.login(id, pw);

			if (dto.getId() != null) {
				System.out.println("로그인 성공");
				HttpSession session = request.getSession();
				session.setAttribute("dto", dto);
				session.setMaxInactiveInterval(60 * 60);

				String before = request.getParameter("before");
				System.out.println(before);
				String url = before.split("/")[4];
				System.out.println(url);

				jsResponse("로그인 성공", "index.jsp", response);
			} else {
				System.out.println("로그인 실패");
				jsResponse("로그인 실패", "login.jsp", response);
			}
		} else if (command.equals("logout")) {
			HttpSession session = request.getSession();
			session.invalidate(); // 세션 정보 삭제
			String url = request.getHeader("referer");
			jsResponse("로그아웃 성공", url, response);
		} else if (command.equals("update")) {
			response.sendRedirect("updateform.jsp");
		} else if (command.equals("updatemember")) {
			int mno = Integer.parseInt(request.getParameter("mno"));
			String pw = request.getParameter("pw");
			String email = request.getParameter("email_id") + request.getParameter("email_url");
			String bank_name = request.getParameter("bank_name");
			String bank_no = request.getParameter("bank_no");
			System.out.println(email);
			System.out.println(bank_name);
			System.out.println(bank_no);

			MemberDto dto = new MemberDto(mno, pw, email, bank_name, bank_no);

			int res = dao.updateMember(dto);

			if (res > 0) {
				System.out.println("\nupdate 성공!");

				String id = request.getParameter("id");

				MemberDto update_dto = dao.login(id, pw);

				HttpSession session = request.getSession();
				session.setAttribute("dto", update_dto);
				session.setMaxInactiveInterval(60 * 60);

				jsResponse("회원정보 수정 성공", "mypage.jsp", response);
			}

			else {
				System.out.println("\nupdate 실패!");
				jsResponse("회원정보 수정 실패", "updateform.jsp", response);
			}
		}
		// 아이디 찾기
		else if (command.equals("searchid")) {

			String name = request.getParameter("name");
			String email = request.getParameter("email");
			MemberDto dto = dao.searchId(name, email);

			if (dto.getName() != null && dto.getEmail() != null) {
				System.out.println("이름과 이메일 일치!");
				HttpSession session = request.getSession();
				session.setAttribute("dto", dto);
				session.setMaxInactiveInterval(60 * 60);

				jsResponse("성공", "searchid2.jsp", response);

			} else {
				System.out.println("\n이름과 이메일 불일치!");
				jsResponse("실패", "searchid1.jsp", response);
			}
		}
		// 비밀번호 찾기
		else if (command.equals("searchpw")) {

			String id = request.getParameter("id");
			String name = request.getParameter("name");
			String email = request.getParameter("email");
			MemberDto dto = dao.searchPw(id, name, email);

			if (dto.getId() != null && dto.getName() != null && dto.getEmail() != null) {
				System.out.println("모두 일치!");
				HttpSession session = request.getSession();
				session.setAttribute("dto", dto);
				session.setMaxInactiveInterval(60 * 60);

				jsResponse("성공", "searchpw2.jsp", response);

			} else {
				System.out.println("\n불일치!");
				jsResponse("실패", "login.jsp", response);
			}
		}

	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doGet(request, response);
	}

	private void jsResponse(String msg, String url, HttpServletResponse response) throws IOException {
		String s = "<script type='text/javascript'>" + "alert('" + msg + "');" + "location.href='" + url + "';"
				+ "</script>";

		PrintWriter out = response.getWriter();
		out.print(s);
	}
}
