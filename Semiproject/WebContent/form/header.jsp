<%@page import="com.semi.dto.MemberDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<link rel="icon" href="img/favicon.png" type="image/png">
<title>MeetMe Personal</title>
<!-- Bootstrap CSS -->
<link rel="stylesheet" href="css/bootstrap.css">
<link rel="stylesheet" href="vendors/linericon/style.css">
<link rel="stylesheet" href="css/font-awesome.min.css">
<link rel="stylesheet" href="vendors/owl-carousel/owl.carousel.min.css">
<link rel="stylesheet" href="vendors/lightbox/simpleLightbox.css">
<link rel="stylesheet" href="vendors/nice-select/css/nice-select.css">
<link rel="stylesheet" href="vendors/animate-css/animate.css">
<link rel="stylesheet" href="vendors/popup/magnific-popup.css">
<link rel="stylesheet" href="vendors/flaticon/flaticon.css">
<!-- main css -->
<link rel="stylesheet" href="css/style.css">
<link rel="stylesheet" href="css/responsive.css">
</head>
<body>
	<%
		MemberDto dto = new MemberDto();
	%>

	<%
		//로긴한 상태라면 userID 변수에 해당 아이디가 담김.아니면 널값
	String userID = null;
	MemberDto user = (MemberDto) session.getAttribute("dto");

	if (session.getAttribute("dto") != null) {
		userID = user.getId();
	}
	%>

	<!--================Header Menu Area =================-->
	<header class="header_area">
		<div class="main_menu">
			<nav class="navbar navbar-expand-lg navbar-light">
				<div class="container box_1620">
					<!-- Brand and toggle get grouped for better mobile display -->
					<a class="navbar-brand logo_h" href="index.jsp"><img
						src="img/logo.png" alt=""></a>
					<button class="navbar-toggler" type="button" data-toggle="collapse"
						data-target="#navbarSupportedContent"
						aria-controls="navbarSupportedContent" aria-expanded="false"
						aria-label="Toggle navigation">
						<span class="icon-bar"></span> <span class="icon-bar"></span> <span
							class="icon-bar"></span>
					</button>
					<!-- Collect the nav links, forms, and other content for toggling -->
					<div class="collapse navbar-collapse offset"
						id="navbarSupportedContent">
						<ul class="nav navbar-nav menu_nav ml-auto">
							<li class="nav-item active"><a class="nav-link"
								href="index.jsp">Home</a></li>
							<li class="nav-item submenu dropdown"><a href="#"
								class="nav-link dropdown-toggle" data-toggle="dropdown"
								role="button" aria-haspopup="true" aria-expanded="false">시장정보</a>
								<ul class="dropdown-menu">
									<li class="nav-item"><a class="nav-link"
										href="stock_search.jsp">기업별 조회</a></li>
									<li class="nav-item"><a class="nav-link"
										href="StockController?command=stock_rank">전종목 시세</a></li>
								</ul></li>
							<li class="nav-item"><a class="nav-link"
								href="boardlist.jsp">커뮤니티</a></li>
							<li class="nav-item"><a class="nav-link"
								href="trade.do?command=trading">모의거래</a></li>
							<li class="nav-item"><a class="nav-link"
								href="mypage.jsp">마이페이지</a></li>
							<%
								if (userID == null || userID.length() == 0) {
							%>
							<li class="nav-item"><a class="nav-link" href="login.jsp">Login</a></li>
							<%
								} else {
							%>
							<li class="nav-item"><a class="nav-link"
								href="member.do?command=logout">Logout</a></li>
							<%
								}
							%>
						</ul>
					</li> 
					
							</ul>
						</div> 
					</div>
				</div>
			</nav>
		</div>
	</header>
	<!--================Header Menu Area =================-->
</body>
</html>