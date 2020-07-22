<%@page import="org.jsoup.nodes.Document"%>
<%@ page import = "org.jsoup.Jsoup" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% request.setCharacterEncoding("UTF-8"); %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%
		String kospiPrice = Jsoup.connect("https://finance.naver.com/sise/sise_index.nhn?code=KOSPI").get().select("#now_value").text();
	%>
	<section class="home_banner_area">
			 <div class="container box_1620">
				 <div class="banner_inner d-flex align-items-center">
		<div class="banner_content">
			<div class="media">
				<div class="d-flex">
					<h1>KOSPI <%=kospiPrice %></h1>
					<hr>
					<h1></h1>
				</div>
				<div class="media-body">
					<div class="personal_text">
						
						
					</div>
				</div>
			</div>
		</div>
	</div>
			</div>
	</section>
</body>
</html>