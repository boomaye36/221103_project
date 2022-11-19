<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>

<div class="container">
<h2 class="bg-light text-info">${gymName}리뷰 </h2>
<table class="table mt-5">
<thead>
	<tr>
		<th>회원 ID</th>
		<th>리뷰</th>
		
	</tr>
	</thead>
	<tbody class="mt-3">
	 <c:forEach items="${gymReviewList}" var="gymReview">
	<tr >
		<td>${userLoginId }</td>
		<td>${gymReview.content }</td>
	</tr>
	 </c:forEach>
	</tbody>
</table>
<div class="d-flex justify-content-center mt-5">
<button type="button" class="btn btn-info reviewWriteBtn">리뷰 등록 </button>
</div>
<%-- <c:forEach items="${gymReviewList}" var="gymReview">

</c:forEach>
 --%>
</div>
<script>
	$(document).ready(function(e){
		$('.reviewWriteBtn').on('click', function(e){
			let workoutId = ${gymId};
			let gymName = '${gymName}';
			let type="gym";
			//alert( gymName);
			document.location.href="/review/review_write_view?workoutId=" + workoutId + "&type=" + type +"&gymName=" + gymName;
		});
	});
</script>