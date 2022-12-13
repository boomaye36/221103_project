<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>



<div class="container">
<h2 class="text-info"><U>검색결과 ${count }개 </U></h2>
<c:if test="${switchstatus == true }">
<c:set var="i" value="0" />
	<c:set var="j" value="2" />
	<table class="table">
	  <c:forEach items="${searchList }" var="search">
	    <c:if test="${i%j == 0 }">
	    <tr>
	    </c:if>
	     <td class="mr-5">	    <a class="text-dark" href="/gym/detail_view?gymId= ${search.id }&location= ${search.location}">
	     ${search.name }<br>전화번호 : ${search.phoneNumber }<br>평점 : ${search.rank }</a></td>
	       <td class="ml-5"><a href="/gym/detail_view?gymId= ${search.id }&location= ${search.location}"><img src="/static/${search.image }"></a></td>
	    <c:if test="${i%j == j-1 }">
	    </tr>
	    </c:if>
	    <c:set var="i" value="${i+1 }" />
	  </c:forEach>
	</table>
</c:if>
<c:if test="${switchstatus == false }">
<c:set var="i" value="0" />
	<c:set var="j" value="2" />
	<table class="table">
	  <c:forEach items="${searchList }" var="search">
	    <c:if test="${i%j == 0 }">
	    <tr>
	    </c:if>
	     <td class="mr-5">	    <a class="text-dark" href="/trainer/trainer_detail_view?trainerId=${search.id }">
	     ${search.name }<br>전화번호 : ${search.phoneNumber }<br>평점 : ${search.rank }</a></td>
	       <td class="ml-5"><a href="/trainer/trainer_detail_view?trainerId=${search.id }"><img src="/static/${search.image }"></a></td>
	    <c:if test="${i%j == j-1 }">
	    </tr>
	    </c:if>
	    <c:set var="i" value="${i+1 }" />
	  </c:forEach>
	</table>
</c:if>
</div>