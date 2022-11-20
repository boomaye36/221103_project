<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<div class="container">
	<form name="myform" id="myform" method="post">
	<fieldset>
		<span class="text-bold">별점을 선택해주세요</span>
		<input type="radio" name="reviewStar" value="1" id="rate1"><label
			for="rate1">★</label>
		<input type="radio" name="reviewStar" value="2" id="rate2"><label
			for="rate2">★</label>
		<input type="radio" name="reviewStar" value="3" id="rate3"><label
			for="rate3">★</label>
		<input type="radio" name="reviewStar" value="4" id="rate4"><label
			for="rate4">★</label>
		<input type="radio" name="reviewStar" value="5" id="rate5"><label
			for="rate5">★</label>
	</fieldset>
	
</form>				
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
			let addrank = document.getElementsByName('reviewStar');
			//alert(addrank);
			for (let i = 0; i < addrank.length; i++){
				if (addrank[i].checked){
					//(addrank[i].value);
					var rank = 6 - addrank[i].value;
					//alert(rank);
				}
			}
			alert(rank);
			$.ajax({
				type:'post',
				url : '/review/create',
				data: {"workoutId" : workoutId,
					"type" : type,
					"content" : content,
					"rank" : rank},
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