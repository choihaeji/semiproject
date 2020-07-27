<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<% request.setCharacterEncoding("UTF-8"); %>
<% response.setContentType("text/html; charset=UTF-8"); %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>아이디 중복체크</title>
<link rel="stylesheet" href="css/style.css">
<link rel="stylesheet" href="css/responsive.css">
<script type="text/javascript">
	onload=function(){
		var id = opener.document.getElementsByName("id")[0].value;
		document.getElementsByName("chkid")[0].value = id;
	}
	
	function confirm(bool){
		if(bool =="true"){
			opener.document.getElementsByName("pw")[0].focus();
			opener.document.getElementsByName("id")[0].title="y";
		} else {
			opener.document.getElementsByName("id")[0].focus();
			opener.document.getElementsByName("id")[0].title="n";
			opener.document.getElementsByName("id")[0].value = "";
		}
		
		self.close();
	}
</script>
</head>
<%
	String idnotused = request.getParameter("idnotused");
%>
<body>
	<div class="container">
		<br>
		<div align="center"><%=idnotused.equals("true")? "사용가능한 ID 입니다":"ID가 존재합니다." %></div>
		<br>
		<div align="center">
			<input class="genric-btn default circle small" type="button" value="확인" onclick="confirm('<%=idnotused%>');">
		</div>
	</div>
</body>
</html>