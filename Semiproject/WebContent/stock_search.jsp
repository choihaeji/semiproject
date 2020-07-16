<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% request.setCharacterEncoding("UTF-8"); %>
<% response.setContentType("text/html; charset=UTF-8"); %>
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
	<link rel="stylesheet" href="vendors/flaticon/flaticon.css">
	<!-- main css -->
	<link rel="stylesheet" href="css/style.css">
	<link rel="stylesheet" href="css/responsive.css">
	
	<link rel="stylesheet" href="css/stock_search.css" />
	
</head>
<body>
	
	<!--================Header Menu Area =================-->
	<header class="header_area">
			<div class="main_menu">
				<nav class="navbar navbar-expand-lg navbar-light">
		<div class="container box_1620">
			<!-- Brand and toggle get grouped for better mobile display -->
			<a class="navbar-brand logo_h" href="index.html"><img src="img/logo.png" alt=""></a>
			<button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
				<span class="icon-bar"></span>
				<span class="icon-bar"></span>
				<span class="icon-bar"></span>
			</button>
			<!-- Collect the nav links, forms, and other content for toggling -->
			<div class="collapse navbar-collapse offset" id="navbarSupportedContent">
				<ul class="nav navbar-nav menu_nav ml-auto">
					<li class="nav-item active"><a class="nav-link" href="index.html">Home</a></li> 
					<li class="nav-item submenu dropdown">
						<a href="#" class="nav-link dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">시장정보</a>
						<ul class="dropdown-menu">
							<li class="nav-item"><a class="nav-link" href="stock_search.jsp">기업별 조회</a></li>
							<li class="nav-item"><a class="nav-link" href="elements.html">전종목 시세</a></li>
						</ul>
					</li> 
					<li class="nav-item"><a class="nav-link" href="about-us.html">커뮤니티</a></li> 
					<li class="nav-item"><a class="nav-link" href="trading.jsp">모의거래</a></li> 
					<li class="nav-item submenu dropdown">
						<a href="#" class="nav-link dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">마이페이지</a>
						<ul class="dropdown-menu">
							<li class="nav-item"><a class="nav-link" href="blog.html">거래내역 조회</a></li>
							<li class="nav-item"><a class="nav-link" href="single-blog.html">회원정보 수정</a></li>
						</ul>
					</li> 
					<li class="nav-item"><a class="nav-link" href="contact.html">Login/Register</a></li>
				</ul>
			</div> 
		</div>
				</nav>
			</div>
	</header>
	<!--================Header Menu Area =================-->
	
	<!--================Home Banner Area =================-->
	<section class="home_banner_area">
		<div class="container box_1620">
			<div id=s_contents>
				<input id="stock_s" type="text" onkeypress="if( event.keyCode==13 ){search();}">
				<input id="stock_b" type="button" value="검색" onclick="search();">
			</div>
			<div id="search_list">

			</div>
		</div>
	</section>
	<!--================Footer Area =================-->
	<footer class="footer_area p_120">
		<div class="container">
			<div class="row footer_inner">
				<div class="col-lg-5 col-sm-6">
					<aside class="f_widget ab_widget">
						<div class="f_title">
							<h3>About Me</h3>
						</div>
						<p>Do you want to be even more successful? Learn to love learning and growth. The more effort you put into improving your skills,</p>
						<p><!-- Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0. -->
