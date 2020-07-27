<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<% request.setCharacterEncoding("UTF-8"); %>
<% response.setContentType("text/html; charset=UTF-8"); %>

<%@ page import="com.semi.dto.MemberDto" %>
<%@ page import = "java.io.PrintWriter" %>
<html>
<head>
<meta charset="UTF-8">
<title>비밀번호 찾기</title>
<script type="text/javascript">
</script>
</head>
<%
	MemberDto dto = (MemberDto)session.getAttribute("dto");
	if(dto==null){
		pageContext.forward("index.jsp");
	}
	
	PrintWriter script = response.getWriter();
	script.println("<script>");
	script.println("alert('" + dto.getId() + "님의 비밀번호는 " + dto.getPw() + " 입니다')");
	script.println("location.href='login.jsp'");
	script.println("</script>");
	
%>
<body>
</body>
</html>