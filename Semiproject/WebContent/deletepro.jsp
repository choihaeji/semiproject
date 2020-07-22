<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<% request.setCharacterEncoding("UTF-8"); %>
<% response.setContentType("text/html; charset=UTF-8"); %>
    
<%@page import="com.semi.dao.MemberDao"%>
<%@page import="com.semi.dto.MemberDto"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>

<%

	MemberDto dto = (MemberDto)session.getAttribute("dto");
	MemberDao dao = new MemberDao();
	
	int result = dao.getDel(dto);
	String message=null;

	if(result>0){
		message ="탈퇴 성공!!";
		session.invalidate();
	}else {
		message ="탈퇴 실패!!";
	}
	request.setAttribute("result", message);

%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<title>Insert title here</title>
</head>
<body>

	<jsp:forward page="deleteResult.jsp" />

</body>
</html>
