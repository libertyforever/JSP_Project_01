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
							<td class="image">Order NO</td>
							<td class="image">Product info</td>
							<td class="image">Order date</td>
							<td class="image">Price</td>
							<td class="">Status</td>
						</tr>
					</thead>
					<tbody> 
					<%-- <c:set var="sum_item" value="0"></c:set> --%>
					<c:set var="i" value="0"></c:set>
					  <c:forEach items="${oList}" var="ovo">   
					  	<c:set var="i" value="${i + 1}"></c:set>
						 <tr id="${i}">
							<td class="image">
								<h4>${ovo.ono}</h4>
							</td>
							<td class=image>
								- 
							</td>
							<td class="cart_quantity">
								${ovo.regdate}
							</td>
							<td class="image">
								계 : 
							</td>
							<td class="image">
								<c:when test=" ${ovo.status == 1 }">
								주문완료</c:when><c:otherwise>주문오류</c:otherwise> 
							</td>
							<%-- <td class="">
							 <c:set var="sum_item" value="${sum_item + ovo.cnt * ovo.price }"></c:set>
								 단품 : ${ovo.price} ₩<br>소계: ${ovo.cnt * cavo.price} ₩ 
							</td> --%>
						 </tr>
				      </c:forEach>
					</tbody>
				</table>
				
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
	
<script type="text/javascript">
$(function(){
	// 보낼 것 ono
	// 받아올 것 id, prdinfo의 첫상품 이름과 그 갯수, 합계
	lastNum = parseInt("<c:out value='${i}'/>");
	
	
	for (var i = 1; i < lastNum+1; i++) {
	var ono = parseInt($("#"+i).find("td:nth-child(1) > h4").html()); // 첫 상품 ono;
	//test2 = $("#1").find("td:nth-child(2)").html(); //정보들어갈 장소;

	ono2json(i, ono);
	}

});


function ono2json(i, ono){
	let n=""; let s=""; let c="";
	$.ajax({
		url:"./ordera?sv=lio",
		type:"post",
		data:{ono:ono},
		success:function(jsonPrdObj){
			let prdObj = JSON.parse(jsonPrdObj);
			//prd1Name = parseInt(prd1Name);
			//prdSum = parseInt(prdSum);
			
			for ( var key in prdObj) {
				//console.log(key+"="+cvo[key]); //key val 뭔지 확인하기
				switch (key) {
				case "prd1Name":
					n = prdObj[key];
					break;
				case "prdSum":
					s = prdObj[key];
					break;
				case "prdCount":
					c = prdObj[key];
					break;
				default:
					break;
				}
			printName(i,n,c);
			printPrice(i,s);
			}
			//let prdCount = "<c:out value='${prdCount}'/>";
			//let prd1Name = "<c:out value='${prd1Name}'/>";
			//let prdSum = "<c:out value='${prdSum}'/>";
			
			//console.log(n+ "- test n"+i+"번째");
			//console.log(s+ "- test s"+i+"번째");
			//console.log(c+ "- test n"+i+"번째");
			
		
			//printPrdInfo(prdCount, prd1Name, prdSum);
		},
		error:function(msg){
			alert('연결실패');
		}
	});
	
	
}


function printName(i,n,c){
	$("#"+i).find("td:nth-child(2)").html("<span>"+n+" 외 "+c+" 종</span>");
}
function printPrice(i,s){
	$("#"+i).find("td:nth-child(4)").html("<span>계:"+ s +"원</span>");
}

</script>
