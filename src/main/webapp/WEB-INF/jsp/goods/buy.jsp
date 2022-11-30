<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
    
<div class="container">
<h2 class="text-success">${userName }님 구매목록 </h2>
	<c:forEach items="${buyViewList }" var="card">
		<div class="m-5">
			<h3>${card.goods.name }</h3>
			<img src="/static/${card.goods.image }" width="300px" height="200px">
			<b>${card.goods.price }원 X ${card.buy.count} 개  = ${card.goods.price * card.buy.count }</b>
		</div>
		<button class="goods-info-btn btn d-none"  data-buy-id="${card.buy.id }"> </button>
		
	</c:forEach>
	<h3 class="text-info"> 배송비 : 2500원 <br><br> 
							<c:if test="${amountPrice ne null}">
							총 결제금액 : ${amountPrice + 2500 }원 
							</c:if>
							${ allAmount}
						
	</h3>
	<button class="btn btn-secondary buy-confirm-btn">구매확정</button>
</div>
<script>
	$(document).ready(function(){
		$('.buy-confirm-btn').on('click', function(e){
			e.preventDefault();
			$('.goods-info-btn').click();
		});
		$('.goods-info-btn').on('click', function(e){
			e.preventDefault();

			let id = $(this).data('buy-id');
			//alert(id);
			$.ajax({
				type : 'post',
				url : "/goods/buy_delete",
				data : {"id" : id},
				success:function(data){
					if (data.code == 100){
						location.reload(true);
						alert("구매 확정되었습니다. ");
					}
				}
			});
		});
	});
</script>