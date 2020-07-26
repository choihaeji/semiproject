<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%
	request.setCharacterEncoding("UTF-8");
%>
<%
	response.setContentType("text/html; charset=UTF-8");
%>

<!DOCTYPE html>
<html>
<head>
<title>아이디/비밀번호 찾기</title>
<script type="text/javascript">
	function idChk() {
		var name = document.getElementsByName("name")[0];
		var email = document.getElementsByName("email")[0];

		if (name.value.trim() == "" || name.value == null) {
			alert("이름을 입력해 주세요.");
			return false;
		}
		if (email.value.trim() == "" || email.value == null) {
			alert("이메일을 입력해 주세요.");
			return false;

		}
	}
	function pwChk() {
		var id = document.getElementsByName("id")[1];
		var name = document.getElementsByName("name")[1];
		var email = document.getElementsByName("email")[1];

		if (id.value.trim() == "" || id.value == null) {
			alert("아이디를 입력해 주세요.");
			return false;
		}
		if (name.value.trim() == "" || name.value == null) {
			alert("이름을 입력해 주세요.");
			return false;
		}
		if (email.value.trim() == "" || email.value == null) {
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
						<h2>ID/PW찾기</h2>
						<div class="page_link">
							<a href="index.jsp">Home</a> <a href="searchidpw1.jsp">id/pw찾기</a>
						</div>
					</div>
				</div>
			</div>
		</div>
	</section>
	<!--================End Home Banner Area =================-->
	<section class="blog_area single-post-area p_120">

		<div class="container">
			<h3>아이디 찾기</h3>
			<hr>
			<p>회원가입 시 , 입력하신 이름 + 이메일로 아이디를 확인하실 수 있습니다.</p>
			<br>
			<form action="member.do" method="post">
				<input type="hidden" name="command" value="searchid">
				<table class="table">
					<colgroup>
						<col width="135">
						<col width="*">
					</colgroup>
					<tr height="38">
						<th style="border-top: 1px solid black;">이&nbsp;&nbsp;름</th>
						<td style="border-top: 1px solid black;"><input type="text"
							name="name"></td>
					</tr>
					<tr height="38">
						<th style="border-bottom: 1px solid black;">이메일</th>
						<td style="border-bottom: 1px solid black;"><input
							type="text" name="email"></td>
					</tr>
					<tr>
						<td colspan="2">
							<div align="center">
								<input type="submit" value="아이디 찾기" onclick="return idChk();"
									class="genric-btn default radius">&nbsp; <input
									type="button" value="취소" onclick="location.href='login.jsp'"
									class="genric-btn default radius">&nbsp;
							</div>
						</td>
					</tr>
				</table>
			</form>
		</div>

		<div class="container">
			<h3>비밀번호 찾기</h3>
			<hr>
			<p>회원가입 시, 입력하신 아이디 + 이름 + 이메일로 비밀번호를 확인하실 수 있습니다.</p>
			<br>
			<form action="member.do" method="post">
				<input type="hidden" name="command" value="searchpw">
				<table class="table">
					<colgroup>
						<col width="135">
						<col width="*">
					</colgroup>
					<tr height="38">
						<th style="border-top: 1px solid black; "><div>아이디</div></th>
						<td style="border-top: 1px solid black;"><div><input type="text"
							name="id" maxlength="30"></div></td>
					</tr>
					<tr height="38">
						<th>이&nbsp;&nbsp;름</th>
						<td><input type="text" name="name"></td>
					</tr>
					<tr height="38">
						<th style="border-bottom: 1px solid black;">이메일</th>
						<td style="border-bottom: 1px solid black;"><input
							type="text" name="email"></td>
					</tr>
					<tr>
						<td colspan="2">
							<div align="center">
								<input type="submit" value="비밀번호 찾기" onclick="return pwChk();"
									class="genric-btn default radius">&nbsp; <input
									type="button" value="취소" onclick="location.href='login.jsp'"
									class="genric-btn default radius">&nbsp;
							</div>
						</td>
					</tr>
				</table>
			</form>
		</div>
	</section>



	<%@ include file="form/footer.jsp"%>

</body>
</html>