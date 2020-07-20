<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<% request.setCharacterEncoding("UTF-8"); %>
<% response.setContentType("text/html; charset=UTF-8"); %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>로그인</h1>
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
					<a href="https://kauth.kakao.com/oauth/authorize?client_id=5d72007ee138ddab5fe6236180b87978&redirect_uri=http://localhost:8787/Semiproject/kakaoLogin.jsp&response_type=code">
						<img src="./img/kakao_login_small.png">
					</a>
				</td>
			</tr>
		</table>
	</form>
</body>
</html>