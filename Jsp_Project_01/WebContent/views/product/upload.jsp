<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>


<div class="container">
<div class="step-one">
				<h2 class="heading">상품등록</h2>
			</div>

<div class="shopper-informations">
				<div class="row">
					<form action="./product?sv=upl" method="post" enctype="multipart/form-data">
					<div class="col-sm-5 clearfix">
						<div class="bill-to">
							<p>등록상품 정보</p>
							<div class="form-one">
									<input type="text" name='pname' placeholder="상품정보">
									<input type="number" name='price' placeholder="가격">
							</div>
							<div class="form-two">
									<select name="category">
										<option>-- Category --</option>
										<option value="pm">프라모델</option>
										<option value="lg">조립레고</option>
										<option value="pg">입체퍼즐</option>
										<option value="ss">십자수/뜨개질</option>
									</select>
									<input type="file" placeholder="imagefile">
							</div>
						</div>
					</div>
					<div class="col-sm-4">
						<div class="order-message">
							<p>상품 상세 설명</p>
							<textarea name="content"  placeholder="상품에 대해서 설명해주세요" rows="10"></textarea>
						</div>	
					</div>	
					<div class="col-sm-3">
						<div class="shopper-info">
							<p>상품 등록</p>
							<button type="button" class="btn btn-primary" style="color:black;" href="">초기화</button>
							<button type="submit" class="btn btn-primary" >등록하기</button>
						</div>
					</div>	
					</form>			
				</div>
			</div>
			</div>