<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!--  String rp = request.getParameter("rp"); %>  -->

<c:set var ="view" value="${param.rp }"/>
<c:choose>
<c:when test="${view eq null || view eq '' }">
	<c:set var="jsp" value="common/20_main1.jsp"></c:set>
</c:when>
<c:when test="${view eq 'main' }">
	<c:set var="jsp" value="common/20_main2.jsp"></c:set>
</c:when>
   
<c:when test="${view eq 'cate' }">
	<c:set var="jsp" value="common/20_main3_cate.jsp"></c:set>
</c:when>
 
 
<c:when test="${view eq 'join' }">
	<c:set var="jsp" value="member/join.jsp"/>
</c:when>
<c:when test="${view eq 'login' }">
	<c:set var="jsp" value="member/login.jsp"/>
</c:when>
<c:when test="${view eq 'logout' }">
	<c:set var="jsp" value="member/logout.jsp"/>
</c:when>
<c:when test="${view eq 'mList' }">
	<c:set var="jsp" value="member/list.jsp"/>
</c:when>
<c:when test="${view eq 'mModify' }">
	<c:set var="jsp" value="member/modify.jsp"/>

</c:when>
<c:when test="${view eq 'reg' }">
	<c:set var="jsp" value="product/upload.jsp"></c:set>
</c:when>
<c:when test="${view eq 'pli' }">
	<c:set var="jsp" value="product/list.jsp"></c:set>
</c:when>
<c:when test="${view eq 'dtl' }">
	<c:set var="jsp" value="product/detail.jsp"></c:set>
</c:when>
<c:when test="${view eq 'pmod' }">
	<c:set var="jsp" value="product/modify.jsp"></c:set>
</c:when>

<c:when test="${view eq 'cList' }">
	<c:set var="jsp" value="cart/list.jsp"/>
</c:when>
     
</c:choose>

<jsp:include page="views/common/10_header.jsp"></jsp:include>
<jsp:include page="views/${jsp}"></jsp:include>
<jsp:include page="views/common/90_footer.jsp"></jsp:include>