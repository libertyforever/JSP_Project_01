<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"  %>
    <%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<section id="cart_items">
		<div class="container">
			<div class="table-responsive cart_info">
			<c:choose>
					<c:when test="${ses_mvo.id ne '' && ses_mvo.id ne null }">
				<div class="signup-form"><!--sign up form-->
						<h2>주문이 완료 되었습니다.</h2>
						</div>
					<table class="table table-condensed">
						<thead>
							<tr class="cart_menu">
								<td class="image">Product No.</td>
								<td class="image">Product Name</td>
								<td class="image">Count</td>
								<td class="image">Price</td>
								<td class="image">Status</td>
							</tr>
						</thead>
						<tbody>
								<c:set var="sum_item" value="0"></c:set>
								<c:forEach items="${ocList}" var="ocvo">
									<tr>
										<td class=image>${ocvo.pno}</td>
										<td class="cart_quantity">${ocvo.pname}</td>
										<td class="image">${ocvo.cnt}</td>
										<td class=""><c:set var="sum_item"
												value="${sum_item + ocvo.cnt * ocvo.price }"></c:set> 단품 :
											${ocvo.price} ₩<br>소계: ${ocvo.cnt * ocvo.price} ₩</td>
									</tr>
								</c:forEach>
								<tr>
								<td class="image pull-right" rowspan="100"><c:choose>
										<c:when test="${ovo.status == 1 }">주문완료</c:when>
										<c:otherwise>주문오류</c:otherwise>
									</c:choose></td></tr>
						</tbody>
					</table>

					<div class="cart-sum product-information pull-right" style="margin-bottom: 20px;'">
				<form action="./order?sv=li" method="post">
								<span><span>Total : ${sum_item } ₩</span></span> 
								<button type="submit" class="btn btn-fefault cart">
									<i class="fa fa-crosshairs"></i> 나의 주문목록
								</button>
								</form>
				</div>
				
				</c:when>
				<c:otherwise>
				<h2 >로그인부터 해주세요!</h2>
				<a class="btn btn-warning" href="index.jsp?rp=login">login</a>
				</c:otherwise>
				</c:choose>
			</div>
			<%-- <div class="product__pagination">
					<c:if test="${paging.prevBlock > 5 }">
					<a href="./Cart?sv=list&cp=${paging.prevBlock }"><i class="fa fa-long-arrow-left"></i></a>
					</c:if>
					<c:forEach var="i" begin="${paging.prevBlock + 1 }" 
					end="${paging.totalPage }" varStatus="status">
					<c:if test="${status.count < 6 }">
					<c:choose>
						<c:when test="${i eq paging.clPage }">
							<a href="#">${i }</a>
						</c:when>						
						<c:otherwise>
							<a href="./Cart?sv=list&cp=${i }">${i }</a>
						</c:otherwise>
					</c:choose>					
					</c:if>
					</c:forEach>
					<c:if test="${paging.nextBlock < paging.totalPage }">
					<a href="./Cart?sv=list&cp=${paging.nextBlock }">
					<i class="fa fa-long-arrow-right"></i></a>
					</c:if>
				</div> --%>
				
				
				
				
		</div>
	</section> <!--/#cart_items-->
	
