<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<% request.setCharacterEncoding("UTF-8"); %>
<% response.setContentType("text/html; charset=UTF-8"); %>

<!DOCTYPE html>
<html>
<head>
<!-- Required meta tags -->
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
<!-- main css -->
<link rel="stylesheet" href="css/style.css">
<link rel="stylesheet" href="css/responsive.css">
 
<style type="text/css">
.col-lg-8 col-md-8 {
	margin-top: 100px;
}

.col-lg-8 col-md-8 p {
	width: 380px;
	margin: 0 auto;
	padding: 50px 20px;
	text-align: center;
}

#d1 {
	width: 500px;
	height: 1000px;
	margin: 0 auto;
}

.div_box {
	position: absolute;
	width: 100px;
	height: 100px;
}
</style>

<meta charset="UTF-8">
<title>로그인</title>
</head>
<body>
	<!--  <h1>로그인</h1>
	<form action="member.do" method="post">
		<input type="hidden" name="command" value="login" >
		<table border="1">
			<col width="100"><col width="100" >
			<tr>
				<th>I D : </th>
				<td><input type="text" name="id" ></td>
			</tr>
			<tr>
				<th>P W : </th>
				<td><input type="password" name="pw" ></td>
			</tr>
			<tr>
				<td colspan="2" >
					<input type="submit" value="login" >
					<input type="button" value="regist"
								onclick="location.href='member.do?command=registform'" >
					<input type="button" onclick="location.href='searchid1.jsp'" value="id 찾기">
					<input type="button" onclick="location.href='searchpw1.jsp'" value="pw 찾기">
				</td>
			</tr>
		</table>
	</form>
	
	----------------------------------------------------------------------------------------------- -->
	<!--================Header Menu Area =================-->
	<%@ include file="form/header.jsp"%>
	<!--================Header Menu Area =================-->
	<!--================Home Banner Area =================-->
	<section class="banner_area">
		<div class="box_1620">
			<div class="banner_inner d-flex align-items-center">
				<div class="container">
					<div class="banner_content text-center">
						<h2>로그인</h2>
						
					</div>
				</div>
			</div>
		</div>
	</section>
	<!--================Home Banner Area =================-->
	
	<section class="contact_area p_120">
 
 
    <!-- ==================로그인 부분======================= -->       
	<div class="col-lg-8 col-md-8" id="d1">
		<h3 class="mb-30 title_color">로그인</h3>
		<form action="member.do" method="post">
			<%
					String before = request.getHeader("referer");
				%>
			<input type="hidden" name="before" value="<%=before %>"> <input
				type="hidden" name="command" value="login">
			<div class="mt-10" border="1">
				<input type="text" name="id" placeholder="ID"
					onfocus="this.placeholder = ''" onblur="this.placeholder = 'ID'"
					required="" class="single-input">
			</div>
			<div class="mt-10">
				<input type="password" name="pw" placeholder="Password"
					onfocus="this.placeholder = ''"
					onblur="this.placeholder = 'Password'" required=""
					class="single-input">
			</div>
			<div>
			<input type="submit" class="genric-btn success circle" value="Login">
			<input type="button" value="Regist" class="genric-btn success circle"
				onclick="location.href='member.do?command=registform'"> <input
				type="button" onclick="location.href='searchid1.jsp'" value="id 찾기"
				class="genric-btn success circle"> <input type="button"
				onclick="location.href='searchpw1.jsp'" value="pw 찾기"
				class="genric-btn success circle">
			</div>
		</form>
	</div>
    <!-- ==================로그인 부분======================= -->       
        </section>
	
	
	
	
	
	<%@ include file="form/footer.jsp"%>
</body>
</html>
