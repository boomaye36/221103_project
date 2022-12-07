<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
 <div class="container">  
 
    <c:if test="${type == 'gym'}">
    <h2>관심 체육관 : ${LikeCount}개 </h2>
    	<c:forEach items="${LikeGymList}" var="gymlike" varStatus="status">
    	
    	<div class="flip-conver-gym">
    		<a href="#" class="btn myGym-detail-btn text-dark" data-gym-id="${gymlike.id}" data-location="${gymlike.location}">
    		
    		<br>
    		${gymlike.name }<br>
    		<img src="/static/${gymlike.image }"><br>
    	
    		
    		</a>
    		</div>
    	</c:forEach>
  </c:if>
	<c:if test="${type == 'trainer'}">
	<h2>관심 트레이너 : ${LikeCount}명 </h2>
		<c:forEach items="${LikeTrainerList}" var="trainerlike">
			<div>
				<a href="#" class="btn myTrainer-detail-btn"
					data-trainer-id="${trainerlike.id }">${trainerlike.name }</a>

			</div>
		</c:forEach>
	</c:if>
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