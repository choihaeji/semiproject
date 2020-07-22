package com.semi.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.semi.dao.AnswerDao;
import com.semi.dto.AnswerDto;
import com.semi.dto.MemberDto;

//인덱스에서 요청한 이름을 넣어줌. -> answer.do
@WebServlet("/answer.do")
public class AnswerController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public AnswerController() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.getWriter().append("Served at: ").append(request.getContextPath());
		
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");
		
		String command = request.getParameter("command");
		System.out.printf("{%s}\n", command);
		
		AnswerDao dao = new AnswerDao();
		
		if(command.equals("boardwrite")) {
			String title = request.getParameter("title");
			String content = request.getParameter("content");
			String writer = request.getParameter("writer");
			
			AnswerDto dto = new AnswerDto();
			dto.setTitle(title);
			dto.setContent(content);
			dto.setWriter(writer);
			
			int res = dao.insert(dto);
			
			if(res>0) {
				dispatch("answer.do?command=list", request, response);
			}else {
				dispatch("answer.do?command=writeform", request, response);
			}
			
			//커맨드가 deteil일때.
		}else if(command.equals("detail")) {
			int boardno = Integer.parseInt(request.getParameter("boardno"));
			
			AnswerDto dto = dao.selectOne(boardno);
			
			//이제 화면에 뿌려주자
			//forward형식으로 페이지 변환해주기.
			request.setAttribute("dto", dto);
			dispatch("boarddetail.jsp", request, response);
			
		}else if(command.equals("answerform")) {
			int parentboardno = Integer.parseInt(request.getParameter("parentboardno"));
			
			//parentboardno랑 일치하는 데이터 가져오기.
			AnswerDto dto = dao.selectOne(parentboardno);
			//리퀘스트로 다시 반환하기?!
			request.setAttribute("parent", dto);
			dispatch("answerwrite.jsp", request, response);
			
		}else if(command.equals("answerwrite")) {
			int parentboardno = Integer.parseInt(request.getParameter("parentboardno"));
			
			String title = request.getParameter("title");
			String content = request.getParameter("content");
			String writer = request.getParameter("writer");
			
			//
			AnswerDto parent = dao.selectOne(parentboardno);
			int parentgroupno = parent.getGroupno();
			int parentgroupsq = parent.getGroupsq();
			int parenttitletab = parent.getTitletab();
			
			//update
			//그룹의 sq 값들을 증가시키기
			int updateRes = dao.updateAnswer(parentgroupno, parentgroupsq);
			
			if(updateRes>0) {
				System.out.println("순서 변경 성공");
			}else {
				System.out.println("순서 변경 실패 or 변경 글 없음");
			}
			
			//insert
			AnswerDto dto = new AnswerDto(0, parentgroupno, parentgroupsq, parenttitletab, title, content, writer, null);
			
			int res = dao.insertAnswer(dto);
			
			if(res>0) {
				response.sendRedirect("answer.do?command=list");
			}else {
				response.sendRedirect("answer.do?command=detail&boardno="+parentboardno);
			}
		}
		
		
	}

	//첫번째 매겨변수를  String url로 바꿔줌.
	private void dispatch(String url, HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		RequestDispatcher dispatch = request.getRequestDispatcher(url);
		dispatch.forward(request, response); //->쓰로우즈로 예외처리.
		
		//이제 page를 만들러가자.
		//boardlist.jsp
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
