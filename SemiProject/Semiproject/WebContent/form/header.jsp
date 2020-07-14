<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% request.setCharacterEncoding("UTF-8"); %>
<% response.setContentType("text/html; charset=UTF-8"); %>
<!DOCTYPE html>
<html>
  <head>
    <title>Arcana by HTML5 UP</title>
    <meta charset="utf-8" />
    <meta
      name="viewport"
      content="width=device-width, initial-scale=1, user-scalable=no"
    />
    <link rel="stylesheet" href="assets/css/main.css" />
  </head>
<body>
 <!-- Header -->
      <div id="header">
        <!-- Logo -->
        <h1>
          <a href="index.jsp" id="logo">Arcana <em>by HTML5 UP</em></a>
        </h1>

        <!-- Nav -->
        <nav id="nav">
          <ul>
            <li class="" style="white-space: nowrap;">
              <a href="index.jsp">Home</a>
            </li>
            
            
            <li
              class="opener"
              style="user-select: none; cursor: pointer; white-space: nowrap;"
            >
              <a href="ent_price.jsp">시장정보</a>

              <ul
                class=""
                style="user-select: none; display: none; position: absolute;"
              >
                <li style="white-space: nowrap;">
                  <a href="ent_price.jsp" style="display: block;">기업별 조회</a>
                </li>
                <li style="white-space: nowrap;">
                  <a href="#" style="display: block;">전종목 시세판(2)</a>
                </li>
              </ul>
            </li>
            
            <li class="" style="white-space: nowrap;">
              <a href="board.do?command=transinfo">커뮤니티</a>
            </li>
            
             <li
              class="opener"
              style="user-select: none; cursor: pointer; white-space: nowrap;"
            >
              <a href="search_id_pw.jsp">고객지원</a>

              <ul
                class=""
                style="user-select: none; display: none; position: absolute;"
              >
                <li style="white-space: nowrap;">
                  <a href="search_id_pw.jsp" style="display: block;">ID/PW 찾기</a>
                </li>
                <li style="white-space: nowrap;">
                  <a href="change_info.jsp" style="display: block;">회원정보 수정</a>
                </li>
                <li style="white-space: nowrap;">
                  <a href="#" style="display: block;">고객유의사항(2)</a>
                </li>
              </ul>
            </li>
            
             <li
              class="opener"
              style="user-select: none; cursor: pointer; white-space: nowrap;"
            >
              <a href="detail_trade.jsp">MyPage</a>

              <ul
                class=""
                style="user-select: none; display: none; position: absolute;"
              >
                <li style="white-space: nowrap;">
                  <a href="detail_trade.jsp" style="display: block;">거래 조회</a>
                </li>
                <li style="white-space: nowrap;">
                  <a href="trading.jsp" style="display: block;">모의거래</a>
                </li>
              </ul>
            </li>
            
            <li class="" style="white-space: nowrap;">
              <a href="login.jsp">Login/Register</a>
            </li>
                    
          </ul>
        </nav>
      </div>
	
	<!-- Scripts -->
    <script src="assets/js/jquery.min.js"></script>
    <script src="assets/js/jquery.dropotron.min.js"></script>
    <script src="assets/js/browser.min.js"></script>
    <script src="assets/js/breakpoints.min.js"></script>
    <script src="assets/js/util.js"></script>
    <script src="assets/js/main.js"></script>
 
  </body>
</html>
