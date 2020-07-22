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
//ajax
function process(price){
	
	var count = $("#count").val();
		$.ajax({
			url:"trade.do?command=ajax&count="+count+"&price="+price,	
			dataType: "json",						
			success:function(msg){
				$("#result").html(msg.allPrice+" 원")
			},
			error:function(){
				alert("실패");
			}
		});
}

/* $(function(){
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
}); */

</script>

</head>
<body>
	<!--================매수 팝업창 =================-->
	<section class="mytabs_area p_120">
		<div class="container">
			<div class="tabs_inner">

				<!--================매수 =================-->
				<div class="tab-content" id="myTabContent">
					<div class="tab-pane fade active show" id="home" role="tabpanel"
						aria-labelledby="home-tab">
						<div class="section-top-border">
							<table class="list">
								 <form action="trade.do" method="post">
									<input type="hidden" name="command" value="tradebuy"> 
									<h3 class="mb-30 title_color">주식매도</h3>
									<div class="progress-table-wrap">
										<div class="progress-table">
											<div class="table-head">
												<div class="serial">이름 :</div>
												<div class="serial">${member.name }</div>
												<div class="serial">계좌번호 :</div>
												<div class="percentage">${member.bankNo }</div>
											</div>
											<div class="table-row">
												<div class=""></div>
												<div class="serial"></div>
												<div class="country">계좌평가금액 :</div>
												<div class="country">${member.account }원</div>
												<div class="serial"></div>
												<div class="serial"></div>
												<div class="country">유가증권평가금액:</div>
												<div class="country">${member.stockAccount }원</div>
												<div class="serial"></div>
											</div>
											<div class="table-row">
												<div class="serial"></div>
												<div class="country">종목명</div>
												<div class="country">현재가</div>
												<div class="country">수량</div>
												<div class="country"></div>
											</div>
											<div class="table-head">
												<div class="serial"></div>
												<div class="country">
													<input type="text" name="stock" value="${stockName }" readonly="readonly" style="border:0px; outline:none;">
												</div>
												<div class="country">
													<input type="text" id="price" name="priceNow" value="${price }" readonly="readonly" style="border:0px; outline:none;">
												</div>
												<div class="country">
													<input name="countbuy" id="count" type="number" min="0"
														max="15" step="1">
												</div>
												<div class="country">
													<input type="button" class="btn sub-btn circle"
														 value="가격확인" onclick="process(${price})">
												</div>
											</div>
											<br>
											<div class="table-row">
												<div class="serial"></div>
												<div class="serial"></div>
												<div class="serial"></div>
												<div class="serial"></div>
												<div class="serial"></div>
												<div class="serial"></div>
												<div class="country">매수 금액 :</div>
												<div class="percentage" id="result"></div>
												<div class="country">
													<input type="submit" value="주식주문"
														class="genric-btn danger circle" >
												</div>
											</div>
										</div>
									</div>
								 </form>
							</table> 
						</div>
					</div>
				</div>
				<!--================매수 =================-->
			</div>
		</div>
	</section>

	<footer class="footer_area p_120">
		<div class="container">
			<div class="row footer_inner">
				<div class="col-lg-5 col-sm-6"></div>
			</div>
		</div>
	</footer>

</body>
</html>