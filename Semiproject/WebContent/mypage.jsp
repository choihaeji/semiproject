<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<% request.setCharacterEncoding("UTF-8"); %>
<% response.setContentType("text/html; charset=UTF-8"); %>

<%@ page import = "com.semi.dto.MemberDto" %>
<%@ page import = "com.semi.dao.TradeDao" %>
<%@ page import = "com.semi.dto.TradeDto"%>
<%@ page import = "java.util.ArrayList"%>
<%@ page import = "java.util.List" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<%
	MemberDto dto = (MemberDto)session.getAttribute("dto");
	TradeDao dao = new TradeDao();
	List<TradeDto> list = dao.holdingStock(dto.getId());
	String id = request.getParameter(dto.getId());

%>
<body>
	<h1><a href="index.jsp">My Page</a></h1>
	<div>
		<span><%=dto.getName() %> 님 환영합니다.</span>
		<input type="button" onclick="location.href='member.do?command=logout'" value="로그아웃">
		<input type="button" onclick="location.href='member.do?command=update'" value="회원정보 수정">
	</div>
	<hr>
	<div>
		<h3>회원 정보</h3>
		<table border="1">
			<tr>
				<th>아이디</th>
				<td><%=dto.getId() %></td>
			</tr>
			<tr>
				<th>비밀번호</th>
				<td><%=dto.getPw().replaceAll(".", "*") %></td>
			</tr>
			<tr>
				<th>이름</th>
				<td><%=dto.getName() %></td>
			</tr>
			<tr>
				<th>생년월일</th>
				<td><%=dto.getBday().substring(0, 10) %></td>
			</tr>
			<tr>
				<th>성별</th>
				<td><%=dto.getGender() %></td>
			</tr>
			<tr>
				<th>이메일</th>
				<td><%=dto.getEmail() %></td>
			</tr>
			
		</table>
	</div>
	<div>
		<h3>계좌 정보</h3>
		<table border="1">
			<tr>
				<th><%=dto.getbankName() %> 은행</th>
				<td><%=dto.getbankNo() %></td>
				<td><%=dto.getAccount() %>원</td>
			</tr>
			<tr>
				<td colspan="3">
					<input type="button" onclick="" value="충전">
				</td>
			</tr>
		</table>
	</div>
	<div>
		<h3>거래 내역</h3>
		<table border="1">
			<tr>
				<th>      </th>
				<th>종 목 명</th>
				<th>보유 수량</th>
				<th>매수 / 매도</th>
			</tr>
			<%
				for (int i = 0; i < list.size(); i++) {
			%>
				<tr>
					<td><%=list.get(i).getTradeNo() %></td>
					<td><%=list.get(i).getstockName() %></td>
					<td><%=list.get(i).getHolding() %></td>
					<td><%=list.get(i).getStatus() %></td>
				</tr>
			<%
				}
			%>
		</table>
	</div>
</body>
</html>