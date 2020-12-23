<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="resources/css/bootstrap.min.css"
	type="text/css">
<link rel="stylesheet" href="resources/css/font-awesome.min.css"
	type="text/css">
<link rel="stylesheet" href="resources/css/elegant-icons.css"
	type="text/css">
<link rel="stylesheet" href="resources/css/nice-select.css"
	type="text/css">
<link rel="stylesheet" href="resources/css/jquery-ui.min.css"
	type="text/css">
<link rel="stylesheet" href="resources/css/owl.carousel.min.css"
	type="text/css">
<link rel="stylesheet" href="resources/css/slicknav.min.css"
	type="text/css">
<link rel="stylesheet" href="resources/css/style.css" type="text/css">
<script src="resources/js/jquery-3.3.1.min.js"></script>
</head>

<c:set var="ses" value="${ses_mvo }" scope="session"></c:set>
<body>

	<!-- Header Section Begin -->
	<header class="header">
		<div class="header__top">
			<div class="container">
				<div class="row">
					<div class="col-lg-6 col-md-6">
						<div class="header__top__left">
							<ul>
								<li><i class="fa fa-envelope"></i>${ses.email} </li>
								<li >Welcome <span style="font-weight: bold">${ses.nickname}
								<c:choose><c:when test="${ses.grade == 120 }">(Manager)</c:when>
								<c:otherwise></c:otherwise></c:choose>
								</span></li>
							</ul>
						</div>
					</div>
					<div class="col-lg-6 col-md-6">
						<div class="header__top__right">

							<c:choose>
								<c:when test="${ses.email ne '' && ses.email ne null }">
									<div class="header__top__right__social">
										<c:choose>
										<c:when test="${ses.grade == 120}">
											<a href="index.jsp?rp=reg">Product Regist</a>
										</c:when>
										<c:otherwise>
											<a href="./product?sv=list">Product List</a>
										</c:otherwise>										
										</c:choose>
										<a href="./member?sv=list">
										<i class="fa fa-user"></i> ${ses.nickname } </a>
									</div>
									<div class="header__top__right__language">
										<a href="#" data-toggle="modal" data-target="#loginModal">
											<i class="fa fa-user"></i> <c:choose>
												<c:when test="${ses.grade > 99 }">VVIP</c:when>
												<c:when test="${ses.grade > 50 }">VIP</c:when>
												<c:when test="${ses.grade > 30 }">GOLD</c:when>
												<c:when test="${ses.grade > 10 }">SILVER</c:when>
												<c:otherwise>NEWBEE</c:otherwise>
											</c:choose>
										</a>
									</div>
									<div class="header__top__right__auth">
										<a href="index.jsp?rp=logout"><i class="fa fa-user"></i>
											Logout(thrpge)&nbsp;</a>
									</div><div class="header__top__right__auth">
										<a href="./member?sv=logout">
											Logout(direct)</a>
									</div>
								</c:when>
								<c:otherwise>
									<div class="header__top__right__social">
										<a href="#"><i class="fa fa-facebook"></i></a> <a href="#"><i
											class="fa fa-twitter"></i></a> <a href="#"><i
											class="fa fa-linkedin"></i></a> <a href="#"><i
											class="fa fa-pinterest-p"></i></a>
									</div>
									<div class="header__top__right__language">
										<a href="index.jsp?rp=join"><i class="fa fa-user"></i>
											Join</a>
									</div>
									<div class="header__top__right__auth">
										<a href="#" data-toggle="modal" data-target="#loginModal">
											<i class="fa fa-user"></i> Login
										</a>
									</div>
								</c:otherwise>
							</c:choose>



							<!--LoGIN Modal -->
							<div class="modal" id="loginModal">
								<div class="modal-dialog">
									<div class="modal-content">

										<!-- Modal Header -->
										<div class="modal-header">
											<h4 class="modal-title">Login member</h4>
											<button type="button" class="close" data-dismiss="modal">&times;</button>
										</div>
										<form action="./member" method="post">
											<input type="hidden" name="sv" value="login">
											<!-- Modal body -->
											<div class="modal-body">
												<div class="checkout__input">
													<p>
														Member Email (ID)<span>*</span>
													</p>
													<input type="text" name="email" required>
												</div>
												<div class="checkout__input">
													<p>
														Password<span>*</span>
													</p>
													<input type="password" name="pwd" required>
												</div>
											</div>

									<!-- Modal footer -->
									<div class="modal-footer">
										<button type="submit" class="btn btn-success">login</button>
									</div>
									</form>
									</div>
								</div>
							</div>
						</div>

					</div>
				</div>
			</div>
		</div>

		<div class="container">
			<div class="row">
				<div class="col-lg-3">
					<div class="header__logo">
						<a href="./index.html"><img src="img/logo.png" alt=""></a>
					</div>
				</div>
				<div class="col-lg-6">
					<nav class="header__menu">
						<ul>
							<li class="active"><a href="./">Home</a></li>
							<li><a href="./product?sv=list">Shop</a></li>
							<li><a href="#">Pages</a>
								<ul class="header__menu__dropdown">
									<li><a href="./shop-details.html">Shop Details</a></li>
									<li><a href="./shoping-cart.html">Shoping Cart</a></li>
									<li><a href="./checkout.html">Check Out</a></li>
									<li><a href="./blog-details.html">Blog Details</a></li>
								</ul></li>
							<li><a href="./blog.html">Blog</a></li>
							<li><a href="./contact.html">Contact</a></li>
						</ul>
					</nav>
				</div>
				<div class="col-lg-3">
					<div class="header__cart">
						<ul>
							<li><a href="#"><i class="fa fa-heart"></i> <span>1</span></a></li>
							<li><a href="#"><i class="fa fa-shopping-bag"></i> <span>3</span></a></li>
						</ul>
						<div class="header__cart__price">
							item: <span>$150.00</span>
						</div>
					</div>
				</div>
			</div>
			<div class="humberger__open">
				<i class="fa fa-bars"></i>
			</div>
		</div>
	</header>
	<!-- Header Section End -->

	<!-- Hero Section Begin -->
	<section class="hero">
		<div class="container">
			<div class="row">
				<div class="col-lg-3">
					<div class="hero__categories">
						<div class="hero__categories__all">
							<i class="fa fa-bars"></i> <span>All departments</span>
						</div>
						<ul>
							<li><a href="#">Fresh Meat</a></li>
							<li><a href="#">Vegetables</a></li>
							<li><a href="#">Fruit & Nut Gifts</a></li>
							<li><a href="#">Fresh Berries</a></li>
							<li><a href="#">Ocean Foods</a></li>
							<li><a href="#">Butter & Eggs</a></li>
							<li><a href="#">Fastfood</a></li>
							<li><a href="#">Fresh Onion</a></li>
							<li><a href="#">Papayaya & Crisps</a></li>
							<li><a href="#">Oatmeal</a></li>
							<li><a href="#">Fresh Bananas</a></li>
						</ul>
					</div>
				</div>
				<div class="col-lg-9">
					<div class="hero__search">
						<div class="hero__search__form">
							<form action="#">
								<div class="hero__search__categories">
									All Categories <span class="arrow_carrot-down"></span>
								</div>
								<input type="text" placeholder="What do yo u need?">
								<button type="submit" class="site-btn">SEARCH</button>
							</form>
						</div>
						<div class="hero__search__phone">
							<div class="hero__search__phone__icon">
								<i class="fa fa-phone"></i>
							</div>
							<div class="hero__search__phone__text">
								<h5>+65 11.188.888</h5>
								<span>support 24/7 time</span>
							</div>
						</div>
					</div>
					<div class="hero__item set-bg" data-setbg="img/hero/banner.jpg">
						<div class="hero__text">
							<span>FRUIT FRESH</span>
							<h2>
								Vegetable <br />100% Organic
							</h2>
							<p>Free Pickup and Delivery Available</p>
							<a href="#" class="primary-btn">SHOP NOW</a>
						</div>
					</div>
				</div>
			</div>
		</div>
	</section>
	<!-- Hero Section End -->
</body>
</html>