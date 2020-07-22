<%@page import="com.semi.dto.MemberDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
	MemberDto dto = new MemberDto();
%>
 <!--================Header Menu Area =================-->
        <header class="header_area">
            <div class="main_menu">
            	<nav class="navbar navbar-expand-lg navbar-light">
					<div class="container box_1620">
						<!-- Brand and toggle get grouped for better mobile display -->
						<a class="navbar-brand logo_h" href="index.html"><img src="img/logo.png" alt=""></a>
						<button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
							<span class="icon-bar"></span>
							<span class="icon-bar"></span>
							<span class="icon-bar"></span>
						</button>
						<!-- Collect the nav links, forms, and other content for toggling -->
						<div class="collapse navbar-collapse offset" id="navbarSupportedContent">
							<ul class="nav navbar-nav menu_nav ml-auto">
								<li class="nav-item active"><a class="nav-link" href="index.jsp">Home</a></li> 
					<li class="nav-item submenu dropdown">
						<a href="#" class="nav-link dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">시장정보</a>
						<ul class="dropdown-menu">
							<li class="nav-item"><a class="nav-link" href="portfolio.html">기업별 조회</a></li>
							<li class="nav-item"><a class="nav-link" href="elements.html">전종목 시세</a></li>
						</ul>
					</li> 
					<li class="nav-item"><a class="nav-link" href="about-us.html">커뮤니티</a></li> 
					<li class="nav-item"><a class="nav-link" href="trade.do?command=trading">모의거래</a></li> 
					<li class="nav-item submenu dropdown">
						<a href="mypage.jsp" class="nav-link dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">마이페이지</a>
						<ul class="dropdown-menu">
							<li class="nav-item"><a class="nav-link" href="blog.html">거래내역 조회</a></li>
							<li class="nav-item"><a class="nav-link" href="single-blog.html">회원정보 수정</a></li>
						</ul>
					</li> 
					<li class="nav-item"><a class="nav-link" href="login.jsp">Login/Register</a></li>
							</ul>
						</div> 
					</div>
            	</nav>
            </div>
        </header>
        <!--================Header Menu Area =================-->
</body>
</html>