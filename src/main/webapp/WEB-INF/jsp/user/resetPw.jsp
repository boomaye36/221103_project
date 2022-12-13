<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<div class="container">
	<div class="d-flex justify-content-center align-items-center m-5" >
	<span >아이디   </span>
	<input type="text" class="form-control idInput ml-5" >
	</div>
	<div class="d-flex justify-content-center align-items-center m-5" >
	<span >비밀번호  </span>
	<input type="password" class="form-control pwInput ml-5" >
	<div  id="pwcf" class="ml-5 small text-danger d-none">비밀번호 특수문자, 문자, 숫자 포함 형태의 5~10자로 입력하세요 </div>
	
	</div>
	
	<div class="d-flex justify-content-center align-items-center m-5" >
	<span >비밀번호 확인  </span>
	<input type="password" class="form-control pwConfirm ml-5" >
	
	</div>
		<div class="d-flex justify-content-center">
		<button class="btn btn-dark resetPw">비밀번호 재설정 </button>
		</div>
	</div>
	
<script>
$(document).ready(function(){
	
	function validpw(userPw){
		 var val_pw = /^.*(?=^.{5,10}$)(?=.*\d)(?=.*[a-zA-Z])(?=.*[!@#$%^&+=]).*$/;
		 return val_pw.test(userPw);
	 }
	$('.resetPw').on('click', function(e){
		e.preventDefault();
		
		let loginId = $('.idInput').val().trim();
		let password = $('.pwInput').val().trim();
		let pwConfirm = $('.pwConfirm').val().trim();
		
		if (loginId == ''){
			alert("아이디를 입력하세요");
			return false;
		}
		if (password == ''){
			alert("비밀번호를 입력하세요");
			return false;
		}
		
		if (pwConfirm == ''){
			alert("비밀번호확인을 입력하세요");
			return false;
		}
		if (password != pwConfirm){
			alert("비밀번호가 일치하지 않습니다.");
			return false;
		}
		if (!validpw(userPw)){
			 $('#pwcf').removeClass('d-none');

			 return false;
		 }
		$.ajax({
			type : 'post',
			url : '/user/pw_reset',
			data : {"password" : password,
				"loginId" : loginId},
			success : function(data){
				if (data.code == 100){
					alert("비밀번호가 변경되었습니다. ");
				document.location.href="/user/sign_in_view";	
				}
			}
			
		});
	});
});


</script>