<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
    
<div class="container">
<div class="d-flex justify-content-center">
	<div class="d-flex justify-content-center">
	<h3>${userName}님 오늘도 근성장 <span class="text-info">${dday}일</span> </h3>
	<a href="#" class="myBtn ml-5" data-toggle="modal" data-target="#modal" ><img src="https://www.iconninja.com/files/860/824/939/more-icon.png" width="50"></a>
	</div>
</div>
	<h3 class="text-info mt-5">주변 헬스장 top5 & 트레이너 top3</h3>
	<MARQUEE class="d-flex topGym border border-info text-dark scrolldelay=600">
		<c:forEach items="${hotGymList}" var="hot" varStatus="status">
			<div class="m-3">
			<a href="/gym/detail_view?gymId=${hot.id }&location=${hot.location}" class="text-dark">
				<c:choose>
				<c:when test="${status.count == 1}">
				<span class="text-warning"><img src="https://cdn-icons-png.flaticon.com/512/2545/2545603.png" width="30px" height="30px"> </span>
				</c:when> 
				<c:when test="${status.count == 2}">
				<span class="text-success">2위 </span>
				</c:when> 
				<c:when test="${status.count == 3}">
				<span class="text-info">3위 </span>
				</c:when>
				<c:when test="${status.count == 4}">
				<span class="text-dark">4위 </span>
				</c:when>
				<c:when test="${status.count == 5}">
				<span class="text-dark">5위 </span>
				</c:when>
				
				</c:choose>
				
				<b>${hot.name }</b><br>
				<img src="/static/${ hot.image}" width="150" height="100">
				</a>
			
			</div>
		</c:forEach>
		<c:forEach items="${hotTrainerList}" var="hot" varStatus="status">
			<a href="/trainer/trainer_detail_view?trainerId=${hot.id }" class="text-dark">
		
			<c:choose>
				<c:when test="${status.count == 1}">
				<span class="text-warning"><img src="https://cdn-icons-png.flaticon.com/512/2583/2583344.png" width="30px" height="30px"> </span>
				</c:when> 
				<c:when test="${status.count == 2}2">
				<span class="text-warning"><img src="https://cdn-icons-png.flaticon.com/128/2583/2583319.png" width="30px" height="30px"> </span>
				</c:when> 
				<c:when test="${status.count == 3}">
				<span class="text-warning"><img src="https://cdn-icons-png.flaticon.com/128/2583/2583434.png" width="30px" height="30px"> </span>
				</c:when> 
			</c:choose>
			${hot.name }<br>
			<img src="/static/${ hot.image}" width="150" height="100">
			</a>
		</c:forEach>
	</MARQUEE>

	<div class="d-flex align-items-center mt-5 reviewManageBox">
		<button type="button" class="btn btn-success " id="cart-btn">장바구니  </button>
		<button type="button" class="btn btn-warning " id="buy-btn">구매목록  </button>
		<button type="button" class="btn btn-info" id="review-manage-btn">리뷰 관리 </button>
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
					<a class="m-3 modaltext" href="#" id="healthBtn" >이용중인 서비스 </a><br>
					<a class="m-3 modaltext" href="#" id="gymLikeBtn" >관심 체육관  </a><br>
					<a class="m-3 modaltext" href="#" id="trainerLikeBtn" >관심 트레이너 </a><br>
					<a class="m-3 modaltext" href="#" id="myQna" >나의 Qna </a><br>
					<a class="m-3 modaltext" href="/user/sign_out"  >로그아웃 </a>
				</div>
				<div class="py-3">
					<%-- data-dismiss="modal" 모달창 닫힘 --%>
					<a class="m-3 modaltext"href="#" data-dismiss="modal">취소</a>
				</div>

			</div>
		</div>
	</div>
</div>
<script>
	$(document).ready(function(){
		$('#healthBtn').on ('click', function(e){
			e.preventDefault();
			document.location.href="/timeline/enroll_view"
		});
		
		$('#gymLikeBtn').on('click', function(e){
			e.preventDefault();
			let type="gym";
			
			document.location.href="/timeline/gym_like_view?type=" + type;
		});
		$('#trainerLikeBtn').on('click', function(e){
			e.preventDefault();
			let type="trainer";
			
			document.location.href="/timeline/trainer_like_view?type=" + type;
		});
		$('#review-manage-btn').on('click', function(e){
			e.preventDefault();
			document.location.href="/timeline/myReview"
		});
		$('#buy-btn').on('click', function(e){
			e.preventDefault();
			let amount = 0;
			
			//alert (amount);
			document.location.href="/goods/buy_view?amount=" + amount;
		});
		$('#cart-btn').on('click', function(e){
			e.preventDefault();
			let percent = 1.0;
			document.location.href="/goods/cart_view?percent=" + percent;
		});
		$('#myQna').on('click', function(e){
			e.preventDefault();
			document.location.href="/qna/qna_view";		
		});
	});
	
</script>