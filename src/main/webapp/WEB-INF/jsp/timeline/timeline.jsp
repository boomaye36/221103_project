<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<form id="locationCategoryForm" method="post" action="/gym/gym_view">
	<div class="d-flex justify-content-center">
		<div class="contents-box">

			<div class="mt-5 d-flex justify-content-center align-items-center">
				<h2>지역을 선택하세요</h2>
				<select class="ml-5 " id="selectedRegion" name="selectedRegion">
					<option value="gangnam">강남구</option>
					<option value="seocho">서초구</option>
					<option value="songpa">송파구</option>
					<option value="kwanak">관악구</option>
					<option value="yongsan">용산구</option>
					<option value="mapo">마포구</option>
					<option value="seongdong">성동구</option>
				</select>
				<input type="text" class="ml-5" id="searchName" >
				<button class="search-btn btn btn-success ml-2">검색하기 </button>
				<div class="mypagebox d-flex justify-content-end">
					<a href="/timeline/timeline_mypage_view" id="mypageBtn"
						class="ml-5"><img width="100" height="100"
						src="https://www.iconninja.com/files/38/267/666/profile-icon.png"></a>
				</div>
			</div>

		</div>
	</div>
	<div class="photo d-flex justify-content-center mt-5">
		<img width="800" height="500" src="/static/img/barbell.jpeg"
			alt="photo" id="bannerImg">
	</div>

	
	<div class="d-flex justify-content-center">
		<a href="#" class="categoryBtn btn btn-info" data-toggle="modal"
			data-target="#modal">카테고리 </a>
		<a href="#" class="goodsBtn btn btn-success ml-5" >상품보기</a>
	</div>

	<!-- Modal -->
	<div class="modal fade" id="modal">
		<%-- modal-dialog-centered 모달창을 가운데정렬, modal-sm 작은 모달창 --%>
		<div class="modal-dialog modal-dialog-centered modal-lg">
			<div class="modal-content">
				<%-- 모달 창 안에 내용 넣기 --%>
				<div class="text-center">
					<div class="my-3 border-bottom">
						<a class="m-3 modaltext" href="#" id="healthBtn"
							data-category-id="1">헬스 </a><br> <a class="m-3 modaltext"
							href="#" id="pilatesBtn" data-category-id="3">필라테스 </a><br>
						<a class="m-3 modaltext" href="#" id="crossfitBtn"
							data-category-id="4">크로스핏 </a><br> <a class="m-3 modaltext"
							href="#" id="yogaBtn" data-category-id="2">요가 </a>
					</div>
					<div class="py-3">
						<%-- data-dismiss="modal" 모달창 닫힘 --%>
						<a class="m-3 modaltext" href="#" data-dismiss="modal">취소</a>
					</div>
				</div>

			</div>

		</div>
	</div>
	<%-- <div class="modal fade" id="12">
		modal-dialog-centered 모달창을 가운데정렬, modal-sm 작은 모달창
		<div class="modal-dialog modal-dialog-centered modal-lg">
			<div class="modal-content">
				모달 창 안에 내용 넣기
				<div class="text-center">
					<div class="my-3 border-bottom">
						<a class="m-3 modaltext" href="#" id="healthBtn"
							data-category-id="1">헬스 </a><br> <a class="m-3 modaltext"
							href="#" id="pilatesBtn" data-category-id="3">필라테스 </a><br>
						<a class="m-3 modaltext" href="#" id="crossfitBtn"
							data-category-id="4">크로스핏 </a><br> <a class="m-3 modaltext"
							href="#" id="yogaBtn" data-category-id="2">요가 </a>
					</div>
					<div class="py-3">
						data-dismiss="modal" 모달창 닫힘
						<a class="m-3 modaltext" href="#" data-dismiss="modal">취소</a>
					</div>
				</div>

			</div>

		</div>
	</div> --%>
</form>
<script>
	$(document).ready(
			function() {

				//alert(location);

				let bannerList = [ "/static/img/barbell.jpeg",
						"/static/img/medicine_ball.jpeg",
						"/static/img/rope.jpeg",
						"/static/img/running_machine.jpeg" ];
				let currentIndex = 0;

				setInterval(function() {
					//console.log(currentIndex);
					currentIndex++;
					$('#bannerImg').attr('src', bannerList[currentIndex]);

					if (currentIndex >= bannerList.length) {
						currentIndex = 0;
					}
				}, 3000);

				$('#modal #healthBtn').on(
						'click',
						function(e) {
							e.preventDefault();
							let location = $('#selectedRegion option:selected')
									.val();
							//alert(location);
							let categoryId = $(this).data('category-id');
							//alert(categoryId);
							document.location.href = "/gym/gym_view?location="
									+ location + "&categoryId=" + categoryId;

						});
				$('#modal #pilatesBtn').on(
						'click',
						function(e) {
							e.preventDefault();
							let location = $('#selectedRegion option:selected')
									.val();
							//alert(location);
							let categoryId = $(this).data('category-id');
							//alert(categoryId);
							document.location.href = "/gym/gym_view?location="
									+ location + "&categoryId=" + categoryId;

						});
				$('#modal #crossfitBtn').on(
						'click',
						function(e) {
							e.preventDefault();
							let location = $('#selectedRegion option:selected')
									.val();
							//alert(location);
							let categoryId = $(this).data('category-id');
							//alert(categoryId);
							document.location.href = "/gym/gym_view?location="
									+ location + "&categoryId=" + categoryId;

						});
				$('#modal #yogaBtn').on(
						'click',
						function(e) {
							e.preventDefault();
							let location = $('#selectedRegion option:selected')
									.val();
							//alert(location);
							let categoryId = $(this).data('category-id');
							//alert(categoryId);
							document.location.href = "/gym/gym_view?location="
									+ location + "&categoryId=" + categoryId;

						});
				$('.goodsBtn').on('click', function(e){
					e.preventDefault();
					document.location.href="/goods/select_view";
				});
				
				$('.search-btn').on('click', function(e){
					e.preventDefault();
					let name = $('#searchName').val().trim();
					//let location = $("#selectedRegion option:selected").text();
					document.location.href="/timeline/timeline_search?name=" + name;
				});

			});
</script>