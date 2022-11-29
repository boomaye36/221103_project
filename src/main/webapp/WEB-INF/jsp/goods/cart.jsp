<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<div class="container">
	<div class="d-flex">
		<div>
			<c:forEach items="${goodsList }" var="goods">
				<div class="d-flex m-5 border border-success my-goods-box">
					<h3 class="text-info">${goods.name }</h3>
					<img class="m-5" src="/static/${goods.image }" width="300px"
						height="200px">

				</div>
			</c:forEach>
		</div>
		<div>
			<c:forEach items="${cartList }" var="cart">
				<div class="d-flex m-5 border border-success goods-count-box">

					<h3 class="text-warning">갯수  : ${cart.count }개 </h3>
					<br>
				</div>
			</c:forEach>

		</div>
	</div>
</div>