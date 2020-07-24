<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%
	request.setCharacterEncoding("UTF-8");
%>
<%
	response.setContentType("text/html; charset=UTF-8");
%>

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
<style type="text/css">
.tradetable {
	border: none;
	padding: 10px;
	background-color: white;
	color: black;
	width: 690px;
	text-align: center;
}

.tradetable thead th {
	padding: 10px;
	text-align: center;
	font-weight: bold;
	vertical-align: top;
	color: #369;
	border-bottom: 3px solid #036;
}

.tradetable tbody td {
	padding: 10px;
	text-align: center;
	border-bottom: 1px solid #ccc;
}

.tradetable input {
	width: 120px;
}
</style>
<script type="text/javascript"
	src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
<script type="text/javascript">
function getStockName(){
	var stockName = $("#stockName").val();
	return stockName;
}; 

function search(){
	window.open("trade.do?command=tradebuyform&stockName="+getStockName(), "_blank", "width=full,height=full");
};

function getParameter(index){
	var count = "count="+document.getElementsByName("count")[index].value;
	var price = "price="+document.getElementsByName("price")[index].value;
	
	return "&"+count+"&"+price;
};

function process(index){
	$.ajax({
		url:"trade.do?command=ajax"+getParameter(index),
		dataType: "json",
		success:function(msg){
			$("input[name=result]:eq("+index+")").val(msg.allPrice+"원");
		},
		error:function(){
			alert("실패");
		}
		
	});
};
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
													<input id="stockName" type="text"> <input
														type="button" class="btn sub-btn" onclick="search();"
														value="검색">
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
						<div class="tabs_inner">

							<table class="tradetable">
								<thead>
									<tr>
										<th colspan="2">이름 : ${member.name }</th>
										<th colspan="3">계좌번호 : ${member.bankNo }</th>
										<th colspan="3">계좌잔액: ${member.account }</th>
									</tr>
								</thead>
								<!--  -->
								<tbody>
									<tr>
										<td>종목명</td>
										<td>구매가(/주당)</td>
										<td>보유량</td>
										<td>현재가(/주당)</td>
										<td>판매량</td>
										<td></td>
										<td>예상매도가</td>
										<td></td>
									</tr>
									<!--  -->
									<c:choose>
										<c:when test="${empty trade }">
											<div align="center">===============구매한 주가가 존재하지
												않습니다.===============</div>
										</c:when>
										<c:otherwise>
											<c:forEach var="trade" items="${trade }" varStatus="status">
												<tr>
													<form action="trade.do" method="post">
														<input type="hidden" name="command" value="tradesell">
														<td><input type="text" name="stockName"
															value="${trade.stockName }" readonly="readonly"
															style="border: 0px; outline: none;"></td>
														<td><input type="text" value="${trade.price }"
															readonly="readonly" style="border: 0px; outline: none;">
														</td>
														<td><input type="text" value="${trade.holding }"
															readonly="readonly" style="border: 0px; outline: none;">
														</td>
														<td><input type="text" name="price"
															value="${nowPrice[status.index]}" readonly="readonly"
															style="border: 0px; outline: none;"></td>
														<td><input name="count" type="number" min="0"
															max="${trade.holding }" step="1"></td>
														<td><input type="button" class="btn sub-btn circle"
															value="가격확인" onclick="process(${status.index});">
														</td>

														<td><input type="text" name="result"
															readonly="readonly" style="border: 0px; outline: none;">
														</td>
														<td><input type="submit"
															class="genric-btn danger circle" value="매도하기"></td>
													</form>
												</tr>
											</c:forEach>
										</c:otherwise>
									</c:choose>
								</tbody>
							</table>
						</div>
					</div>


					<!--================매도 끝=================-->
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
	<script type="text/javascript"
		src="https://code.jquery.com/jquery-3.5.1.min.js"></script>


</body>
</html>