<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
    <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
    
    
    
<div class="container p-3">
	<div class="d-flex justify-content-center m-5 " >
		<div class="d-flex justify-content-center">
		<h3 class="serviceNo">이용중인 서비스 ${enrollCount}개</h3>
		</div>
	<div class="p-4 m-5">
	<div class="d-flex justify-content-center mt-5">
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
					<a href="#" class="mypage-gym-btn" data-gym-id="${mygym.id}" data-gym-location="${mygym.location}">${mygym.name}</a>
				</td>
			</tr>
			</c:forEach>
			
		</tbody>
	</table>
	<table class="table myGymTable">
		<thead>
			<tr><th>체육관 등록개월수 </th>
				<th>등록한 날짜 </th>
				<th>등록 취소 </th>
			</tr>
		</thead>
		<tbody>
			<c:forEach items="${myEnrollList }" var="myenroll">
				<tr>
					
					<td>${myenroll.month }개월</td>
					<td><fmt:formatDate pattern="yyyy-MM-dd" value="${myenroll.createdAt }"/></td>
					<td><a href="#" class="btn btn-warning delBtn" data-toggle="modal" data-target="#modal" data-enroll-id="${myenroll.id}">등록취소</a></td>
				</tr>
			</c:forEach>
			</tbody>
	</table>
	</div>
	
	</div>
	</div>
</div>
<!-- Modal -->
<div class="modal fade" id="modal">
	<div class="modal-dialog modal-dialog-centered modal-lg">
		<div class="modal-content">
			<div class="text-center">
				<div class="my-3 border-bottom">
					<a class="m-3 modaltext" href="#" id="enrolldeleteBtn"  ><span class="text-danger">삭제하기</span></a><br>
				</div>
				<div class="py-3">
					<a class="m-3 modaltext"href="#" data-dismiss="modal">취소</a>
				</div>

			</div>
		</div>
	</div>
</div>
<script>
$(document).ready(function(e){

	$('.mypage-gym-btn').on('click', function(e){
		e.preventDefault();
		let gymId = $(this).data('gym-id');
		//alert(gymId);
		let location = $(this).data('gym-location');
		//alert(location);
		document.location.href="/gym/detail_view?gymId=" + gymId + "&location=" + location;	});
	$('.delBtn').on('click', function(e){
		e.preventDefault();
		let enrollId = $(this).data('enroll-id');
		$('#modal').data('enroll-id', enrollId);
	});
	$('#modal #enrolldeleteBtn').on('click', function(e){
		e.preventDefault();
		let enrollId = $('#modal').data('enroll-id');
		alert(enrollId);
		alert('정말 등록을 취소하시겠습니까?');
		//alert(enrollId);
		$.ajax({
			type : 'post',
			url : '/enroll/delete',
			data : {"enrollId" : enrollId},
			success : function(data){
				if (data.code == 100){
					alert("등록이 취소되었습니다. ");
					location.reload(true);
				}
			}
		});
		});
	});
</script>