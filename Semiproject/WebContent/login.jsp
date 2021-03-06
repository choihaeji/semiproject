<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%
	request.setCharacterEncoding("UTF-8");
%>
<%
	response.setContentType("text/html; charset=UTF-8");
%>

<!DOCTYPE html>
<html>
<head>
<!-- Required meta tags -->
<title>Login</title>
<style type="text/css">
.form {
	position: absolute;
	top: 50%;
	left: 50%;
	background: #fff;
	width: 285px;
	margin: -140px 0 0 -182px;
	padding: 40px;
	box-shadow: 0 0 3px rgba(0, 0, 0, 0.3);
}

input {
	outline: none;
	display: block;
	width: 100%;
	margin: 0 0 20px;
	padding: 10px 15px;
	border: 1px solid #ccc;
	color: #ccc;
	font-family: "Roboto";
	box-sizing: border-box;
	font-size: 14px;
	font-wieght: 400;
	-webkit-font-smoothing: antialiased;
	-moz-osx-font-smoothing: grayscale;
	transition: 0.2s linear; &
	input: focus{
      color: #333;
	border: 1px solid #44c4e7;
}

}
button {
	cursor: pointer;
	background: #44c4e7;
	width: 100%;
	padding: 10px 15px;
	border: 0;
	color: #fff;
	font-family: "Roboto";
	font-size: 14px;
	font-weight: 400;
	&:
	hover
	{
	background
	:
	#369cb8;
}

}
.size {
	position: relative;
	left: 55%;
	margin-left: -250px;
	padding-top: 50px;
	text-align: center;
	width: 350px;
	height: 250px;
}
}
</style>
</head>
<body>
	<!--================Header Menu Area =================-->
	<%@ include file="form/header.jsp"%>
	<!--================Header Menu Area =================-->
	<!--================Home Banner Area =================-->
	<section class="banner_area">
		<div class="box_1620">
			<div class="banner_inner d-flex align-items-center">
				<div class="container">
					<div class="banner_content text-center">
						<h2>Login</h2>

					</div>
				</div>
			</div>
		</div>
	</section>
	<!--================Home Banner Area =================-->
 
    <!-- ==================로그인 부분======================= -->       
	<section class="blog_area single-post-area p_120">
		<div class="container">
			<div class="size">
				<form action="member.do" method="post">

					<%
							String before = request.getHeader("referer");
					%>
					<input type="hidden" name="before" value="<%=before%>"> <input
						type="hidden" name="command" value="login">
					<div class="form-group">
						<input type="text" name="id" placeholder="ID"
							onfocus="this.placeholder = ''" onblur="this.placeholder = 'ID'"
							class="form-control">
					</div>
					<div class="form-group">
						<input type="password" name="pw" placeholder="Password"
							onfocus="this.placeholder = ''"
							onblur="this.placeholder = 'Password'" class="form-control">
					</div>
					<div class="form-group">
						<button name="button"type="submit">로그인</button>
					</div>
					<div>
						<a href="https://kauth.kakao.com/oauth/authorize?client_id=5d72007ee138ddab5fe6236180b87978&redirect_uri=http://localhost:8787/Semiproject/kakaoLogin.jsp&response_type=code">
            				<img src="./img/kakao_login_medium_wide.png" width="100%"></a>
					</div>
					<br>

					<div align="center">
						<a href="searchidpw1.jsp">ID/PW찾기</a>&nbsp;&nbsp;|&nbsp;&nbsp; <a
							href="member.do?command=registform">회원가입</a>
					</div>
				</form>
				<!-- ==================로그인 부분======================= -->
			</div>
		</div>
	</section>





	<%@ include file="form/footer.jsp"%>
</body>
</html>
