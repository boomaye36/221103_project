<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<div class="container p-3">

	<c:forEach items="${trainerList }" var="trainer">

			<div id="trainer-box" class="bg-light" >
				<a href="#" class="text-dark" id="trainer-detail-btn" data-trainer-id="${trainer.id }">
				<img src="/static/${trainer.image }"> <br> <br> <br>
				<b>${trainer.name}</b><br> <br> ${trainer.introduce }<br>
				</a>
				
			</div>
			
	</c:forEach>
	</div>

<script>
	$(document).ready(function(){
		$('#trainer-detail-btn').on('click', function(e){
			e.preventDefault();
			let trainerId = $(this).data('trainer-id');
			//alert(trainerId);
			document.location.href="/trainer/trainer_detail_view?trainerId=" + trainerId;
		});
	});
</script>