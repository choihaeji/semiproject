<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<% request.setCharacterEncoding("UTF-8"); %>
<% response.setContentType("text/html; charset=UTF-8"); %>

<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>

	<%@ include file="form/header.jsp"%>
	<!--================Home Banner Area =================-->
	<section class="banner_area">
		<div class="box_1620">
			<div class="banner_inner d-flex align-items-center">
				<div class="container">
					<div class="banner_content text-center">
						<h2>회원탈퇴</h2>
						<div class="page_link">
							<a href="#">Home</a> <a
								href="#">MyPage</a>
								<a href="#">회원탈퇴</a>
						</div>
					</div>
				</div>
			</div>
		</div>
	</section>
	<!--================End Home Banner Area =================-->
<section class="blog_area single-post-area p_120">

<div style="text-align:center;">
	<%
		String message = (String)request.getAttribute("result");
	%>
	<%= message %>
	<br><br>
	<a href="index.jsp">메인페이지로</a>
</div>

</section>
</body>
</html>
