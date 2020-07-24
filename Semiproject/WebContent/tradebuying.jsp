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
	width: 900px;
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
							<table class="tradetable">
								<form action="trade.do" method="post">
									<input type="hidden" name="command" value="tradebuy">
									<h3 class="mb-30 title_color">주식매수</h3>
									<div class="progress-table-wrap">
										<thead>
											<tr>
												<th colspan="2">이름 : ${member.name }</th>
												<th colspan="2">계좌번호 : ${member.bankNo }</th>
												<th colspan="2">계좌평가금액 : ${member.account }원</th>
											</tr>
										</thead>
										<tbody>
											<tr>
												<td>종목명</td>
												<td>현재가</td>
												<td>수량</td>
											</tr>
											<tr>
												<td><input type="text" name="stock"
													value="${stockName }" readonly="readonly"
													style="border: 0px; outline: none;"></td>
												<td><input type="text" id="price" name="priceNow"
													value="${price }" readonly="readonly"
													style="border: 0px; outline: none;"></td>
												<td><input name="countbuy" id="count" type="number"
													min="0" max="15" step="1"></td>
												<td><input type="button" class="btn sub-btn circle"
													value="가격확인" onclick="process(${price})"></td>
											</tr>
											<tr>
												<td colspan="2">매수 금액 :</td>
												<td colspan="2"><input id="result"></td>
												<td colspan="2"><input type="submit" value="주식주문"
													class="genric-btn danger circle"></td>
											</tr>
										</tbody>
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

	<%@ include file="form/footer.jsp"%>

</body>
</html>