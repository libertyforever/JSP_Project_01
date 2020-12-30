<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>



<section id="slider">
	<!--slider-->
	<div class="container">
		<div class="row">
			<div class="col-sm-12"></div>
		</div>
	</div>
</section>
<!--/slider-->
<section>
	<div class="container">
		<div class="row">
			<div class="col-sm-3">
				<div class="left-sidebar">
					<h2>Category</h2>
					<div class="panel-group category-products" id="accordian">
						<!--category-productsr-->
						<div class="panel panel-default">
							<div class="panel-heading">
								<h4 class="panel-title">
									<%-- 리스트 목록 링크 사용 --%>
									<a data-toggle="collapse" data-parent="#accordian" href="./product?sv=lic&ca=pm">
										<span class="badge pull-right"></span> 프라모델
									</a>
								</h4>
							</div>
						</div>
						<div class="panel panel-default">
							<div class="panel-heading">
								<h4 class="panel-title">
									<%-- 리스트 목록 링크 사용 --%>
									<a data-toggle="collapse" data-parent="#accordian" href="./product?sv=lic&ca=lg">
										<span class="badge pull-right"></span> 조립블럭
									</a>
								</h4>
							</div>
							<div id="mens" class="panel-collapse collapse"></div>
						</div>

						<div class="panel panel-default">
							<div class="panel-heading">
								<h4 class="panel-title">
									<%-- 리스트 목록 링크 사용 --%>
									<a data-toggle="collapse" data-parent="#accordian"
										href="./product?sv=lic&ca=pg"> <span class="badge pull-right"></span>
										입체퍼즐
									</a>
								</h4>
							</div>
						</div>
						<div class="panel panel-default">
							<div class="panel-heading">
								<h4 class="panel-title">
									<a href="./product?sv=lic&ca=ss">십자수/그리기</a>
								</h4>
							</div>
						</div>
					</div>
					<!--/category-products-->


					<div class="shipping text-center">
						<!--shipping-->
						<img src="images/home/shipping.jpg" alt="" />
					</div>
					<!--/shipping-->

				</div>
			</div>

			<div class="col-sm-9 padding-right">

				<div class="features_items">
					<!--features_items-->
					<h2 class="title text-center">인기상품</h2>

					<c:forEach items="${poList }" var="pvo2" begin="0" end="2">
						<div class="col-sm-4">
							<div class="product-image-wrapper">
								<div class="single-products">
									<div class="productinfo text-center">
										<a href="./product?sv=info&pno=${pvo2.pno }"><img src="./upload/${pvo2.thumb }"
											alt="error" /></a>
										<h2>${pvo2.price }</h2>
										<p><a href="./product?sv=info&pno=${pvo2.pno }">${pvo2.pname }</a></p>
										<a href="#" class="btn btn-default add-to-cart"><i
											class="fa fa-shopping-cart"></i>Add to cart</a>
									</div>
								</div>
							</div>
						</div>
					</c:forEach>


				</div>
				<!--features_items-->

				<div class="category-tab">
					<!--category-tab-->
					<div class="features_items">
						<!--features_items-->
						<h2 class="title text-center">조회수 베스트</h2>
						
						<c:forEach items="${pvList }" var="pvo1" begin="0" end="2">
						<div class="col-sm-4">
							<div class="product-image-wrapper">
								<div class="single-products">
									<div class="productinfo text-center">
										<a href="./product?sv=info&pno=${pvo1.pno }"><img src="./upload/${pvo1.thumb }"
											alt="./resources/images/product-details/similar1.jpg" /></a>
										<h2>${pvo1.price }</h2>
										<p><a href="./product?sv=info&pno=${pvo1.pno }">${pvo1.pname }</a></p>
										<a href="#" class="btn btn-default add-to-cart"><i
											class="fa fa-shopping-cart"></i>Add to cart</a>
									</div>
								</div>
							</div>
						</div>
					</c:forEach>
						
					</div>
					<!--features_items-->

					<div class="features_items">
						<!--features_items-->
						<h2 class="title text-center">상품 리스트</h2>

						<c:forEach items="${pList }" var="pvo" begin="0" end="7">
							<div class="col-sm-4">
								<div class="product-image-wrapper">
									<div class="single-products">
										<div class="productinfo text-center">
											<a href="./product?sv=info&pno=${pvo.pno }"><img src="./upload/${pvo.thumb }"
												alt="error" /></a>
											<h2>${pvo.price }</h2>
											<p><a href="./product?sv=info&pno=${pvo.pno }">${pvo.pname }</a></p>
											<a href="#" class="btn btn-default add-to-cart"><i
												class="fa fa-shopping-cart"></i>Add to cart</a>
										</div>
									</div>
								</div>
							</div>
						</c:forEach>


					</div>
					<!--features_items-->

				</div>
				<!--/recommended_items-->
			</div>
		</div>
	</div>
</section>