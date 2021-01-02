<%@page import="java.util.HashSet"%>
<%@page import="java.util.Set"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<section id="cart_items">
	<div class="container">
			<div class="table-responsive cart_info">
				<c:choose>
					<c:when test="${ses_mvo.id ne '' && ses_mvo.id ne null }">
	
						<table class="table table-condensed">
							<thead>
								<tr class="cart_menu">
									<td class="image">CART NO</td>
									<td class="image">ID</td>
									<td class="image">Product No</td>
									<td class="image">Product Name</td>
									<td class="image">Count</td>
									<td class="image">Price</td>
									<td class="">Option</td>
									<td></td>
								</tr>
							</thead>
							<tbody>
								<c:set var="sum_item" value="0"></c:set>
								<c:forEach items="${cList}" var="cavo">
									<c:if test="${fn:trim(ses_mvo.id) eq fn:trim(cavo.id)}">
										<tr>
											<td class="image">
												<h4>${cavo.cano}</h4>
											</td>
											<td class="cart_price">${cavo.id}</td>
											<td class=image>${cavo.pno}</td>
											<td class="cart_quantity">${cavo.pname}</td>
											<td class="image">${cavo.cnt}</td>
											<td class=""><c:set var="sum_item"
													value="${sum_item + cavo.cnt * cavo.price }"></c:set> 단품 :
												${cavo.price} ₩<br>소계: ${cavo.cnt * cavo.price} ₩</td>
											<td><a href="./Cart?sv=rm&cano=${cavo.cano}"> 구매 </a> <a
												href="./Cart?sv=rm&cano=${cavo.cano}"> 삭제 </a></td>
											<td><input type="checkbox" name="${cavo.pno}"
												value="${cavo.cnt }"></td>
												<c:set var="opno" value="${cavo.pno }"/><c:set var="ocnt" value="${cavo.cnt }"/>
												<c:set var="opnocnt" value='{&quot;${opno}&quot; :&quot;${ocnt}&quot;}'/>
												<c:set var="json_prd1" value="${json_prd1},${opnocnt }"/>
										</tr>
									</c:if>
								</c:forEach>
							</tbody>
						</table>



					</c:when>
					<c:otherwise>
						<h2>로그인부터 해주세요!</h2>
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

			<div class="cart-sum product-information pull-right"
				style="margin-bottom: 20px;'">

				<span><span>Total : ${sum_item } ₩</span></span>
				<button type="submit" onclick="sendJson();" class="btn btn-fefault cart">
					<i class="fa fa-crosshairs"></i> 모두 구매하기
				</button>
			</div>


	</div>
</section>
<!--/#cart_items-->
<script type="text/javascript">
		var test = "<c:out value='${json_prd1}'/>";

		$(function(){
		test=test.substr(1);
		test='['+test+']'
		console.log(test);
	});
	
	function sendJson(){
		test1 = test
		console.log(test1);
		$.ajax({
			url: "./ordera/odr",
			type: "post",
			data: {prdinfo:test},
			success: function(){ //list > String
			},
			error: function(msg){
			}
		});
		
	}
	
	
</script>
