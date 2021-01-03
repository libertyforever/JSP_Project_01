<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
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
										<c:set var="opnocnt" value='${cavo.pno }:${cavo.cnt }' />
										<c:set var="json_prd1" value="${json_prd1},${opnocnt }" />

									</tr>
								</c:if>
							</c:forEach>
						</tbody>
					</table>

					<div class="cart-sum product-information pull-right"
						style="margin-bottom: 20px;'">

						<span><span>Total : ${sum_item } ₩</span></span>
						<form action="./ordera?sv=odr" method="post">
							<input type="hidden" name="id" value="${ses_mvo.id}"> <input
								type="hidden" name="prdinfo" value="${json_prd1}">
							<button type="submit" class="btn btn-fefault cart">
								<i class="fa fa-crosshairs"></i> 모두 구매하기
							</button>
						</form>
						<!-- <button type="submit" onclick="sendJson();"
							class="btn btn-fefault cart">
							<i class="fa fa-crosshairs"></i> 모두 구매하기 (json 없앨예정)
						</button> -->
					</div>

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




	</div>
</section>
<!--/#cart_items-->
<script type="text/javascript">
		prdinfo = "<c:out value='${json_prd1}'/>";
		var prdinfo=prdinfo.substr(1);
		var prdinfoList = prdinfo.split(','); //list로 만듦, java에서 만들기로함
		var prdinfoListObj = {prdinfoList}; //객체로 보냈는데도 오류남 왜죠ㄷㄷ
		console.log(prdinfo);
		console.log(prdinfoList);
		console.log(prdinfoListObj);

//		$(function(){ //json 잠시 보류
		//test1 = JSON.stringify(test);
		//console.log(test1);
//	});
	
	function sendJson(){
		id = '<c:out value="${ses_mvo.id}"/>'
		console.log(prdinfo); 
		console.log(prdinfoList); //var로 했을 때 함수안에도 scope 적용됨
		console.log(id);
		$.ajax({
			url: "./ordera/odr",
			type: "post",
			data: {prdinfo:prdinfo, id:id},
			success: function(){ //list > String
			location.replace('index.jsp?rp=odrComp');
			},
			error: function(msg){
			}
		});
		
	}
	
	
</script>
