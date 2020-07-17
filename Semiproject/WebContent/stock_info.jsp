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
	
	<link rel="stylesheet" href="css/stock_info.css" />
	
	
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
			<div id="m_contents">
				<div id=s_contents>
					<input id="stock_s" type="text" onkeypress="if( event.keyCode==13 ){search();}">
					<input id="stock_b" type="button" value="검색" onclick="search();">
				</div>
				<div id="stock_info">
					<!-- 주식정보 출력 -->
				</div>
				<div id="chart_area">
					<div class="graph_nav">
						<dl class="line">
							<dt>선차트</dt>
							<dd>
								<ul>
									<li class="day"><a class="day" href="#" onclick="showChart('day')">1일</a></li>
									<li class="week"><a class="week" href="#" onclick="showChart('week')">1주일</a></li>
									<li class="month3"><a class="month3" href="#" onclick="showChart('month3')">3개월</a></li>
									<li class="year1"><a class="year1" href="#" onclick="showChart('year1')">1년</a></li>
									<li class="year3"><a class="year3" href="#" onclick="showChart('year3')">3년</a></li>
									<li class="year5"><a class="year5" href="#" onclick="showChart('year5')">5년</a></li>
									<li class="year10"><a class="year10" href="#" onclick="showChart('year10')">10년</a></li>
								</ul>
							</dd>
						</dl>
						<dl class="bar">
							<dt>봉차트</dt>
							<dd>
								<ul>
									<li class="day"><a class="day_b" href="#" onclick="showChart('day_b')">일봉</a></li>
									<li class="week"><a class="week_b" href="#" onclick="showChart('week_b')">주봉</a></li>
									<li class="month"><a class="month_b" href="#" onclick="showChart('month_b')">월봉</a></li>
								</ul>
							</dd>
						</dl>					
					</div>
					<div id="graph_area">
						<!-- 차트이미지 출력 -->
					</div>
				</div>
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
	//차트 선택
	var code = "";
	var char_src = "https://ssl.pstatic.net/imgfinance/chart/item/area/day/";
	
	//자동 갱신 변수
	setI = null;

	//검색한 주식명
	function getStockValues(){
		var regExp = /[\{\}\[\]\/?.,;:|\)*~`!^\-_+<>@\#$%&\\\=\(\'\"]/gi;
		var stock = $("#stock_s").val().replace(/ /g,"").replace(regExp,"");

		return stock;
	}
		
	//자동 갱신 함수
	function setInter(code){
		selOne(code);
		setI = setInterval(function(){selOne(code);}, 5000);
	}
	
	//보여줄 그래프선택
	function showChart(chart){
		if(chart == "day"){
			char_src = "https://ssl.pstatic.net/imgfinance/chart/item/area/day/";
			$("#img_chart_area").attr("src",char_src + code + ".png?t=" + new Date().getTime());
			$("#chart_area a").css('color','#464646');
			$("a.day").css('color','#00468c');
		}else if(chart == "week"){
			char_src = "https://ssl.pstatic.net/imgfinance/chart/item/area/week/";
			$("#img_chart_area").attr("src",char_src + code + ".png?t=" + new Date().getTime());
			$("#chart_area a").css('color','#464646');
			$("a.week").css('color','#00468c');
		}else if(chart == "month3"){
			char_src = "https://ssl.pstatic.net/imgfinance/chart/item/area/month3/";
			$("#img_chart_area").attr("src",char_src + code + ".png?t=" + new Date().getTime());
			$("#chart_area a").css('color','#464646');
			$("a.month3").css('color','#00468c');
		}else if(chart == "year1"){
			char_src = "https://ssl.pstatic.net/imgfinance/chart/item/area/year/";
			$("#img_chart_area").attr("src",char_src + code + ".png?t=" + new Date().getTime());
			$("#chart_area a").css('color','#464646');
			$("a.year1").css('color','#00468c');
		}else if(chart == "year3"){
			char_src = "https://ssl.pstatic.net/imgfinance/chart/item/area/year3/";
			$("#img_chart_area").attr("src",char_src + code + ".png?t=" + new Date().getTime());
			$("#chart_area a").css('color','#464646');
			$("a.year3").css('color','#00468c');
		}else if(chart == "year5"){
			char_src = "https://ssl.pstatic.net/imgfinance/chart/item/area/year5/";
			$("#img_chart_area").attr("src",char_src + code + ".png?t=" + new Date().getTime());
			$("#chart_area a").css('color','#464646');
			$("a.year5").css('color','#00468c');
		}else if(chart == "year10"){
			char_src = "https://ssl.pstatic.net/imgfinance/chart/item/area/year10/";
			$("#img_chart_area").attr("src",char_src + code + ".png?t=" + new Date().getTime());
			$("#chart_area a").css('color','#464646');
			$("a.year10").css('color','#00468c');
		}else if(chart == "day_b"){
			char_src = "https://ssl.pstatic.net/imgfinance/chart/item/candle/day/";
			$("#img_chart_area").attr("src",char_src + code + ".png?t=" + new Date().getTime());
			$("#chart_area a").css('color','#464646');
			$("a.day_b").css('color','#00468c');
		}else if(chart == "week_b"){
			char_src = "https://ssl.pstatic.net/imgfinance/chart/item/candle/week/";
			$("#img_chart_area").attr("src",char_src + code + ".png?t=" + new Date().getTime());
			$("#chart_area a").css('color','#464646');
			$("a.week_b").css('color','#00468c');
		}else if(chart == "month_b"){
			char_src = "https://ssl.pstatic.net/imgfinance/chart/item/candle/month/";
			$("#img_chart_area").attr("src",char_src + code + ".png?t=" + new Date().getTime());
			$("#chart_area a").css('color','#464646');
			$("a.month_b").css('color','#00468c');
		}
	}
	
	//선택한 주식 정보가져오기
	function selOne(code){
		$.ajax({
			url:"ServletController?command=stockSelOne&stockCode="+code,
			dataType:"json",
			success:function(data){
				var html1 = [];
				var html2 = [];
				var i=0;
				var j=0;
				
				html1[i++] = '<div id="c_info1">';
				html1[i++] = '<p id="p_s_name">' + data.stock_name + '<span>&nbsp&nbsp&nbsp' +data.stock_code + '</span>' + '</p>';
				if(data.dod_ud == "상승"){
					html1[i++] = '<div id="u_info">';
					html1[i++] = '<p class="stock_p1">' + data.price + '</p>';
					html1[i++] = '<p class="stock_p2"><img src="img/stock_search/ico_up.gif" width="11" height="9" alt="상승">' 
					+ data.dod + '<span class="no"> | </span>' + data.fluctuation_ud + data.fluctuation + '%' + '</p>';
					html1[i++] = '</div>';
				}else if(data.dod_ud == "하락"){
					html1[i++] = '<div id="d_info">';
					html1[i++] = '<p class="stock_p1">' + data.price + '</p>';
					html1[i++] = '<p class="stock_p2"><img src="img/stock_search/ico_down.gif" width="11" height="9" alt="하락">' 
					+ data.dod + '<span class="no"> | </span>' + data.fluctuation_ud + data.fluctuation + '%' + '</p>';
					html1[i++] = '</div>';
				}else{
					html1[i++] = '<div id="nud_info">';
					html1[i++] = '<p class="stock_p1">' + data.price + '</p>';
					html1[i++] = '<p class="stock_p2"><img src="img/stock_search/ico_same.gif" width="11" height="9" alt="보합">' 
					+ data.dod + '<span class="no"> | </span>' + data.fluctuation_ud + data.fluctuation + '%' + '</p>';
					html1[i++] = '</div>';
				}
				
				html1[i++] = '</div>';
				
				
				
				html2[j++] = '<div id="c_info2"><img id="img_chart_area" src="" alt="이미지 차트"></div>';
				
				
				$("#stock_info")[0].innerHTML = html1.join('');
				$("#graph_area")[0].innerHTML = html2.join('');
				$("#img_chart_area").attr("src",char_src + data.stock_code + ".png?t=" + new Date().getTime());
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
			
			location.href = "stock_search.jsp?s_name="+getStockValues();
		}
	}
	
	$(function(){
		code = '${param.code }';
		setInter(code);
	});
	
	</script>

</body>
</html>