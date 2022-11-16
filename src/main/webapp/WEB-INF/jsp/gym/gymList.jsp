<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<h1>${categoryName}
${categoryId }
${location }</h1>
<div class="container my-5">
	<c:forEach items="${gymList }" var="gym">
		<div class="gym-box">
			<a class="text-dark" href="/gym/detail_view"><img src="/images/_1668495267293/download (2).jpeg"width="18px" height="18px">
			<br>${gym.name}<br>${gym.location }</a>
		</div>
	</c:forEach>
	<!-- /images/_1668481573446/download (4).jpeg -->
	<div class="d-flex justify-content-center">
			<c:if test="${prevId ne 0 }">
				<a href="/gym/gym_view?prevId=${prevId }&categoryId=${categoryId}&location=${location}" class="mr-5">&lt;&lt; 이전</a>
			</c:if>
			<c:if test="${nextId ne 0 }">
				<a href="/gym/gym_view?nextId=${nextId }&categoryId=${categoryId}&location=${location}" class="mr-5">다음 &gt;&gt; </a>
			</c:if>
		</div>
</div>
