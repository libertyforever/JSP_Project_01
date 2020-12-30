<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<div class="container">
<div class="step-one">
				<h2 class="heading">상품 수정 페이지</h2>
			</div>

<div class="shopper-informations">
				<div class="row">
					<form action="./product?sv=upd" method="post" enctype="multipart/form-data">
					<input type="hidden" name="pno" value="${pvo.pno }">
					<div class="col-sm-5 clearfix">
						<div class="bill-to">
							<p>등록상품 정보 수정</p>
							<div class="form-one">
									<input type="text" name='pname' placeholder="${pvo.pname }">
									<input type="number" name='price' placeholder="가격">
							</div>
							<div class="form-two">
									<select name="category">
										<option>-- Category --</option>
										<option value="pm">프라모델</option>
										<option value="lg">조립레고</option>
										<option value="pg">입체퍼즐</option>
										<option value="ss">십자수/그리기</option>
									</select>
									<input type="file" name="imgfile" placeholder="imagefile">
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
							<button type="reset" class="btn btn-primary" style="color:black;" >초기화</button>
							<button type="submit" class="btn btn-primary" >수정하기</button>
						</div>
					</div>	
					</form>			
				</div>
			</div>
			</div>