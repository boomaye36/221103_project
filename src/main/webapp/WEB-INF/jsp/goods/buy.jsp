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
	</c:forEach>
	<h3 class="text-info"> 배송비 : 2500원 <br><br> 
							총 결제금액 : ${amountPrice + 2500 }원 
	</h3>
</div>