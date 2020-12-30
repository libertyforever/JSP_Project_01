<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<section id="form"><!--form-->
		<div class="container">
			<div class="row">
				<div class="col-sm-4 col-sm-offset-1">
				</div>
				<div class="col-sm-4">
					<div class="signup-form"><!--sign up form-->
						<h2>회원정보 수정</h2>
						<form action="./member" method="post">
                            <input type="hidden" name="sv" value="update">
							<input type="text" name="id"  value="${mvo.id }" readonly/>
							<input type="password" name="pwd"  value="${mvo.pwd }"/>
							<input type="text" name="nickname"  value="${mvo.nickname }"/>
							<button type="submit" class="btn btn-default">수정하기</button>
						</form>
					</div><!--/sign up form-->
				</div>
			</div>
		</div>
	</section><!--/form-->