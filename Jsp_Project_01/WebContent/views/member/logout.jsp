<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%
	session.invalidate();
%>
<section class="featured spad">
	<div class="container">
		<div class="row">
			<div class="section-title">
				<h2>로그아웃 되었습니다!</h2>
				<h2>이용해 주셔서 감사합니다. 다음에 또 만나요!!</h2>
				<h2><span id="seconds">5</span>초 뒤 초기화면으로 이동합니다.</h2>
			</div>
			
		</div>
	</div>
</section>
<script>
	$(function(){
		//setTimeout(function(){location.replace("index.jsp");}, 3000);
		setTimeout(() => {location.replace("index.jsp");}, 5000);
		
		let time = 4;
		   let i=0;
		   setInterval(function(){
		      let cd = time - i;
		      $("#seconds").text(cd);
		      i++;   
		   }, 1000);
	});
</script>