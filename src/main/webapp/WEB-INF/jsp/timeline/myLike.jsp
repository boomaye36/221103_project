<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
    
    <c:if test="${type == 'gym'}">
    	<c:forEach items="${LikeGymList}" var="gymlike">
    		${gymlike.name }
    	</c:forEach>
  </c:if>
    <c:if test="${type == 'trainer'}">
    	<c:forEach items="${LikeTrainerList}" var="trainerlike">
    		${trainerlike.name }
    	</c:forEach>
  </c:if>
  