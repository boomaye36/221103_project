<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>

<div class="container">
<h2 class="bg-light text-info">${gymName}리뷰 </h2>
<table class="table">
<thead>
	<tr>
		<th>회원 ID</th>
		<th>리뷰</th>
		
	</tr>
	</thead>
	<tbody>
	 <c:forEach items="${gymReviewList}" var="gymReview">
	<tr>
		<td>${userLoginId }</td>
		<td>${gymReview.content }</td>
	</tr>
	 </c:forEach>
	</tbody>
</table>
<%-- <c:forEach items="${gymReviewList}" var="gymReview">

</c:forEach>
 --%>
</div>