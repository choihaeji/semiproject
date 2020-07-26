<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<% request.setCharacterEncoding("UTF-8"); %>
<% response.setContentType("text/html; charset=UTF-8"); %>

<%@ page import="java.io.PrintWriter"%>
<%@ page import="com.semi.dao.BoardDao"%>
<%@ page import="com.semi.dto.BoardDto"%>
<%@ page import="java.util.ArrayList"%>
<%@ page import="com.semi.dto.MemberDto" %>

<!DOCTYPE html>
<html>
<head>

		 <!-- BootStrap -->
		<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
		<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
		<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
		
		<!-- jquery -->
		<script src="//code.jquery.com/jquery.min.js"></script>
		
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width" initial-scale="1">
<link rel="stylesheet" href="css/bootstrap.css">
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%
		//로그인상태라면 userID에 해당 아이디값 담기. 아니면 널값
		String userID = null;
		MemberDto user = (MemberDto)session.getAttribute("dto");
		if(session.getAttribute("dto") != null){
			userID = user.getId();
		}
	%>

	<!-- 네비게이션  -->
	<jsp:include page="form/header.jsp"></jsp:include>
	
	<!--================Home Banner Area =================-->
	<section class="banner_area">
		<div class="box_1620">
			<div class="banner_inner d-flex align-items-center">
				<div class="container">
					<div class="banner_content text-center">
						<h2>게시판</h2>
						<div class="page_link">
							<a href="trade.do?command=index">Home</a> <a
								href="trade.do?commnad=trading">커뮤니티</a>
						</div>
					</div>
				</div>
			</div>
		</div>
	</section>
	<!--================End Home Banner Area =================-->
	
	<section class="blog_area single-post-area p_120">
	<!-- 게시판 -->
	<div class="container">
		<div class="row">
			<form method="post" action="boardwriteAction.jsp">
			<input type="hidden" name=command value="boardWrite">
				<table class="table table-striped"
					style="text-align: center; border: 1px solid #dddddd">
					<thead>
						<tr>
							<th colspan="2"
								style="background-color: #eeeeee; text-align: center; width: 1200px;">게시판 등록</th>
						</tr>
					</thead>
					<tbody>
						<tr style=width: 1200px;>
							<td><input type="text" class="form-control" placeholder="글 제목" name="boardTitle" maxlength="50"/></td>
						</tr>
						<tr style=width: 1200px;>
							<td><textarea class="form-control" placeholder="글 내용" name="boardContent" maxlength="2048" style="height: 350px;"></textarea></td>
						</tr>
					</tbody>
				</table>	
				<input type="submit" class="genric-btn info circle arrow" value="글쓰기" />
			</form>

		</div>
	</div>
	</section>	
	<%@ include file="form/footer.jsp" %>

	<!-- 애니매이션 담당 JQUERY -->
	<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
	<!-- 부트스트랩 JS  -->
	<script src="js/bootstrap.js"></script>
</body>
</html>