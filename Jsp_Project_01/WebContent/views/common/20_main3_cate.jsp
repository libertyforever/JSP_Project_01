<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>



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
									<a data-toggle="" data-parent="" href="./product?sv=lic&ca=pm">
										<span class="badge pull-right"></span> 프라모델
									</a>
								</h4>
							</div>
						</div>
						<div class="panel panel-default">
							<div class="panel-heading">
								<h4 class="panel-title">
									<%-- 리스트 목록 링크 사용 --%>
									<a data-toggle="" data-parent="" href="./product?sv=lic&ca=lg">
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
									<a data-toggle="" data-parent=""
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


					<div class="text-center" style="padding-bottom: 100px;">
						<!--shipping-->
						<img src="./views/common/main/Left_banner_stayhome_cate.jpg" alt="" style="width: 100%"/>
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
										<a href="./product?sv=info&pno=${pvo2.pno }" onclick="countUp(${pvo2.pno});"><img src="./upload/${pvo2.thumb }"
											alt="error" /></a>
										<h2><fmt:formatNumber value="${pvo2.price}" pattern="#,###.## ₩"/></h2>
										<p><a href="./product?sv=info&pno=${pvo2.pno }" onclick="countUp(${pvo2.pno});">${pvo2.pname }</a></p>
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
</section>
<script type="text/javascript">

function countUp(pno){
	$.ajax({
		url: "./product?sv=cntup",
		type: "get",
		data: {pno:pno}, 
		success: function(result){
			let res = parseInt(result);
			if(res>0){
				colsole.log(pno+" 조회수 up")
			}else{
				alert("조회수 업 실패")
			}
		},
		error: function(msg){
			alert("url connection error")
		}
	});		
}

</script>
