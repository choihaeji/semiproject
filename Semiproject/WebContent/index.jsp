<%@page import="com.semi.dto.MemberDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");
%>
<%
	response.setContentType("text/html; charset=UTF-8");
%>
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
	<jsp:include page="form/header.jsp"></jsp:include>
	<!--================Header Menu Area =================-->

	<!--================Home Banner Area =================-->
	<jsp:include page="./form/homeBanner.jsp"></jsp:include>
	<!--================End Home Banner Area =================-->

	<!--================Welcome Area =================-->
	<section class="welcome_area p_120">
		<div class="container">
			
		</div>
	</section>
	<!--================End Welcome Area =================-->

	

	<!--================Feature Area =================-->
	<section class="feature_area p_120">
		<div class="container">
			<div class="main_title">
				<h2>offerings to my clients</h2>
				<p>If you are looking at blank cassettes on the web, you may be
					very confused at the difference in price. You may see some for as
					low as $.17 each.</p>
			</div>
			<div class="feature_inner row">
				<div class="col-lg-4 col-md-6">
					<div class="feature_item">
						<i class="flaticon-city"></i>
						<h4>Architecture</h4>
						<p>If you are looking at blank cassettes on the web, you may
							be very confused at the difference in price. You may see some for
							as low as $17 each.</p>
					</div>
				</div>
				<div class="col-lg-4 col-md-6">
					<div class="feature_item">
						<i class="flaticon-skyline"></i>
						<h4>Interior Design</h4>
						<p>If you are looking at blank cassettes on the web, you may
							be very confused at the difference in price. You may see some for
							as low as $17 each.</p>
					</div>
				</div>
				<div class="col-lg-4 col-md-6">
					<div class="feature_item">
						<i class="flaticon-sketch"></i>
						<h4>Concept Design</h4>
						<p>If you are looking at blank cassettes on the web, you may
							be very confused at the difference in price. You may see some for
							as low as $17 each.</p>
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
			<div class="gallery_f_inner row imageGallery1"
				style="position: relative; height: 719.126px;">
				<div class="col-lg-4 col-md-4 col-sm-6 brand manipul design print"
					style="position: absolute; left: 0px; top: 0px;">
					<div class="h_gallery_item">
						<div class="g_img_item">
							<img class="img-fluid" src="img/gallery/project-1.jpg" alt="">
							<a class="light" href="img/gallery/project-1.jpg"><img
								src="img/gallery/icon.png" alt=""></a>
						</div>
						<div class="g_item_text">
							<h4>3D Helmet Design</h4>
							<p>Client Project</p>
						</div>
					</div>
				</div>
				<div class="col-lg-4 col-md-4 col-sm-6 brand manipul creative"
					style="position: absolute; left: 239.988px; top: 0px;">
					<div class="h_gallery_item">
						<div class="g_img_item">
							<img class="img-fluid" src="img/gallery/project-2.jpg" alt="">
							<a class="light" href="img/gallery/project-2.jpg"><img
								src="img/gallery/icon.png" alt=""></a>
						</div>
						<div class="g_item_text">
							<h4>2D Vinyl Design</h4>
							<p>Client Project</p>
						</div>
					</div>
				</div>
				<div
					class="col-lg-4 col-md-4 col-sm-6 manipul creative design print"
					style="position: absolute; left: 479.976px; top: 0px;">
					<div class="h_gallery_item">
						<div class="g_img_item">
							<img class="img-fluid" src="img/gallery/project-3.jpg" alt="">
							<a class="light" href="img/gallery/project-3.jpg"><img
								src="img/gallery/icon.png" alt=""></a>
						</div>
						<div class="g_item_text">
							<h4>Creative Poster Design</h4>
							<p>Client Project</p>
						</div>
					</div>
				</div>
				<div class="col-lg-4 col-md-4 col-sm-6 brand creative print"
					style="position: absolute; left: 0px; top: 359.563px;">
					<div class="h_gallery_item">
						<div class="g_img_item">
							<img class="img-fluid" src="img/gallery/project-4.jpg" alt="">
							<a class="light" href="img/gallery/project-4.jpg"><img
								src="img/gallery/icon.png" alt=""></a>
						</div>
						<div class="g_item_text">
							<h4>Embosed Logo Design</h4>
							<p>Client Project</p>
						</div>
					</div>
				</div>
				<div class="col-lg-4 col-md-4 col-sm-6 brand manipul design"
					style="position: absolute; left: 239.988px; top: 359.563px;">
					<div class="h_gallery_item">
						<div class="g_img_item">
							<img class="img-fluid" src="img/gallery/project-5.jpg" alt="">
							<a class="light" href="img/gallery/project-5.jpg"><img
								src="img/gallery/icon.png" alt=""></a>
						</div>
						<div class="g_item_text">
							<h4>3D Disposable Bottle</h4>
							<p>Client Project</p>
						</div>
					</div>
				</div>
				<div class="col-lg-4 col-md-4 col-sm-6 brand creative"
					style="position: absolute; left: 479.976px; top: 359.563px;">
					<div class="h_gallery_item">
						<div class="g_img_item">
							<img class="img-fluid" src="img/gallery/project-6.jpg" alt="">
							<a class="light" href="img/gallery/project-6.jpg"><img
								src="img/gallery/icon.png" alt=""></a>
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
				<p>If you are looking at blank cassettes on the web, you may be
					very confused at the difference in price. You may see some for as
					low as $.17 each.</p>
			</div>
			<div class="testi_inner">
				<div class="testi_slider owl-carousel owl-loaded owl-drag">



					<div class="owl-stage-outer">
						<div class="owl-stage"
							style="transform: translate3d(-960px, 0px, 0px); transition: all 0s ease 0s; width: 2160px;">
							<div class="owl-item cloned"
								style="width: 210px; margin-right: 30px;">
								<div class="item">
									<div class="testi_item">
										<p>As conscious traveling Paup ers we must always be
											oncerned about our dear Mother Earth. If you think about it,
											you travel across her face</p>
										<h4>Fanny Spencer</h4>
										<a href="#"><i class="fa fa-star"></i></a> <a href="#"><i
											class="fa fa-star"></i></a> <a href="#"><i class="fa fa-star"></i></a>
										<a href="#"><i class="fa fa-star"></i></a> <a href="#"><i
											class="fa fa-star-half-o"></i></a>
									</div>
								</div>
							</div>
							<div class="owl-item cloned"
								style="width: 210px; margin-right: 30px;">
								<div class="item">
									<div class="testi_item">
										<p>As conscious traveling Paup ers we must always be
											oncerned about our dear Mother Earth. If you think about it,
											you travel across her face</p>
										<h4>Fanny Spencer</h4>
										<a href="#"><i class="fa fa-star"></i></a> <a href="#"><i
											class="fa fa-star"></i></a> <a href="#"><i class="fa fa-star"></i></a>
										<a href="#"><i class="fa fa-star"></i></a> <a href="#"><i
											class="fa fa-star-half-o"></i></a>
									</div>
								</div>
							</div>
							<div class="owl-item cloned"
								style="width: 210px; margin-right: 30px;">
								<div class="item">
									<div class="testi_item">
										<p>As conscious traveling Paup ers we must always be
											oncerned about our dear Mother Earth. If you think about it,
											you travel across her face</p>
										<h4>Fanny Spencer</h4>
										<a href="#"><i class="fa fa-star"></i></a> <a href="#"><i
											class="fa fa-star"></i></a> <a href="#"><i class="fa fa-star"></i></a>
										<a href="#"><i class="fa fa-star"></i></a> <a href="#"><i
											class="fa fa-star-half-o"></i></a>
									</div>
								</div>
							</div>
							<div class="owl-item" style="width: 210px; margin-right: 30px;">
								<div class="item">
									<div class="testi_item">
										<p>As conscious traveling Paup ers we must always be
											oncerned about our dear Mother Earth. If you think about it,
											you travel across her face</p>
										<h4>Fanny Spencer</h4>
										<a href="#"><i class="fa fa-star"></i></a> <a href="#"><i
											class="fa fa-star"></i></a> <a href="#"><i class="fa fa-star"></i></a>
										<a href="#"><i class="fa fa-star"></i></a> <a href="#"><i
											class="fa fa-star-half-o"></i></a>
									</div>
								</div>
							</div>
							<div class="owl-item active"
								style="width: 210px; margin-right: 30px;">
								<div class="item">
									<div class="testi_item">
										<p>As conscious traveling Paup ers we must always be
											oncerned about our dear Mother Earth. If you think about it,
											you travel across her face</p>
										<h4>Fanny Spencer</h4>
										<a href="#"><i class="fa fa-star"></i></a> <a href="#"><i
											class="fa fa-star"></i></a> <a href="#"><i class="fa fa-star"></i></a>
										<a href="#"><i class="fa fa-star"></i></a> <a href="#"><i
											class="fa fa-star-half-o"></i></a>
									</div>
								</div>
							</div>
							<div class="owl-item active"
								style="width: 210px; margin-right: 30px;">
								<div class="item">
									<div class="testi_item">
										<p>As conscious traveling Paup ers we must always be
											oncerned about our dear Mother Earth. If you think about it,
											you travel across her face</p>
										<h4>Fanny Spencer</h4>
										<a href="#"><i class="fa fa-star"></i></a> <a href="#"><i
											class="fa fa-star"></i></a> <a href="#"><i class="fa fa-star"></i></a>
										<a href="#"><i class="fa fa-star"></i></a> <a href="#"><i
											class="fa fa-star-half-o"></i></a>
									</div>
								</div>
							</div>
							<div class="owl-item cloned active"
								style="width: 210px; margin-right: 30px;">
								<div class="item">
									<div class="testi_item">
										<p>As conscious traveling Paup ers we must always be
											oncerned about our dear Mother Earth. If you think about it,
											you travel across her face</p>
										<h4>Fanny Spencer</h4>
										<a href="#"><i class="fa fa-star"></i></a> <a href="#"><i
											class="fa fa-star"></i></a> <a href="#"><i class="fa fa-star"></i></a>
										<a href="#"><i class="fa fa-star"></i></a> <a href="#"><i
											class="fa fa-star-half-o"></i></a>
									</div>
								</div>
							</div>
							<div class="owl-item cloned"
								style="width: 210px; margin-right: 30px;">
								<div class="item">
									<div class="testi_item">
										<p>As conscious traveling Paup ers we must always be
											oncerned about our dear Mother Earth. If you think about it,
											you travel across her face</p>
										<h4>Fanny Spencer</h4>
										<a href="#"><i class="fa fa-star"></i></a> <a href="#"><i
											class="fa fa-star"></i></a> <a href="#"><i class="fa fa-star"></i></a>
										<a href="#"><i class="fa fa-star"></i></a> <a href="#"><i
											class="fa fa-star-half-o"></i></a>
									</div>
								</div>
							</div>
							<div class="owl-item cloned"
								style="width: 210px; margin-right: 30px;">
								<div class="item">
									<div class="testi_item">
										<p>As conscious traveling Paup ers we must always be
											oncerned about our dear Mother Earth. If you think about it,
											you travel across her face</p>
										<h4>Fanny Spencer</h4>
										<a href="#"><i class="fa fa-star"></i></a> <a href="#"><i
											class="fa fa-star"></i></a> <a href="#"><i class="fa fa-star"></i></a>
										<a href="#"><i class="fa fa-star"></i></a> <a href="#"><i
											class="fa fa-star-half-o"></i></a>
									</div>
								</div>
							</div>
						</div>
					</div>
					<div class="owl-nav disabled">
						<div class="owl-prev">prev</div>
						<div class="owl-next">next</div>
					</div>
					<div class="owl-dots disabled">
						<div class="owl-dot active">
							<span></span>
						</div>
					</div>
				</div>
			</div>
		</div>
	</section>
	<!--================End Testimonials Area =================-->

	<!--================Footer Area =================-->
<%@ include file="form/footer.jsp" %>
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