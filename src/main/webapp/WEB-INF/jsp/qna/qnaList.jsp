<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<div class="review-box">
	
	<div class="d-flex justify-content-between">
	<div>
	<h3 class="text-center">트레이너 Q&A </h3>
	<div class="d-flex">
	<div>
	<table class="table m-5 ">
		<thead>
			<tr>
				<th>트레이너 이름 </th>
			</tr>
		</thead>	
		<tbody>
				<c:forEach items="${trainerQnaList}" var="trainer">
			
			<tr>
				<td>${trainer.name }</td>
			</tr>
			</c:forEach>
		</tbody>
	</table>
	</div>
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
						<td class="qna">${userLoginId }</td>
						<td><a href="#" class="qna-detail-btn" data-qna-id="${qna.id}">${qna.title }</a></td>
						
		<td><fmt:formatDate pattern="yyyy-MM-dd" value="${qna.createdAt }"/></td>
		<td><a  class="btn review-delete-btn" data-qna-id="${qna.id}"><img src="https://cdn-icons-png.flaticon.com/128/3687/3687412.png" width="30px" class="mb-4"></a></td>		
		<td>
			<button type="button" class="btn btn-warning review-update-btn" data-qna-id="${qna.id}" data-toggle="modal" data-target="#modal"><small class="qna-text">수정하기</small> </button>
		</td>
				</tr>
				
		</c:if>
		
	</c:forEach>
	</tbody>
			</table>
			</div>
			</div>
	<div>
			<h3 class="text-center">체육관 Q&A </h3>
	<div class="d-flex">
	<div>
	<table class="table m-5 ">
		<thead>
			<tr>
				<th>체육관 이름 </th>
			</tr>
		</thead>	
		<tbody>
				<c:forEach items="${gymQnaList}" var="gym">
			
			<tr>
				<td class="qna">${gym.name }</td>
			</tr>
			</c:forEach>
		</tbody>
	</table>
	</div>
	<div>
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
					<tr >
						<td >${userLoginId }</td>
						<td><a href="#" class="qna-detail-btn" data-qna-id="${qna.id}">${qna.title }</a></td>
						
		<td><fmt:formatDate pattern="yyyy-MM-dd" value="${qna.createdAt }"/></td>
				<td><a  class="btn review-delete-btn" data-qna-id="${qna.id}"><img src="https://cdn-icons-png.flaticon.com/128/3687/3687412.png" width="30px" class="mb-4"></a></td>		
	
		<td>
			<button type="button" class="btn btn-warning review-update-btn" data-qna-id="${qna.id}" data-toggle="modal" data-target="#modal"><small class="qna-text">수정하기 </small></button>
		</td>		
				
				</tr>
				
		</c:if>
		
	</c:forEach>
	</tbody>
			</table>
			</div>
			</div>
			</div>	
	</div>		
</div>
<!-- Modal -->
<div class="modal fade" id="modal">
	<%-- modal-dialog-centered 모달창을 가운데정렬, modal-sm 작은 모달창 --%>
	<div class="modal-dialog modal-dialog-centered modal-lg">
		<div class="modal-content">
			<%-- 모달 창 안에 내용 넣기 --%>
			<div class="text-center">
				<div class="my-3 border-bottom">
					<div class="d-flex modal-title-box">
						<b class="w-25">제목 : </b> <input type="text"
							class="form-control ml-5" id="title" placeholder="제목을 입력하세요 ">

					</div>
					<div class="d-flex align-items-center modal-content-box">
						<b class="w-25">내용 : </b> <input type="text"
							class="form-control ml-5" id="content" placeholder="내용을 입력하세요 ">
					</div>
					<a href="#" class="btn btn-info" id="qnaUpdateBtn" >수정하기</a>

				</div>
				<div class="py-3">
					<%-- data-dismiss="modal" 모달창 닫힘 --%>
					<a class="m-3 modaltext" href="#" data-dismiss="modal">취소</a>
				</div>

			</div>
		</div>
	</div>
</div>
<script>
	$(document).ready(function(e){
		$('.qna-detail-btn').on('click', function(e){
			let id = $(this).data('qna-id');
			alert(id);
			document.location.href="/qna/qna_detail_view?id=" + id;
		});
		$('.review-delete-btn').on('click', function(e){
			let id = $(this).data('qna-id');
			//alert(id);
			$.ajax({
				type : 'post',
				url : '/qna/delete',
				data : {"id" : id},
				success : function(data) {
					if (data.code == 100) {
						alert("삭제되었습니다.");
						location.reload(true);
					}
				}
			});
		});
		$('#modal #qnaUpdateBtn').on('click', function(e){
			e.preventDefault();
			//$('.review-update-btn').click();
			let id = $('#modal').data('qna-id');
			alert(id);
			let title = $('#title').val().trim();
			let content = $('#content').val().trim();
			if (title == ''){
				alert('제목을 입력하세요 ');
				return false;
			}
			if (content == ''){
				alert('내용을 입력하세요 ');
				return false;

			}
			$.ajax({
				type : 'post',
				url : '/qna/update',
				data : {"id" : id,
					"title" : title, 
					"content" : content},
				success : function(data) {
					if (data.code == 100) {
						alert("Q&A가 수정되었습니다.");
						location.reload(true);
					}
				}
			});
		});
		$('.review-update-btn').on('click', function(e){
			let id = $(this).data('qna-id');
			//alert(id);
			$('#modal').data('qna-id', id);
			
		});

	});
</script>