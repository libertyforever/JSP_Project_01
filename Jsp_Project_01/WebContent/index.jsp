<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!--  String rp = request.getParameter("rp"); %>  -->

<c:set var ="view" value="${param.rp }"/>
<c:choose>
<c:when test="${view eq null || view eq '' }">
 	<c:set var="jsp" value="common/20_main.jsp"></c:set>
 </c:when>
 <c:when test="${view eq 'join' }">
 	<c:set var="jsp" value="member/join.jsp"></c:set>
 </c:when>
 <c:when test="${view eq 'logout' }">
 	<c:set var="jsp" value="member/logout.jsp"></c:set>
 </c:when>
  <c:when test="${view eq 'mList' }">
 	<c:set var="jsp" value="member/list.jsp"></c:set>
 </c:when>
   <c:when test="${view eq 'mModify' }">
 	<c:set var="jsp" value="member/modify.jsp"></c:set>
 </c:when>
    <c:when test="${view eq 'reg' }">
 	<c:set var="jsp" value="product/regist.jsp"></c:set>
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
</c:choose>

<jsp:include page="views/common/10_header.jsp"></jsp:include>
<jsp:include page="views/${jsp}"></jsp:include>
<jsp:include page="views/common/90_footer.jsp"></jsp:include>