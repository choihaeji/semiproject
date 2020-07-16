<%@page import="com.semi.dao.KakaoAPI"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% request.setCharacterEncoding("UTF-8"); %>
<% response.setContentType("text/html; charset=UTF-8"); %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<%
	KakaoAPI api = new KakaoAPI();
	String code = request.getParameter("code");
%>
<body>
	<%=code %>
	<%=api.getAccessToken(code) %>
</body>
</html>