<%@page import="com.semi.dao.KakaoAPI"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% request.setCharacterEncoding("UTF-8"); %>
<% response.setContentType("text/html; charset=UTF-8"); %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<%
	KakaoAPI api = new KakaoAPI();
	String code = request.getParameter("code");
	String accessToken = api.getAccessToken(code);
	
	String email = api.getUserInfo(accessToken).getEmail();
%>
<body>
	<h1>추가 정보 입력</h1>
	<form action="member.do" method="post">
		<input type="hidden" name="command" value="insertmember">
		<table border="1">
			<tr>
				<th rowspan="2">아이디</th>			
				<td>
					<input type="text" name="id" title="n" required="required" value="<%=email.substring(0, email.indexOf("@")) %>">
					<input type="button" value="중복체크" onclick="idChk();" >
				</td>
			</tr>
			<tr>
				<td style="color:blue;">
					※ 영문자,숫자 포함하여 4~12자리로 입력. 첫글자는 영문
				</td>
			</tr>
			<tr>
				<th rowspan="2">비밀번호</th>
				<td><input type="password" onclick="idChkConfirm();" name="pw" required="required" onchange="pwCheck();" >
				</td>
			</tr>
			<tr>
				<td style="color:blue">
					※ 영문자,숫자,특수문자 포함하여 8~15자로 입력
				</td>
			</tr>
			<tr>
				<th>비밀번호 확인</th>
				<td>
					<input type="password" name="pwcheck" required="required" onchange="pwCheck();" >
					&nbsp;<span id="check"></span>
				</td>
			</tr>
			<tr>
				<th>이름</th>
				<td><input type="text" name="name" 
						required="required" placeholder="한글 2글자 이상 입력"
						value="<%=api.getUserInfo(accessToken).getName() %>">
				</td>
			</tr>
			<tr>
				<th>생년월일</th>
				<td>
					<input type="date" name="bday" required="required" value="2000-01-01">
				</td>
			</tr>
			<tr>
				<th>성별</th>
				<td>
					<select name="gender">
						<option value="남자">남</option>
						<option value="여자">여</option>
					</select>
				</td>
			</tr>
			<tr>
				<th>이메일</th>
				<td>
					<input type="text" name="email_id" required="required"
						value="<%=email.substring(0, email.indexOf("@")) %>">&nbsp;&nbsp;@&nbsp;
					<select name="email_url">
						<option value="@kakao.com">kakao.com</option>
						<option value="@naver.com">naver.com</option>
						<option value="@hanmail.net">hanmail.net</option>
						<option value="@gmail.com">gmail.com</option>
						<option value="@hotmail.com">hotmail.com</option>
						<option value="@yahoo.com">yahoo.com</option>
					</select>
				</td>
			</tr>
			<tr>
				<th>은행계좌</th>
				<td>
					<select name="bank_name">
						<option value="신한">신한</option>
						<option value="우리">우리</option>
						<option value="국민">국민</option>
						<option value="기업">기업</option>
						<option value="농협">농협</option>
						<option value="씨티">씨티</option>
						<option value="하나">하나</option>
						<option value="카카오뱅크">카카오뱅크</option>
					</select>
					<input type="text" name="bank_no" required="required" placeholder=" ( - ) 포함하여 전체 입력 ">
				</td>
			</tr>
			<tr>
				<td colspan="2">
					<input type="submit" value="가입" onclick="return validate();">
					<input type="reset" value="리셋">
					<input type="button" value="취소" onclick="location.href='login.jsp'">
				</td>
			</tr>
		</table>
	</form>
</body>
</html>