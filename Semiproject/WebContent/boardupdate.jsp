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
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width" initial-scale="1">
<link rel="stylesheet" href="css/bootstrap.css">
<title>jsp 게시판 웹사이트</title>
</head>
<body>

	<%
		//로긴한사람이라면	 userID라는 변수에 해당 아이디가 담기고 그렇지 않으면 null값
		String userID = null;
		if(session.getAttribute("dto") != null){
			userID = ((MemberDto)session.getAttribute("dto")).getId();
		}
		//로그인 안한 경우
		if(userID == null) {
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('로그인을 하세요.')");
			script.println("location.href = 'login.jsp'");
			script.println("</script>");
		}

		int boardNum = 0;
		if (request.getParameter("boardNum") != null) {
			boardNum = Integer.parseInt(request.getParameter("boardNum"));
		}
		if (boardNum == 0) {
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('유효하지 않은 글 입니다.')");
			script.println("location.href = 'boardlist.jsp'");
			script.println("</script>");
		}

		BoardDto dto = new BoardDao().getBoardview(boardNum);
		
		if (!userID.equals(dto.getUserID())) {
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('권한이 없습니다.')");
			script.println("location.href = 'boardlist.jsp'");
			script.println("</script>");				
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
							<a href="trade.do?command=trading">게시글 수정</a>							
						</div>
					</div>
				</div>
			</div>
		</div>
	</section>
	<!--================End Home Banner Area =================-->

	<!-- 게시판 --> 
	<section class="blog_area single-post-area p_120">
	<div class="container">
		<div class="row">
			<form method="post" action="Board.do?command=update&boardNum=<%= boardNum %> ">
				<table class="table table-striped"
					style="text-align: center; border: 1px solid #dddddd">
					<thead>
						<tr>
							<th colspan="2"
								style="background-color: #eeeeee; text-align: center; width: 1200px;">글 수정
						    </th>
						</tr>
					</thead>
					<tbody>
						<tr style=width: 1200px;>
							<td><input type="text" class="form-control"  required=""  placeholder="글 제목" name="boardTitle" maxlength="50" value="<%= dto.getBoardTitle() %>" ></td>
						</tr>
						<tr style=width: 1200px;>
							<td><textarea class="form-control"  required=""  placeholder="글 내용" name="boardContent" maxlength="2048" style="height: 350px; resize:none;" ><%= dto.getBoardContent() %></textarea></td>
						</tr>
					</tbody>
				</table>	
				<button type="submit" class="btn btn-primary pull-right" >수정</button>
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