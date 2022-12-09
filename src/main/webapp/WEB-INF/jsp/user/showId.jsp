<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<div class="container">
	<div class="d-flex justify-content-center align-items-center">
		<h2>${name }님의 아이디는 </h2>
		<h2 class="text-info">  ${LoginId }입니다 </h2>
	</div>
	<div class="d-flex justify-content-center align-items-center mt-5">
	<a href="/user/sign_in_view">로그인 하러가기</a>
	/
	<a href="/user/reset_pw">비밀번호 재설정</a>
	
	</div>
</div>