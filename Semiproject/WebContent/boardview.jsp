<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<% request.setCharacterEncoding("UTF-8"); %>
<% response.setContentType("text/html; charset=UTF-8"); %>

<%@ page import="java.io.PrintWriter"%>
<%@ page import="com.semi.dao.BoardDao"%>
<%@ page import="com.semi.dto.BoardDto"%>
<%@ page import="java.util.ArrayList"%>
<%@ page import="com.semi.dto.MemberDto" %>
<%@ page import="com.semi.dto.CommentDto" %>   
<%@ page import="com.semi.dao.CommentDao" %>

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
		
		int commentPage = 1; //기본페이지 넘버
        
        //페이지넘버값이 있을때
        if (request.getParameter("commentPage") != null) {
           commentPage = Integer.parseInt(request.getParameter("commentPage"));
        }
	%>
	<!-- 네비게이션  -->
	<jsp:include page="form/header.jsp"></jsp:include>
	
	<!--================Home Banner Area =================-->
	<section class="banner_area">
		<div class="box_1620">
			<div class="banner_inner d-flex align-items-center">
				<div class="container">
					<div class="banner_content text-center">
						<h2>게시판</h2>
						<div class="page_link">
							<a href="trade.do?command=index">Home</a> <a
								href="trade.do?commnad=trading">커뮤니티</a>
						</div>
					</div>
				</div>
			</div>
		</div>
	</section>
	<!--================End Home Banner Area =================-->
<section class="blog_area single-post-area p_120">

	<!-- 게시판 -->
	<div class="container">
		<div class="row">
				<!-- 이전글/다음글 -->
				<% 
					int bnb = boardNum - 1;
					int bnn = boardNum + 1;
					ArrayList<BoardDto> list = dao.getList(pageNumber);
					
					if(res.getBoardNum() != 1){
				%>		
					<button onclick="location.href='Board.do?command=boardview&boardNum=<%=bnb%>'" class="genrc-btn info-border radius">이전글</button>&nbsp;
				<%
					}else{
				%>
					<button onclick="bnbc();" class="genrc-btn info-border radius">이전글</button>&nbsp;
				<%
					}
				%>
				
				<%
				%>
					<button onclick="location.href='Board.do?command=boardview&boardNum=<%=bnn%>'" class="genrc-btn info-border radius">다음글</button>&nbsp;
				<%
				%>
				<%
				%>
				<!-- 게시판 뷰 -->
				<table class="table table-striped"
					style="text-align: center; border: 1px solid #dddddd">
					<thead>
						<tr>
							<th colspan="3"
								style="background-color: #eeeeee; text-align: center;">게시글 상세보기 </th>
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
				<a href = "boardlist.jsp" class="genrc-btn info-border radius">목록</a>
				<%
				//글작성자 본인일시 수정 삭제 가능 
					if(userID != null && userID.equals(res.getUserID())){
				%>
						&nbsp;&nbsp;<a href="boardupdate.jsp?boardNum=<%= boardNum %>" class="genrc-btn info-border radius">수정</a>&nbsp;&nbsp;
						<a onclick="return confirm('정말로 삭제하시겠습니까?')" href="Board.do?command=delete&boardNum=<%= boardNum %>" class="genrc-btn info-border radius">삭제</a>
				<%					
					}
				%>
		</div>
	</div>
	


	
	
