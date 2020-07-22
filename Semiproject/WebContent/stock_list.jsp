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
	
	<link rel="stylesheet" href="css/stock_rank.css" />
	<script type="text/javascript">
		function mouseOver(obj){
			obj.style.backgroundColor="#f6f4e5";
		}
		function mouseOut(obj){
  			obj.style.backgroundColor="#ffffff";
		}
	</script>
	
	<% 
		int pageNum = Integer.parseInt(request.getParameter("page")); 
		String kos = (String)request.getParameter("kos");
	%>
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
					<li class="nav-item active"><a class="nav-link" href="index.jsp">Home</a></li> 
					<li class="nav-item submenu dropdown">
						<a href="#" class="nav-link dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">시장정보</a>
						<ul class="dropdown-menu">
							<li class="nav-item"><a class="nav-link" href="stock_search.jsp">기업별 조회</a></li>
							<li class="nav-item"><a class="nav-link" href="StockController?command=stock_rank">전종목 시세</a></li>
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
			
		</div>
	</section>
	<section>
		<div id="m_contents">
				<div class="selR">
					<a href="StockController?command=stock_rank&kos=p&page=1">코스피</a>
					<a href="StockController?command=stock_rank&kos=d&page=1">코스닥</a>
				</div>
				<div id="rank_list">
					<div>
						${rank.rank_list }
					</div>
					<div id="page">
						
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
	var pageN = 1;
	var kospd = "p";
	$(function(){
		pageN = parseInt((<%=pageNum%>-1)/10)*10;
		kospd = '<%=kos%>';
		
		if(kospd == 'p'){
			$("#m_contents > div.selR > a:nth-child(1)").addClass("sel_a");
		}else{
			$("#m_contents > div.selR > a:nth-child(2)").addClass("sel_a");
		}
		
		var html = [];
		var j = 0;
		
		html[j++] = '<table id="pageNum"><tr>';
		for(var i = pageN+1; i <= pageN+10; i++){
			if((pageN != 0)&&((i%10) == 1)){
				var x = i-1;
				html[j++] = '<td style="border-right: 1px solid gray; width: auto; padding-right: 5px;"><a href="StockController?command=stock_rank&kos=' + kospd + '&page=' + x + '">이전</a></td>';
			}
			if(i == <%=pageNum%>){
				html[j++] = '<td><a style="color: black; font-weight: bold;" href="StockController?command=stock_rank&kos=' + kospd + '&page=' + i + '">' + i + '</a></td>';
			}else{
				html[j++] = '<td><a href="StockController?command=stock_rank&kos=' + kospd + '&page=' + i + '">' + i + '</a></td>';
			}
			
			if((i%10) == 0){
				var x = i+1;
				html[j++] = '<td style="border-left: 1px solid gray; width: auto; padding-left: 5px;"><a href="StockController?command=stock_rank&kos=' + kospd + '&page=' + x + '">다음</a></td>';
			}
			
			if(kospd == 'p'){
				if(i == 32){
					break;
				}
			}else{
				if(i == 29){
					break;
				}
			}
		}
		html[j++] = '</tr></table>';
		
		$("#page")[0].innerHTML = html.join('');
	});
	</script>
</body>
</html>