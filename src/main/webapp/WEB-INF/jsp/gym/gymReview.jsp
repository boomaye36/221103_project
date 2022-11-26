<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>

<div class="container">
<h2 class="bg-light text-info">${gymName}리뷰 </h2>
<div class="d-flex">
<table class="table mt-5">
<thead>
	<tr>
		<th>회원 ID</th>
		<th>제목 </th>
		<th>별점 </th>
		
		<th>작성 날짜</th>
		
	</tr>
	</thead>
	<tbody class="mt-3">
	 <c:forEach items="${gymReviewList}" var="gymReview">
	<tr >
	
		<td>${userLoginId }</td>
		<td><a href="#" class="reviewDetailBtn" data-review-id="${gymReview.id}">${gymReview.title }</a></td>
		
		<td><c:choose>
			<c:when test="${gymReview.rank eq 1}">
				<img src="http://marondal.com/material/images/dulumary/web/jstl/star_fill.png" alt="one-star" width='30px' height='30px'>
				</c:when>
			<c:when test="${gymReview.rank eq 2}">
				<c:forEach begin="1" end="2">
				<img src="http://marondal.com/material/images/dulumary/web/jstl/star_fill.png" alt="two-star" width='30px' height='30px'>
				</c:forEach>
				</c:when>
			<c:when test="${gymReview.rank eq 3}">
			<c:forEach begin="1" end="3">
				<img src="http://marondal.com/material/images/dulumary/web/jstl/star_fill.png" alt="three-star" width='30px' height='30px'>
				</c:forEach>
				</c:when>
			<c:when test="${gymReview.rank eq 4}">
			<c:forEach begin="1" end="4">
				<img src="http://marondal.com/material/images/dulumary/web/jstl/star_fill.png" alt="four-star" width='30px' height='30px'>
				</c:forEach>
			</c:when>
			<c:when test="${gymReview.rank eq 5}">
			<c:forEach begin="1" end="5">
				<img src="http://marondal.com/material/images/dulumary/web/jstl/star_fill.png" alt="five-star" width='30px' height='30px'>
				</c:forEach>
			</c:when>
		
		</c:choose></td>
		
						
			<td><fmt:formatDate pattern="yyyy-MM-dd" value="${gymReview.createdAt }"/></td>	
			
	</tr>
	
	 </c:forEach>
	
	</tbody>
	
</table>
<table class="table mt-5">
	<thead>
		<tr>
			<th>조회수</th>
		</tr>
	</thead>
	<tbody>
		<c:forEach var="count" items="${reviewCountList}" >
			<tr>
			<td>조회수 : ${count.reviewCount}</td>
			</tr>
			</c:forEach>
	</tbody>
</table>
</div>
<div class="d-flex justify-content-center mt-5">

<button type="button" class="btn btn-info reviewWriteBtn" data-review-id="${review.id}">리뷰 등록 </button>
</div>
<%-- <c:forEach items="${gymReviewList}" var="gymReview">

</c:forEach>
 --%>
</div>
<script>
	$(document).ready(function(e){
		$('.reviewWriteBtn').on('click', function(e){
			//let reviewId = $(this).data('review-id');
			//alert(reviewId);
			let workoutId = ${workoutId};
			let gymName = '${gymName}';
			let type='${type}';
			//alert(type);
			//alert( gymName);
			document.location.href="/review/review_write_view?workoutId=" + workoutId + "&type=" + type +"&gymName=" + gymName;
		});
		$('.reviewDetailBtn').on('click', function(e){
			let reviewId = $(this).data('review-id');
			let gymName = '${gymName}';

			//alert(reviewId);
			/* let reviewCount  = 0;
			reviewCount ++; */
			$.ajax({
				
				type : 'post',

				url:"/review/review_count_insert"
				,data:{"reviewId" : reviewId}
				,success:function(data){
					if (data.code == 100){
						document.location.href="/review/review_detail_view?reviewId=" + reviewId + "&gymName=" + gymName;
						
					}
				},error : function(e) {
					alert("조회수 실패  ");
				}
			});

		});
	});
</script>