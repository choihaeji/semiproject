<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<% request.setCharacterEncoding("UTF-8"); %>
<% response.setContentType("text/html; charset=UTF-8"); %>

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
	function Chk(){
		var name = document.getElementsByName("name")[0];
        var email = document.getElementsByName("email")[0];
		
		if(name.value.trim()=="" || name.value==null){
			alert("이름을 입력해 주세요.");
			return false;
		}
		if(email.value.trim()=="" || email.value==null){
			alert("이메일을 입력해 주세요.");
			return false;
			
		}
	}
	
	
</script>
</head>
<body>

	<%@ include file="form/header.jsp"%>
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

  <div style="text-align:center;">
	<h1>아이디 찾기</h1>
	<form action="member.do" method="post" > 
		<input type="hidden" name="command" value="searchid">
		<div class="comment-list" style="width: 1000px; display: inline-block;">
		<table border="1" style="position : relative ; left:330px;">
			<col width="150"><col width="150" >
			<tr>
				<th rowspan="1">이름 입력</th>			
				<td><input type="text" name="name"></td>
			</tr>
			<tr>
				<th rowspan="1">이메일 입력</th>			
				<td><input type="text" name="email"></td>
			</tr>
			<tr>
				<td colspan="2">
					<input type="submit" value="확인" onclick="return Chk();" class="genric-btn default radius">&nbsp;
					<input type="button" value="취소" onclick="location.href='login.jsp'" class="genric-btn default radius">&nbsp;
				</td>
			</tr>
		</table>
		</div>
		</form>
	</div>
	
</section>

<%@ include file="form/footer.jsp" %>

</body>
</html>