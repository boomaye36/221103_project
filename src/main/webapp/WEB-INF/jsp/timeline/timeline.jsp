<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<div class="d-flex justify-content-center">
	<div class="contents-box">
		<div class="mt-5 d-flex justify-content-center align-items-center">
			<h2>지역을 선택하세요</h2>
			<select class="ml-5 " id="selectedRegion" name="selectedRegion">
				<option value="gangnam"
					<c:if test="${selectedRegion==gangnam}">selected </c:if >>강남구
				</option>
				<option value="seocho"
					<c:if test="${selectedRegion==seocho}">selected </c:if >>서초구
				</option>
				<option value="songpa"
					<c:if test="${selectedRegion==songpa}">selected </c:if >>송파구
				</option>
				<option value="kwanak"
					<c:if test="${selectedRegion==kwanak}">selected </c:if >>관악구</option>
				<option value="yongsan"
					<c:if test="${selectedRegion==yongsan}">selected </c:if >>용산구
				</option>
				<option value="mapo"
					<c:if test="${selectedRegion==mapo}">selected </c:if >>마포구
				</option>

			</select>

			<div class="mypagebox d-flex justify-content-end">
				<a href="/timeline/timeline_mypage_view" id="mypageBtn" class="ml-5"><img
					width="100" height="100"
					src="https://www.iconninja.com/files/38/267/666/profile-icon.png"></a>
			</div>
		</div>

	</div>
</div>
<div class="photo d-flex justify-content-center mt-5">
	<img width="800" height="500" src="/static/img/barbell.jpeg"
		alt="photo" id="bannerImg">
</div>

<div class="d-flex justify-content-between">
	<a href="/timeline/timeline_view" ><img src="https://www.iconninja.com/files/995/95/811/home-interface-button-symbol-icon.png"></a>
</div>
<div class="d-flex justify-content-center">
	<a href="#" class="categoryBtn btn btn-info" data-toggle="modal" data-target="#modal">카테고리 </a>

</div>

<!-- Modal -->
<div class="modal fade" id="modal">
	<%-- modal-dialog-centered 모달창을 가운데정렬, modal-sm 작은 모달창 --%>
	<div class="modal-dialog modal-dialog-centered modal-lg">
		<div class="modal-content">
			<%-- 모달 창 안에 내용 넣기 --%>
			<div class="text-center">
				<div class="my-3 border-bottom">
					<a class="m-3 modaltext" href="/gym/gym_view" id="healthBtn" data-category-id="1">헬스 </a><br>
					<a class="m-3 modaltext" href="/gym/gym_view" id="pilatesBtn" data-category-id="3">필라테스 </a><br>
					<a class="m-3 modaltext" href="/gym/gym_view" id="crossfitBtn" data-category-id="4">크로스핏 </a><br>
					<a class="m-3 modaltext" href="/gym/gym_view" id="yogaBtn" data-category-id="2">요가 </a>
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
	$(document).ready(
			function() {
				let location = $('#selectedRegion').val().trim();
				//alert(location);
				/* $('#mypageBtn').on('click', function(){
					//e.preventDefault();
					let 
				}); */

				let bannerList = [ "/static/img/barbell.jpeg",
						"/static/img/medicine_ball.jpeg",
						"/static/img/rope.jpeg",
						"/static/img/running_machine.jpeg" ];
				let currentIndex = 0;

				/* setInterval(function() {
					//console.log(currentIndex);
					currentIndex++;
					$('#bannerImg').attr('src', bannerList[currentIndex]);
					
					if (currentIndex >= bannerList.length) {
						currentIndex = 0;
					}
				}, 3000); */
				
				$('#modal #healthBtn').on('click', function(e){
					e.preventDefault();
					//let categoryId = 1;
					let categoryId = $(this).data('category-id');
					//alert(categoryId);
					$.ajax({
						type:"post",
						url:"/gym/create",
						data:{"location" : location,
							"categoryId" : categoryId},
						success:function(data){
							if(data.code == 100){
								location.href="/gym/gym_view";
							}
						},error : function(e){
							alert("다시 시도해주세요 ");
						}
					});
				});
				$('#modal #pilatesBtn').on('click', function(e){
					e.preventDefault();
					//let categoryId = 3;
					let categoryId = $(this).data('category-id');
					//alert(categoryId);
					$.ajax({
						type:"post",
						url:"/gym/create",
						data:{"location" : location,
							"categoryId" : categoryId},
						success:function(data){
							if(data.code == 100){
								location.href="/gym/gym_view";
							}
						},error : function(e){
							alert("다시 시도해주세요 ");
						}
					});
				});
				$('#modal #crossfitBtn').on('click', function(e){
					e.preventDefault();
					//let categoryId = 4;
					let categoryId = $(this).data('category-id');
					//alert(categoryId);
					$.ajax({
						type:"post",
						url:"/gym/create",
						data:{"location" : location,
							"categoryId" : categoryId},
						success:function(data){
							if(data.code == 100){
								location.href="/gym/gym_view";
							}
						},error : function(e){
							alert("다시 시도해주세요 ");
						}
					});
				});
				$('#modal #yogaBtn').on('click', function(e){
					e.preventDefault();
					//let categoryId = 2;
					let categoryId = $(this).data('category-id');
					//alert(categoryId);
					$.ajax({
					type:"post",
					url:"/gym/create",
					data:{"location" : location,
						"categoryId" : categoryId},
					success:function(data){
						if(data.code == 100){
							location.href="/gym/gym_view";
						}
					},error : function(e){
						alert("다시 시도해주세요 ");
					}
				});
				
				});
			});
</script>