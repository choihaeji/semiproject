<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<% request.setCharacterEncoding("UTF-8"); %>
<% response.setContentType("text/html; charset=UTF-8"); %>

<%@ page import="java.io.PrintWriter"%>
<%@ page import="com.semi.dao.BoardDao"%>
<%@ page import="com.semi.dto.BoardDto"%>
<%@ page import="java.util.ArrayList"%>
<%@ page import="com.semi.dto.MemberDto" %>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

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
	<link rel="stylesheet" href="vendors/flaticon/flaticon.css">
	<!-- main css -->
	<link rel="stylesheet" href="css/style.css">
	<link rel="stylesheet" href="css/responsive.css">
		  
		 <!-- BootStrap -->
		<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
		<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
		<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
		
		<!-- jquery -->
		<script src="//code.jquery.com/jquery.min.js"></script>
	
	<script type="text/javascript">
		function bnbc() {
			alert("첫번째 게시글입니다.");
		}
		
		function bnnc() {
			alert("마지막 게시글입니다.");
		}
    
		function conc() {
			alert("로그인을 먼저 해주세요.");
			location.href="login.jsp";
		}
		

        function printProduct(){
            var result = document.getElementById("result");
			
          
            var etc = document.getElementById("message").value;

            result.innerHTML += "코멘트 : " + etc + "<br>";

            return false;
        }
    
		
	</script>

