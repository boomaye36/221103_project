<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<div class="container">
	<div class="d-flex">
		<div>
		<c:forEach items="${cartViewList }" var="card">
				<div class="d-flex m-5 border border-success my-goods-box">
					<h3 class="text-info">${card.goods.name }</h3>
					<img class="m-5" src="/static/${card.goods.image }" width="300px"
						height="200px">
					<h3 class="text-warning mr-5">갯수  : ${card.cart.count }개 </h3>
					<h3>가격 ${card.goods.price }원 </h3>
				<button class="goods-del-btn btn btn-danger ml-5" data-goods-id="${card.cart.id }">삭제하기 </button>
				
				</div>
			</c:forEach>
		</div>
		<%-- <div>
			<c:forEach items="${cartList }" var="cart">
				
				<div class="d-flex m-5 border border-success goods-count-box justify-content-between">
					<h3 class="text-warning mr-5">갯수  : ${cart.count }개 </h3>
					<button class="goods-del-btn btn btn-danger ml-5" data-goods-id="${cart.id }">삭제하기 </button>
 				</div>
 
			</c:forEach>

		</div> --%>
	</div>
		<%-- <c:forEach items="${cartViewList }" var="card">
			${card.goods.price }
			${card.goods.name }
			${card.cart.count }
		</c:forEach>
	 --%>
</div>
<script>
	$(document).ready(function(e){
		$('.goods-del-btn').on('click', function(e){
			e.preventDefault();
			let goodsId = $(this).data('goods-id');
			//alert(goodsId);
			$.ajax({
				type : 'post',
				url : "/goods/delete",
				data : {"goodsId" : goodsId},
				success:function(data){
					if (data.code == 100){
						location.reload(true);
					}
				}
				
			});
		});
		
	});
</script>