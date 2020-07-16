<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<% request.setCharacterEncoding("UTF-8"); %>
<% response.setContentType("text/html; charset=UTF-8"); %>

<%@ page import="com.semi.dto.MemberDto" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<%
	MemberDto dto = (MemberDto)session.getAttribute("dto");

	if(dto==null){
		pageContext.forward("index.jsp");
	}
%>
<body>
	<h1>My Page</h1>
	<div>
		<span><%=dto.getName() %> 님 환영합니다.</span>
		<input type="button" onclick="location.href='member.do?command=logout'" value="로그아웃">
		<input type="button" onclick="location.href='member.do?command=update'" value="회원정보 수정">
	</div>
	<hr>
	<div>
		<table border="1">
			<tr>
				<th><%=dto.getbankName() %></th>
				<td><%=dto.getbankNo() %></td>
				<td><%=dto.getAccount() %>원</td>
				<td><input type="button" onclick="" value="충전"></td>
			</tr>
		</table>
		
		<h3>거래 내역</h3>
		<table border="1">
		</table>
	</div>
</body>
</html>