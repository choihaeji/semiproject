<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%
	request.setCharacterEncoding("UTF-8");
%>
<%
	response.setContentType("text/html; charset=UTF-8");
%>

<%@ page import="com.semi.dto.MemberDto"%>
<%@ page import="com.semi.dao.TradeDao"%>
<%@ page import="com.semi.dto.TradeDto"%>
<%@ page import="com.semi.dao.BoardDao"%>
<%@ page import="com.semi.dto.BoardDto"%>
<%@ page import="com.semi.dao.CommentDao"%>
<%@ page import="com.semi.dto.CommentDto"%>
<%@ page import="java.util.ArrayList"%>
<%@ page import="java.util.List"%>
<%@ page import="java.io.PrintWriter"%>

<!DOCTYPE html>
<html>
<head>
<!-- Required meta tags -->
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<link rel="icon" href="img/favicon.png" type="image/png">
<title>MyPage</title>
<style type="text/css">
td {
	text-align: "center";
}

th {
	text-align: "center";
}
</style>
</head>
<%
	MemberDto dto = (MemberDto) session.getAttribute("dto");
	if(dto == null){
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("alert('로그인이 필요한 서비스 입니다.')");
		script.println("location.href='login.jsp'");
		script.println("</script>");
	}
	TradeDao dao = new TradeDao();
	List<TradeDto> list = dao.viewTrade(dto.getId());

	System.out.println(dto.getName() + ", " + dto.getAccount());
	
	int boardPage = 1;
	
	if (request.getParameter("boardPage") != null) {
	       boardPage = Integer.parseInt(request.getParameter("boardPage"));
	}
	    
	   int commentPage = 1;
	    
	if (request.getParameter("commentPage") != null) {
	       commentPage = Integer.parseInt(request.getParameter("commentPage"));
	}
	
