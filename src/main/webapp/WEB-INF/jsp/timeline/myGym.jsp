<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
    
<div class="container p-3">
	<div class="d-flex justify-content-center m-5">
	
	<div class="p-4 m-5">
	
	<c:forEach items="${myGymList}" var="mygym">
		<a href="#" id="mypage-gym-btn" data-gym-id="${mygym.id}" data-gym-location="${mygym.location}">
		체육관 : ${mygym.name}
		</a>
		<br>
	</c:forEach>
	
	</div>
	<div class="m-5">
	<c:forEach items="${myEnrollList }" var="myenroll">
 	${myenroll.month }개월 <br>
 	
	</c:forEach>
	</div>
	</div>
</div>
<script>
	$('#mypage-gym-btn').on('click', function(e){
		e.preventDefault();
		//alert("dsf");
		let gymId = $(this).data('gym-id');
		//alert(gymId);
		let location = $(this).data('gym-location');
		//alert(location);

	});
</script>