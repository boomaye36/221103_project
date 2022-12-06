<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<div class="d-flex justify-content-center">
	<div class="bg-light mt-5">
	<form id="loginForm" action="/user/sign_in" method="post">
		<div class="input-group mb-3">
			<div class="input-group-prepend">
				<span class="input-group-text">아이디</span>
			</div>
			<input type="text" class="form-control" id ="loginId" name="loginId">
		</div>

		<div class="input-group mb-3">
			<div class="input-group-prepend">
				<span class="input-group-text">비밀번호</span>
			</div>
			<input type="password" class="form-control" id="password" name="password">
		</div>
		<div class="d-flex justify-content-center">
		<button type="submit" id="signinBtn" class="btn btn-info mt-3 mr-5">로그인 </button>
		<a class="btn btn-warning ml-5" href="/user/sign_up_view">회원가입 </a>
		</div>
	</form>
	</div>
</div>

<script>
$(document).ready(function(){
	$('#loginForm').on('submit', function(e){
		e.preventDefault();
		
		let loginId = $('#loginId').val().trim();
		let password = $('#password').val().trim();
		if (loginId==''){
			alert("아이디를 입력해주세요.");
			return false;
		}
		if (password==''){
			alert("비밀번호를 입력해주세요.");
			return false;
		}
		let url = $(this).attr('action');
		let params = $(this).serialize(); 
		
		$.post(url, params)
		.done(function(data) {
			if (data.code == 100) { // 성공
				location.href = "/timeline/timeline_view"; 
			} else {
				alert(data.errorMessage);
			}
	});
	});
});
</script>