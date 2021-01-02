<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="description" content="">
    <meta name="author" content="">
    <title>Home | GipKok Mall</title>
    <link href="resources/css/bootstrap.min.css" rel="stylesheet">
    <link href="resources/css/font-awesome.min.css" rel="stylesheet">
    <link href="resources/css/prettyPhoto.css" rel="stylesheet">
    <link href="resources/css/price-range.css" rel="stylesheet">
    <link href="resources/css/animate.css" rel="stylesheet">
   <link href="resources/css/main.css" rel="stylesheet">
   <link href="resources/css/responsive.css" rel="stylesheet">
    <!--[if lt IE 9]>
    <script src="js/html5shiv.js"></script>
    <script src="js/respond.min.js"></script>
    <![endif]-->       
    <link rel="shortcut icon" href="images/ico/favicon.ico">
    <link rel="apple-touch-icon-precomposed" sizes="144x144" href="images/ico/apple-touch-icon-144-precomposed.png">
    <link rel="apple-touch-icon-precomposed" sizes="114x114" href="images/ico/apple-touch-icon-114-precomposed.png">
    <link rel="apple-touch-icon-precomposed" sizes="72x72" href="images/ico/apple-touch-icon-72-precomposed.png">
    <link rel="apple-touch-icon-precomposed" href="images/ico/apple-touch-icon-57-precomposed.png">
    <script src="resources/js/jquery.js"></script>
    <script src="resources/js/bootstrap.min.js"></script>
	<script src="resources/js/jquery.scrollUp.min.js"></script>
	<script src="resources/js/price-range.js"></script>
    <script src="resources/js/jquery.prettyPhoto.js"></script>
    <script src="resources/js/main.js"></script>
</head><!--/head-->

<body>
   <header id="header"><!--header-->
      <div class="header_top"><!--header_top-->
         <div class="container">
            <div class="row">
               <div class="col-sm-6">
                  <div class="contactinfo">
                     <ul class="nav nav-pills">
                     <%-- 아이디 --%>
                        <li><a href="#"> 환영합니다!</a></li>
                        <li><a href="#"><i class="fa fa-envelope"></i>${ses_mvo.id }(   
                        <c:choose>
									<c:when test="${ses_mvo.grade > 100 }"> VVIP</c:when>
									<c:when test="${ses_mvo.grade > 50 }"> VIP</c:when>
									<c:when test="${ses_mvo.grade > 30 }"> GOLD</c:when>
									<c:when test="${ses_mvo.grade > 10 }"> SILVER</c:when>
									<c:when test="${ses_mvo.grade >= 0 }"> BRONZE</c:when>
									<c:otherwise> 비회원</c:otherwise>
								</c:choose>
								)</a></li>
                     </ul>
                  </div>
               </div>
               <div class="col-sm-6">
                  <div class="social-icons pull-right">
                     <ul class="nav navbar-nav">
                        <li><a href="https://www.facebook.com/"><i class="fa fa-facebook"></i></a></li>
                     </ul>
                  </div>
               </div>
            </div>
         </div>
      </div><!--/header_top-->
      
      <div class="header-middle"><!--header-middle-->
         <div class="container">
            <div class="row">
               <div class="col-md-4 clearfix">
               </div>
               <%-- 메뉴설정 --%>
               <div class="col-md-8 clearfix">
                  <c:choose>
					<c:when test="${ses_mvo.id ne '' && ses_mvo.id ne null }">
						<div class="shop-menu clearfix pull-right">
							<ul class="nav navbar-nav">
							<c:choose>
							 <c:when test="${ses_mvo.grade == 101 }">
								<li><a href="./member?sv=list"><i class="fa fa-star"></i> list</a></li>
								<%-- 상품입력란 입력해주세요! --%>
								<li><a href="./index.jsp?rp=reg"><i class="fa fa-crosshairs"></i> product input</a></li>
							 </c:when>
							 <c:otherwise>
								<li><a href="#"><i class="fa fa-star"></i> list</a></li>
								<li><a href="#"><i class="fa fa-crosshairs"></i> product input</a></li>
							 </c:otherwise>
							 </c:choose>
							    <li><a><i class="fa fa-star"></i>${ses_mvo.nickname }</a></li> 
								<li><a href="./Cart?sv=list"><i class="fa fa-shopping-cart"></i> Cart</a></li>
								<li><a href="index.jsp?rp=logout"><i class="fa fa-lock"></i> Logout</a></li>
							</ul>
						</div>
						</c:when>
						<c:otherwise>
						<div class="shop-menu clearfix pull-right">
							<ul class="nav navbar-nav">
								<li><a href="index.jsp?rp=join"><i class="fa fa-user"></i> join</a></li>
								<li><a href="order/li"><i class="fa fa-crosshairs"></i> Checkout</a></li>
								<li><a href="./Cart?sv=list"><i class="fa fa-shopping-cart"></i> Cart</a></li>
								<li><a href="index.jsp?rp=login"><i class="fa fa-lock"></i> Login</a></li>
							</ul>
						</div>
						</c:otherwise>
					</c:choose>
               </div>
            </div>
         </div>
      </div><!--/header-middle-->
   
      <div class="header-bottom"><!--header-bottom-->
         <div class="container">
            <div class="row">
               <div class="col-sm-9">
                  <div class="navbar-header">
                     <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-collapse">
                        <span class="sr-only">Toggle navigation</span>
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                     </button>
                  </div>
                  <div class="mainmenu pull-left">
                  <%-- 메뉴설정 --%>
                     <ul class="nav navbar-nav collapse navbar-collapse">
                        <li><a href="./index.jsp" class="active">Home</a></li>
                        <li class="dropdown"><a href="#">Shop<i class="fa fa-angle-down"></i></a>
									<ul role="menu" class="sub-menu">
										<li><a href="./product?sv=list">Products</a></li>
										<li><a href="">Most View</a></li>
										<li><a href="">Best Seller</a></li>
									</ul></li> 
                     </ul>
                  </div>
               </div>
            </div>
         </div>
      </div><!--/header-bottom-->
   </header><!--/header-->