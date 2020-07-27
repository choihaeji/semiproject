<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<% request.setCharacterEncoding("UTF-8"); %>
<% response.setContentType("text/html; charset=UTF-8"); %>

<!DOCTYPE html>
<html>
<head>
<title>회원가입</title>

<style type="text/css">
body > section.blog_area.single-post-area.p_120 > div > form > table > tbody > tr:nth-child(7) > td:nth-child(2) > div{
display: inline-block;
float: inherit;
}
</style>

<script type="text/javascript">
	function idChk(){
		var doc = document.getElementsByName("id")[0];
		if(doc.value.trim()=="" || doc.value==null){
			alert("아이디를 입력해 주세요.");
		}
		else{
			var target="member.do?command=idchk&id="+doc.value.trim();
			open(target,"","width=200,height=100");
		}
	}
	function idChkConfirm(){ 
		var chk=document.getElementsByName("id")[0].title;
		if(chk=="n"){
			alert("아이디 중복체크를 해주세요");
			document.getElementsByName("id")[0].focus();
		}
	}
	
	function validate(){
        var id = document.getElementsByName("id")[0];
        var pw1 = document.getElementsByName("pw")[0];
        var pw2 = document.getElementsByName("pwcheck")[0];
        var name = document.getElementsByName("name")[0];
        
        //id 검사
        if(!check(/^[a-z][a-z\d]{3,11}$/,id,"유효하지 않은 아이디입니다.")){
        	return false;
        }
        
      	//pw 검사
        if(!check(/^.*(?=^.{8,15}$)(?=.*\d)(?=.*[a-zA-Z])(?=.*[!@#$%^&+=]).*$/,pw1,"유효하지 않은 비밀번호입니다.")){
        	return false;
        }
      	
      	//pw 확인
        if(pw1.value!=pw2.value){
            alert("비밀번호가 일치하지 않습니다.");
            pw2.value="";
            pw2.focus();
            return false;
        }
      	
      	//이름 검사
        if(!check(/^[가-힣]{2,}$/,name,"유효하지 않은 이름입니다.")){
            return false;
        }
      	
      	//이메일 검사
      	var email = document.getElementsByName("email_id")[0];
		if(email.value.trim()=="" || email.value==null){
			alert("이메일을 입력해 주세요.");
			return false;
		}

		//계좌번호 검사
      	var bank = document.getElementsByName("bank_no")[0];
		if(bank.value.trim()=="" || bank.value==null){
			alert("계좌번호를 입력해 주세요.");
			return false;
		}
    }

    function check(regExp, checkValue, msg){
        if(!regExp.test(checkValue.value)){
            alert(msg);
            checkValue.value="";
            checkValue.focus();
            return false;
        }
        else{
            return true;
        }
    }
    
    function pwCheck(){
    	var pw1 = document.getElementsByName("pw")[0];
        var pw2 = document.getElementsByName("pwcheck")[0];
    	
    	if(pw1.value==pw2.value){
            document.getElementById('check').innerHTML='비밀번호가 일치합니다.'
            document.getElementById('check').style.color='blue';
        }
        else{
            document.getElementById('check').innerHTML='비밀번호가 일치하지 않습니다.';
            document.getElementById('check').style.color='red';
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
						<h2>회원가입</h2>
						<div class="page_link">
							<a href="index.jsp">Home</a> <a
								href="registform.jsp">회원가입</a>
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
				<input type="hidden" name="command" value="insertmember" >
				<table class="table">
					<tr>
						<th>아이디</th>
						<td>
							<input type="text" name="id" title="n" placeholder="아이디 입력" onfocus="this.placeholder = ''" 
								  onblur="this.placeholder = '아이디 입력'" required="required" class="single-input"> 
						&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<b style="color:blue;">※ 영문자,숫자 포함하여 4~12자리로 입력. 첫글자는 영문</b>
						<input type="button" value="중복체크" onclick="idChk();" class="genric-btn success-border medium" >
						</td>
					</tr>
					<tr>
						<th>비밀번호</th>
						<td>
							<input type="password" onclick="idChkConfirm();" name="pw" onchange="pwCheck();" placeholder="패스워드 입력" onfocus="this.placeholder = ''" 
								  onblur="this.placeholder = '패스워드 입력'" required="required" class="single-input"> 
						&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<b style="color:blue;">※ 영문자,숫자,특수문자 포함하여 8~15자로 입력</b>
						</td>
					</tr>	
					<tr>
						<th>비밀번호 확인</th>
						<td>
							<input type="password" name="pwcheck" onchange="pwCheck();" placeholder="패스워드 확인" onfocus="this.placeholder = ''" 
								  onblur="this.placeholder = '패스워드 확인'" required="required" class="single-input">
								  &nbsp;<span id="check"></span>
						</td>
					</tr>	
					
					<tr>
						<th>이름</th>
						<td>
							<input type="text" name="name" onchange="pwCheck();" placeholder="한글 2글자 이상 입력" onfocus="this.placeholder = ''" 
								  onblur="this.placeholder = '한글 2글자 이상 입력" required="required" class="single-input">
						</td>
					</tr>
					<tr>
						<th>생년월일</th>
						<td>
							<input type="data" name="bday" value="2000-01-01" placeholder="생년월일" onfocus="this.placeholder = ''" 
								  onblur="this.placeholder = '생년월일" required="required" class="single-input">
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
							<input type="text" name="email_id" required="required">&nbsp;&nbsp;@&nbsp;
							<select name="email_url">
								<option value="@naver.com">naver.com</option>
								<option value="@hanmail.net">hanmail.net</option>
								<option value="@gmail.com">gmail.com</option>
								<option value="@hotmail.com">hotmail.com</option>
								<option value="@yahoo.com">yahoo.com</option>
							</select>
						<td>
					</tr>
					<tr>
						<th>은행정보</th>
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
							<div align="right">
								<input type="submit" class="genric-btn success circle large" value="가입하기" onclick="return validate();" >
								<input type="reset" value="리셋" class="genric-btn success circle large" >
								<input type="button" onclick="location.href='login.jsp'" value="취소" class="genric-btn success circle large" >
							</div>
						</td>
					</tr>
				</table>
			</form>

		</div>
	</section>
<%@ include file="form/footer.jsp" %>
</body>
</html>