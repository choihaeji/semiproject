<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<% request.setCharacterEncoding("UTF-8"); %>
<% response.setContentType("text/html; charset=UTF-8"); %>

<%@ page import="com.semi.dto.MemberDto" %>
<%@ page import = "java.io.PrintWriter" %>
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

<title>비밀번호 찾기</title>
<script type="text/javascript">
</script>
</head>

<body>
<%
	MemberDto dto = (MemberDto)session.getAttribute("dto");
	/* if(dto==null){
		pageContext.forward("index.jsp");
	} */
	String chk = request.getParameter("chk");
	if(chk.equals("y")){
%>
		<div class="wrap" style="text-align:center;">
		<br>
		<div>[<%=dto.getId()%>]님의 비밀번호는</div>
		<div id="userId">[<b><%=dto.getPw() %></b>] 입니다.</div><br>
		<button id="button" class="btn btn-outline-info " onclick="move();">로그인 하러가기</button>	
		</div>
<%
	}else if(chk.equals("n")){
%>
		<div class="wrap" style="text-align:center;">
		<br>
		<div>회원정보가 존재하지 않거나,</div>
		<div> 회원정보가 일치하지 않습니다.</div><br>
		<button id="button" class="btn btn-outline-info " onclick="cls();">닫기</button>
		</div>
<%
	}
%>

<script type="text/javascript">
function move(){
	opener.document.location.href="login.jsp";
	self.close();
}
function cls(){
	self.close();
}
</script>
</body>
</html>