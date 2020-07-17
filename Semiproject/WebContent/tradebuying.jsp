<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% request.setCharacterEncoding("UTF-8"); %>
<% response.setContentType("text/html; charset=UTF-8"); %>

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
        <!-- main css -->
        <link rel="stylesheet" href="css/style.css">
        <link rel="stylesheet" href="css/responsive.css">
</head>
<body>
 <!--================매수 팝업창 =================-->
        <section class="mytabs_area p_120">
        	<div class="container">
        		<div class="tabs_inner">
					
					<!--================매수 =================-->
					<div class="tab-content" id="myTabContent">
						<div class="tab-pane fade active show" id="home" role="tabpanel" aria-labelledby="home-tab">
							<div class="section-top-border">
							<table class="list">
							<form action="trade.do" method="post">
							<input type="hidden" name="command" value="tradebuy">
									<h3 class="mb-30 title_color">주식주문</h3>
									<div class="progress-table-wrap">
										<div class="progress-table">
											<div class="table-head">
												<div class="serial">이름 : </div>
												<div class="serial">${member.getName }</div>
												<div class="serial">계좌번호 : </div>
												<div class="percentage">${member.getBankNo }</div>
											</div>
											<div class="table-row">
												<div class=""></div>
												<div class="country">계좌평가금액 : </div>
												<div class="country">${member.getAccount }</div>
												<div class="serial"></div>
												<div class="serial"></div>
												<div class="country">유가증권평가금액: </div>
												<div class="country">${member.getStockAccount } </div>
												<div class="serial"></div>
											</div>
											<div class="table-row">
												<div class="serial">
													<input type="checkbox" id="default-checkbox">
													<label for="default-checkbox"></label>
												</div>
												<div class="country">종목명</div>
												<div class="country">현재가</div>
												<div class="country">수량</div>
																		
											</div>
											
											<div class="table-head">
												<div class="serial">
													<input type="checkbox" id="default-checkbox">
													<label for="default-checkbox"></label>
												</div>
												<div class="country"></div>
												<div class="country"></div>
												<div class="serial"><input name="countbuy" class="nice-select" type="number" min="0" max="15" step="1"></div>														
											</div>
											<br>
											<div class="table-row">
												<div class="serial"></div>
												<div class="serial"></div>
												<div class="serial"></div>
												<div class="serial"></div>
												<div class="serial"></div>
												<div class="serial"></div>
												<div class="country">매수 금액 : </div>
												<div class="country"></div>	
												<div class="country"><input type="submit" value="주식주문" class="genric-btn danger circle" ></div>
											</div>
											</form>
											</table>
									</div>
								</div>
						
					</div>
        		</div>
        	</div>
        </section>
</body>
</html>