<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<% request.setCharacterEncoding("UTF-8"); %>
<% response.setContentType("text/html; charset=UTF-8"); %>

<%@ page import="com.semi.dto.MemberDto" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

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
<!-- main css -->
<link rel="stylesheet" href="css/style.css">
<link rel="stylesheet" href="css/responsive.css">

<title>아이디 찾기</title>
<script type="text/javascript">
</script>
<%
	MemberDto dto = (MemberDto)session.getAttribute("dto");
	if(dto==null){
		pageContext.forward("index.jsp");
	}
%>
</head>
<body>

<jsp:include page="form/header.jsp"></jsp:include>	
	<!--================Home Banner Area =================-->
	<section class="banner_area">
		<div class="box_1620">
			<div class="banner_inner d-flex align-items-center">
				<div class="container">
					<div class="banner_content text-center">
						<h2>회원정보 찾기</h2>
						<div class="page_link">
							<a href="trade.do?command=index">Home</a> <a
								href="trade.do?commnad=trading">login</a>
						</div>
					</div>
				</div>
			</div>
		</div>
	</section>
	<!--================End Home Banner Area =================-->
<section class="blog_area single-post-area p_120">
		
		<div class="wrap" style="text-align:center;">
		<div id="userName">[<%=dto.getName()%>]님의 아이디는</div><br>
		<div id="userId">[<b><%=dto.getId() %></b>] 입니다.</div><br>
		<button id="button" class="btn btn-outline-info " onclick="location.href='login.jsp'">로그인 하러가기</button>
		</div>

</section>

<%@ include file="form/footer.jsp" %>

	</body>
	
</html>