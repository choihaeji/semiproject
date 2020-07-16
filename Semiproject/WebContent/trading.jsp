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
<%@ include file="form/header.jsp" %>
  
        <!--================Home Banner Area =================-->
        <section class="banner_area">
            <div class="box_1620">
				<div class="banner_inner d-flex align-items-center">
					<div class="container">
						<div class="banner_content text-center">
							<h2>모의거래</h2>
							<div class="page_link">
								<a href="trade.do?command=index">Home</a>
								<a href="trade.do?commnad=trading">모의거래</a>
							</div>
						</div>
					</div>
				</div>
            </div>
        </section>
        <!--================End Home Banner Area =================-->
        
        <!--================매도 매수 =================-->
        <section class="mytabs_area p_120">
        	<div class="container">
        		<div class="tabs_inner">
					<ul class="nav nav-tabs" id="myTab" role="tablist">
						<li class="nav-item">
							<a class="nav-link active show" id="home-tab" data-toggle="tab" href="#home" role="tab" aria-controls="home" aria-selected="true">모의 주식주문</a>
						</li>
						<li class="nav-item">
							<a class="nav-link" id="profile-tab" data-toggle="tab" href="#profile" role="tab" aria-controls="profile" aria-selected="false">매도하기</a>
						</li>
					</ul>
					
					<!--================매수 =================-->
					<div class="tab-content" id="myTabContent">
						<div class="tab-pane fade active show" id="home" role="tabpanel" aria-labelledby="home-tab">
							<div class="section-top-border">
							<table class="list">
									<h3 class="mb-30 title_color">님의 주식주문</h3>
									<div class="progress-table-wrap">
										<div class="progress-table">
											<div class="table-head">
												<div class="serial">계좌번호 : </div>
												<div class="percentage"></div>
												<div class="serial">이름 : </div>
												<div class="serial"></div>
											</div>
											<div class="table-row">
												<div class="serial"></div>
												<div class="country">계좌평가금액 : </div>
												<div class="country">  </div>
												<div class="serial"></div>
												<div class="serial"></div>
												<div class="country">유가증권평가금액: </div>
												<div class="country"> </div>
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
												<div class="serial"></div>														
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
												<div class="country"><a href="#" class="genric-btn danger circle" onclick="location.href='trade.do?command=tradebuy'">모의 주식 주문</a></div>
											</div>
											</table>
									</div>
								</div>
						
						<!--================매도 =================-->
						<div class="tab-pane fade" id="profile" role="tabpanel" aria-labelledby="profile-tab">
							<div class="section-top-border">
							<table class="list">
									<h3 class="mb-30 title_color"> 님의 매도가능 정보</h3>
									<div class="progress-table-wrap">
									<!--  -->
										<div class="progress-table">
											<div class="table-head">
												<div class="serial">계좌번호 : </div>
												<div class="percentage"></div>
												<div class="serial">이름 : </div>
												<div class="serial"></div>
											</div>
									<!--  -->				
											<div class="table-row">
												<div class="serial"></div>
												<div class="country">계좌평가금액 : </div>
												<div class="country">  </div>
												<div class="country">유가증권평가금액: </div>
												<div class="country"> </div>
												<div class="serial"></div>
											</div>
									<!--  -->
											<div class="table-row">
												<div class="serial">
													<input type="checkbox" id="default-checkbox">
													<label for="default-checkbox"></label>
												</div>
												<div class="country">종목명</div>
												<div class="country">현재가</div>
												<div class="country">보유 주가 수</div>
												<div class="serial">수량</div>												
																		
											</div>
									<!--  -->
											<div class="table-head">
												<div class="serial">
													<input type="checkbox" id="default-checkbox">
													<label for="default-checkbox"></label>
												</div>
												<div class="country"></div>
												<div class="serial"></div>														
											</div>
									<!--  -->											
											<br>
											<div class="table-row">
												<div class="serial"></div>
												<div class="serial"></div>
												<div class="serial"></div>
												<div class="serial"></div>
												<div class="serial"></div>
												<div class="serial"></div>
												<div class="country">매매 금액 : </div>
												<div class="country"></div>	
												<div class="country"><a href="#" class="genric-btn danger circle" onclick="location.href='trade.do?command=tradesell'">매도하기</a></div>
											</div>
									<!--  -->
									</table>
									</div>
								</div>
					<!--================매도 끝=================-->
					</div>
        		</div>
        	</div>
        </section>
        <!--================End My Tabs Area =================-->

<%@ include file="form/footer.jsp" %>

   
		     
        <!-- Optional JavaScript -->
        <!-- jQuery first, then Popper.js, then Bootstrap JS -->
        <script src="js/jquery-3.3.1.min.js"></script>
        <script src="js/popper.js"></script>
        <script src="js/bootstrap.min.js"></script>
        <script src="js/stellar.js"></script>
        <script src="vendors/lightbox/simpleLightbox.min.js"></script>
        <script src="vendors/nice-select/js/jquery.nice-select.min.js"></script>
        <script src="vendors/isotope/imagesloaded.pkgd.min.js"></script>
        <script src="vendors/isotope/isotope.pkgd.min.js"></script>
        <script src="vendors/owl-carousel/owl.carousel.min.js"></script>
        <script src="vendors/popup/jquery.magnific-popup.min.js"></script>
        <script src="js/jquery.ajaxchimp.min.js"></script>
        <script src="vendors/counter-up/jquery.waypoints.min.js"></script>
        <script src="vendors/counter-up/jquery.counterup.min.js"></script>
        <script src="js/mail-script.js"></script>
        <script src="js/theme.js"></script>
    

</body></html>