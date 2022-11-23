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
				</div>
				<br> <br> <br> <b>${trainerDetail.introduce }</b>
			</div>
			<div class="d-flex align-items-center">
			<div>
				<span>전화번호 : ${trainerDetail.phoneNumber }</span> <br><br>
				<span>평점 :${trainerDetail.rank }</span><br><br>
				<a href="#" id="workgym-btn" data-gym-id="${trainerDetail.gymId }">##근무 체육관</a><br><br>
				<button id="trainer-review-btn" class="btn btn-info" data-trainer-id="${trainerDetail.id }" data-trainer-name="${trainerDetail.name }">리뷰보기 </button>
			</div>
			</div>
		</div>
	</c:forEach>
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
	});
</script>