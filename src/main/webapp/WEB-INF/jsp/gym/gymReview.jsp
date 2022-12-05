<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>

<div class="container">
<h2 class="bg-light text-info">${gymName}리뷰 </h2>
<div class="d-flex">
<select id="selectSort" class="mt-5" onchange="changeSort()">
	<option  value="userId">회원 ID </option>
	<option value="title">제목 </option>
	<option value="rankhigh ">높은 별점 순 </option>
	<option value="ranklow ">낮은 별점 순  </option>
	<option value="old ">오래된 순  </option>
	<option value="new ">최신 순  </option>
	<option value="access">조회수  </option>
</select>
</div>
<table class="table mt-5">
<thead>
	<tr>
		<th>회원 ID</th>
		<th>제목 </th>
		<th>별점 </th>
		
		<th>작성 날짜</th>
		<th>조회수 </th>
		
	</tr>
	</thead>
	<tbody class="mt-3">
		<c:forEach var="count" items="${reviewCountList}" >
	<tr >
	
		<td>${userLoginId }</td>
		<td><a href="#" class="reviewDetailBtn" data-review-id="${count.review.id}">${count.review.title }</a></td>
		
		<td><c:choose>
			<c:when test="${count.review.rank eq 1}">
				<img src="http://marondal.com/material/images/dulumary/web/jstl/star_fill.png" alt="one-star" width='30px' height='30px'>
				</c:when>
			<c:when test="${count.review.rank eq 2}">
				<c:forEach begin="1" end="2">
				<img src="http://marondal.com/material/images/dulumary/web/jstl/star_fill.png" alt="two-star" width='30px' height='30px'>
				</c:forEach>
				</c:when>
			<c:when test="${count.review.rank eq 3}">
			<c:forEach begin="1" end="3">
				<img src="http://marondal.com/material/images/dulumary/web/jstl/star_fill.png" alt="three-star" width='30px' height='30px'>
				</c:forEach>
				</c:when>
			<c:when test="${count.review.rank eq 4}">
			<c:forEach begin="1" end="4">
				<img src="http://marondal.com/material/images/dulumary/web/jstl/star_fill.png" alt="four-star" width='30px' height='30px'>
				</c:forEach>
			</c:when>
			<c:when test="${count.review.rank eq 5}">
			<c:forEach begin="1" end="5">
				<img src="http://marondal.com/material/images/dulumary/web/jstl/star_fill.png" alt="five-star" width='30px' height='30px'>
				</c:forEach>
			</c:when>
		
		</c:choose></td>
		
						
			<td><fmt:formatDate pattern="yyyy-MM-dd" value="${count.review.createdAt }"/></td>	
			<td>조회수 : ${count.reviewCount}</td>
	</tr>
	
	 </c:forEach>
	
	</tbody>
	
</table>

<div class="d-flex justify-content-center mt-5">

<button type="button" class="btn btn-info reviewWriteBtn" >리뷰 등록 </button>
</div>
<%-- <c:forEach items="${gymReviewList}" var="gymReview">

</c:forEach>
 --%>
</div>
<script>
	function changeSort(){
		
		let sortSelect = document.getElementById("selectSort");
		let selectValue = sortSelect.options[sortSelect.selectedIndex].value;
		//alert(selectValue);
		let workoutId = ${workoutId};
		let gymName = '${gymName}';
		let type='${type}';
		document.location.href="/review/view?workoutId="
			+ workoutId
			+ "&type="
			+ type
			+ "&gymName="
			+ gymName
			+ "&sort="
			+ selectValue;

	}
	
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