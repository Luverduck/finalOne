<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<c:set var="login" value="${loginId != null}"></c:set>

<div>
	<c:choose>
		<c:when test="${login}">
			<a href="/">홈</a>
			<a href="/ahzitUser/logout">로그아웃</a>
			<a href="/ahzitUser/mypage">마이페이지</a>
		</c:when>
		<c:otherwise>
			<a href="/">홈</a>
			<a href="/ahzitUser/login">로그인</a>
		</c:otherwise>
	</c:choose>

</div>

<div>
	<a href = "/freeboard/list">자유게시판</a>
</div>
