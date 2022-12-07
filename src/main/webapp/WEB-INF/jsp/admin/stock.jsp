<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"
	integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4="
	crossorigin="anonymous"></script>

<!-- bootstrap -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css"
	integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm"
	crossorigin="anonymous">
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js"
	integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q"
	crossorigin="anonymous"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"
	integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl"
	crossorigin="anonymous"></script>
<link rel="stylesheet" type="text/css" href="/static/css/style.css">
</head>
<body>

	<div class="d-flex align-items-center mt-5">
			<label for="goodsId" class="goodsId"  ><b>상품 no</b> </label>	
			<input type="text" id="goodsId" class="form-control" placeholder="내용을 입력해주세요. ">
		</div>
	<div class="d-flex align-items-center mt-5">
			<label for="count" class="count"  ><b>상품 수량 </b> </label>	
			<input type="text" id="count"  class="form-control" placeholder="내용을 입력해주세요. ">
		</div>
		<div class="d-flex justify-content-center">
		
		<button type="button" id="stockBtn" class="btn btn-info mt-3 ">등록하기  </button>
		</div>
		
		
		<script>
			$(document).ready(function(){
				$('#stockBtn').on('click', function(e){
					e.preventDefault();
					let goodsId = $('#goodsId').val().trim();
					let count = $('#count').val().trim();
					if (goodsId==''){
						alert("상품번호를 입력하세요 ");
						return false;
					}
					if (count==''){
						alert("수량을 입력하세요 ");
						return false;
					}
					$.ajax({
						type : "post",
						url : "/admin/admin_stock",
						data : {"goodsId" : goodsId, "count" : count},
						success : function(data) {
							if (data.code == 100) {
								alert("추가되었습니다");
								location.reload();
							} 
						}
						
					});
				});
			});
		</script>
</body>


</html>