<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
    
<div class="container">
	<c:forEach items="${reviewDetailList}" var="review">
		${review.content}
		조회수 : ${reviewCount}
	
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