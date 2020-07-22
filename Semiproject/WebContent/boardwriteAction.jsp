<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<% request.setCharacterEncoding("UTF-8"); %>
<% response.setContentType("text/html; charset=UTF-8"); %>

<%@ page import = "com.semi.dao.BoardDao" %>
<%@ page import = "com.semi.dto.BoardDto" %>
<%@ page import = "java.io.PrintWriter" %>
<%@ page import = "com.semi.dto.MemberDto" %>
<!--
<jsp:useBean id="BoardDto" class="com.semi.dto.BoardDto" scope="page" />
<jsp:setProperty name="BoardDto" property="boardTitle" />
<jsp:setProperty name="BoardDto" property="boardContent" />
-->
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
		String title = (String)request.getParameter("boardTitle");
		String content = (String)request.getParameter("boardContent");
		
		if(session.getAttribute("dto") != null){          
			userID= user.getId();
		 System.out.println(userID);
		}
		if(userID == null){
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('로그인을 하세요.')");
			script.println("location.href='login.jsp");
			script.println("</script>");
		}
		
		else{
			if(BoardDto.getBoardTitle() == null || BoardDto.getBoardContent() == null) {
				PrintWriter script = response.getWriter();
				script.println("<script>");
				script.println("alert('입력이 안된 사항이 있습니다')");
				script.println("history.back()");
				script.println("</script>");
			}else {
				BoardDao dao = new BoardDao();
				BoardDto dto = new BoardDto();
				
				int res = dao.boardWrite(title, userID, content);
				
				if (res == 0) {
					PrintWriter script = response.getWriter();
					script.println("<script>");
					script.println("alert('글쓰기에 실패했습니다')");
					script.println("history.back()");
					script.println("</script>");
				
				} else {
					PrintWriter script = response.getWriter();
					script.println("<script>");
					script.println("location.href='boardlist.jsp'");
					//script.println("history.back()");
					script.println("</script>");
				}
			}
		}
	%>
		
			
	
	
</body>
</html>