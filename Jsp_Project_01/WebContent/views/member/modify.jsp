<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<section id="form"><!--form-->
		<div class="container">
			<div class="row">
				<div class="col-sm-4">
				</div>
				<div class="col-sm-4">
					<div class="signup-form"><!--sign up form-->
						<h2>회원정보 수정</h2>
						<form action="./member" method="post">
                            <input type="hidden" name="sv" value="update">
							<input type="text" name="id"  value="${mvo.id }" readonly/>
							<input type="password" name="pwd"  value="${mvo.pwd }"/>
							<input type="text" name="nickname"  value="${mvo.nickname }"/>
							<input type="number" name="grade"  value="${mvo.grade }"/>
							<p>
							 100 이상 : VVIP</p><p>
							 50 이상 : VIP</p><p>
							 30 이상 : GOLD</p><p>
							 10 이상 : SILVER</p><p>
							 0 이상 : BRONZE</p>
							<button type="submit" class="btn btn-default">수정하기</button>
						</form>
					</div><!--/sign up form-->
				</div>
			</div>
		</div>
	</section><!--/form-->