<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<div class="review-box">
	
	<div class="d-flex justify-content-between">
	<div>
	<h3 class="text-center">트레이너 Q&A </h3>
	<table class="table m-5 ">
				<thead>
					<tr>
						<th>회원 ID</th>
						<th>제목 </th>
						<th>작성 날짜</th>
					</tr>

				</thead>
	<c:forEach items="${qnaList}" var="qna">
		<c:if test="${qna.type == 'trainer'}">
			
				<tbody>
					<tr>
						<td>${userLoginId }</td>
						<td><a href="#" class="qna-detail-btn" data-qna-id="${qna.id}">${qna.title }</a></td>
						
		<td><fmt:formatDate pattern="yyyy-MM-dd" value="${qna.createdAt }"/></td>
		<td><button type="button" class="btn btn-danger review-delete-btn" data-qna-id="${qna.id}">삭제하기 </button></td>		
				</tr>
				
		</c:if>
		
	</c:forEach>
	</tbody>
			</table>
			</div>
	<div>
			<h3 class="text-center">체육관 Q&A </h3>
	
	<table class="table m-5">
				<thead>
					<tr>
						<th>회원 ID</th>
						<th>제목 </th>

						<th>작성 날짜</th>
					</tr>

				</thead>
	<c:forEach items="${qnaList}" var="qna">
		<c:if test="${qna.type == 'gym'}">
			
				<tbody>
					<tr>
						<td>${userLoginId }</td>
						<td><a href="#" class="qna-detail-btn" data-qna-id="${qna.id}">${qna.title }</a></td>
						
		<td><fmt:formatDate pattern="yyyy-MM-dd" value="${qna.createdAt }"/></td>
		<td><button type="button" class="btn btn-danger review-delete-btn" data-qna-id="${qna.id}">삭제하기 </button></td>		
				
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
		$('.qna-detail-btn').on('click', function(e){
			let id = $(this).data('qna-id');
			//alert(id);
			document.location.href="/qna/qna_detail_view?id=" + id;
		});
	});
</script>