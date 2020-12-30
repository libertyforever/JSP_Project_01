<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"  %>
    <%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<section id="cart_items">
		<div class="container">
			<div class="table-responsive cart_info">
			<c:choose>
					<c:when test="${ses_mvo.id ne '' && ses_mvo.id ne null }">
				<table class="table table-condensed">
					<thead>
						<tr class="cart_menu">
							<td class="image">CART NO</td>
							<td class="quantity">ID</td>
							<td class="total">Product No</td>
							<td class="total">Count</td>
							<td></td>
						</tr>
					</thead>
					<tbody> 
					  <c:forEach items="${cList}" var="cavo">   
					  <c:if test="${fn:trim(ses_mvo.id) eq fn:trim(cavo.id)}">
						 <tr>
							<td class="cart_product">
								<h4>${cavo.cano}</h4>
							</td>
							<td class="cart_price">
								${cavo.id}
							</td>
							<td class="cart_quantity">
								 ${cavo.pno}
							</td>
							<td class="cart_quantity">
								 ${cavo.pname}
							</td>
							<td class="cart_quantity">
								 ${cavo.cnt}
							</td>
							<td>
							 <a href="./Cart?sv=rm&cano=${cavo.cano}"> 구매 </a>
							</td>
							<td>
							 <a href="./Cart?sv=rm&cano=${cavo.cano}"> 삭제 </a>
							</td>
							<td>
							</td>
						 </tr>
						     </c:if>
				      </c:forEach>
					</tbody>
				</table>
				</c:when>
				<c:otherwise>
				<h2>로그인부터 해주세요!</h2>
				</c:otherwise>
				</c:choose>
			</div>
			<div class="product__pagination">
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
				</div>
		</div>
	</section> <!--/#cart_items-->