<!-- 댓글등록 -->
<div class="comment-form" style="text-align: center; ">
					 <%
					 	if(userID==null || userID.length()==0){
					 %>
					
					<div class="" style="text-align: center; ">
                        <form action="comment.do" method="post" style="height: 120px;">
							<input type="hidden" name="command" value="insert">
            				<input type="hidden" name="boardNum" value="<%=boardNum %>">
                                <div class="form-group" style="text-align: center; width: 700px; display: inline-block; border:1px solid gray; height: 83px; ">
                                    <textarea onclick="location.href='login.jsp'" class="form-control mb-10" rows="2" name="message" placeholder="로그인이 필요합니다.(클릭)" onfocus="this.placeholder = ''" 
                                    		  onblur="this.placeholder = '로그인이 필요합니다.(클릭)'" required="required" style="height: 80px;"></textarea>
                                </div>
                                <div style="position : relative ; right:45px;">
                                <button onclick="conc();" class="genric-btn info circle arrow" style="text-align: center;">등록</button>	
                        		</div>
                        </form>
                     </div>
					 <%
					 	}else{
					 %>
					
					 <div class="" style="text-align: center; ">
                          <form method="post" action="comment.do" style="text-align: center; height: 120px;">
                              <input type="hidden" name="command" value="insert">
           					  <input type="hidden" name="boardNum" value="<%=boardNum %>">
				              <input type="hidden" value="<%=user.getId() %>" name="commentID">
                                		<div class="form-group" style=" text-align: center; width: 700px; display: inline-block; border:1px solid gray; height: 83px; ">
                                   		<textarea id="message" class="form-control mb-10" rows="2" name="commentContent" placeholder="댓글을 남겨보세요." onfocus="this.placeholder = ''" 
                                    		 	 onblur="this.placeholder = '댓글을 남겨보세요.'" required="required" style=" height: 80px;" maxlength="200"></textarea>
		                                </div>
                            	<!-- <button type="submit" onclick="return printProduct();" class="primary-btn submit_btn">등록</button> -->
					 					<div style="position : relative ; right:45px;">
					 						<input type="submit" value="등록" class="genric-btn info circle arrow">
					 					</div>
                 		 </form>
                     </div>
					 <%
					 	}
					 %>
<!-- 댓글 뷰 -->
						<br>
						<br>
	  <%
         CommentDao comment_dao = new CommentDao();
	  		ArrayList<CommentDto> comment_list = comment_dao.getComment(boardNum);
         
         int max = comment_list.size()/5 + 1;
         int begin = (commentPage-1)*5;
         int end = begin + 5;
         if(end>comment_list.size()){
            end=comment_list.size();
         }
         int num = comment_list.size()-begin;
            for (int i = begin; i <end; i++) {
            System.out.println(comment_list.get(i));
      %>
      		<div class="" style="text-align: center; ">
				<div style="text-align: center;">
					<form action="comment.do" method="post">
					     <input type="hidden" name="boardNum" value="<%=res.getBoardNum() %>">
                   	     <input type="hidden" name="commentNo" value="<%=comment_list.get(i).getComment_No() %>">
                         <input type="hidden" name="command" value="delete">
							<div class="comment-list" style="width: 1000px; display: inline-block;">
                                <div class="single-comment justify-content-between d-flex" style="width: 1000px; display: inline-block;">
                                    <div class="user justify-content-between d-flex">
                                        <div class="desc" style="width: 1000px; display: inline-block;">
                                        <table >
                                          <tr>
                                        	<td>
                                        		<div>
                                        		<b><%=comment_list.get(i).getComment_Id() %></b><br>
                                            	<p class="date" style="font-size:10px; color:gray; "><%=comment_list.get(i).getRegdate() %> </p>
                                            	</div>
                                            </td>
                                           	<td width="800px;">
                                           		<div class="comment" >
                                           			<%=comment_list.get(i).getComment_Content() %>
                                           		</div>
                                           	</td>
                                           	<td>
                                           		<div>
                                    <%
                       					 if(userID==null || !userID.equals(comment_list.get(i).getComment_Id())){
                   				     %>
                                         <div class="reply-btn" >
                                             <input type="hidden" value="삭제"  class="genric-btn primary-border small" onclick="alert('댓글 작성자만 삭제할 수 있습니다.');">
                                        </div>
                                    <%
                       					 } else{
                   					%>
                   						<div class="reply-btn" >
                     						 <input type="submit" value="삭제" class="genric-btn primary-border small" >
                    			    	</div>
                    			    <%
                    				     }
                   				     %>
                                           		</div>
                                           	</td>
                                       	  </tr>
                                       	  <hr>
                                        </table>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <br>
					      <%
					         }
					      %>
					                  <p style="text-align:center">
					      <%
					         for (int i=1;i<=max;i++){
					      %>
					               <a href="boardview.jsp?boardNum=<%=boardNum %>&commentPage=<%=i %>"><%=i %></a>&nbsp;
					      <%
					         }
					      %>
                 					 </p>
                 	
				    </form>
				    
			</div>
		</div>	
		
	</div>	
</section>	
	

		<%@ include file="form/footer.jsp" %>
      
  <!-- ---------------------------------------------------------------------------------------------------------- -->


	<!-- 애니매이션 담당 JQUERY -->
	<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
	<!-- 부트스트랩 JS  -->
	<script src="js/bootstrap.js"></script>

</body>
</html>
























