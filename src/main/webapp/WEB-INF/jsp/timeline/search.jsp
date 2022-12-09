<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>



<div class="container">
<h2 class="text-info"><U>검색결과 ${count }개 </U></h2>
<c:set var="i" value="0" />
	<c:set var="j" value="2" />
	<table class="table">
	  <c:forEach items="${searchList }" var="search">
	    <c:if test="${i%j == 0 }">
	    <tr>
	    </c:if>
	       <td>${search.name }<br>전화번호 : ${search.phoneNumber }<br>평점 : ${search.rank }</td>
	       <td><img src="/static/${search.image }"></td>
	    <c:if test="${i%j == j-1 }">
	    </tr>
	    </c:if>
	    <c:set var="i" value="${i+1 }" />
	  </c:forEach>
	</table>

</div>