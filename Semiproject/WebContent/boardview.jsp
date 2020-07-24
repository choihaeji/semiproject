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

	<!-- 네비게이션  -->
	<jsp:include page="form/header.jsp"></jsp:include>
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
					 <%
					 	if(userID==null || userID.length()==0){
					 %>
					 
					<div class="comment-form" style="text-align: center;">
							<input type="hidden" name="command" value="insert">
            				<input type="hidden" name="boardNum" value="<%=boardNum %>">
                            <form action="comment.do" method="post">
                                <div class="form-group form-inline">
                                </div>
                                <div class="form-group" style="width: 1000px; display: inline-block;">
                                    <textarea onclick="location.href='login.jsp'" class="form-control mb-10" rows="5" name="message" placeholder="로그인을 해주세요(클릭)" onfocus="this.placeholder = ''" 
                                    		  onblur="this.placeholder = '로그인을 해주세요(클릭)'" required=""></textarea>
                                </div>
                                <button onclick="conc();" class="genric-btn info circle arrow">등록</button>	
                            </form>
                     </div>
					 <%
					 	}else{
					 %>
					
					 <div class="comment-form" style="text-align: center;">
                          <form method="post" action="comment.do">
                              <input type="hidden" name="command" value="insert">
           					  <input type="hidden" name="boardNum" value="<%=boardNum %>">
                                <div class="form-group form-inline">
                                </div>
				                <input type="hidden" value="<%=user.getId() %>" name="commentID">
                                <div class="form-group" style="width: 1000px; display: inline-block;">
                                    <textarea id="message" class="form-control mb-10" rows="5" name="commentContent" placeholder="코멘트 입력" onfocus="this.placeholder = ''" 
                                    		  onblur="this.placeholder = '코멘트 입력'" required="required"></textarea>
                                </div>
                            	<!-- <button type="submit" onclick="return printProduct();" class="primary-btn submit_btn">등록</button> -->
					 			<input type="submit" value="등록"  class="genric-btn info circle arrow">
                 		    </form>
                     </div>
					 <%
					 	}
					 %>
<!-- 댓글 뷰 -->
						
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
				<div style="text-align: center;">
					<form action="comment.do" method="post">
					     <input type="hidden" name="boardNum" value="<%=res.getBoardNum() %>">
                   	     <input type="hidden" name="commentNo" value="<%=comment_list.get(i).getComment_No() %>">
                         <input type="hidden" name="command" value="delete">
							<div class="comment-list" style="width: 1000px; display: inline-block;">
                                <div class="single-comment justify-content-between d-flex" style="width: 1000px; display: inline-block;">
                                    <div class="user justify-content-between d-flex">
                                        <div class="desc" style="width: 1000px; display: inline-block;">
                                            <h5><p>작성자: <a href="#"> <%=comment_list.get(i).getComment_Id() %></a></p></h5>
                                            <p class="date">등록일: <%=comment_list.get(i).getRegdate() %> </p>
                                            <p class="comment">
                                               <%=comment_list.get(i).getComment_Content() %>
                                            </p>
                                        </div>
                                    </div>
                                    <%
                       					 if(userID==null || !userID.equals(comment_list.get(i).getComment_Id())){
                   				     %>
                                         <div class="reply-btn" >
                                             <input type="button" value="삭제"  class="genric-btn default" onclick="alert('댓글 작성자만 삭제할 수 있습니다.');">
                                        </div>
                                    <%
                       					 } else{
                   					%>
                   						<div class="reply-btn" >
                     						 <td><input type="submit" value="삭제" class="genric-btn default" ></td>
                    			    	</div>
                    			    <%
                    				     }
                   				     %>
                                </div>
                            </div>
				    </form>
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
			</div>


      
  <!-- ---------------------------------------------------------------------------------------------------------- -->


	<!-- 애니매이션 담당 JQUERY -->
	<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
	<!-- 부트스트랩 JS  -->
	<script src="js/bootstrap.js"></script>

</body>
</html>
























