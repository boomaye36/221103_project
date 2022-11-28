<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
    
<div class="container p-3">
	<div class="d-flex justify-content-center m-5">
	<h3>이용중인 서비스 ${enrollCount}개</h3>
	<div class="p-4 m-5">
	<div class="d-flex justify-content-center ">
	<table class="table">
		<thead>
			<tr>
				<th>체육관 이름 </th>
			</tr>
		</thead>
		<tbody>
			<c:forEach items="${myGymList}" var="mygym">
			
			<tr>
				<td>		
					<a href="#" id="mypage-gym-btn" data-gym-id="${mygym.id}" data-gym-location="${mygym.location}">${mygym.name}</a>
				</td>
			</tr>
			</c:forEach>
			
		</tbody>
	</table>
	<table class="table">
		<thead>
			<tr><th>체육관 등록개월수 </th></tr>
		</thead>
		<tbody>
			<c:forEach items="${myEnrollList }" var="myenroll">
				<tr>
					<td>${myenroll.month }개월</td>
				</tr>
			</c:forEach>
			</tbody>
	</table>
	</div>
	
	</div>
	</div>
</div>
<script>
	$('#mypage-gym-btn').on('click', function(e){
		e.preventDefault();
		//alert("dsf");
		let gymId = $(this).data('gym-id');
		alert(gymId);
		let location = $(this).data('gym-location');
		//alert(location);
		document.location.href="/gym/detail_view?gymId=" + gymId + "&location=" + location;

	});
</script>