<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<!-- 뷰포트 -->
<meta name="viewport" content="width=device-width" initial-scale="1">
<!-- 스타일시트 참조  -->
<link rel="stylesheet" href="css/bootstrap.css">
<title>jsp 게시판 웹사이트</title>
</head>
<body>
	<%
		//로긴한사람이라면	 userID라는 변수에 해당 아이디가 담기고 그렇지 않으면 null값
		String userID = null;
		MemberDto user = (MemberDto)session.getAttribute("dto");
		if(session.getAttribute("dto") != null){
			userID = user.getId();
		}
		System.out.println("userID:"+userID);

		int boardNum = 0;
		if (request.getParameter("boardNum") != null) {
			boardNum = Integer.parseInt(request.getParameter("boardNum"));
		}
		
		if (boardNum == 0) {
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('유효하지 않은 글 입니다.')");
			script.println("location.href = 'boardlist.jsp'");
			script.println("</script>");
		}
		
		BoardDao dao = new BoardDao();
		
		BoardDto res = dao.getBoardview(boardNum);
		System.out.println("작성자:"+res.getUserID());
		
		int pageNumber = 1; //기본페이지 넘버
		
		//페이지넘버값이 있을때
		if (request.getParameter("pageNumber") != null) {
			pageNumber = Integer.parseInt(request.getParameter("pageNumber"));
		}
		
		/*
		if(res == null){
			PrintWriter script = response.getWriter();
			script.println("location.href = 'boardlist.jsp?boardNum=boardNum'");
		}
		*/
		
	%>

	<!-- 네비게이션  -->
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
		<div class="row">
				
				<% 
					int bnb = boardNum - 1;
					int bnn = boardNum + 1;
					ArrayList<BoardDto> list = dao.getList(pageNumber);
					
					int max = list.size();
					
					if(res.getBoardNum() != 1){
				%>		
					<button onclick="location.href='Board.do?command=boardview&boardNum=<%=bnb%>'" class="btn btn-primary pull-right">이전글</button>&nbsp;
				<%
					}else{
				%>
					<button onclick="bnbc();" class="btn btn-primary pull-right">이전글</button>&nbsp;
				<%
					}
				%>
				
				<%
					if(max != 0 ){
				%>
					<button href="Board.do?command=boardview&boardNum=<%=bnn%>" class="btn btn-primary pull-right">다음글</button>
				<%
					}else{
				%>
					<button onclick="bnnc();" class="btn btn-primary pull-right">다음글</button>
				<%
					}
				%>
				
				<table class="table table-striped"
					style="text-align: center; border: 1px solid #dddddd">
					<thead>
						<tr>
							<th colspan="3"
								style="background-color: #eeeeee; text-align: center;">글 보기 </th>
						</tr>
					</thead>
					<tbody>
						<tr>
							<td style="width: 20%;"> 글 제목 </td>
							<td colspan="2"><%= res.getBoardTitle().replaceAll(" ", "&nbsp;").
									replaceAll("<", "&lt;").replaceAll(">", "&gt;").replaceAll("\n", "<br/>") %>
							</td>
						</tr>
						<tr>
							<td>작성자</td>	
							<td colspan="2"><%= res.getUserID() %></td>
						</tr>
						<tr>
							<td>작성일</td>	
							<td colspan="2"><%= res.getBoardDate().substring(0, 11) + res.getBoardDate().substring(11, 13) + "시"
							+ res.getBoardDate().substring(14, 16) + "분"%>
							</td>
						</tr>
						<tr>
							<td>내용</td>	
							<td colspan="2" style="min-height: 200px; text-align: left;"><%= res.getBoardContent().replaceAll(" ", "&nbsp;").
							replaceAll("<", "&lt;").replaceAll(">", "&gt;").replaceAll("\n", "<br/>") %>
							</td>
						</tr>
					</tbody>
				</table>	
				<a href = "boardlist.jsp" class="btn btn-primary">목록</a>
				<%
				//글작성자 본인일시 수정 삭제 가능 
					if(userID != null && userID.equals(res.getUserID())){
				%>
						&nbsp;&nbsp;<a href="boardupdate.jsp?boardNum=<%= boardNum %>" class="btn btn-primary">수정</a>&nbsp;&nbsp;
						<a onclick="return confirm('정말로 삭제하시겠습니까?')" href="Board.do?command=delete&boardNum=<%= boardNum %>" class="btn btn-primary">삭제</a>
				<%					
					}
				%>
		</div>
	</div>

					 <%
					 	if(userID==null || userID.length()==0){
					 %>
					<div class="comment-form">
                        <h4>의견쓰기</h4>
                            <form>
                                <div class="form-group form-inline">
                                </div>
                                <div class="form-group">
                                    <textarea onclick="location.href='login.jsp'" class="form-control mb-10" rows="5" name="message" placeholder="로그인을 해주세요(클릭)" onfocus="this.placeholder = ''" 
                                    		  onblur="this.placeholder = '로그인을 해주세요(클릭)'" required=""></textarea>
                                </div>
                                <button onclick="conc();" class="primary-btn submit_btn">등록</button>	
                            </form>
                     </div>
					 <%
					 	}else{
					 %>
					 <div class="comment-form">
                        <h4>의견쓰기</h4>
                            <form method="get" action="">
                                <div class="form-group form-inline">
                                </div>
                                <div class="form-group">
                                    <textarea id="message" class="form-control mb-10" rows="5" name="message" placeholder="코멘트 입력" onfocus="this.placeholder = ''" 
                                    		  onblur="this.placeholder = '코멘트 입력'" required=""></textarea>
                                </div>
                            	<!-- <button type="submit" onclick="return printProduct();" class="primary-btn submit_btn">등록</button> -->
					 			<input type="submit" value="등록" onclick="return printProduct(); " class="primary-btn submit_btn">
					 	<h4>코멘트</h4>
					 	<div id="result">
					 	</div>
                 		    </form>
                     </div>
					 <%
					 	}
					 %>
					 <br>
					 <div class="comments-area">
                            <h4>Comments</h4>
                            <div class="comment-list">
                                <div class="single-comment justify-content-between d-flex">
                                    <div class="user justify-content-between d-flex">
                                       <div class="thumb">
                                            <img src="img/blog/c1.jpg" alt="">
                                        </div>
                                        <div class="desc">
                                            <h5><a href="#"><%=userID%></a></h5>
                                            <p class="date">December 4, 2017 at 2:12 pm</p>
                                            <p class="comment">
                                                Never say goodbye till the end comes!
                                            </p>
                                        </div>
                                    </div>
                                    <div class="reply-btn">
                                           <a href="" class="btn-reply text-uppercase">reply</a> 
                                    </div>
                                </div>
                            </div>	
                            <div class="comment-list left-padding">
                                <div class="single-comment justify-content-between d-flex">
                                    <div class="user justify-content-between d-flex">
                                        <div class="thumb">
                                            <img src="img/blog/c2.jpg" alt="">
                                        </div>
                                        <div class="desc">
                                            <h5><a href="#">Elsie Cunningham</a></h5>
                                            <p class="date">December 4, 2017 at 3:12 pm </p>
                                            <p class="comment">
                                                Never say goodbye till the end comes!
                                            </p>
                                        </div>
                                    </div>
                                    <div class="reply-btn">
                                           <a href="" class="btn-reply text-uppercase">reply</a> 
                                    </div>
                                </div>
                            </div>	
                            <div class="comment-list left-padding">
                                <div class="single-comment justify-content-between d-flex">
                                    <div class="user justify-content-between d-flex">
                                        <div class="thumb">
                                            <img src="img/blog/c3.jpg" alt="">
                                        </div>
                                        <div class="desc">
                                            <h5><a href="#">Annie Stephens</a></h5>
                                            <p class="date">December 4, 2017 at 3:12 pm </p>
                                            <p class="comment">
                                                Never say goodbye till the end comes!
                                            </p>
                                        </div>
                                    </div>
                                    <div class="reply-btn">
                                           <a href="" class="btn-reply text-uppercase">reply</a> 
                                    </div>
                                </div>
                            </div>	
                            <div class="comment-list">
                                <div class="single-comment justify-content-between d-flex">
                                    <div class="user justify-content-between d-flex">
                                        <div class="thumb">
                                            <img src="img/blog/c4.jpg" alt="">
                                        </div>
                                        <div class="desc">
                                            <h5><a href="#">Maria Luna</a></h5>
                                            <p class="date">December 4, 2017 at 3:12 pm </p>
                                            <p class="comment">
                                                Never say goodbye till the end comes!
                                            </p>
                                        </div>
                                    </div>
                                    <div class="reply-btn">
                                           <a href="" class="btn-reply text-uppercase">reply</a> 
                                    </div>
                                </div>
                            </div>	
                            <div class="comment-list">
                                <div class="single-comment justify-content-between d-flex">
                                    <div class="user justify-content-between d-flex">
                                        <div class="thumb">
                                            <img src="img/blog/c5.jpg" alt="">
                                        </div>
                                        <div class="desc">
                                            <h5><a href="#">Ina Hayes</a></h5>
                                            <p class="date">December 4, 2017 at 3:12 pm </p>
                                            <p class="comment">
                                                Never say goodbye till the end comes!
                                            </p>
                                        </div>
                                    </div>
                                    <div class="reply-btn">
                                           <a href="" class="btn-reply text-uppercase">reply</a> 
                                    </div>
                                </div>
                            </div>	                                             				
                        </div>


	<!-- 애니매이션 담당 JQUERY -->
	<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
	<!-- 부트스트랩 JS  -->
	<script src="js/bootstrap.js"></script>

</body>
</html>
























