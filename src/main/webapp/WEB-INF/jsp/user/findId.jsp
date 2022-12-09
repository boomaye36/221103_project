<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<div class="container">
	<div class="d-flex justify-content-center align-items-center m-5" >
	<span >이름  </span>
	<input type="text" class="form-control nameInput ml-5" >
	</div>
	<div class="d-flex justify-content-center align-items-center m-5" >
	<span >이메일  </span>
	<input type="text" class="form-control emailInput ml-5" >
	</div>
	<div class="d-flex justify-content-center align-items-center m-5">
	<span >전화번호   </span>
	<input type="text" class="form-control phoneNumberInput ml-5" >
	</div>
	<div class="d-flex justify-content-center id-find-btn">
	<button class="btn btn-dark">아이디 찾기 </button>
	</div>
</div>

<script>
$(document).ready(function(){
	$('.id-find-btn').on('click', function(e){
		e.preventDefault();
		
		let name = $('.nameInput').val().trim();
		let email = $('.emailInput').val().trim();
		let phoneNumber = $('.phoneNumberInput').val().trim();
		
		if (name == ''){
			alert("이름을 입력하세요");
			return false;
		}
		if (email == ''){
			alert("이메일을 입력하세요");
			return false;
		}
		if (phoneNumber == ''){
			alert("전화번호를 입력하세요");
			return false;
		}
		
		document.location.href="/user/show_id?email=" + email + "&phoneNumber=" + phoneNumber + "&name=" + name;	
		
	});
	
});
</script>
