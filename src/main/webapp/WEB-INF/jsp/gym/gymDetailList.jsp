<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<h1 class="bg-info font-weight-bold p-3 mt-5">${gymName}</h1>
<div class="container mt-5">
	<div class="d-flex justify-content-between">
		<div class="d-flex">

			<img src="/static/${gymImage}" width="400px" height="300px">
			<a href="#" class="like-btn ml-3"><img src="https://www.iconninja.com/files/527/809/128/heart-icon.png" width="50px"></a> 
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
		<button type="button" class="btn btn-info reviewBtn">리뷰보기</button>

	</div>
	<div class="d-flex justify-content-between mt-5">
		<a href="/timeline/timeline_view"><img
			src="https://www.iconninja.com/files/995/95/811/home-interface-button-symbol-icon.png"></a>
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
											//alert(month);
											//let gymId = ${gymId};
											//alert(gymId);
											let location = $
											{
												location
											}
											;
											let categoryId = $
											{
												categoryId
											}
											;
											//alert(location);
											alert(category);
											$
													.ajax({
														type : 'POST',
														url : '/enroll/create',
														data : {
															"month" : month
														},
														success : function(data) {
															if (data.code == 100) {
																alert("등록 되었습니다");
																location.href = "/gym/gym_view?location="
																		+ location
																		+ "&categoryId="
																		+ categoryId;
															}
														},
														error : function(e) {
															alert("등록 실패했습니다. ");
														}
													});
										});
					});
</script>