<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<h1 class="bg-info font-weight-bold p-3 mt-5">${gymName}</h1>
<div class="container mt-5">
	<div class="d-flex justify-content-between">
		<div class="d-flex">

			<img src="/static/${gymImage}" width="400px" height="300px"> 
			<a href="#" class="like-btn ml-3"><img
				src="https://www.iconninja.com/files/527/809/128/heart-icon.png"
				width="50px"></a>
		</div>
		<div>
			<h3>등록 개월을 선택하세요</h3>
			<select class="ml-5 selectMonth mt-5">
				<option value="3">3</option>
				<option value="6">6</option>
				<option value="9">9</option>
				<option value="12">12</option>
			</select><br>
			<button type="button" class="btn btn-info enrollBtn">등록하기</button>
			<br>

		</div>

	</div>

	<%-- <dl>
	<dt>${gymIntroduce }</dt>
	<br><br>
	<dd> - ${gymPhoneNumber }</dd>
	<dd> - ${gymLocation }</dd>
	</dl> --%>
	<br> <br>
	<div class="d-flex">
		<ul class="list-group detail-list mt-5">
			<li class="list-group-item active">${gymIntroduce }</li>

			<li class="list-group-item">${gymPhoneNumber }</li>
			<li class="list-group-item">${gymLocation }</li>
		</ul>
		<div class="d-flex">
			<button type="button" class="btn btn-info reviewViewBtn">리뷰보기</button>
<!-- 		<button type="button" class="btn btn-info reviewWriteBtn">리뷰쓰기 </button>
 -->		</div>
	</div>
	
</div>
<script>
	$(document)
			.ready(
					function(e) {
						$('.enrollBtn')
								.on(
										'click',
										function(e) {
											e.preventDefault();

											let month = $(
													'.selectMonth option:selected')
													.val();
											
											$.ajax({
														type : 'POST',
														url : '/enroll/create',
														data : {
															"month" : month
														},
														success : function(data) {
															if (data.code == 100) {
																alert("등록 되었습니다");
																document.location.href = "/gym/gym_view?location=${location}&categoryId=${categoryId}";

															}
														},
														error : function(e) {
															alert("등록 실패했습니다. ");
														}
													});
											
				
				});
						$('.reviewViewBtn').on('click', function(e){
							e.preventDefault();
							let workoutId = ${gymId};
							//alert(gymId);
							let type = "gym";
							let gymName = '${gymName}';
							//alert(gymName);
							document.location.href="/review/view?workoutId=" + workoutId + "&type=" + type +"&gymName=" + gymName;	
						});
						$('.like-btn').on('click', function(e){
							e.preventDefault();
							let userId = ${userId};
							//alert (userId);
							if (userId ==''){
								alert("로그인을 해주세요 ");
								document.location.href="/user/sign_in_view";
								return;
							}
							let workoutId = ${gymId};
							let type = "gym";
							//alert(workoutId);
							$.ajax({
								url:"/like/" + workoutId,
								data : {"type" : type},
								success:function(data)	{
									if(data.code == 100 ){
										location.reload(true);
									}else{
										alert(data.errorMessage);
									}
								},error : function(e){
									alert("체육관 좋아요 누르기 실패 ");
								}
							});
						});
						
					});
</script>