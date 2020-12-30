<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<section id="cart_items">
		<div class="container">
			<div class="table-responsive cart_info">
				<table class="table table-condensed">
					<thead>
						<tr class="cart_menu">
							<td class="image">ID</td>
							<td class="quantity">nickname</td>
							<td class="total">grade</td>
							<td></td>
						</tr>
					</thead>
					<tbody> 
					  <c:forEach items="${mList}" var="mvo">   
						 <tr>
							<td class="cart_product">
								<h4>${mvo.id}</h4>
							</td>
							<td class="cart_price">
								${mvo.nickname }
							</td>
							<td class="cart_quantity">
								  <c:choose>
									<c:when test="${mvo.grade > 100 }">VVIP</c:when>
									<c:when test="${mvo.grade > 50 }">VIP</c:when>
									<c:when test="${mvo.grade > 30 }">GOLD</c:when>
									<c:when test="${mvo.grade > 10 }">SILVER</c:when>
									<c:otherwise>일반회원</c:otherwise>
							     </c:choose>
							</td>
							<td>
							<form action="./Cart" method="post">
                            <input type="hidden" name="sv" value="join">
							<input type="hidden" name="id"  value="${mvo.id }"/>
							<input type="hidden"  name="cnt"  value="'5'"/>
							<button type="submit" class="btn btn-default">장바구니에 추가 </button>
						    </form>
							</td>
							<td>
							<form action="./member" method="post">
                            <input type="hidden" name="sv" value="modify">
							<input type="hidden" name="id"  value="${mvo.id }"/>
							<button type="submit" class="btn btn-default">수정 </button>
						    </form>
							</td>
							<td>
							<form action="./member" method="post">
                            <input type="hidden" name="sv" value="rm">
							<input type="hidden" name="id"  value="${mvo.id }"/>
							<button type="submit" class="btn btn-default">삭제 </button>
							</form>
							</td>
							<td>
							</td>
						 </tr>
				      </c:forEach>
					</tbody>
				</table>
				<div class="product__pagination">
					<c:if test="${paging.prevBlock > 5 }">
					<a href="./member?sv=list&cp=${paging.prevBlock }"><i class="fa fa-long-arrow-left"></i></a>
					</c:if>
					<c:forEach var="i" begin="${paging.prevBlock + 1 }" 
					end="${paging.totalPage }" varStatus="status">
					<c:if test="${status.count < 6 }">
					<c:choose>
						<c:when test="${i eq paging.clPage }">
							<a href="#">${i }</a>
						</c:when>						
						<c:otherwise>
							<a href="./member?sv=list&cp=${i }">${i }</a>
						</c:otherwise>
					</c:choose>					
					</c:if>
					</c:forEach>
					<c:if test="${paging.nextBlock < paging.totalPage }">
					<a href="./member?sv=list&cp=${paging.nextBlock }">
					<i class="fa fa-long-arrow-right"></i></a>
					</c:if>
				</div>
			</div>
		</div>
	</section> <!--/#cart_items-->
    
   