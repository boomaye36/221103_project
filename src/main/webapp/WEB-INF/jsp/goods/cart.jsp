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
				
					<button class="minusBtn btn btn-danger" data-goods-count="${card.cart.count }" data-goods-id="${card.cart.id }" >빼기  </button>
					<button class="plusBtn btn btn-info" data-goods-count="${card.cart.count }"  data-goods-id="${card.cart.id }">더하기 </button>
					<div>
					<h3>가격 ${card.goods.price }원 </h3>
					<h4 class="text-success">총가격 : ${card.cart.count * card.goods.price}원 </h4>
					</div>
				<button class="goods-del-btn btn btn-danger ml-5" data-goods-id="${card.cart.id }">삭제하기 </button>
				
				</div>
			</c:forEach>
		</div>
		
	</div>
		
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
		$('.minusBtn').on('click', function(e){
			e.preventDefault();
			let id = $(this).data('goods-id');
			//alert(id);
			let count = $(this).data('goods-count');
			count--;
			//alert(count);
			$.ajax({
				type : 'post',
				url : "/goods/update",
				data : {"count" : count,
						"id" : id},
				success:function(data){
					if (data.code == 100){
						location.reload(true);
					}
				}
				
			});
			
		});
		$('.plusBtn').on('click', function(e){
			e.preventDefault();
			let count = $(this).data('goods-count');
			count++;
			let id = $(this).data('goods-id');

			//alert(count);
			$.ajax({
				type : 'post',
				url : "/goods/update",
				data : {"count" : count,
						"id" : id},
				success:function(data){
					if (data.code == 100){
						location.reload(true);
					}
				}
				
			});
			
		});
		
	});
</script>