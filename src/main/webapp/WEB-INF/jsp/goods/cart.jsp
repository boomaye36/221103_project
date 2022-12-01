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
				<button class="goods-info-btn btn d-none" data-goods-name="${card.goods.name}" data-goods-quantity="${card.cart.count }" data-goods-price="${card.cart.count * card.goods.price}" data-goods-id="${card.goods.id }"> </button>
				
				</div>
				
			</c:forEach>
<%-- 			<%int lastPrice  = (int)  %>

 --%>		<div class="d-flex">
 			
 			<h3 class="text-success m-5">총 가격 : ${amountPrice}₩</h3>
 			<a class="btn btn-secondary coupon-btn" data-toggle="modal"
			data-target="#modal">쿠폰 적용하기 </a>
 			<button class="btn btn-info buy-button ml-5" data->구입하기</button> 
 			</div>
 		</div>
		
	</div>
		
</div>
<div class="modal fade" id="modal">
		<%-- modal-dialog-centered 모달창을 가운데정렬, modal-sm 작은 모달창 --%>
		<div class="modal-dialog modal-dialog-centered modal-lg">
			<div class="modal-content">
				<%-- 모달 창 안에 내용 넣기 --%>
				<div class="text-center">
					<div class="my-3 border-bottom">
						<a class="m-3 modaltext" href="#" id="5percentcoupon"
							data-price="${amountPrice*0.95 }">5% 쿠폰  </a><br> <a class="m-3 modaltext"
							href="#" id="10percentcoupon" data-price="${amountPrice*0.90 }" >10% 쿠폰 </a><br>
						<a class="m-3 modaltext" href="#" id="15percentcoupon"
							data-price="${amountPrice*0.85 }">15% 쿠폰 </a>
					</div>
					<div class="py-3">
						<%-- data-dismiss="modal" 모달창 닫힘 --%>
						<a class="m-3 modaltext" href="#" data-dismiss="modal">취소</a>
					</div>
				</div>

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
		$('.buy-button').on('click', function(e){
			e.preventDefault(); 
			let amount = ${amountPrice};
			

			alert("총 금액 :" + amount + "원 구매되었습니다.");
			$('.goods-info-btn').click();
			
		});
		$("#5percentcoupon").on('click', function(e){
			e.preventDefault(); 
			let price = $(this).data('price');
			let percent = 0.95;
			document.location.href="/goods/cart_view?percent=" + percent; 			
			alert("총가격 " + price + "원 적용되었습니다.");
	
		});
		$("#10percentcoupon").on('click', function(e){
			e.preventDefault(); 
			let price = $(this).data('price');
			let percent = 0.9;
			document.location.href="/goods/cart_view?percent=" + percent; 			
			alert("총가격 " + price + "원 적용되었습니다.");
		});
		$("#15percentcoupon").on('click', function(e){
			e.preventDefault(); 
			let price = $(this).data('price');
			let percent = 0.85;
			document.location.href="/goods/cart_view?percent=" + percent; 			
			alert("총가격 " + price + "원 적용되었습니다.");

		});
		$('.goods-info-btn').on('click',function(e){
			let name = $(this).data('goods-name');
			//alert("sdf");
			let quantity = $(this).data('goods-quantity');
			let price = $(this).data('goods-price');
			let goodsId = $(this).data('goods-id');
			let amount = ${amountPrice};

			//alert(amount);
			
			alert("상품 이름 : " + name 
					+"\n상품 개수 : " + quantity 
					+"\n금액 : " + price + "원");
			$.ajax({
				type : 'post',
				url : "/goods/buy_insert",
				data : {"quantity" : quantity,
						"goodsId" : goodsId},
				success:function(data){
					if (data.code == 100){
						document.location.href="/goods/buy_view?amount=" + amount;
					}
				}
			});
		});
		
	});
</script>