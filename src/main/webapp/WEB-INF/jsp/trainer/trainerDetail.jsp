<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<div class="container">
	<c:forEach items="${trainerDetailList }" var="trainerDetail">

		<div class="d-flex justify-content-between bg-light mt-5">
			<div>
				<h1 class="mt-5">${trainerDetail.name }</h1>
				<br> <br> <img src="/static/${trainerDetail.image }"width="400px" height="300px"> 
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
	});
</script>