<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
 <div class="container">  
 
    <c:if test="${type == 'gym'}">
    <h2>관심 체육관 : ${LikeCount}개 </h2>
    	
    	
    <c:set var="i" value="0" />
	<c:set var="j" value="2" />
	<table class="table">
    	<c:forEach items="${LikeGymList}" var="gymlike" varStatus="status">
	    <c:if test="${i%j == 0 }">
	    <tr>
	    </c:if>
	     <td class="mr-5">	    <a class="text-dark" href="/gym/detail_view?gymId= ${gymlike.id }&location= ${gymlike.location}">
	     ${gymlike.name }<br>전화번호 : ${gymlike.phoneNumber }<br>평점 : ${gymlike.rank }</a></td>
	       <td class="ml-5"><a href="/gym/detail_view?gymId= ${gymlike.id }&location= ${gymlike.location}"><img src="/static/${gymlike.image }"></a></td>
	    <c:if test="${i%j == j-1 }">
	    </tr>
	    </c:if>
	    <c:set var="i" value="${i+1 }" />
	  </c:forEach>
	</table>
    	</c:if>
    <c:if test="${type == 'trainer'}">
    <h2>관심 트레이너 : ${LikeCount}명</h2>
    	
    	
    <c:set var="i" value="0" />
	<c:set var="j" value="2" />
	<table class="table">
    	<c:forEach items="${LikeTrainerList}" var="trainerlike" varStatus="status">
	    <c:if test="${i%j == 0 }">
	    <tr>
	    </c:if>
	     <td class="mr-5">	    <a class="text-dark" href="/trainer/trainer_detail_view?trainerId=${trainerlike.id }">
	     ${trainerlike.name }<br>전화번호 : ${trainerlike.phoneNumber }<br>평점 : ${trainerlike.rank }</a></td>
	       <td class="ml-5"><a href="/trainer/trainer_detail_view?trainerId=${trainerlike.id }"><img src="/static/${trainerlike.image }"></a></td>
	    <c:if test="${i%j == j-1 }">
	    </tr>
	    </c:if>
	    <c:set var="i" value="${i+1 }" />
	  </c:forEach>
	</table>
    	</c:if>
    	
    		
    		
	<%-- <c:if test="${type == 'trainer'}">
	<h2>관심 트레이너 : ${LikeCount}명 </h2>
		<c:forEach items="${LikeTrainerList}" var="trainerlike">
			<div>
				<a href="#" class="btn myTrainer-detail-btn"
					data-trainer-id="${trainerlike.id }">${trainerlike.name }</a>

			</div>
		</c:forEach>
	</c:if> --%>
</div> 
 
 <script>
 	$(document).ready(function(){
 		
 		$('.myGym-detail-btn').on('click', function(e){
 			e.preventDefault();
 			let gymId = $(this).data('gym-id');
 			let location = $(this).data('location');
 			let array = [];
 			array = location.split(" ");
 			//alert(array.length);
 			let area = array[1];
 			//alert(area);
 			if (area == '강남구'){
 				area = 'gangnam';
 			}else if (area == '서초구 '){
 				area = 'seocho';
 			
 			}else if (area == '송파구 '){
 				area = 'songpa';
 			}
 			else if (area == '관악구'){
 				area = 'kwanak';
 			
 			}else if (area == '용산구'){
 				area = 'yongsan';
 			
 			}else if (area == '마포구'){
 				area = 'mapo';
 			}else {
 				area = 'seongdong';
 			}
 			document.location.href="/gym/detail_view?gymId=" + gymId + "&location=" + area;
 		});
 		$('.myTrainer-detail-btn').on('click', function(e){
 			e.preventDefault();
			let trainerId = $(this).data('trainer-id');
			document.location.href="/trainer/trainer_detail_view?trainerId="+trainerId;
			});
			});
 		
 	

 </script>