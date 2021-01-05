<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"  %>
    <%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<section id="cart_items">
		<div class="container">
			<c:choose>
					<c:when test="${ses_mvo.id ne '' && ses_mvo.id ne null }">
						<h3> ${ses_mvo.id} 님의 주문목록</h3>
				<div class="table-responsive cart_info">
				<div class="signup-form"><!--sign up form-->
						</div>
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
							<c:set var = "string1" value = "${ovo.regdate}"/>
							<c:set var = "length" value = "${fn:length(string1)}"/>
      						<c:set var = "string2" value = "${fn:substring(string1, 0, length-5)}" />
								${string2 }
							</td>
							<td class="image">
								계 : 
							</td>
							<td class="image">
							<c:choose>
								<c:when test="${ovo.status == 1 }">
								주문완료</c:when><c:otherwise>주문오류</c:otherwise>
								</c:choose> 
							</td>
							<%-- <td class="">
							 <c:set var="sum_item" value="${sum_item + ovo.cnt * ovo.price }"></c:set>
								 단품 : ${ovo.price} ₩<br>소계: ${ovo.cnt * cavo.price} ₩ 
							</td> --%>
						 </tr>
				      </c:forEach>
					</tbody>
				</table>
				</div>
				</c:when>
				<c:otherwise>
				<div class="col-sm-12" style="text-align: center; padding-bottom:100px; ">
					<h2>로그인부터 해주세요!</h2>
					<a class="btn btn-warning" href="index.jsp?rp=login">login</a>
					</div>
				</c:otherwise>
				</c:choose>
			
			<%-- <div class="pagination-area">
					<ul class="pagination">
					<c:if test="${paging.prevBlock > 5 }">
					<li><a href="./product?sv=lip&cp=${paging.prevBlock }"><i class="fa fa-angle-double-left"></i></a></li>
					</c:if>
					<c:forEach var="i" begin="${paging.prevBlock + 1 }" 
					end="${paging.totalPage }" varStatus="status">
					<c:if test="${status.count < 6 }">
					<c:choose>
						<c:when test="${i eq paging.clPage }">
							<li><a href="#" class="active">${i }</a></li>
						</c:when>						
						<c:otherwise>
							<li><a href="./product?sv=lip&cp=${i }">${i }</a></li>
						</c:otherwise>
					</c:choose>					
					</c:if>
					</c:forEach>
					<c:if test="${paging.nextBlock < paging.totalPage }">
					<li><a href="./product?sv=lip&cp=${paging.nextBlock }">
					<i class="fa fa-long-arrow-right"></i></a></li>
					</c:if>
					</ul>
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
	
	 /*  var temp_s = String(s).split('').join(',').split('');

	  for( var k=temp_s.length-1, j=1; i>=0; k--, j++){
		  if( j%6 != 0 && j%2 == 0) {
			  temp_s[k] = '';
			  }
	  } 

	  let print_s = temp_s.join('');
 */	
	$("#"+i).find("td:nth-child(4)").html("<span>계:"+ s +"원</span>");
}

</script>
