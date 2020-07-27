<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<% request.setCharacterEncoding("UTF-8"); %>
<% response.setContentType("text/html; charset=UTF-8"); %>
<!DOCTYPE html>
<html>
<head>
<!-- Required meta tags -->
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<link rel="icon" href="img/favicon.png" type="image/png">
<title>기업별 조회</title>
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

<link rel="stylesheet" href="css/stock_search.css" />

</head>
<body>
	<!--================Header Menu Area =================-->
	<%@ include file="form/header.jsp"%>
	<!--================Header Menu Area =================-->

	<!--================Home Banner Area =================-->
	<section class="banner_area">
		<div class="box_1620">
			<div class="banner_inner d-flex align-items-center">
				<div class="container">
					<div class="banner_content text-center">
						<h2>기업별 조회</h2>
						<div class="page_link">
							<a href="index.jsp">Home</a> <a href="stock_search.jsp">기업별
								조회</a>
						</div>
					</div>
				</div>
			</div>
		</div>
	</section>
	<!--================Home Banner Area =================-->
	<div class="blog_area single-post-area p_120">
		<div class="container box_1620">
			<div id="m_contents">
				<!-- 로딩 -->
				<div class="wrap-loading display-none">
					<div>
						<img src="img/stock_search/loadding.gif" />
					</div>
				</div>
				<!-- 검색 -->
				<div id=s_contents>
					<input id="stock_s" type="text"
						onkeypress="if( event.keyCode==13 ){search();}"> <input
						id="stock_b" type="button" value="검색" onclick="search();">
				</div>
				<div id="search_list"></div>
			</div>
		</div>
	</div>
	<!--================Footer Area =================-->
	<%@ include file="form/footer.jsp"%>
	<!--================End Footer Area =================-->



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
	<script type="text/javascript">
	var g_val = "";
	
	//검색한 주식명
	function getStockValues(){
		var regExp = /[\{\}\[\]\/?.,;:|\)*~`!^\-_+<>@\#$%&\\\=\(\'\"]/gi;
		var stock = $("#stock_s").val().replace(/ /g,"").replace(regExp,"");
		
		return stock;
	}
		
	//주식검색
	function search(){
		var stock = getStockValues();
		
		if(stock == ""){
			alert('종목명을 입력하세요.');
		}else if(stock.length < 2){
			alert('두글자 이상 입력하세요.');
		}else{
			stock_search(stock);
		}
	}
	
	function stock_search(stock){
		var s_val = stock;
		
		$.ajax({
			url:"StockController?command=stock_search_list&stock="+s_val,
			dataType:"json"
			,beforeSend:function(){
		    	$('.wrap-loading').removeClass('display-none');
		    }
			,success:function(data){
				$('.wrap-loading').addClass('display-none');
				if(data[0].chk == 0){
					$("#search_list").html("'"+s_val+"'에 대한 검색결과가 없습니다.");
				}else{
					var html = [];
					var j=0;
					$("#search_list").html('<table id="stock_list_t"></table>');
					html[j++] = '<th class="stock_th1">종목명</th><th class="stock_th2">현재가</th><th class="stock_th2">전일대비</th><th class="stock_th2">등락율</th><th class="stock_th2">거래량</th><th class="stock_th2">거래대금(백만)</th>';
					
					for(var i=1; i<Object.keys(data).length; i++){
						html[j++] = '<tr><td class="stock_td1">';
						html[j++] = '<a class="a_info" href="stock_info.jsp?code=' + data[i].stock_code + '");">' + data[i].stock_name + '</a>';
						html[j++] = '</td><td>';
						html[j++] = data[i].price;
						html[j++] = '</td>';
						
						if(data[i].dod_ud == "상승"){
							html[j++] =	'<td class="td_up">' + '<img src="img/stock_search/ico_up.gif" width="7" height="6" alt="상승">';
							html[j++] = data[i].dod;
						}else if(data[i].dod_ud == "하락"){
							html[j++] = '<td class="td_down">' + '<img src="img/stock_search/ico_down.gif" width="7" height="6" alt="하락">';
							html[j++] = data[i].dod;
						}else{
							html[j++] = '<td>' + '<img src="img/stock_search/ico_same.gif" width="7" height="6" alt="보합">';
							html[j++] = data[i].dod;
						}
						
						html[j++] = '</td>';
						
						if(data[i].fluctuation_ud == "+"){
							html[j++] =	'<td class="td_up">';
							html[j++] = data[i].fluctuation_ud + data[i].fluctuation + '%';
						}else if(data[i].fluctuation_ud == "-"){
							html[j++] = '<td class="td_down">';
							html[j++] = data[i].fluctuation_ud + data[i].fluctuation + '%';
						}else{
							html[j++] = '<td>';
							html[j++] = data[i].fluctuation_ud + data[i].fluctuation + '%';
						}
						
						html[j++] = '</td><td>';
						html[j++] = data[i].volume;
						html[j++] = '</td><td>';
						html[j++] = data[i].trading_val;
						html[j++] = '</td></tr>';
					}
					
					$("#stock_list_t")[0].innerHTML = html.join('');
					$("#stock_s").val("");
				}
			},
			error:function(){
				alert("fail");
			}
		});
	}
	$(function(){
		g_val = '${param.s_name }';
		if(g_val != ""){
			stock_search(g_val);
		}
	});
	</script>
</body>
</html>