<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<link rel="stylesheet" href="https://code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
        <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<h1 class="bg-info font-weight-bold p-3 mt-5">${gymName}</h1>
<div class="container mt-5">
	<div class="d-flex justify-content-between">
		<div class="d-flex">

			<img src="/static/${gymImage}" width="400px" height="300px">
			<button class="btn like-btn ml-3" data-gym-id="${gymId }"
				data-location="${location}">

				<c:if test="${isLike eq true}">
					<img
						src="https://www.iconninja.com/files/507/847/828/like-icon.png"
						width="30px" height="30px" alt="good" class="like">
				</c:if>
				<c:if test="${isLike eq false}">
					<img
						src="https://www.iconninja.com/files/186/930/395/like-icon.png"
						width="30px" height="30px" alt="not good" class="like">
				</c:if>
			</button>


		</div>


		<div>
			<div>
				<span class="ml-2 text-info">좋아요 ${likeCount}개 </span>
			</div>


			<div class="d-flex align-items-center justify-content-center mt-3">
				<h3>등록 개월을 선택하세요</h3>
				<select class="ml-5 selectMonth ">
					<option value="3">3개월</option>
					<option value="6">6개월</option>
					<option value="9">9개월</option>
					<option value="12">12개월</option>
				</select><br>
				
			</div>
			<div class="d-flex justify-content-center align-items-center mt-3">
                <label for="startDate"><img class="mr-3 mt-3" src="https://cdn-icons-png.flaticon.com/128/3652/3652191.png" width="50px">
                </label>
                <input type=text class="form-control col-4 mt-3" id="startDate">
                
            </div>
			<div class="d-flex align-items-center justify-content-center">

				<button type="button" class="btn btn-success trainer_view_btn"
					data-gym-id="${gymId}">트레이너 보기</button>
				<button type="button" class="btn btn-info enrollBtn">등록하기</button>
				<br>
			</div>

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
		<div class="d-flex detailgymBox">
			<a class="btn reviewViewBtn"><img src="https://cdn-icons-png.flaticon.com/128/8743/8743831.png"><br>리뷰보기</a>
			<a  class="btn qnaBtn"
				data-toggle="modal" data-target="#modal"><img src="https://www.iconninja.com/files/160/730/465/qna-icon.png"><br>qna쓰기</a>
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
					<a href="#" class="btn btn-info" id="qnaEnrollBtn">등록하기</a>

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
	$(document)
			.ready(function(e) {
				$('.enrollBtn').on('click',function(e) {
						e.preventDefault();
						let month = $('.selectMonth option:selected').val();
						let gymId = ${gymId};
						
						let jsDate = $('#startDate').datepicker('getDate');
						if (jsDate !== null) { // if any date selected in datepicker
						    jsDate instanceof Date; // -> true
						    jsDate.getDate();
						    jsDate.getMonth();
						    jsDate.getFullYear();
						}
						let dateString = $.datepicker.formatDate("yy-mm-dd ", jsDate);

						//alert(dateString);


											$.ajax({
														type : 'POST',
														url : '/enroll/create',
														data : {
															"month" : month,
															"gymId" : gymId,
															"dateString" : dateString
														},
														success : function(data) {
															if (data.code == 100) {
																alert("등록 되었습니다");
																//document.location.href = "/gym/gym_view?location=${location}&categoryId=${categoryId}";
																location.reload(true);
															}
														},
														error : function(e) {
															alert("등록 실패했습니다. ");
														}
													});

										});
						$('.reviewViewBtn')
								.on(
										'click',
										function(e) {
											e.preventDefault();
											//alert(${gymId});
											let workoutId = ${gymId};
											//alert(gymId);
											let type = "gym";
											let gymName = '${gymName}';
											//alert(gymName);
											document.location.href = "/review/view?workoutId="
													+ workoutId
													+ "&type="
													+ type
													+ "&gymName="
													+ gymName;
										});
						$('.like-btn').on('click', function(e) {
							e.preventDefault();
							//alert(${gymId});
							//alert('${isLike}');
							let userId = ${userId};
							//alert (userId);
							let gymId = $(this).data('gym-id');
							let location = $(this).data('location');
							alert(location);
							if (userId == '') {
								alert("로그인을 해주세요 ");
								document.location.href = "/user/sign_in_view";
								return;
							}
							let workoutId =${gymId};
							let type = "gym";
							//alert(workoutId);
							$.ajax({
								url : "/like/" + workoutId,
								data : {
									"type" : type
								},
								success : function(data) {
									//alert("좋아");
								//alert(data.code);
									  if (data.code == 100){
											//alert("좋아요 ");
											

									document.location.href="/gym/detail_view?gymId="+gymId+"&location="+location;
									  
									  }	  
									//location.href="/gym/like";
								}
									/* if (data.isLiked == true){
									      document.getElementById("like").src = "https://www.iconninja.com/files/186/930/395/like-icon.png";

									}
									
									else {
									      document.getElementById("like").src = "https://www.iconninja.com/files/507/847/828/like-icon.png";

									} */
									
								,
								error : function(e) {
									alert("체육관 좋아요 누르기 실패 ");
								}
							});
						});
		$('.trainer_view_btn').on('click',function(e){
			e.preventDefault();
			let gymId = $(this).data('gym-id');
			//alert(gymId);
			
			document.location.href = "/trainer/trainer_view1?gymId=" + gymId;
			
		});
		$('#qnaEnrollBtn').on('click', function(e){
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
			let workoutId = ${gymId};
			let type = 'gym';
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
		
		$.datepicker.setDefaults({
            dayNamesMin: ['일', '월', '화', '수', '목', '금', '토'] // 요일을 한글로 변경
            , dateFormat: 'yy-mm-dd'
        });

        // 오늘 날짜로 이동하는 함수
        $.datepicker._gotoToday = function(id) {
            $(id).datepicker('setDate', new Date()).datepicker('hide').blur();
        };

		
        $('#startDate').datepicker({
            showButtonPanel: true // 오늘 버튼 노출
            , minDate:0 // 오늘과 그 이후만 선택 가능

            // 시작일이 선택되는 순간 종료일의 minDate 변경
            , onSelect:function(dateText) {
                $('#endDate').datepicker('option', 'minDate', dateText);
            }
        });

        $('#endDate').datepicker({
            minDate:0 
        });
					});
</script>