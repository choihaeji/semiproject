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
		
	
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width" initial-scale="1">
<link rel="stylesheet" href="css/bootstrap.css">
<title>Insert title here</title>
</head>
<body>
	<%
		//로긴한 상태라면 userID 변수에 해당 아이디가 담김.아니면 널값
		String userID = null;
		MemberDto user = (MemberDto)session.getAttribute("dto");
		
		if(session.getAttribute("dto") != null){
			userID = user.getId();
		}
		System.out.println("userID:"+userID);
		
		int pageNumber = 1; //기본페이지 넘버
		
		//페이지넘버값이 있을때
		if (request.getParameter("pageNumber") != null) {
			pageNumber = Integer.parseInt(request.getParameter("pageNumber"));
		}
		
	%>
	<!-- 네비 링크부분 -->
	<nav class="navbar navbar-default">
		<div class="navbar-header">
			<button type="button" class="navbar-toggle collapsed"
				data-toggle="collapse" data-target="bs-example-navbar-collapse-1"
				aria-expaned="false">
				<span class="icon-bar"></span> <span class="icon-bar"></span> <span
					class="icon-bar"></span>
			</button>
			<a class="navbar-brand" href="index.jsp">주식거래</a>
		</div>
		<div class="collapse navbar-collapse"
			id="#bs-example-navbar-collapse-1">
			<ul class="nav navbar-nav">
				<li><a href="index.jsp">메인</a></li>
				<li class="active"><a href="boardlist.jsp">게시판</a></li>
			</ul>

			<%
				//로그인안된경우
				if (userID==null || userID.length()==0 ) {
			%>
			<ul class="nav navbar-nav navbar-right">
				<li class="dropdown"><a href="#" class="dropdown-toggle"
					data-toggle="dropdown" role="button" aria-haspopup="true"
					aria-expanded="false">접속하기<span class="caret"></span></a>
					<ul class="dropdown-menu">
						<li><a href="login.jsp">로그인</a></li>
						<li><a href="registform.jsp">회원가입</a></li>
					</ul></li>
			</ul>
			<%
				} else {
			%>
			<ul class="nav navbar-nav navbar-right">
				<li class="dropdown"><a href="#" class="dropdown-toggle"
					data-toggle="dropdown" role="button" aria-haspopup="true"
					aria-expanded="false">회원관리<span class="caret"></span></a>
					<ul class="dropdown-menu">
						<li><a href="member.do?command=logout">로그아웃</a></li>
					</ul></li>
			</ul>
			<%
				}
			%>
		</div>
	</nav>

	<!-- 게시판 -->
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
		
			<!-- 애니매이션 담당 JQUERY -->
	<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
	<!-- 부트스트랩 JS  -->
	<script src="js/bootstrap.js"></script>
	
	<script type="text/javascript">
		function page(){
			var pageN = p+1
		}
	</script>
</body>
</html>