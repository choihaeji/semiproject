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
        <!-- main css -->
        <link rel="stylesheet" href="css/style.css">
        <link rel="stylesheet" href="css/responsive.css">
    </head>
    <body>
        
       <%@ include file="form/header.jsp" %>
        
        <!--================Home Banner Area =================-->
        <section class="banner_area">
            <div class="box_1620">
				<div class="banner_inner d-flex align-items-center">
					<div class="container">
						<div class="banner_content text-center">
							<h2>Elements</h2>
							<div class="page_link">
								<a href="index.html">Home</a>
								<a href="elements.html">Elements</a>
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
						<li class="nav-item">
							<a class="nav-link active show" id="home-tab" data-toggle="tab" href="#home" role="tab" aria-controls="home" aria-selected="true">매수</a>
						</li>
						<li class="nav-item">
							<a class="nav-link" id="profile-tab" data-toggle="tab" href="#profile" role="tab" aria-controls="profile" aria-selected="false">매도</a>
						</li>
					</ul>
					
					<!--================매수 =================-->
					<div class="tab-content" id="myTabContent">
						<div class="tab-pane fade active show" id="home" role="tabpanel" aria-labelledby="home-tab">
							<table class="list">
								<div class="section-top-border">
									<h3 class="mb-30 title_color">Table</h3>
									<div class="progress-table-wrap">
										<div class="progress-table">
											<div class="table-head">
												<div class="serial">#</div>
												<div class="country">Countries</div>
												<div class="visit">Visits</div>
												<div class="percentage">Percentages</div>
											</div>
											<div class="table-row">
												<div class="serial">01</div>
												<div class="country"> <img src="img/elements/f1.jpg" alt="flag">Canada</div>
												<div class="visit">645032</div>
												<div class="percentage">
													<div class="progress">
														<div class="progress-bar color-1" role="progressbar" style="width: 80%" aria-valuenow="80" aria-valuemin="0" aria-valuemax="100"></div>
													</div>
												</div>
											</div>
											<div class="table-row">
												<div class="serial">02</div>
												<div class="country"> <img src="img/elements/f2.jpg" alt="flag">Canada</div>
												<div class="visit">645032</div>
												<div class="percentage">
													<div class="progress">
														<div class="progress-bar color-2" role="progressbar" style="width: 30%" aria-valuenow="30" aria-valuemin="0" aria-valuemax="100"></div>
													</div>
												</div>
											</div>
											<div class="table-row">
												<div class="serial">03</div>
												<div class="country"> <img src="img/elements/f3.jpg" alt="flag">Canada</div>
												<div class="visit">645032</div>
												<div class="percentage">
													<div class="progress">
														<div class="progress-bar color-3" role="progressbar" style="width: 55%" aria-valuenow="55" aria-valuemin="0" aria-valuemax="100"></div>
													</div>
												</div>
											</div>
											<div class="table-row">
												<div class="serial">04</div>
												<div class="country"> <img src="img/elements/f4.jpg" alt="flag">Canada</div>
												<div class="visit">645032</div>
												<div class="percentage">
													<div class="progress">
														<div class="progress-bar color-4" role="progressbar" style="width: 60%" aria-valuenow="60" aria-valuemin="0" aria-valuemax="100"></div>
													</div>
												</div>
											</div>
											<div class="table-row">
												<div class="serial">05</div>
												<div class="country"> <img src="img/elements/f5.jpg" alt="flag">Canada</div>
												<div class="visit">645032</div>
												<div class="percentage">
													<div class="progress">
														<div class="progress-bar color-5" role="progressbar" style="width: 40%" aria-valuenow="40" aria-valuemin="0" aria-valuemax="100"></div>
													</div>
												</div>
											</div>
											<div class="table-row">
												<div class="serial">06</div>
												<div class="country"> <img src="img/elements/f6.jpg" alt="flag">Canada</div>
												<div class="visit">645032</div>
												<div class="percentage">
													<div class="progress">
														<div class="progress-bar color-6" role="progressbar" style="width: 70%" aria-valuenow="70" aria-valuemin="0" aria-valuemax="100"></div>
													</div>
												</div>
											</div>
											<div class="table-row">
												<div class="serial">07</div>
												<div class="country"> <img src="img/elements/f7.jpg" alt="flag">Canada</div>
												<div class="visit">645032</div>
												<div class="percentage">
													<div class="progress">
														<div class="progress-bar color-7" role="progressbar" style="width: 30%" aria-valuenow="30" aria-valuemin="0" aria-valuemax="100"></div>
													</div>
												</div>
											</div>
											<div class="table-row">
												<div class="serial">08</div>
												<div class="country"> <img src="img/elements/f8.jpg" alt="flag">Canada</div>
												<div class="visit">645032</div>
												<div class="percentage">
													<div class="progress">
														<div class="progress-bar color-8" role="progressbar" style="width: 60%" aria-valuenow="60" aria-valuemin="0" aria-valuemax="100"></div>
													</div>
												</div>
											</div>
										</div>
									</div>
								</div>
								
							</table>
						</div>
						
						<!--================매도 =================-->
						<div class="tab-pane fade" id="profile" role="tabpanel" aria-labelledby="profile-tab">
							<table>
								<tr>매도</tr>
							</table>
						</div>
					</div>
        		</div>
        	</div>
        </section>
        <!--================End My Tabs Area =================-->
		
		<%@ include file="form/footer.jsp" %>   
		     
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