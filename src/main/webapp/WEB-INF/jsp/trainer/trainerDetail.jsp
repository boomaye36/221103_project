<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<div class="container">
	<c:forEach items="${trainerDetailList }" var="trainerDetail">

		<div class="d-flex justify-content-between bg-light mt-5">
			<div>
				<h1 class="mt-5">${trainerDetail.name }</h1>
				<br> <br> 
				<div class="d-flex">
				<img src="/static/${trainerDetail.image }"width="400px" height="300px"> 
				<a href="#" class="trainer-like-btn ml-3" data-trainer-id="${trainerDetail.id }" >
			 <!-- 	<img src="https://www.iconninja.com/files/507/847/828/like-icon.png"
						width="30px" height="30px" alt="good" > -->
			 <c:if test="${isLike eq true}">  
 				<img src="https://www.iconninja.com/files/507/847/828/like-icon.png"
						width="30px" height="30px" alt="good" >
				  </c:if>
				<c:if test="${isLike eq false}">
					<img src="https://www.iconninja.com/files/186/930/395/like-icon.png"
					 width ="30px" height="30px" alt="not good">
					</c:if>		
					</a>
					<span class="ml-2 text-info">좋아요 ${likeCount}개 </span>
			
				</div>
				
				<br> <br> <br> <b>${trainerDetail.introduce }</b>
			</div>
			<div class="d-flex align-items-center">
			<div>
				<span>전화번호 : ${trainerDetail.phoneNumber }</span> <br><br>
				<span>평점 :${trainerDetail.rank }</span><br><br>
				<a href="#" id="workgym-btn" data-gym-id="${trainerDetail.gymId }">##근무 체육관</a><br><br>
				<div class="d-flex">
				<button type="button" class="btn btn-success qnaBtn" data-toggle="modal" data-target="#modal"  data-trainer-id="${trainerDetail.id }">qna쓰기</button>					
				<button id="trainer-review-btn" class="btn btn-info" data-trainer-id="${trainerDetail.id }" data-trainer-name="${trainerDetail.name }">리뷰보기 </button>
				</div>
			</div>
			</div>
		</div>
	</c:forEach>
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
					<a href="#" class="btn btn-info" id="qnaTrainerEnrollBtn">등록하기</a>

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
	$(document).ready(function(){
		$('#workgym-btn').on('click', function(e){
			e.preventDefault();
			let gymId = $(this).data('gym-id');
			//alert(gymId);
			document.location.href = "/trainer/gym_detail_view?gymId=" + gymId;
		});
		
		$('#trainer-review-btn').on('click', function(e){
			e.preventDefault();
			let workoutId = $(this).data('trainer-id');
			alert(workoutId);
			let type = "trainer";
			let gymName = $(this).data('trainer-name')
			document.location.href="/review/view?workoutId=" + workoutId + "&type=" + type + "&gymName=" + gymName;
		});
		
		$('.trainer-like-btn').on('click', function(e){
			e.preventDefault();
			let workoutId = $(this).data('trainer-id');
			//alert(workoutId);
			//let userId = ${userId};
			//alert(userId);
			let type="trainer";
			$.ajax({
				url: "/like/" + workoutId,
				data:{
					"type" : type
				},
				success : function(data){
					alert(data.code);
					if (data.code == 100){
						document.location.href="/trainer/trainer_detail_view?trainerId=" + workoutId;
					}
				},error : function(e) {
					alert("트레이너 좋아요 누르기 실패 ");
				}
			});
			
		});
		$('#qnaTrainerEnrollBtn').on('click', function(e){
			e.preventDefault();
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
			let workoutId = ${id};
			alert(workoutId);
			let type = 'trainer';
			$.ajax({
				type:'post',
				url:'/qna/insert_' + type,
				data : {"title" : title, 
						"content" : content,
						"workoutId" : workoutId},
				success : function(data) {
					if (data.code == 100) {
						alert("등록 되었습니다");
						location.reload(true); 
						}
					},
				error : function(e) {
					alert("등록 실패했습니다. ");
				}
			});
		});
	});
</script>