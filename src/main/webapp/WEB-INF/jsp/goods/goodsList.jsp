<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
    
<div class="container">
	<div>
		<c:forEach items="${goodsViewList }" var="goods">
			<div class="d-flex m-5 border border-success">
			<h3 class="text-info">${goods.goods.name }</h3><br><br>
			<img class="m-5" src="/static/${goods.goods.image }" width="300px" height="200px">
			<div class="m-5">
			<div class="d-flex">
			<h4 class="mt-5">${goods.goods.price}₩</h4>
			
			<c:choose>
			
			<c:when test="${goods.stock.count < 10}">
				<h4 class="text-danger m-5 ml-5">남은 갯수 : ${goods.stock.count }개 </h4>
			</c:when>
			<c:otherwise>
			<h4 class="text-warning m-5 ml-5">남은 갯수 : ${goods.stock.count}개 </h4>
			</c:otherwise>
			</c:choose>
			</div>
			<button class="btn btn-success cartBtn mt-5" data-goods-id="${goods.goods.id }">장바구니 담기</button>
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
					document.location.href="/user/sign_in_view";
				}
			});
			
		});
	});
</script>