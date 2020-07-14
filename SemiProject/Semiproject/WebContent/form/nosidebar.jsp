<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% request.setCharacterEncoding("UTF-8"); %>
<% response.setContentType("text/html; charset=UTF-8"); %>
<!DOCTYPE html>
<html>
  <head>
    <title>No Sidebar - Arcana by HTML5 UP</title>
    <meta charset="utf-8" />
    <meta
      name="viewport"
      content="width=device-width, initial-scale=1, user-scalable=no"/>
    <link rel="stylesheet" href="assets/css/main.css" />
  </head>
  <body class="">
    <div id="page-wrapper">
      <%@ include file="header.jsp" %>

      <!-- Main -->
      <section class="wrapper style1">
        <div class="container">
          <div id="content">
            <!-- Content -->

            <article>
              <header>
                <h2>No Sidebar</h2>
                <p>All content, all the time.</p>
              </header>
             
            </article>
          </div>
        </div>
      </section>
    </div>

    <%@ include file="footer.jsp" %>
  </body>
</html>
