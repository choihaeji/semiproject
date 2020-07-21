<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<% request.setCharacterEncoding("UTF-8"); %>
<% response.setContentType("text/html; charset=UTF-8"); %>

<!DOCTYPE html>
<html>
<head>
<!-- Required meta tags -->
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
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
        
<meta charset="UTF-8">
<title>회원가입</title>
<script type="text/javascript">
	function idChk(){
		var doc = document.getElementsByName("id")[0];
		if(doc.value.trim()=="" || doc.value==null){
			alert("아이디를 입력해 주세요.");
		}
		else{
			var target="member.do?command=idchk&id="+doc.value.trim();
			open(target,"","width=200,height=200");
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

<style>
	#d1{
		width:500px;
		height:1000px;
		margin : 0 auto;
	}
	.div_box { 
   position: absolute; 
   width: 100px; 
   height: 100px; 
	}
	select { 
	-webkit-appearance: none; /* 네이티브 외형 감추기 */ 
	-moz-appearance: none; 
	appearance: none;
	background: url(이미지 경로) no-repeat 95% 50%; /* 화살표 모양의 이미지 */ 
	 }
	 /* IE 10, 11의 네이티브 화살표 숨기기 */ 
	 select::-ms-expand { 
	 display: none; 
	 }
	select { 
	width: 130px; /* 원하는 너비설정 */ 
	padding: .10em .5em; /* 여백으로 높이 설정 */
	font-family: inherit; /* 폰트 상속 */
	background: url(https://farm1.staticflickr.com/379/19928272501_4ef877c265_t.jpg) no-repeat 95% 50%; /* 네이티브 화살표 대체 */ 
	border: 1px solid #999; 
	border-radius: 0px; /* iOS 둥근모서리 제거 */ 
	-webkit-appearance: none; /* 네이티브 외형 감추기 */ 
	-moz-appearance: none;
	appearance: none;
	 }
	

</style>
</head>
<body>
	<div class="col-lg-8 col-md-8" id="d1" >
		<h3 class="mb-30 title_color">회원가입</h3>
			<form action="member.do" method="post">
				<input type="hidden" name="command" value="insertmember" >
					<div class="mt-10">
						<input type="text" name="id" title="n" placeholder="아이디 입력" onfocus="this.placeholder = ''" 
								  onblur="this.placeholder = '아이디 입력'" required="required" class="single-input"> 
						&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<b style="color:blue;">※ 영문자,숫자 포함하여 4~12자리로 입력. 첫글자는 영문</b>
						<input type="button" value="중복체크" onclick="idChk();" class="genric-btn success-border medium" >
					</div>
					<br>
					<div class="mt-10">
						<input type="password" onclick="idChkConfirm();" name="pw" onchange="pwCheck();" placeholder="패스워드 입력" onfocus="this.placeholder = ''" 
								  onblur="this.placeholder = '패스워드 입력'" required="required" class="single-input"> 
						&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<b style="color:blue;">※ 영문자,숫자,특수문자 포함하여 8~15자로 입력</b>
					</div>
					<br>
					<div class="mt-10">
						<input type="password" name="pwcheck" onchange="pwCheck();" placeholder="패스워드 확인" onfocus="this.placeholder = ''" 
								  onblur="this.placeholder = '패스워드 확인'" required="required" class="single-input">
								  &nbsp;<span id="check"></span> 
					</div>
					<br>
					<div class="mt-10">
						<input type="text" name="name" onchange="pwCheck();" placeholder="한글 2글자 이상 입력" onfocus="this.placeholder = ''" 
								  onblur="this.placeholder = '한글 2글자 이상 입력" required="required" class="single-input">
					</div>
					<br>
					<div class="mt-10">
						<input type="data" name="bday" value="2000-01-01" placeholder="생년월일" onfocus="this.placeholder = ''" 
								  onblur="this.placeholder = '생년월일" required="required" class="single-input">
					</div>
					<br>
					<div class="mt-10">
						<select name="gender">
							<option value="남자">남</option>
							<option value="여자">여</option>
						</select>
					</div>
					<br>
					<div class="mt-10">
						<input type="text" name="email_id" required="required">&nbsp;&nbsp;@&nbsp;
						<select name="email_url">
							<option value="@naver.com">naver.com</option>
							<option value="@hanmail.net">hanmail.net</option>
							<option value="@gmail.com">gmail.com</option>
							<option value="@hotmail.com">hotmail.com</option>
							<option value="@yahoo.com">yahoo.com</option>
						</select>
					</div>
					<br>
					<div class="mt-10">
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
					</div>
					<br>
						<input type="submit" class="genric-btn success circle" value="가입" onclick="return validate();" >
						<input type="reset" value="리셋" class="genric-btn success circle" >
						<input type="button" onclick="location.href='login.jsp'" value="취소" class="genric-btn success circle" >
				</form>
	</div>

</body>
</html>