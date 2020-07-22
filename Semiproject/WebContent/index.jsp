<%@page import="com.semi.dto.MemberDto"%>
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
</head>
<body>

	<%
		MemberDto dto = new MemberDto();
	%>
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
					<li class="nav-item"><a class="nav-link" href="trade.do?command=trading">모의거래</a></li> 
					<li class="nav-item submenu dropdown">
						<a href="member.do?command=mypage&id=<%=dto.getId() %>" class="nav-link dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">마이페이지</a>
						<ul class="dropdown-menu">
							<li class="nav-item"><a class="nav-link" href="blog.html">거래내역 조회</a></li>
							<li class="nav-item"><a class="nav-link" href="member.do?command=updata&mno=<%=dto.getMno() %>">회원정보 수정</a></li>
						</ul>
					</li> 
					<li class="nav-item"><a class="nav-link" href="login.jsp">Login/Register</a></li>
				</ul>
			</div> 
		</div>
				</nav>
			</div>
	</header>
	<!--================Header Menu Area =================-->
	
	<!--================Home Banner Area =================-->
	<jsp:include page="./form/homeBanner.jsp"></jsp:include>
	<!--================End Home Banner Area =================-->
	
	<!--================Welcome Area =================-->
	<section class="welcome_area p_120">
		<div class="container">
			<div class="row welcome_inner">
				<div class="col-lg-6">
					<div class="welcome_text">
						<h4>About Myself</h4>
						<p>inappropriate behavior is often laughed off as “boys will be boys,” women face higher conduct standards especially in the workplace. That’s why it’s crucial that, as women, our behavior on the job is beyond reproach. inappropriate behavior is often laughed.</p>
						<div class="row">
							<div class="col-md-4">
								<div class="wel_item">
									<i class="lnr lnr-database"></i>
									<h4>$2.5M</h4>
									<p>Total Donation</p>
								</div>
							</div>
							<div class="col-md-4">
								<div class="wel_item">
									<i class="lnr lnr-book"></i>
									<h4>1465</h4>
									<p>Total Projects</p>
								</div>
							</div>
							<div class="col-md-4">
								<div class="wel_item">
									<i class="lnr lnr-users"></i>
									<h4>3965</h4>
									<p>Total Volunteers</p>
								</div>
							</div>
						</div>
					</div>
				</div>
				<div class="col-lg-6">
					<div class="tools_expert">
						<div class="skill_main">
					<div class="skill_item">
						<h4>After Effects <span class="counter">85</span>%</h4>
						<div class="progress_br">
							<div class="progress">
								<div class="progress-bar" role="progressbar" aria-valuenow="85" aria-valuemin="0" aria-valuemax="100"></div>
							</div>
						</div>
					</div>
					<div class="skill_item">
						<h4>Photoshop <span class="counter">90</span>%</h4>
						<div class="progress_br">
							<div class="progress">
								<div class="progress-bar" role="progressbar" aria-valuenow="90" aria-valuemin="0" aria-valuemax="100"></div>
							</div>
						</div>
					</div>
					<div class="skill_item">
						<h4>Illustrator <span class="counter">70</span>%</h4>
						<div class="progress_br">
							<div class="progress">
								<div class="progress-bar" role="progressbar" aria-valuenow="70" aria-valuemin="0" aria-valuemax="100"></div>
							</div>
						</div>
					</div>
					<div class="skill_item">
						<h4>Sublime <span class="counter">95</span>%</h4>
						<div class="progress_br">
							<div class="progress">
								<div class="progress-bar" role="progressbar" aria-valuenow="95" aria-valuemin="0" aria-valuemax="100"></div>
							</div>
						</div>
					</div>
					<div class="skill_item">
						<h4>Sketch <span class="counter">75</span>%</h4>
						<div class="progress_br">
							<div class="progress">
								<div class="progress-bar" role="progressbar" aria-valuenow="75" aria-valuemin="0" aria-valuemax="100"></div>
							</div>
						</div>
					</div>
				</div>
					</div>
				</div>
			</div>
		</div>
	</section>
	<!--================End Welcome Area =================-->
	
	<!--================My Tabs Area =================-->
	<section class="mytabs_area p_120">
		<div class="container">
			<div class="tabs_inner">
		<ul class="nav nav-tabs" id="myTab" role="tablist">
			<li class="nav-item">
				<a class="nav-link active" id="home-tab" data-toggle="tab" href="#home" role="tab" aria-controls="home" aria-selected="true">My Experiences</a>
			</li>
			<li class="nav-item">
				<a class="nav-link" id="profile-tab" data-toggle="tab" href="#profile" role="tab" aria-controls="profile" aria-selected="false">My Education</a>
			</li>
		</ul>
		<div class="tab-content" id="myTabContent">
			<div class="tab-pane fade show active" id="home" role="tabpanel" aria-labelledby="home-tab">
				<ul class="list">
					<li>
						<span></span>
						<div class="media">
							<div class="d-flex">
								<p>March 2017 to present</p>
							</div>
							<div class="media-body">
								<h4>Colorlib</h4>
								<p>Senior Web Developer <br>Santa monica, Los angeles</p>
							</div>
						</div>
					</li>
					<li>
						<span></span>
						<div class="media">
							<div class="d-flex">
								<p>March 2017 to present</p>
							</div>
							<div class="media-body">
								<h4>Colorlib</h4>
								<p>Senior Web Developer <br>Santa monica, Los angeles</p>
							</div>
						</div>
					</li>
					<li>
					<span></span>
						<div class="media">
							<div class="d-flex">
								<p>March 2017 to present</p>
							</div>
							<div class="media-body">
								<h4>Colorlib</h4>
								<p>Senior Web Developer <br>Santa monica, Los angeles</p>
							</div>
						</div>
					</li>
				</ul>
			</div>
			<div class="tab-pane fade" id="profile" role="tabpanel" aria-labelledby="profile-tab">
				<ul class="list">
					<li>
						<span></span>
						<div class="media">
							<div class="d-flex">
								<p>March 2017 to present</p>
							</div>
							<div class="media-body">
								<h4>Colorlib</h4>
								<p>Senior Web Developer <br>Santa monica, Los angeles</p>
							</div>
						</div>
					</li>
					<li>
						<span></span>
						<div class="media">
							<div class="d-flex">
								<p>March 2017 to present</p>
							</div>
							<div class="media-body">
								<h4>Colorlib</h4>
								<p>Senior Web Developer <br>Santa monica, Los angeles</p>
							</div>
						</div>
					</li>
					<li>
					<span></span>
						<div class="media">
							<div class="d-flex">
								<p>March 2017 to present</p>
							</div>
							<div class="media-body">
								<h4>Colorlib</h4>
								<p>Senior Web Developer <br>Santa monica, Los angeles</p>
							</div>
						</div>
					</li>
				</ul>
			</div>
		</div>
			</div>
		</div>
	</section>
	<!--================End My Tabs Area =================-->
	
	<!--================Feature Area =================-->
	<section class="feature_area p_120">
		<div class="container">
			<div class="main_title">
				<h2>offerings to my clients</h2>
				<p>If you are looking at blank cassettes on the web, you may be very confused at the difference in price. You may see some for as low as $.17 each.</p>
			</div>
			<div class="feature_inner row">
				<div class="col-lg-4 col-md-6">
					<div class="feature_item">
						<i class="flaticon-city"></i>
						<h4>Architecture</h4>
						<p>If you are looking at blank cassettes on the web, you may be very confused at the difference in price. You may see some for as low as $17 each.</p>
					</div>
				</div>
				<div class="col-lg-4 col-md-6">
					<div class="feature_item">
						<i class="flaticon-skyline"></i>
						<h4>Interior Design</h4>
						<p>If you are looking at blank cassettes on the web, you may be very confused at the difference in price. You may see some for as low as $17 each.</p>
					</div>
				</div>
				<div class="col-lg-4 col-md-6">
					<div class="feature_item">
						<i class="flaticon-sketch"></i>
						<h4>Concept Design</h4>
						<p>If you are looking at blank cassettes on the web, you may be very confused at the difference in price. You may see some for as low as $17 each.</p>
					</div>
				</div>
			</div>
		</div>
	</section>
	<!--================End Feature Area =================-->
	
	<!--================Home Gallery Area =================-->
	<section class="home_gallery_area p_120">
		<div class="container">
			<div class="main_title">
				<h2>Our Latest Featured Projects</h2>
				<p>Who are in extremely love with eco friendly system.</p>
			</div>
			<div class="isotope_fillter">
				<ul class="gallery_filter list">
			<li class="active" data-filter="*"><a href="#">All</a></li>
			<li data-filter=".brand"><a href="#">Vector</a></li>
			<li data-filter=".manipul"><a href="#">Raster</a></li>
			<li data-filter=".creative"><a href="#">UI/UX</a></li>
			<li data-filter=".design"><a href="#">Printing</a></li>
		</ul>
			</div>
		</div>
		<div class="container">
			<div class="gallery_f_inner row imageGallery1" style="position: relative; height: 719.126px;">
				<div class="col-lg-4 col-md-4 col-sm-6 brand manipul design print" style="position: absolute; left: 0px; top: 0px;">
					<div class="h_gallery_item">
						<div class="g_img_item">
							<img class="img-fluid" src="img/gallery/project-1.jpg" alt="">
							<a class="light" href="img/gallery/project-1.jpg"><img src="img/gallery/icon.png" alt=""></a>
						</div>
						<div class="g_item_text">
							<h4>3D Helmet Design</h4>
							<p>Client Project</p>
						</div>
					</div>
				</div>
				<div class="col-lg-4 col-md-4 col-sm-6 brand manipul creative" style="position: absolute; left: 239.988px; top: 0px;">
					<div class="h_gallery_item">
						<div class="g_img_item">
							<img class="img-fluid" src="img/gallery/project-2.jpg" alt="">
							<a class="light" href="img/gallery/project-2.jpg"><img src="img/gallery/icon.png" alt=""></a>
						</div>
						<div class="g_item_text">
							<h4>2D Vinyl Design</h4>
							<p>Client Project</p>
						</div>
					</div>
				</div>
				<div class="col-lg-4 col-md-4 col-sm-6 manipul creative design print" style="position: absolute; left: 479.976px; top: 0px;">
					<div class="h_gallery_item">
						<div class="g_img_item">
							<img class="img-fluid" src="img/gallery/project-3.jpg" alt="">
							<a class="light" href="img/gallery/project-3.jpg"><img src="img/gallery/icon.png" alt=""></a>
						</div>
						<div class="g_item_text">
							<h4>Creative Poster Design</h4>
							<p>Client Project</p>
						</div>
					</div>
				</div>
				<div class="col-lg-4 col-md-4 col-sm-6 brand creative print" style="position: absolute; left: 0px; top: 359.563px;">
					<div class="h_gallery_item">
						<div class="g_img_item">
							<img class="img-fluid" src="img/gallery/project-4.jpg" alt="">
							<a class="light" href="img/gallery/project-4.jpg"><img src="img/gallery/icon.png" alt=""></a>
						</div>
						<div class="g_item_text">
							<h4>Embosed Logo Design</h4>
							<p>Client Project</p>
						</div>
					</div>
				</div>
				<div class="col-lg-4 col-md-4 col-sm-6 brand manipul design" style="position: absolute; left: 239.988px; top: 359.563px;">
					<div class="h_gallery_item">
						<div class="g_img_item">
							<img class="img-fluid" src="img/gallery/project-5.jpg" alt="">
							<a class="light" href="img/gallery/project-5.jpg"><img src="img/gallery/icon.png" alt=""></a>
						</div>
						<div class="g_item_text">
							<h4>3D Disposable Bottle</h4>
							<p>Client Project</p>
						</div>
					</div>
				</div>
				<div class="col-lg-4 col-md-4 col-sm-6 brand creative" style="position: absolute; left: 479.976px; top: 359.563px;">
					<div class="h_gallery_item">
						<div class="g_img_item">
							<img class="img-fluid" src="img/gallery/project-6.jpg" alt="">
							<a class="light" href="img/gallery/project-6.jpg"><img src="img/gallery/icon.png" alt=""></a>
						</div>
						<div class="g_item_text">
							<h4>3D Logo Design</h4>
							<p>Client Project</p>
						</div>
					</div>
				</div>
			</div>
			<div class="more_btn">
				<a class="main_btn" href="#">Load More Items</a>
			</div>
		</div>
	</section>
	<!--================End Home Gallery Area =================-->
	
	<!--================Testimonials Area =================-->
	<section class="testimonials_area p_120">
		<div class="container">
			<div class="main_title">
				<h2>Testimonials</h2>
				<p>If you are looking at blank cassettes on the web, you may be very confused at the difference in price. You may see some for as low as $.17 each.</p>
			</div>
			<div class="testi_inner">
		<div class="testi_slider owl-carousel owl-loaded owl-drag">
			
			
			
		<div class="owl-stage-outer"><div class="owl-stage" style="transform: translate3d(-960px, 0px, 0px); transition: all 0s ease 0s; width: 2160px;"><div class="owl-item cloned" style="width: 210px; margin-right: 30px;"><div class="item">
				<div class="testi_item">
					<p>As conscious traveling Paup ers we must always be oncerned about our dear Mother Earth. If you think about it, you travel across her face</p>
					<h4>Fanny Spencer</h4>
					<a href="#"><i class="fa fa-star"></i></a>
					<a href="#"><i class="fa fa-star"></i></a>
					<a href="#"><i class="fa fa-star"></i></a>
					<a href="#"><i class="fa fa-star"></i></a>
					<a href="#"><i class="fa fa-star-half-o"></i></a>
				</div>
			</div></div><div class="owl-item cloned" style="width: 210px; margin-right: 30px;"><div class="item">
				<div class="testi_item">
					<p>As conscious traveling Paup ers we must always be oncerned about our dear Mother Earth. If you think about it, you travel across her face</p>
					<h4>Fanny Spencer</h4>
					<a href="#"><i class="fa fa-star"></i></a>
					<a href="#"><i class="fa fa-star"></i></a>
					<a href="#"><i class="fa fa-star"></i></a>
					<a href="#"><i class="fa fa-star"></i></a>
					<a href="#"><i class="fa fa-star-half-o"></i></a>
				</div>
			</div></div><div class="owl-item cloned" style="width: 210px; margin-right: 30px;"><div class="item">
				<div class="testi_item">
					<p>As conscious traveling Paup ers we must always be oncerned about our dear Mother Earth. If you think about it, you travel across her face</p>
					<h4>Fanny Spencer</h4>
					<a href="#"><i class="fa fa-star"></i></a>
					<a href="#"><i class="fa fa-star"></i></a>
					<a href="#"><i class="fa fa-star"></i></a>
					<a href="#"><i class="fa fa-star"></i></a>
					<a href="#"><i class="fa fa-star-half-o"></i></a>
				</div>
			</div></div><div class="owl-item" style="width: 210px; margin-right: 30px;"><div class="item">
				<div class="testi_item">
					<p>As conscious traveling Paup ers we must always be oncerned about our dear Mother Earth. If you think about it, you travel across her face</p>
					<h4>Fanny Spencer</h4>
					<a href="#"><i class="fa fa-star"></i></a>
					<a href="#"><i class="fa fa-star"></i></a>
					<a href="#"><i class="fa fa-star"></i></a>
					<a href="#"><i class="fa fa-star"></i></a>
					<a href="#"><i class="fa fa-star-half-o"></i></a>
				</div>
			</div></div><div class="owl-item active" style="width: 210px; margin-right: 30px;"><div class="item">
				<div class="testi_item">
					<p>As conscious traveling Paup ers we must always be oncerned about our dear Mother Earth. If you think about it, you travel across her face</p>
					<h4>Fanny Spencer</h4>
					<a href="#"><i class="fa fa-star"></i></a>
					<a href="#"><i class="fa fa-star"></i></a>
					<a href="#"><i class="fa fa-star"></i></a>
					<a href="#"><i class="fa fa-star"></i></a>
					<a href="#"><i class="fa fa-star-half-o"></i></a>
				</div>
			</div></div><div class="owl-item active" style="width: 210px; margin-right: 30px;"><div class="item">
				<div class="testi_item">
					<p>As conscious traveling Paup ers we must always be oncerned about our dear Mother Earth. If you think about it, you travel across her face</p>
					<h4>Fanny Spencer</h4>
					<a href="#"><i class="fa fa-star"></i></a>
					<a href="#"><i class="fa fa-star"></i></a>
					<a href="#"><i class="fa fa-star"></i></a>
					<a href="#"><i class="fa fa-star"></i></a>
					<a href="#"><i class="fa fa-star-half-o"></i></a>
				</div>
			</div></div><div class="owl-item cloned active" style="width: 210px; margin-right: 30px;"><div class="item">
				<div class="testi_item">
					<p>As conscious traveling Paup ers we must always be oncerned about our dear Mother Earth. If you think about it, you travel across her face</p>
					<h4>Fanny Spencer</h4>
					<a href="#"><i class="fa fa-star"></i></a>
					<a href="#"><i class="fa fa-star"></i></a>
					<a href="#"><i class="fa fa-star"></i></a>
					<a href="#"><i class="fa fa-star"></i></a>
					<a href="#"><i class="fa fa-star-half-o"></i></a>
				</div>
			</div></div><div class="owl-item cloned" style="width: 210px; margin-right: 30px;"><div class="item">
				<div class="testi_item">
					<p>As conscious traveling Paup ers we must always be oncerned about our dear Mother Earth. If you think about it, you travel across her face</p>
					<h4>Fanny Spencer</h4>
					<a href="#"><i class="fa fa-star"></i></a>
					<a href="#"><i class="fa fa-star"></i></a>
					<a href="#"><i class="fa fa-star"></i></a>
					<a href="#"><i class="fa fa-star"></i></a>
					<a href="#"><i class="fa fa-star-half-o"></i></a>
				</div>
			</div></div><div class="owl-item cloned" style="width: 210px; margin-right: 30px;"><div class="item">
				<div class="testi_item">
					<p>As conscious traveling Paup ers we must always be oncerned about our dear Mother Earth. If you think about it, you travel across her face</p>
					<h4>Fanny Spencer</h4>
					<a href="#"><i class="fa fa-star"></i></a>
					<a href="#"><i class="fa fa-star"></i></a>
					<a href="#"><i class="fa fa-star"></i></a>
					<a href="#"><i class="fa fa-star"></i></a>
					<a href="#"><i class="fa fa-star-half-o"></i></a>
				</div>
			</div></div></div></div><div class="owl-nav disabled"><div class="owl-prev">prev</div><div class="owl-next">next</div></div><div class="owl-dots disabled"><div class="owl-dot active"><span></span></div></div></div>
			</div>
		</div>
	</section>
	<!--================End Testimonials Area =================-->
	
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

</body>
</html>