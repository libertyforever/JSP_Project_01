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
					<h2 class="title text-center">
					<c:choose>
					<c:when test="${param.ca eq 'pm' }">프라모델</c:when>
					<c:when test="${param.ca eq 'lg' }">조립블럭</c:when>
					<c:when test="${param.ca eq 'pg' }">입체퍼즐</c:when>
					<c:otherwise>십자수/그리기</c:otherwise>
					</c:choose>
					
					</h2>

					<c:forEach items="${pcList }" var="pvo2" begin="0" end="9">
						<div class="col-sm-4">
							<div class="product-image-wrapper">
								<div class="single-products">
									<div class="productinfo text-center">
										<img src="./upload/${pvo2.thumb }"
											alt="error" />
										<h2>${pvo2.price }</h2>
										<p>${pvo2.pname }</p>
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