Copyright ©<script>document.write(new Date().getFullYear());</script>2020 All rights reserved | This template is made with <i class="fa fa-heart-o" aria-hidden="true"></i> by <a href="https://colorlib.com" target="_blank">Colorlib</a>
<!-- Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0. --></p>
					</aside>
				</div>
				<div class="col-lg-5 col-sm-6">
					<aside class="f_widget news_widget">
						<div class="f_title">
							<h3>Newsletter</h3>
						</div>
						<p>Stay updated with our latest trends</p>
						<div id="mc_embed_signup">
													<form target="_blank" action="https://spondonit.us12.list-manage.com/subscribe/post?u=1462626880ade1ac87bd9c93a&amp;id=92a4423d01" method="get" class="subscribe_form relative" novalidate="true">
														<div class="input-group d-flex flex-row">
																	<input name="EMAIL" placeholder="Enter email address" onfocus="this.placeholder = ''" onblur="this.placeholder = 'Email Address '" required="" type="email">
																	<button class="btn sub-btn"><span class="lnr lnr-arrow-right"></span></button>		
															</div>				
															<div class="mt-10 info"></div>
													</form>
											</div>
					</aside>
				</div>
				<div class="col-lg-2">
					<aside class="f_widget social_widget">
						<div class="f_title">
							<h3>Follow Me</h3>
						</div>
						<p>Let us be social</p>
						<ul class="list">
							<li><a href="#"><i class="fa fa-facebook"></i></a></li>
							<li><a href="#"><i class="fa fa-twitter"></i></a></li>
							<li><a href="#"><i class="fa fa-dribbble"></i></a></li>
							<li><a href="#"><i class="fa fa-behance"></i></a></li>
						</ul>
					</aside>
				</div>
			</div>
		</div>
	</footer>
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
	//자동 갱신 변수
	setI = null;

	//검색한 주식명
	function getStockValues(){
		var stock = $("#stock_s").val().replace(/ /g,"");

		return stock;
	}
		
	//자동 갱신 함수
	function setInter(code){
		setI = setInterval(function(){selOne(code);}, 5000);
	}

	//선택한 주식 정보가져오기
	function selOne(code){
		$.ajax({
			url:"ServletController?command=stockSelOne&stockCode="+code,
			dataType:"json",
			success:function(data){
				var html = [];
				var j=0;
				
				html[j++] = '<div id="test1">'
				html[j++] = 
				html[j++] = '</div>';
				html[j++] = '<div id="test2">' + data.d_graph + '</div>';
					
				
				$("#search_list")[0].innerHTML = html.join('');
			},
			error:function(){
				alert("fail");
			}
		});
	}	

	//주식검색
	function search(){
		if(getStockValues() == ""){
			alert('종목명을 입력하세요.');
		}else if(getStockValues().length < 2){
			alert('두글자 이상 입력하세요.');
		}else{
			//자동 갱신 중일 경우 중지
			if(setI != null){
				clearInterval(setI);
			}
				
			$.ajax({
				url:"ServletController?command=stock_search_list&stock="+getStockValues(),
				dataType:"json",
				success:function(data){
					if(data[0].chk == 0){
						$("#search_list").html('없음');
					}else{
						var html = [];
						var j=0;
						$("#search_list").html('<table id="stock_list_t"></table>');
						html[j++] = '<th class="stock_th1">종목명</th><th class="stock_th2">현재가</th><th class="stock_th2">전일대비</th><th class="stock_th2">등락율</th><th class="stock_th2">거래량</th><th class="stock_th2">거래대금(백만)</th>'
						
						for(var i=1; i<Object.keys(data).length; i++){
							html[j++] = '<tr><td class="stock_td1">';
							html[j++] = '<a class="a_info" onclick="setInter(\'' + data[i].stock_code + '\');">' + data[i].stock_name + '</a>';
							html[j++] = '</td><td>';
							html[j++] = data[i].price;
							html[j++] = '</td>';
							
							if(data[i].dod_ud == "상승"){
								html[j++] =	'<td class="td_up">' + '<img src="img/stock_search/ico_up.gif" width="7" height="6" alt="상승">';
								html[j++] = data[i].dod;
							}else if(data[i].dod_ud == "하락"){
								html[j++] = '<td class="td_down">' + '<img src="img/stock_search/ico_down.gif" width="7" height="6" alt="상승">';
								html[j++] = data[i].dod;
							}else{
								html[j++] = '<td>' + '<img src="img/stock_search/ico_same.gif" width="7" height="6" alt="상승">';
								html[j++] = data[i].dod;
							}
							
							html[j++] = '</td>';
							
							if(data[i].fluctuation_ud == "+"){
								html[j++] =	'<td class="td_up">';
								html[j++] = data[i].fluctuation_ud + data[i].fluctuation;
							}else if(data[i].fluctuation_ud == "-"){
								html[j++] = '<td class="td_down">';
								html[j++] = data[i].fluctuation_ud + data[i].fluctuation;
							}else{
								html[j++] = '<td>'
								html[j++] = data[i].fluctuation_ud + data[i].fluctuation;
							}
							
							html[j++] = '</td><td>';
							html[j++] = data[i].volume;
							html[j++] = '</td><td>';
							html[j++] = data[i].trading_val;
							html[j++] = '</td></tr>';
						}
						
						$("#stock_list_t")[0].innerHTML = html.join('');
					}
				},
				error:function(){
					alert("fail");
				}
			});
		}
	}
		
	</script>

</body>
</html>