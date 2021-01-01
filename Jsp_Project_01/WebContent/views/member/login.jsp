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
						<h2>로그인</h2>
						<form action="./member" method="post">
						<input type="hidden" name="sv" value="login" >
							<input type="text" name="id"  placeholder="id" required/>
							<input type="password" name="pwd" placeholder="password"  required/>
							<button type="submit" class="btn btn-default">로그인하기!</button>
						</form>
					</div><!--/sign up form-->
				</div>
			</div>
		</div>
	</section><!--/form-->