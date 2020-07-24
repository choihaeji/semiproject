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
						<h2>모의거래</h2>
						<div class="page_link">
							<a href="trade.do?command=index">Home</a> <a
								href="trade.do?commnad=trading">모의거래</a>
						</div>
					</div>
				</div>
			</div>
		</div>
	</section>
	<!--================End Home Banner Area =================-->
	
	<%
		//로긴한 상태라면 userID 변수에 해당 아이디가 담김.아니면 널값
// 		String userID = null;
// 		MemberDto user = (MemberDto)session.getAttribute("dto");
		
// 		if(session.getAttribute("dto") != null){
// 			userID = user.getId();
// 		}
// 		System.out.println("userID:"+userID);
		
		int pageNumber = 1; //기본페이지 넘버
		
		//페이지넘버값이 있을때
		if (request.getParameter("pageNumber") != null) {
			pageNumber = Integer.parseInt(request.getParameter("pageNumber"));
		}
		
	%>
	<!-- 게시판 -->
	<section class="blog_area single-post-area p_120">
	<div class="container">
		<div class = "row">
			<table class="table table-striped" style="text-align:center; border:1px solid #dddddd"> 
				<thead>
					<tr>
						<th style="background-color: #eeeeee; text-align: center;">번호</th>
						<th style="background-color: #eeeeee; text-align: center;">제목</th>
						<th style="background-color: #eeeeee; text-align: center;">작성자</th>
						<th style="background-color: #eeeeee; text-align: center;">작성일</th>
					</tr>
				</thead>
				<tbody>
					<%
						BoardDao dao = new BoardDao();
						ArrayList<BoardDto> list = dao.getList(pageNumber);
						System.out.println(list.size());
						int max =list.size()/10 + 1;
						int begin = (pageNumber-1)*10;
						System.out.println("begin:"+begin);
						int end = begin+10;
						if(end>list.size()){
							end = list.size();
						}
						System.out.println("end:"+end);
						int num = list.size()-begin;
						for (int i = begin; i <end; i++) {
					%>
						<tr>
							<td><%=num%></td>
							<%num--; %>
							<td><a href="Board.do?command=boardview&boardNum=<%=list.get(i).getBoardNum()%>"><%=list.get(i).getBoardTitle()%></a></td>
							<td><%=list.get(i).getUserID()%></td>
							<td><%=list.get(i).getBoardDate().substring(0, 11) + list.get(i).getBoardDate().substring(11, 13) + "시"
							+ list.get(i).getBoardDate().substring(14, 16) + "분"%></td>
						</tr>
						<%
							}
						%>
					</tbody>
				</table>

				<div>
					<%
						for(int i=1;i<=max;i++){
					%>
						<a href="boardlist.jsp?pageNumber=<%=i %>"><%=i %></a>&nbsp;
					<%
						}
					%>
				</div>
				
			</div>
			<!-- 회원만넘어가도록 -->
				<%
					//if logined userID라는 변수에 해당 아이디가 담기고 if not null
					if (userID != null) {
				%>
				<a href="boardwrite.jsp" class="btn btn-primary pull-right">글쓰기</a>
				<%
					} else {
				%>
				<button class="btn btn-primary pull-right"
					onclick="if(confirm('로그인 하세요'))location.href='login.jsp';"
					type="button">글쓰기</button>
				<%
					}
				%>
		</div>
</section>
	
	<script type="text/javascript">
		function page(){
			var pageN = p+1
		}
	</script>
</body>
</html>