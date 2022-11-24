<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>


<div class="review-box">
	
	<div class="d-flex justify-content-between">
	<div>
	<h3 class="text-center">트레이너 리뷰 </h3>
	<table class="table m-5 ">
				<thead>
					<tr>
						<th>회원 ID</th>
						<th>리뷰</th>
						<th>별점</th>

						<th>작성 날짜</th>
					</tr>

				</thead>
	<c:forEach items="${myReview}" var="review">
		<c:if test="${review.type == 'trainer'}">
			
				<tbody>
					<tr>
						<td>${userLoginId }</td>
						<td>${review.content }</td>
						<td><c:choose>
			<c:when test="${review.rank eq 1}">
				<img src="http://marondal.com/material/images/dulumary/web/jstl/star_fill.png" alt="one-star" width='30px' height='30px'>
				</c:when>
			<c:when test="${review.rank eq 2}">
				<c:forEach begin="1" end="2">
				<img src="http://marondal.com/material/images/dulumary/web/jstl/star_fill.png" alt="two-star" width='30px' height='30px'>
				</c:forEach>
				</c:when>
			<c:when test="${review.rank eq 3}">
			<c:forEach begin="1" end="3">
				<img src="http://marondal.com/material/images/dulumary/web/jstl/star_fill.png" alt="three-star" width='30px' height='30px'>
				</c:forEach>
				</c:when>
			<c:when test="${review.rank eq 4}">
			<c:forEach begin="1" end="4">
				<img src="http://marondal.com/material/images/dulumary/web/jstl/star_fill.png" alt="four-star" width='30px' height='30px'>
				</c:forEach>
			</c:when>
			<c:when test="${review.rank eq 5}">
			<c:forEach begin="1" end="5">
				<img src="http://marondal.com/material/images/dulumary/web/jstl/star_fill.png" alt="five-star" width='30px' height='30px'>
				</c:forEach>
			</c:when>
		
		</c:choose></td>
		<td><fmt:formatDate pattern="yyyy-MM-dd" value="${review.createdAt }"/></td>
		<td><button type="button" class="btn btn-danger review-delete-btn" data-review-id="${review.id}">삭제하기 </button></td>		
				</tr>
				
		</c:if>
		
	</c:forEach>
	</tbody>
			</table>
			</div>
	<div>
			<h3 class="text-center">체육관 리뷰 </h3>
	
	<table class="table m-5">
				<thead>
					<tr>
						<th>회원 ID</th>
						<th>리뷰</th>
						<th>별점</th>

						<th>작성 날짜</th>
					</tr>

				</thead>
	<c:forEach items="${myReview}" var="review">
		<c:if test="${review.type == 'gym'}">
			
				<tbody>
					<tr>
						<td>${userLoginId }</td>
						<td>${review.content }</td>
						<td><c:choose>
			<c:when test="${review.rank eq 1}">
				<img src="http://marondal.com/material/images/dulumary/web/jstl/star_fill.png" alt="one-star" width='30px' height='30px'>
				</c:when>
			<c:when test="${review.rank eq 2}">
				<c:forEach begin="1" end="2">
				<img src="http://marondal.com/material/images/dulumary/web/jstl/star_fill.png" alt="two-star" width='30px' height='30px'>
				</c:forEach>
				</c:when>
			<c:when test="${review.rank eq 3}">
			<c:forEach begin="1" end="3">
				<img src="http://marondal.com/material/images/dulumary/web/jstl/star_fill.png" alt="three-star" width='30px' height='30px'>
				</c:forEach>
				</c:when>
			<c:when test="${review.rank eq 4}">
			<c:forEach begin="1" end="4">
				<img src="http://marondal.com/material/images/dulumary/web/jstl/star_fill.png" alt="four-star" width='30px' height='30px'>
				</c:forEach>
			</c:when>
			<c:when test="${review.rank eq 5}">
			<c:forEach begin="1" end="5">
				<img src="http://marondal.com/material/images/dulumary/web/jstl/star_fill.png" alt="five-star" width='30px' height='30px'>
				</c:forEach>
			</c:when>
		
		</c:choose></td>
		<td><fmt:formatDate pattern="yyyy-MM-dd" value="${review.createdAt }"/></td>
		<td><button type="button" class="btn btn-danger review-delete-btn" data-review-id="${review.id}">삭제하기 </button></td>		
				
				</tr>
				
		</c:if>
		
	</c:forEach>
	</tbody>
			</table>
			</div>	
	</div>		
</div>
<script>
	$(document).ready(function(e){
		$('.review-delete-btn').on('click', function(e){
			let reviewId = $(this).data('review-id');
			//alert(reviewId);
			$.ajax({
				type : 'post',
				url : '/review/delete',
				data : {"reviewId" : reviewId},
				success:function(data){
					if (data.code == 100){
						alert("리뷰가 삭제되었습니다.");
						location.reload(true);
					}
				}
				,error:function(e){
					alert("리뷰 삭제에 실패했습니다. ");
				}
			})
			
		});
	});
</script>