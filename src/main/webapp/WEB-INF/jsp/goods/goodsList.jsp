<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
    
<div class="container">
	<div>
		<c:forEach items="${goodsList }" var="goods">
			<div class="d-flex m-5 border border-success">
			<h3 class="text-info">${goods.name }</h3><br><br>
			<img class="m-5" src="/static/${goods.image }" width="300px" height="200px">
			<div class="m-5">
			<h4 class="mt-5">${goods.price}₩</h4>
			
			<button class="btn btn-success cartBtn mt-5" data-goods-id="${goods.id }">장바구니 담기</button>
			</div>
			</div>
		</c:forEach>
	</div>
</div>
<script>
	$(document).ready(function(e){
		$('.cartBtn').on('click', function(e){
			let goodsId = $(this).data('goods-id');
			//alert(goodsId);
			$.ajax({
				type : 'post',
				url : "/goods/cart_insert",
				data : {"goodsId" : goodsId},
				success : function(data){
					if (data.code == 100){
						alert("장바구니에 담겼습니다 ");
						href.reload(true);
					}
				},error : function(e) {
					alert("등록 실패했습니다. ");
				}
			});
			
		});
	});
</script>