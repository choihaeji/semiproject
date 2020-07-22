<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<% request.setCharacterEncoding("UTF-8"); %>
<% response.setContentType("text/html; charset=UTF-8"); %>

<%@ page import="java.io.PrintWriter"%>
<%@ page import="com.semi.dao.BoardDao"%>
<%@ page import="com.semi.dto.BoardDto"%>
<%@ page import="java.util.ArrayList"%>
<%@ page import="com.semi.dto.MemberDto" %>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%
		String userID = null;
		MemberDto user = (MemberDto)session.getAttribute("dto");
		if (session.getAttribute("dto") != null) { 
			userID = user.getId();
		}
		if (userID == null) {
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('로그인을 하세요.')");
			script.println("location.href = 'login.jsp'");
			script.println("</script>");
		} 
		
		int boardNum = 0;
		
		if(request.getParameter("boardNum") != null){
			boardNum = Integer.parseInt(request.getParameter("boardNum"));
		}
		if(boardNum == 0) {
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('유효하지 않은 글 입니다')");
			script.println("location.href='boardlist.jsp'");
			script.println("</script>");
		}
		
		BoardDto dto = new BoardDao().getBoardview(boardNum);

		if(!userID.equals(dto.getUserID())) {
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('권한이 없습니다')");
			script.println("location.href='boardlist.jsp'");
			script.println("</script>");			
		}

		else{

			BoardDao dao = new BoardDao();

			int result = dao.delete(boardNum);
			
			if (result == -1) {
				PrintWriter script = response.getWriter();
				script.println("<script>");
				script.println("alert('글 삭제에 실패했습니다')");
				script.println("history.back()");
				script.println("</script>");

			} else {
				PrintWriter script = response.getWriter();
				script.println("<script>");
				script.println("location.href='boardlist.jsp'");
				script.println("</script>");
			}
		}
	%>

</body>
</html>