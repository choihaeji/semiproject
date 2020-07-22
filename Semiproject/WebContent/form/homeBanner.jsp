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
<script type="text/javascript" src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
<script type="text/javascript">
	$(function() {
		var kospi3 = $("#kospi3").text();
		if (kospi.slice(0, 1) == "-") {
			
		}
	});
</script>
</head>
<body>
	<%
		Document doc = Jsoup.connect("https://finance.naver.com/sise/sise_index.nhn?code=KOSPI").get();
		String kospiPrice = doc.select("#now_value").text();
		String temp = doc.select("#change_value_and_rate span").text();
		String kospiChange = temp.substring(0, temp.length() - 2);
		temp = doc.select("#change_value_and_rate").text().replaceFirst(kospiChange, "");
		temp = temp.substring(0, temp.length() - 2);
	%>
	<section class="home_banner_area">
			 <div class="container box_1620">
				 <div class="banner_inner d-flex align-items-center">
		<div class="banner_content">
			<div class="media">
				<div class="d-flex">
					<img src="img/personal.jpg" alt="">
				</div>
				<div class="media-body">
					<div class="personal_text">
						<div id="kospiInfo">
							<p id="kospi1"><%=kospiPrice %>
								<span id="kospi2"><%=kospiChange %>
									<span id="kospi3"><%=temp %></span>
								</span>
							</p>
							<img width="700px" height="500px"
							src="https://ssl.pstatic.net/imgstock/chart3/day/KOSPI.png?sidcode=1595298373676">
						</div>
						
					</div>
				</div>
			</div>
		</div>
	</div>
			</div>
	</section>
</body>
</html>