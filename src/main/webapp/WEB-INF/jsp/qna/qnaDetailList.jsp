<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
    
    <div class="container">
		<div class="d-flex justify-content-center">
			<h2 class="bg-light text-info">제목 : ${title }</h2>
		</div>
		<div class="mt-5 bg-light">
			<h3>${content }</h3>
			
		</div>
		<div class="d-flex">
			<input type="text" class="form-control mt-5" placeholder="댓글은 100자까지만 입력 가능합니다." id="comment">
			<button class="btn btn-success mt-5 comment-insert-btn">댓글달기 </button>
		</div>
		
		<div class="m-5">
			<b>댓글목록 : </b>
		</div>			
			<c:forEach items="${commentList }" var="comment">
				
				
				<%-- <c:forEach items="${answerList }" var="answer">
				${answer.content }
				
				</c:forEach> --%>
			</c:forEach>
			
  <c:forEach items="${answerViewList }" var="answer">
  				<span class="text-info">댓글쓴이 : ${answer.comment.userloginId }</span>
				<div class="d-flex m-5">
				${answer.comment.content }
				<button class="btn btn-danger comment-delete-btn ml-5" data-comment-id="${answer.comment.id }">삭제하기 </button>
				<button class="btn btn-info comment-add-btn ml-5" data-comment-id="${answer.comment.id }">답글달기  </button>
				</div>
				<div class="d-flex d-none">
					<input class="form-control d-none answer-input" type="text" id="answerInput"> 
					<button class="btn btn-success d-none answer-add-btn">등록하기 </button>
				</div>
				 <c:forEach items="${answer.answerList}" var="view">
				 	${view.content }<br>
				 	
				 </c:forEach>
				
			</c:forEach>  
    </div>
   
    
<script>
	$(document).ready(function(e){
		$('.comment-insert-btn').on('click', function(e){
			let qnaId = ${id}
			//alert(qnaId);
			let content = $('#comment').val().trim();
			if (content == ''){
				alert("댓글을 입력하세요.");
				return false;
			}
			$.ajax({
				type : 'post',
				url : '/comment/insert',
				data : {"qnaId" : qnaId,
					"content" : content,
					"type" : "comment"},
				success : function(data) {
					if (data.code == 100) {
						alert("등록 되었습니다");
						document.location.href="/qna/qna_detail_view?id=" + qnaId;
					}
				}
			});
		});
		$('.comment-delete-btn').on('click', function(e){
			let id = $(this).data('comment-id');
			$.ajax({
				type : 'post',
				url : '/comment/delete',
				data : {"id" : id},
				success : function(data) {
					if (data.code == 100) {
						alert("삭제 되었습니다");
						location.reload(true);
					}
					
				}
			});
		});
		$('.comment-add-btn').on('click', function(e){
			let commentId = $(this).data('comment-id');
			//alert(commentId);
			$('.answer-input').removeClass('d-none'); 
			$('.answer-add-btn').removeClass('d-none'); 
			$('.answer-add-btn').data('comment-id', commentId);
		});
		$('.answer-add-btn').on('click', function(e){
			let commentId = $('.answer-add-btn').data('comment-id');
			let qnaId = ${id}
			
			let content = $('#answerInput').val().trim();
			alert(content);
			if (content == ''){
				alert("답글 내용을 입력하세요.");
				return false;
			}
			$.ajax({
				type : 'post',
				url : '/answer/insert',
				data : {"qnaId" : qnaId,
					"commentId" : commentId, 
					"content" : content},
				success : function(data) {
					if (data.code == 100) {
						document.location.href="/qna/qna_detail_view?id=" + qnaId + "&commentId=" + commentId;
						//location.reload(true);
					}
				}	
				
			});
		});
		
	}); 	
</script>