%>
<body>
	<jsp:include page="form/header.jsp"></jsp:include>

	<!--================Home Banner Area =================-->
	<section class="banner_area">
		<div class="box_1620">
			<div class="banner_inner d-flex align-items-center">
				<div class="container">
					<div class="banner_content text-center">
						<h2>MyPage</h2>
						<div class="page_link">
							<a href="index.jsp">Home</a> <a href="mypage.jsp">MyPage</a>
						</div>
					</div>
				</div>
			</div>
		</div>
	</section>
	<!--================End Home Banner Area =================-->
	<section class="blog-area single-post-area p_120">
		<div class="container">

			<!-- 회원정보 구역 -->
			<h3 class="mb-30 title_color">
				<%=dto.getName()%>님의 정보 &nbsp;&nbsp;&nbsp; <input type="button"
					onclick="location.href='member.do?command=update'"
					class="genric-btn success-border radius small" value="회원정보 수정">
			</h3>

			<div class="row">
				<div class="col-lg-12">
					<div class="generic-blockquote">
						<table class="infotable">
							<tr>
								<td><%=dto.getId()%></td>
								<td><%=dto.getBday().substring(0, 10)%></td>
								<td><%=dto.getEmail()%></td>
								<td></td>
							</tr>
							<tr>
								<td><%=dto.getbankName()%>은행</td>
								<td>&nbsp;&nbsp;&nbsp;<%=dto.getbankNo()%></td>
								<td>&nbsp;&nbsp;&nbsp;&nbsp;<%=dto.getAccount()%>원
								</td>
								<td>
									<form action="member.do" method="post">
										<input type="hidden" name="command" value="charge_account">
										<input type="hidden" name="id" value="<%=dto.getId()%>">
										<input type="hidden" name="pw" value="<%=dto.getPw()%>">
										<input type="hidden" name="account"
											value="<%=dto.getAccount()%>"> <input type="text"
											value="0" name="chargenum" style="width: 120px;"> <input
											type="submit" class="genric-btn primary-border medium"
											value="충전">
									</form>
								</td>
							</tr>
						</table>
					</div>
				</div>
			</div>
		</div>

		<!-- 탭구역 -->
		<div class="container">
			<div class="cols-lg-12 mt-25">

				<!-- 탭이름 -->
				<ul class="nav nav-tabs" id="myTab" role="tablist">
					<li class="nav-item"><a class="nav-link active show"
						id="trade-tab" data-toggle="tab" href="#trade" role="tab"
						aria-controls="trade" aria-selected="true">거래내역</a></li>
					<li class="nav-item"><a class="nav-link" id="board-tab"
						data-toggle="tab" href="#board" role="tab" aria-controls="board"
						aria-selected="false">내가 쓴 게시글</a></li>
					<li class="nav-item"><a class="nav-link" id="comment-tab"
						data-toggle="tab" href="#comment" role="tab"
						aria-controls="comment" aria-selected="false">내가 쓴 댓글</a></li>
				</ul>
			</div>
			<!-- 탭내용 -->
			<div class="cols-lg-12 mt-25">
				<div class="tab-content" id="myTabContent">

					<div class="tab-pane fade active show" id="trade" role="tabpanel"
						aria-labelledby="trade-tab">
						<div class="list">
							<table class="table">
								<tr>
									<th></th>
									<th>종 목 명</th>
									<th>매도/매수 수량</th>
									<th>매수 / 매도</th>
								</tr>
								<%
									for (int i = 0; i < list.size(); i++) {
								%>
								<tr>
									<td><%=list.get(i).getTradeNo()%></td>
									<td><%=list.get(i).getstockName()%></td>
									<td><%=list.get(i).getHolding()%></td>
									<td><%=list.get(i).getStatus()%></td>
								</tr>
								<%
									}
								%>
							</table>
						</div>

					</div>


					<div class="tab-pane fade" id="board" role="tabpanel"
						aria-labelledby="board-tab">
						<div class="list">
							<table class="table">
								<tr>
									<th>번 호</th>
									<th>제 목</th>
									<th>작성일</th>
								</tr>
								<%
                              BoardDao bdao = new BoardDao();
                              List<BoardDto> blist = bdao.getListbyId(dto.getId());
                              
                              int b_max = blist.size()/5 + 1;
                                int b_begin = (boardPage-1)*5;
                                int b_end = b_begin + 5;
                                if(b_end>blist.size()){
                                   b_end=blist.size();
                                }
                                int bnum = blist.size()-b_begin;
                              for(int i=b_begin;i<b_end;i++){
                           %>
								<tr>
									<td><%=bnum %></td>
									<%bnum--; %>
									<td><a
										href="Board.do?command=boardview&boardNum=<%=blist.get(i).getBoardNum()%>"><%=blist.get(i).getBoardTitle() %></a></td>
									<td><%=blist.get(i).getBoardDate() %></td>
								</tr>
								<%
                              }
                           %>
								<tr>
									<td colspan="3">
										<%
                           for(int i=1;i<=b_max;i++){
                           %> <a
										href="mypage.jsp?boardPage=<%=i %>&commentPage=<%=commentPage%>"><%=i %></a>&nbsp;
										<%
                              }
                           %>
									</td>
								</tr>
							</table>
						</div>
					</div>

				<div class="tab-pane fade" id="comment" role="tabpanel"
					aria-labelledby="comment-tab">
					<div class="list">
						<table class="table">
							<tr>
								<th>번 호</th>
								<th>글 제목</th>
								<th>댓글 내용</th>
								<th>작성일</th>
							</tr>
							<%   
                              CommentDao cdao = new CommentDao();
                              List<CommentDto> clist = cdao.getCommentbyId(dto.getId());
                              int c_max = clist.size()/5 + 1;
                                int c_begin = (commentPage-1)*5;
                                int c_end = c_begin + 5;
                                if(c_end>clist.size()){
                                   c_end=clist.size();
                                }
                                int cnum = clist.size()-c_begin;
                              for(int i=c_begin;i<c_end;i++){
                           %>
							<tr>
								<td><%=cnum %></td>
								<%cnum--; %>
								<td><%=bdao.getBoardTitle(clist.get(i).getBoardNo()) %></td>
								<td><a
									href="Board.do?command=boardview&boardNum=<%=clist.get(i).getBoardNo()%>"><%=clist.get(i).getComment_Content() %></a></td>
								<td><%=clist.get(i).getRegdate() %></td>
							</tr>
							<%
                              }
                           %>
							<tr>
								<td colspan="4">
									<%
                           for(int i=1;i<=c_max;i++){
                           %> <a
									href="mypage.jsp?boardPage=<%=boardPage %>&commentPage=<%=i %>"><%=i %></a>&nbsp;
									<%
                              }
                           %>
								</td>
							</tr>
						</table>
					</div>
				</div>
			</div>
		</div>
		<!-- 탭내용  -->
		</div>
	</section>

	<%@ include file="form/footer.jsp"%>
	<!--================End Home Banner Area =================-->




</body>
</html>