<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<% request.setCharacterEncoding("UTF-8"); %>
<% response.setContentType("text/html; charset=UTF-8"); %>

<%@ page import="com.semi.dto.MemberDto"%>
<%@ page import="com.semi.dao.TradeDao"%>
<%@ page import="com.semi.dto.TradeDto"%>
<%@ page import="java.util.ArrayList"%>
<%@ page import="java.util.List"%>

<!DOCTYPE html>
<html>
<head>
<!-- Required meta tags -->
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<link rel="icon" href="img/favicon.png" type="image/png">
<title>MyPage</title>

<style style="text/css">
#fc {
	position: absolute;
	left: 50%;
	margin-left: -400px;
	margin-bottom: 50px;
	padding-top: 50px;
	padding-bottom: 30px;
	text-align: center;
	border: 3px solid lightgray;
}

#lf {
	width: 800px;
	margin: 0 auto;
	padding-left: 30px;
	padding-right: 30px;
}

table {
	width: 700px;
	margin: 0 auto;
	border-collapse: separate;
	border-spacing: 5px;
}

th {
	background-color: rgb(162, 226, 226);
	height: 50px;
	font-size: 14px;
	color: rgb(3, 43, 43);
}

td {
	height: 50px;
	font-size: 14px;
	background-color: rgb(229, 255, 255);
}
</style>

<!-- Bootstrap CSS -->
<link rel="stylesheet" href="css/bootstrap.css">
<link rel="stylesheet" href="vendors/linericon/style.css">
<link rel="stylesheet" href="css/font-awesome.min.css">
<link rel="stylesheet" href="vendors/owl-carousel/owl.carousel.min.css">
<link rel="stylesheet" href="vendors/lightbox/simpleLightbox.css">
<link rel="stylesheet" href="vendors/nice-select/css/nice-select.css">
<link rel="stylesheet" href="vendors/animate-css/animate.css">
<link rel="stylesheet" href="vendors/popup/magnific-popup.css">
<!-- main css -->
<link rel="stylesheet" href="css/style.css">
<link rel="stylesheet" href="css/responsive.css">
</head>
<%
MemberDto dto = (MemberDto) session.getAttribute("dto");

	TradeDao dao = new TradeDao();
	List<TradeDto> list = dao.viewTrade(dto.getId());
	
	System.out.println(dto.getName() + ", " + dto.getAccount());
%>
<body>
	<jsp:include page="form/header.jsp"></jsp:include>

	<!--================Home Banner Area =================-->
	<section class="banner_area">
		<div class="box_1620">
			<div class="banner_inner d-flex align-items-center">
				<div class="container">
					<div class="banner_content text-center">
						<h2>MyPage</h2>
						<div class="page_link">
							<a href="index.jsp">Home</a> <a href="registform.jsp">MyPage</a>
						</div>
					</div>
				</div>
			</div>
		</div>
	</section>
	<!--================End Home Banner Area =================-->

	<!--================Home Banner Area =================-->
	<section class="profile_area">
		<div class="container">
			<div class="profile_inner p_120">
				<div class="row" style="height: 1100px;">
					<div id="fc">
						<div id="lf">
							<div style="padding-bottom: 15px;">
								<h3 style="padding-bottom: 10px;">My Page</h3>
								<span><%=dto.getName() %>님 환영합니다.</span> <input type="button"
									onclick="location.href='member.do?command=logout'"
									class="genric-btn success-border medium" value="로그아웃">
								<input type="button"
									onclick="location.href='member.do?command=update'"
									class="genric-btn success-border medium" value="회원정보 수정">
							</div>
							<hr>

							<div style="padding-bottom: 15px;">
								<h3 style="padding: 10px 0;">회원 정보</h3>
								<table>
									<col width="150">
									<col width="550">
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
							<hr>
							<div style="padding-bottom: 15px;">
								<h3 style="padding: 10px 0;">계좌 정보</h3>
								<table>
									<col width="100">
									<col width="400">
									<col width="200">
									<tr>
										<th><%=dto.getbankName() %>은행</th>
										<td><%=dto.getbankNo() %></td>
										<td><%=dto.getAccount() %>원</td>
									</tr>
									<tr>
										<td colspan="3">
											<form action="member.do" method="post">
												<input type="hidden" name="command" value="charge_account">
												<input type="hidden" name="id" value="<%=dto.getId()%>">
												<input type="hidden" name="pw" value="<%=dto.getPw()%>">
												<input type="hidden" name="account"
													value="<%=dto.getAccount()%>"> <input type="number"
													value="0" name="chargenum"> <input type="submit"
													value="충전">
											</form>
										</td>
									</tr>
								</table>
							</div>
							<hr>

							<div style="padding-bottom: 25px;">
								<h3 style="padding: 10px 0;">거래 내역</h3>
								<table>
									<tr>
										<th>종 목 명</th>
										<th>보유 수량</th>
										<th>매수 / 매도</th>
									</tr>
									<%
				for (int i = 0; i < list.size(); i++) {
			%>
									<tr>
										<td><%=list.get(i).getTradeNo()%></td>
										<td><%=list.get(i).getstockName()%></td>
										<td><%=list.get(i).getHolding()%></td>
										<td><%=list.get(i).getStatus()%></td>
									</tr>
									<%
				}
			%>
								</table>
							</div>
						</div>
					</div>
				</div>
			</div>
	</section>
	<!--================End Home Banner Area =================-->

	<%@ include file="./form/footer.jsp"%>


</body>
</html>