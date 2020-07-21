<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<% request.setCharacterEncoding("UTF-8"); %>
<% response.setContentType("text/html; charset=UTF-8"); %>

<%@ page import="com.semi.dto.MemberDto" %>

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
%>
<body>
		<div class="wrap">
		<div id="userId">[<%=dto.getId()%>]님의 비밀번호는</div><br>
		<div id="userPw">[<%=dto.getPw() %>] 입니다.</div>
		<button id="button" class="btn btn-outline-info " onclick="location.href='login.jsp'">로그인 하러가기</button>
		</div>
	</body>
</html>