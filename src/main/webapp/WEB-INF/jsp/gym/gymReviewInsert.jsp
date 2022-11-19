<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<div class="container">
	<textarea id="content" placeholder="내용을 입력하세요 "></textarea>
	<div class="d-flex justify-content-between">
		<button class="btn btn-info insertBtn">등록하기 </button>
		<button class="btn btn-danger cancelBtn">취소하기  </button>
	</div>
</div>

<script>
	$(document).ready(function(){
		$('.insertBtn').on('click', function(){
			let workoutId = ${gymId};
			let type = "gym";
			let content = $('#content').val().trim();
			if (content == ''){
				alert("내용을 입력하세요 ");
				return;
			}
			$.ajax({
				type:'post',
				url : '/review/create',
				data: {"workoutId" : workoutId,
					"type" : type,
					"content" : content},
				success:function(data){
					if (data.code == 100){
					alert("리뷰가 저장되었습니다. ");
					document.location.href="/review/view?workoutId=" + workoutId + "&type=" + type +"&gymName=${gymName}";	
					}
				}
				,error:function(e){
					alert("리뷰 저장에 실패했습니다.");
				}
				
			});
		});
		$('.cancelBtn').on('click', function(){
			let workoutId = ${gymId};
			//alert(gymId);
			let type = "gym";
			let gymName = '${gymName}';
			//alert(gymName);
			document.location.href="/review/view?workoutId=" + workoutId + "&type=" + type +"&gymName=" + gymName;	
					});
	});
</script>