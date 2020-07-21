<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<% request.setCharacterEncoding("UTF-8"); %>
<% response.setContentType("text/html; charset=UTF-8"); %>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<!-- Required meta tags -->
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
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
<script type="text/javascript" src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
<script type="text/javascript">
function getStockName(){
	var stockName = $("#stockName").val();
	return stockName;
};

function search(){
	window.open("trade.do?command=tradebuyform&stockName="+getStockName(), "_blank", "width=full,height=full");
}

function getParameter(){
	
	var count = "count="+$("#count").val();
	var price = "price="+$("#price").val();
	
	return "&"+count+"&"+price;
}

$(function(){
	$("#process").click(function(){
		$.ajax({
			url:"trade.do?command=ajax"+getParameter(),	
			dataType: "json",						
			success:function(msg){
				$("#result").html(msg.allPrice+" 원")
			},
			error:function(){
				alert("실패");
			}
		});
	});
	
});

function sell(){
	window.open("trade.do?command=tradesellform&stockName="+,"_blank","width=full,height=full");
}

</script>
</head>

<body>
	<%@ include file="form/header.jsp"%>

	<!--================Home Banner Area =================-->
	<section class="banner_area">
		<div class="box_1620">
			<div class="banner_inner d-flex align-items-center">
				<div class="container">
					<div class="banner_content text-center">
						<h2>모의거래</h2>
						<div class="page_link">
							<a href="trade.do?command=index">Home</a> <a
								href="trade.do?commnad=trading">모의거래</a>
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
					<li class="nav-item"><a class="nav-link active show"
						id="home-tab" data-toggle="tab" href="#home" role="tab"
						aria-controls="home" aria-selected="true">모의 주식주문</a></li>
					<li class="nav-item"><a class="nav-link" id="profile-tab"
						data-toggle="tab" href="#profile" role="tab"
						aria-controls="profile" aria-selected="false">매도하기</a></li>
				</ul>

				<!--================매수 =================-->
				<div class="tab-content" id="myTabContent">
					<div class="tab-pane fade active show" id="home" role="tabpanel"
						aria-labelledby="home-tab">
						<div class="section-top-border">
							<table class="list">
								<h3 class="mb-30 title_color">주식주문</h3>

								<div align="center">
									<div class="col-lg-5 col-sm-6">
										<aside class="f_widget news_widget">
											<div id="mc_embed_signup">
												<div class="input-group d-flex flex-row">
													<input id="stockName" type="text"> 
													<input type="button" class="btn sub-btn" onclick="search();" value="검색">
												</div>
												<div class="mt-10 info"></div>
											</div>
										</aside>
									</div>
								</div>

							</table>
						</div>
					</div>

					<!--================매도 =================-->
					<div class="tab-pane fade" id="profile" role="tabpanel"
						aria-labelledby="profile-tab">
						<div class="section-top-border">
							<talbe class="list">
							<form action="trade.do" method="post">
								<input type="hidden" name="command" value="tradesell">
								<h3 class="mb-30 title_color">매도가능 정보</h3>
								<div class="progress-table-wrap">
									<div class="progress-table">
										<!--  -->
										<div class="table-head">
											<div class="serial">이름 :</div>
											<div class="serial">${member.name }</div>
											<div class="serial">계좌번호 :</div>
											<div class="percentage">${member.bankNo }</div>
										</div>
										<!--  -->
										<div class="table-row">
											<div class="serial"></div>
											<div class="country">계좌평가금액:</div>
											<div class="country">${member.account }</div>
											<div class="country">유가증권평가금액:</div>
											<div class="country">${member.stockAccount }</div>
											<div class="serial"></div>
										</div>
										<!--  -->
										<div class="table-row">
											<div class="serial">
												<input type="checkbox" id="default-checkbox"> <label
													for="default-checkbox"></label>
											</div>
											<div class="country">종목명</div>
											<div class="country">구매가(/주당)</div>
											<div class="country">현재가(/주당)</div>
											<div class="country">보유량</div>
											<div class="country"></div>

										</div>
										<!--  -->
										<div class="talbe-row">
											<c:choose>
												<c:when test="${empty trade }">
													<div align="center">===============구매한 주가가 존재하지
														않습니다.===============</div>
												</c:when>

												<c:otherwise>
													<c:forEach var="trade" items="${trade }" varStatus="status">

														<div class="serial">
															<input type="radio" id="default-radio">
															<label for="default-radio"></label>
														</div>
														<div class="country">
															<input type="text" name="stock" value="${trade.stockName }" readonly="readonly" style="border:0px; outline:none;">
														</div>
														<div class="country">${trade.price }</div>
														<div class="country">
															<input type="text" id="price" name="priceNow" value="${nowPrice[status.index].value}"
																readonly="readonly" style="border:0px; outline:none;">
														</div>
														<div class="country">${trade.holding }주</div>
														<input type="button" class="btn sub-btn" onclick="sell();" name="sell" value="매도하기">

													</c:forEach>
												</c:otherwise>

											</c:choose>
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
											<div class="country">매매 금액 :</div>
											<div class="country" id="result"></div>
											<div class="country">
												<input type="submit" value="매도하기"
													class="genric-btn danger circle">
											</div>

										</div>

									</div>
								</div>
							</form>
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

	<%@ include file="form/footer.jsp"%>



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
	<script type="text/javascript" src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
	

</body>
</html>