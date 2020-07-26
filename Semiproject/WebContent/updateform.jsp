<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%
	request.setCharacterEncoding("UTF-8");
%>
<%
	response.setContentType("text/html; charset=UTF-8");
%>

<%@ page import="com.semi.dto.MemberDto"%>

<%
	MemberDto dto = (MemberDto) session.getAttribute("dto");

if (dto == null) {
	pageContext.forward("index.jsp");
}
%>

<!DOCTYPE html>
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
<link rel="stylesheet" href="vendors/animate-css/animate.css">
<link rel="stylesheet" href="vendors/popup/magnific-popup.css">
<!-- main css -->
<link rel="stylesheet" href="css/style.css">
<link rel="stylesheet" href="css/responsive.css">

<title>회원정보 수정</title>
<script type="text/javascript"
	src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
<script type="text/javascript">
	$(document).ready(function(){
		$("#email_url").val("<%=dto.getEmailURL()%>").attr("selected","selected");
		$("#bank_name").val("<%=dto.getbankName()%>
	").attr("selected",
						"selected");
			});

	function pwCheck() {
		var pw1 = document.getElementsByName("pw")[0];
		var pw2 = document.getElementsByName("pwcheck")[0];

		if (pw1.value == pw2.value) {
			document.getElementById('check').innerHTML = '비밀번호가 일치합니다.'
			document.getElementById('check').style.color = 'blue';
		} else {
			document.getElementById('check').innerHTML = '비밀번호가 일치하지 않습니다.';
			document.getElementById('check').style.color = 'red';
		}
	}

	function validate() {
		var pw1 = document.getElementsByName("pw")[0];
		var pw2 = document.getElementsByName("pwcheck")[0];

		//pw 검사
		if (!check(
				/^.*(?=^.{8,15}$)(?=.*\d)(?=.*[a-zA-Z])(?=.*[!@#$%^&+=]).*$/,
				pw1, "유효하지 않은 비밀번호입니다.")) {
			return false;
		}

		//pw 확인
		if (pw1.value != pw2.value) {
			alert("비밀번호가 일치하지 않습니다.");
			pw2.value = "";
			pw2.focus();
			return false;
		}

		//이메일 검사
		var email = document.getElementsByName("email_id")[0];
		if (email.value.trim() == "" || email.value == null) {
			alert("이메일을 입력해 주세요.");
			return false;
		}

		//계좌번호 검사
		var bank = document.getElementsByName("bank_no")[0];
		if (bank.value.trim() == "" || bank.value == null) {
			alert("계좌번호를 입력해 주세요.");
			return false;
		}
	}
</script>

</head>

<body>
	<jsp:include page="form/header.jsp"></jsp:include>
	<!--================Home Banner Area =================-->
	<section class="banner_area">
		<div class="box_1620">
			<div class="banner_inner d-flex align-items-center">
				<div class="container">
					<div class="banner_content text-center">
						<h2>회원정보 수정</h2>
						<div class="page_link">
							<a href="index.jsp">Home</a> <a href="mypage.jsp">MyPage</a> <a
								href="member.do?command=update">회원정보수정</a>
						</div>
					</div>
				</div>
			</div>
		</div>
	</section>
	<!--================End Home Banner Area =================-->
	<section class="blog_area single-post-area p_120">

		<div class="container">

			<form action="member.do" method="post">
				<input type="hidden" name="command" value="updatemember"> <input
					type="hidden" name="mno" value="<%=dto.getMno()%>">
				<table class="table">
					<tr>
						<th>아이디</th>
						<td><input type="text" name="id" title="n"
							required="required" readonly="readonly" value="<%=dto.getId()%>">
						</td>
					</tr>
					
					<tr>
						<th rowspan="2">비밀번호</th>
						<td><input type="password" name="pw" required="required"
							onchange="pwCheck();"></td>
					</tr>
					
					<tr>
						<td style="color: blue">※ 영문자,숫자,특수문자 포함하여 8~15자로 입력</td>
					</tr>
					
					<tr>
						<th>비밀번호 확인</th>
						<td><input type="password" name="pwcheck"
							required="required" onchange="pwCheck();"> &nbsp;<span
							id="check"></span></td>
					</tr>
					
					<tr>
						<th>이름</th>
						<td><input type="text" name="name" required="required"
							placeholder="한글 2글자 이상 입력" readonly="readonly"
							value="<%=dto.getName()%>"></td>
					</tr>
					
					<tr>
						<th>생년월일</th>
						<td><input type="text" name="bday" required="required"
							readonly="readonly" value="<%=dto.getBdayAsString()%>"></td>
					</tr>
					
					<tr>
						<th>성별</th>
						<td><input type="text" name="gender" readonly="readonly"
							value="<%=dto.getGender()%>"></td>
					</tr>
					
					<tr>
						<th>이메일</th>
						<td><input type="text" name="email_id" required="required"
							value="<%=dto.getEmailId()%>">&nbsp;@ <select
							name="email_url" id="email_url">
								<option value="@naver.com">naver.com</option>
								<option value="@hanmail.net">hanmail.net</option>
								<option value="@gmail.com">gmail.com</option>
								<option value="@hotmail.com">hotmail.com</option>
								<option value="@yahoo.com">yahoo.com</option>
						</select></td>
					</tr>
					
					<tr>
						<th>은행계좌</th>
						<td><select name="bank_name" id="bank_name">
								<option value="신한">신한</option>
								<option value="우리">우리</option>
								<option value="국민">국민</option>
								<option value="기업">기업</option>
								<option value="농협">농협</option>
								<option value="씨티">씨티</option>
								<option value="하나">하나</option>
								<option value="카카오뱅크">카카오뱅크</option>
						</select> <input type="text" name="bank_no" required="required"
							placeholder=" ( - ) 포함하여 전체 입력 " value="<%=dto.getbankNo()%>">
						</td>
					</tr>
					
					<tr>
						<td colspan="2">
							<div align="right">
								<input type="submit" value="수정" onclick="return validate();"
									class="genric-btn default radius">&nbsp; <input
									type="reset" value="리셋" class="genric-btn default radius">&nbsp;
								<input type="button" value="취소"
									onclick="location.href='mypage.jsp'"
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