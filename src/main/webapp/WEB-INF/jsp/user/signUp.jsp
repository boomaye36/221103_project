<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<div>
	<div class="container d-flex justify-content-center">
		<form id="signUpForm" method="post" action="/user/sign_up">
		<h2>회원가입 </h2>
		<div class="form-group p-4">
			<div class="d-flex  m-5">
			<label for="userId">아이디:</label>
			
				<input class="ml-4" type="text" id="userId" name="userId" placeholder="아이디를 입력해주세요 ">
				<button type="button" id="duplicateBtn" class="btn btn-info ml-3">중복 확인 </button>
				<div  id="idcheckLength" class="ml-5 small text-danger d-none">4자 이상으로 입력하세요.</div>
				<div  id="duplicateNo" class="ml-5 small text-danger d-none">중복된 아이디입니다 .</div>
				<div id="confirmOk" class="ml-5 small text-success d-none">사용 가능한 아이디입니다 .</div>
			</div>
			
			<div class="d-flex  m-5">
				<label for="userPw">비밀번호: </label>
				<input class="ml-4" type="password" id="userPw" name="userPw" class="form-control">	
				<div  id="pwcheck" class="ml-5 small text-danger d-none">비밀번호 특수문자, 문자, 숫자 포함 형태의 5~10자로 입력하세요 </div>
				
			</div>
			<div class="d-flex  m-5">
				<label for="userPwConfirm">비밀번호 확인: </label>
				<input class="ml-4" type="password" id="userPwConfirm" name="userPwConfirm" class="form-control">
			</div>	
			
			<div class="d-flex  m-5">
				<label for="name">이름: </label>
				<input class="ml-4" type="text" id="name" name="name" class="form-control" placeholder="이름을 입력해주세요.">
			</div>	
			<div class="d-flex  m-5">
				<label for="email ">이메일: </label>
				<input class="ml-4" type="text" id="email" name="email" class="form-control" placeholder="이메일을 입력해주세요.">
				
			</div>
			<div class="d-flex  m-5">
				<label for="phoneNumber ">전화번호: </label>
				<input class="ml-4" type="text" id="phoneNumber" name="phoneNumber" class="form-control">
				
			</div>
			
			<div class="d-flex align-items-right">	
			<button type="submit" id="signupBtn" class="btn btn-info mt-3 ">회원가입  </button>
			</div>
			
		</div>
		</form>
	</div>
</div>

<script>
$(document).ready(function(){
	
	function validEmail(email){
		 var val_email = /^([0-9a-zA-Z_\.-]+)@([0-9a-zA-Z_-]+)(\.[0-9a-zA-Z_-]+){1,2}$/;
		 return val_email.test(email);
	 }
	function validpw(userPw){
		 var val_pw = /^.*(?=^.{5,10}$)(?=.*\d)(?=.*[a-zA-Z])(?=.*[!@#$%^&+=]).*$/;
		 return val_pw.test(userPw);
	 }
	function validPn(phoneNumber){
		 var val_pn = /^\d{3}-\d{3,4}-\d{4}$/;
		 return val_pn.test(phoneNumber);
	 }
	$('#duplicateBtn').on('click', function(){
		let userId = $('#userId').val().trim();
	if (userId.length < 4){
		$('#idcheckLength').removeClass('d-none');
		$('#duplicateNo').addClass('d-none');
		$('#confirmOk').addClass('d-none');
		return;
	}
	$.ajax({
		url:"/user/is_duplicated_id"
		,data:{"userId":userId}
		,success:function(data){
			if (data.result == true){
				// 중복일 때
				$('#idCheckLength').addClass('d-none'); //경고문구 노출
				$('#duplicateNo').removeClass('d-none'); 
				$('#confirmOk').addClass('d-none'); 
			}else{
				$('#idCheckLength').addClass('d-none'); //경고문구 노출
				$('#duplicateNo').addClass('d-none'); 
				$('#confirmOk').removeClass('d-none'); 				
		}
		}
	, error:function(e){
		alert("아이디 중복확인에 실패했습니다.");
	}
	});
});
	
	$('#signUpForm').on('submit', function(e){
		e.preventDefault();
		let userId = $('#userId').val().trim();
		let userPw = $('#userPw').val().trim();
		let userPwConfirm = $('#userPwConfirm').val().trim();
		let name = $('#name').val().trim();
		let email = $('#email').val().trim();
		let phoneNumber = $('#phoneNumber').val().trim();
		if (userId == ''){
			 alert("아이디를 입력하세요");
			 return false;
		 }
		 if (userPw == '' || userPwConfirm==''){
			 alert("비밀번호를 입력하세요");
			 return false;
		 }
		 if (userPw != userPwConfirm){
			 alert("비밀번호가 일치하지 않습니다");
			 return false;
		 }
		 if (!validpw(userPw)){
			 $('#pwcheck').removeClass('d-none');
			 return false;
		 }
		 if (name == ''){
			 alert("이름을 입력하세요");
			 return false;
		 }
		 if (email == ''){
			 alert("이메일을 입력하세요");
			 return false;
		 }else{
			 if (!validEmail(email)){
				 alert("이메일 형식에 맞게 입력해주세요 ");
				 return false;
			 }
		 }
		 
		 if (phoneNumber == ''){
			 alert("전화번호를 입력하세요");
			 return false;
		 }else {
			 if (!validPn(phoneNumber)){
				 alert("형식에 맞지 않는 번호입니다. ")
				 return false;
			 }
		 }
		 
		 if ($('#confirmOk').hasClass('d-none') === true){
				alert("아이디 중복확인을 다시 해주세요.");
				return;
			}
		 
		 let url = $(this).attr('action');
		 let params = $(this).serialize();
		
		 //console.log(params);
		 $.post(url, params)
			.done(function(data) {
				if (data.code == 100){
					alert("가입을 환영합니다! 로그인해주세요.");
					location.href="/user/sign_in_view";
				}else{
					alert("가입에 실패했습니다.");
				}
		 });

	});
});
</script>