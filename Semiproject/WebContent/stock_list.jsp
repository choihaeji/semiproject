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
			obj.style.backgroundColor="lavender";
		}
		function mouseOut(obj){
  			obj.style.backgroundColor="whitesmoke";
		}
	</script>
	
	<% 
		int pageNum = Integer.parseInt(request.getParameter("page")); 
		String kos = (String)request.getParameter("kos");
	%>
</head>
<body>
	<!--================Header Menu Area =================-->
	<%@ include file="form/header.jsp" %>
	<!--================Header Menu Area =================-->
	
	<!--================Home Banner Area =================-->
	<section class="banner_area">
		<div class="box_1620">
			<div class="banner_inner d-flex align-items-center">
				<div class="container">
					<div class="banner_content text-center">
						<h2>전종목 시세</h2>
						<div class="page_link">
							<a href="index.jsp">Home</a> <a
								href="StockController?command=stock_rank">전종목 시세</a>
						</div>
					</div>
				</div>
			</div>
		</div>
	</section>
	<!--================Home Banner Area =================-->
	<section class="blog_area single-post-area p_120">
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