<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%-- header.jsp 불러오기 --%>
<jsp:include page="/WEB-INF/views/template/header.jsp">
	<jsp:param value="메인페이지" name="title"/>
</jsp:include>

<h1>홈 화면</h1>

<c:set var="login" value="${loginId != null}"></c:set>

<div>
	<c:choose>
		<c:when test="${login}">
			<a href="/ahzit/create">아지트 개설</a>
		</c:when>
		<c:otherwise>
		</c:otherwise>
	</c:choose>
</div>


