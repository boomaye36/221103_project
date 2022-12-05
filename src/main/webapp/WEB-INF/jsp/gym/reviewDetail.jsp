<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
    <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
    
    
<div class="container">
	<h3 class="text-info mb-5">${userLoginId} 님의 리뷰 </h3>
	<c:forEach items="${reviewDetailList}" var="review">
		<span class="m-5 text-info">조회수 : ${reviewCount} </span>
		<span class="m-5">작성날짜 : <fmt:formatDate pattern="yyyy-MM-dd" value="${review.createdAt }"/> </span>
		<div id="reviewDetailBox">
	
		<h4>	${review.content}
		</h4>
		</div>
	<a href="#" class="btn btn-info" id="review-confirm-btn" data-workout-id="${review.workoutId}" data-type="${review.type}">확인 </a>
	</c:forEach>
</div>
<script>
	$(document).ready(function(e){
		$('#review-confirm-btn').on('click', function(e){
			//let reviewId = $(this).data('review-id');
			let workoutId = $(this).data('workout-id');
			let type = $(this).data('type');
			let gymName = '${gymName}';
			//alert(type);
			//alert(gymName);
			document.location.href="/review/view?workoutId=" + workoutId + "&type=" + type + "&gymName=" + gymName;
		});
	});
</script>