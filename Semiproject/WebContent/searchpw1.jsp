<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<% request.setCharacterEncoding("UTF-8"); %>
<% response.setContentType("text/html; charset=UTF-8"); %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>비밀번호 찾기</title>
<script type="text/javascript">
	function Chk(){
		var id = document.getElementsByName("id")[0];
		var name = document.getElementsByName("name")[0];
        var email = document.getElementsByName("email")[0];
		
        if(id.value.trim()=="" || id.value==null){
			alert("아이디를 입력해 주세요.");
			return false;
		}
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

	<h1>아이디 찾기</h1>
	<form action="member.do" method="post"> 
		<input type="hidden" name="command" value="searchpw">
		<table border="1">
			<col width="150"><col width="150" >
			<tr>
				<th rowspan="1">아이디 입력</th>			
				<td><input type="text" name="id"></td>
			</tr>
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
					<input type="submit" value="확인" onclick="return Chk();">
					<input type="button" value="취소" onclick="location.href='login.jsp'">
				</td>
			</tr>
		</table>
		</form>
</body>
</html>