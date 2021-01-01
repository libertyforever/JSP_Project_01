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
						<h2>회원가입</h2>
						<form action="./member" method="post">
						<input type="hidden" name="sv" value="join" > <span id="isOk"></span>
							<input type="text" name="id" id="input_id" placeholder="id" required/> 
							<input type="password" name="pwd" placeholder="password"  required/>
							<input type="text" name="nickname" placeholder="nickname"  required/>
							<button type="submit" class="btn btn-default">가입하기</button>
						</form>
					</div><!--/sign up form-->
				</div>
			</div>
		</div>
	</section><!--/form-->
    <script>
    $("#input_id").blur(function(){
    	let idVal = $("#input_id").val();
    	$.ajax({
    		url: './member?sv=check',
    		type: 'POST',
    		data: {id:idVal},
    		success: function(result){
    			if(result == '0'){
    				$("#isOk").html("사용가능한 ID").css("color","green");
    			}else{
    				$("#isOk").html("사용불가능한 ID").css("color","red");
    				$("input[name=id]").focus();
    			}
    		}
    	});
    });
    </script>