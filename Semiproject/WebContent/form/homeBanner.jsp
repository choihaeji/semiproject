<%@ page import="org.jsoup.nodes.Document"%>
<%@ page import="org.jsoup.Jsoup" %>
<%@ page import="org.jsoup.select.Elements" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% request.setCharacterEncoding("UTF-8"); %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="css/homeBanner.css">

</head>
<body>
	<%
		String kospi = Jsoup.connect("https://finance.naver.com/sise/sise_index.nhn?code=KOSPI").get().select("#quotient").toString().replace("\n", "");
		String kospi_info = Jsoup.connect("https://finance.naver.com/sise/sise_index.nhn?code=KOSPI").get().select("#contentarea_left > div.box_top_sub > div > dl").toString().replace("\n", "");
		String kosdaq = Jsoup.connect("https://finance.naver.com/sise/sise_index.nhn?code=KOSDAQ").get().select("#quotient").toString().replace("\n", "");
		String kosdaq_info = Jsoup.connect("https://finance.naver.com/sise/sise_index.nhn?code=KOSDAQ").get().select("#contentarea_left > div.box_top_sub > div > dl").toString().replace("\n", "");
	%>
	<section class="welcome_area p_120">
		<div class="container box_1620">
			<div class="banner_inner d-flex align-items-center">
				<div class="contents">
					<div class="m_contents">
						<div id="kosp">
							
						</div>
						<div id="kosd">
							
						</div>
					</div>
					<div class="media-body">
						<div class="personal_text">
					
					
						</div>
					</div>
				</div>
			</div>
		</div>
	</section>
	<script src="js/jquery-3.3.1.min.js"></script>
	<script type="text/javascript">
	function showKos(){
		var htmlp = [];
		var htmld = [];
		var i = 0;
		var j = 0;
		
		htmlp[i++] = '<h2>KOSPI</h2>';
		htmlp[i++] = '<%=kospi%>';
		htmlp[i++] = '<img src="https://ssl.pstatic.net/imgfinance/chart/main/KOSPI.png?t=' + new Date().getTime() + '" width="301" height="127" alt="지수">';
		htmlp[i++] = '<%=kospi_info%>';
		
		htmld[j++] = '<h2>KOSDAQ</h2>';
		htmld[j++] = '<%=kosdaq%>';
		htmld[j++] = '<img src="https://ssl.pstatic.net/imgfinance/chart/main/KOSDAQ.png?t=' + new Date().getTime() + '" width="301" height="127" alt="지수">';
		htmld[j++] = '<%=kosdaq_info%>';
		
		$("#kosp")[0].innerHTML = htmlp.join('');
		$("#kosd")[0].innerHTML = htmld.join('');
	}
	
	function setInter(){
		showKos();
		setI = setInterval(function(){showKos();}, 60000); //1분마다 갱신
	}
	
	$(function(){
		setInter();
	});
	
</script>
</body>
</html>