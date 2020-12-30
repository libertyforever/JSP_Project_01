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
									<a data-toggle="collapse" data-parent="#accordian" href="">
										<span class="badge pull-right"></span> 프라모델
									</a>
								</h4>
							</div>
						</div>
						<div class="panel panel-default">
							<div class="panel-heading">
								<h4 class="panel-title">
									<%-- 리스트 목록 링크 사용 --%>
									<a data-toggle="collapse" data-parent="#accordian" href="#mens">
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
										href="#womens"> <span class="badge pull-right"></span>
										입체퍼즐
									</a>
								</h4>
							</div>
						</div>
						<div class="panel panel-default">
							<div class="panel-heading">
								<h4 class="panel-title">
									<a href="#">십자수/그리기</a>
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
				<div class="product-details">
					<!--product-details-->
					<div class="col-sm-5">
						<div class="view-product">
							<img src="./upload/${pvo.imgfile}" alt="" />
							<h3>ZOOM</h3>
						</div>
						

					</div>
					<div class="col-sm-7">
						<div class="product-information">
							<!--/product-information-->
							<img src="images/product-details/new.jpg" class="newarrival"
								alt="" />
							<h2>${pvo.pname }</h2>
							<p>Web ID: ${pvo.pno }</p>
							<img src="images/product-details/rating.png" alt="" /> <span>
								<span>${pvo.price } ₩</span> <label>Quantity:</label> <input
								type="text" value="3" />
								</span>
								
								<form action="./Cart" method="post">
							<input type="hidden" name="sv" value="join">
								<input type="hidden" name="id" value="${ses_mvo.id}">
								<input type="hidden" name="pno" value="${pvo.pno}">
								<input type="hidden" name="pname" value="${pvo.pname}">
								<input type="hidden" name="cnt" value="3">
								<input type="hidden" name="thumb" value="${pvo.imgfile}">
								<button type="submit" class="btn btn-fefault cart">
									<i class="fa fa-shopping-cart"></i> Add to cart
								</button>
								</form>
								
							<p>
								<b>Availability:</b> In Stock
							</p>
							<p>
								<b>Condition:</b> New
							</p>
							<p>
								<b>Brand:</b> E-SHOPPER
							</p>
							<a href=""><img src="images/product-details/share.png"
								class="share img-responsive" alt="" /></a>
						</div>
						<!--/product-information-->
					</div>
				</div>
				<!--/product-details-->

				<div class="category-tab shop-details-tab">
					<!--category-tab-->
					<div class="col-sm-12">
						<ul class="nav nav-tabs">
							<li><a href="#details" data-toggle="tab">Details</a></li>
							<li class="active"><a href="#reviews" data-toggle="tab">Reviews
									</a></li>
						</ul>
					</div>
					<div class="tab-content">
						<div class="tab-pane fade" id="details">
							
							<div class="col-sm-12">
								<div class="product-image-wrapper">
									<div class="single-products">
										<div class="productinfo text-center">
											<img src="${pvo.imgfile }" alt="" />
											<h2>${pvo.price }</h2>
											<p>${pvo.pname }</p>
											<button type="button" class="btn btn-default add-to-cart">
												<i class="fa fa-shopping-cart"></i>Add to cart
											</button>
										</div>
									</div>
								</div>
							</div>
						</div>
						<div class="tab-pane fade active in" id="reviews">
						
								
								<div class="col-sm-12">
								<hr>
								<ul>
									<li><a href=""><i class="fa fa-user"></i>EUGEN</a></li>
									<li><a href=""><i class="fa fa-clock-o"></i>12:41 PM</a></li>
									<li class="pull-right"><a href=""><i class="fa fa-calendar-o"></i>31 DEC
											2014</a></li>
								</ul>
								<p>contents contents contents contents contents </p>
								<button class="rmBtn pull-right">삭제</button>
								</div>
								
								<div id="cmtList" class="col-sm-12">
								</div>
								
								
								<c:if test="${ses_mvo.id ne '' && ses_mvo.id ne null }">
								<div class="col-sm-12">
								<hr>
								<p>
									<b>Write Your Review</b>
								</p>

								<form action="#">
									<span><input type="text" value="${ses_mvo.nickname }" readonly/> 
									<input type="hidden"></span>
									<textarea name="comment" id="cmt"></textarea>
									<b>Rating: </b> <img src="images/product-details/rating.png"
										alt="" />
									<button type="button" id="cmtBtn" class="btn btn-default pull-right">
										Submit</button>
								</form>
								</div>
								</c:if>
							</div>
						</div>
					</div>
				</div>
			</div>


		</div>
</section>

<script>
				$(function(){
					pno = '<c:out value="${pvo.pno}"/>';
					nick = '<c:out value="${ses_mvo.id}"/>';
					getlistComment(pno);
				});
				
				function getlistComment(pno){
					$("#cmtList").html("");
					$.ajax({
						url: "./comment/list",
						type: "post",
						data: {pno:pno},
						success: function(list){ //list > String
							let listObj = JSON.parse(list) //JSON parse해서 object로 변환
							printlistComment(listObj);
						},
						error: function(msg){
						}
					});
				}
				
				function printlistComment(listObj){
					//$("#cmtList").append('<hr>');
					//첫행 hr -> 필요없음
					let w = ''; let c = ''; let d = '';
					for (let cvo of listObj) {
						for ( var key in cvo) {
							//console.log(key+"="+cvo[key]); //key val 뭔지 확인하기
							switch (key) {
							case "writer":
								w = cvo[key];
								break;
							case "comment":
								c = cvo[key];
								break;
							case "regdate":
								d = cvo[key];
								break;
							case "cno":
								n = cvo[key];
								console.log(n);
								break;
							default:
								break;
							}
						}
						$("#cmtList").append('<hr><ul><li><a href=""><i class="fa fa-user"></i>'+w
								+'</a></li><li><a href=""><i class="fa fa-clock-o"></i>Rating</a></li>'
								+'<li class="pull-right"><a href=""><i class="fa fa-calendar-o"></i>'+d
								+'</a></li></ul><span>'+c+'</span>'
								+'<button class="pull-right" onclick="delCom('+n
								+');">삭제</button>');
					}
					
				}
					
					
				function delCom(n){
					$.ajax({
						url: "./comment/rm",
						type: "post",
						data: {cno:n},
						success: function(result){
							let res = parseInt(result);
							if(res > 0){
								alert("댓글이 삭제되었습니다.");
								getlistComment(pno);
							}else{
								alert("댓글 삭제 실패!\n관리자문의 요망!");
							}
						},
						error: function(msg){
							alert("안 댐. 실패함요.");
						}
					});
				}
				
				
				$("#cmtBtn").on("click", function(){
					let cmt = $("#cmt").val();
					console.log(pno);
					console.log(nick);
					console.log(cmt);
					$.ajax({
						url: "./comment/add",
						type: "post",
						data: {pno:pno, writer:nick, comment:cmt},
						success: function(result){
							console.log(result);
							let res = parseInt(result);
							if(res > 0){
								alert("댓글 등록 완료!");
								getlistComment(pno);
								$("#cmt").val("");
							}else{
								alert("댓글 등록 실패!\n관리자문의 요망!");
							}
						},
						error: function(msg){
							alert("안 댐. 실패함요.");
						}
					});
				});
				</script>
