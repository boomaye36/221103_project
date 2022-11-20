<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<h1>${categoryName}
${categoryId }
${location }</h1>
<div class="container my-5 ">
	<c:forEach items="${gymList }" var="gym">
		<div class="gym-box d-flex justify-content-center bg-light">
			<a class="text-dark gym_detail_btn" href="#" data-gym-id="${gym.id }" data-gym-location="${location}"><img src="/static/${gym.image}" width="150px" height="100px" >
			<br><span class="font-weight-bold ">#${gym.name}</span><br>#${gym.location }</a>
			<c:choose>
				<c:when test="${gym.rank >=4.5 }">
					<span class="text-info">${gym.rank }</span>
				</c:when>
				<c:when test="${gym.rank >=4.0 && gym.rank < 4.5}">
					<span class="text-success">${gym.rank }</span>
				</c:when>
				<c:when test="${gym.rank >=3.0 && gym.rank  < 4.0}">
					<span class="text-warning">${gym.rank }</span>
				</c:when>
				<c:otherwise>
					<span class="text-danger">${gym.rank }</span>
				</c:otherwise>
			</c:choose>			
			
			
 		</div>
	</c:forEach>
	
	<div class="d-flex justify-content-center">
			<c:if test="${prevId ne 0 }">
				<a href="/gym/gym_view?prevId=${prevId }&categoryId=${categoryId}&location=${location}" class="mr-5">&lt;&lt; 이전</a>
			</c:if>
			<c:if test="${nextId ne 0 }">
				<a href="/gym/gym_view?nextId=${nextId }&categoryId=${categoryId}&location=${location}" class="mr-5">다음 &gt;&gt; </a>
			</c:if>
		</div>
</div>
<script>
	$(document).ready(function(){
		$('.gym_detail_btn').on('click', function(e){
			e.preventDefault();
			let gymId = $(this).data('gym-id');
			let location = $(this).data('gym-location');
			alert(location);
			//alert(gymId);
			document.location.href = "/gym/detail_view?gymId=" + gymId +"&location=" + location;
		});
		
	});
</script>
