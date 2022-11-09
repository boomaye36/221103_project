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
<section>
<div class="container">
		<div class="d-flex align-items-center mt-5">
			<label for="name" class="gymname"  ><b>체육관 이름</b> </label>	
			<input type="text" id="name" name="name" class="form-control" placeholder="내용을 입력해주세요. ">
		</div>
		<div class="d-flex align-items-center mt-3">
			<label for="categoryId" class="gymname"  ><b>체육관 카테고리 </b> </label>	
			<input type="number" id="categoryId" name="categoryId" class="form-control" placeholder="내용을 입력해주세요. ">
		</div>
		<div class="d-flex align-items-center mt-3">
			<label for="location" class="gymname"  ><b>체육관 위치 </b> </label>	
			<input type="text" id="location" name="location" class="form-control" placeholder="내용을 입력해주세요. ">
		</div>
		<div class="d-flex align-items-center mt-3">
			<label for="phoneNumber" class="gymname"  ><b>체육관 전화번호 </b> </label>	
			<input type="text" id="phoneNumber" name="phoneNumber" class="form-control" placeholder="내용을 입력해주세요. ">
		</div>
		<div class="d-flex align-items-center mt-3">
			<label for="introduce" class="gymname"  ><b>체육관 소개 </b> </label>	
			<input type="text" id="introduce" name="introduce" class="form-control" placeholder="내용을 입력해주세요. ">
		</div>
		<div class="d-flex align-items-center mt-3">
			<label for="rank" class="gymname"  ><b>체육관 평점 </b> </label>	
			<input type="text" id="rank" name="rank" class="form-control" placeholder="내용을 입력해주세요. ">
		</div>
		<div class="d-flex justify-content-between mt-3">
			<div class="file-upload d-flex ">
					<b>체육관 이미지 </b>
					<input  type="file" id="file" class="d-none"
						accept=".gif, .jpg, .png, .jpeg">
					<a href="#" id="fileUploadBtn"><img width="35"
						src="https://cdn4.iconfinder.com/data/icons/ionicons/512/icon-image-512.png" class="ml-5"></a>

					<div id="fileName" class="ml-2"></div>
				</div>
		</div>
		<div class="d-flex justify-content-center">
		
		<button type="button" id="insertBtn" class="btn btn-info mt-3 ">추가하기 </button>
		</div>
			<a href="/timeline/timeline_view" class="btn btn-danger">돌아가기 </a>
	
</div>

<script>
$(document).ready(
		function() {
			$('#fileUploadBtn').on('click', function(e) {
				e.preventDefault(); 
				$('#file').click(); 
			});
		$('#file').on(
				'change',
				function(e) {
					//alert("change");
					let fileName = e.target.files[0].name; 
					//alert(fileName);
					let ext = fileName.split('.').pop().toLowerCase();

					if (fileName.split('.').length < 2
							|| (ext != 'gif' && ext != 'png'
									&& ext != 'jpg' && ext != 'jpeg')) {
						alert("이미지 파일만 업로드 할 수 있습니다.");
						$(this).val(''); 
						$('#fileName').text(''); 
						return;
					}

					$('#fileName').text(fileName);
				});
		$('#insertBtn').on('click', function(e){
			e.preventDefault();
			let name = $('#name').val().trim();
			let categoryId = $('#categoryId').val().trim();
			let location = $('#location').val().trim();
			let introduce = $('#introduce').val().trim();
			let rank = $('#rank').val().trim();
			let phoneNumber = $('#phoneNumber').val().trim();
			//alert(categoryId);
			if (name==''){
				alert("이름을 입력하세요 ");
				return false;
			}
			if (categoryId==''){
				alert("카테고리를 입력하세요 ");
				return false;
			}
			if (location==''){
				alert("주소를 입력하세요 ");
				return false;
			}
			if (phoneNumber==''){
				alert("전화번호를 입력하세요 ");
				return false;
			}
			if (introduce==''){
				alert("소개를 입력하세요 ");
				return false;
			}
			let file = $('#file').val();
			let ext = file.split('.').pop().toLowerCase();
			/* if ($.inArray(ext, [ 'gif', 'png', 'jpg', 'jpeg' ]) == -1) {
				alert("gif, png, jpg, jpeg 파일만 업로드 할 수 있습니다.");
				$('#file').val(''); // 파일을 비운다.
				return;
			} */
			let formData = new FormData();
			formData.append("name", name);
			formData.append("categoryId", categoryId);
			formData.append("location", location);
			formData.append("phoneNumber", phoneNumber);

			formData.append("introduce", introduce);
			formData.append("rank", rank);
			formData.append("file", $('#file')[0].files[0]);
			$.ajax({
				type : "post",
				url : "/admin/admin_gym",
				data : formData,
				enctype : "multipart/form-data" 
				,
				processData : false 
				,
				contentType : false 
				,
				success : function(data) {
					if (data.code == 100) {
						alert("추가되었습니다");
						location.href="https://naver.com"
					} 
					 else {
						alert(data.errorMessage);
					}
				},
				//error : function(e) {
					//alert("관리자에게 문의해주세요.");
				//}
			});
		});
			
		
	});
</script>
</section>
</body>
</html>