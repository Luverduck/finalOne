<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">

	<!-- Font Awesome Link -->
	<link rel="stylesheet" type = "text/css" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.2.0/css/all.min.css"/>

    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
	
	<!-- Bootstrap CDN -->
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>
	
	<!-- jQuery CDN -->
    <script src = "https://code.jquery.com/jquery-3.6.1.js"></script>
	
	<!-- AXIOS CDN -->
	<script src="https://unpkg.com/axios/dist/axios.min.js"></script>
	
<title>
	<c:choose>
		<%-- title이라는 변수의 값이 있다면(null이 아니면) title에 입력될 값은 해당 title 변수의 값으로  --%>
		<c:when test = "${param.title != null}">
			${param.title}
		</c:when>
		<c:otherwise>
			Ahzit
		</c:otherwise>
	</c:choose>
</title>
</head>
<body>

<c:set var="login" value="${loginId != null}"></c:set>

<div class = "container" style="background-color: yellow;">
	<div class = "row">
		<div class = "col right">
			<a href="/">홈</a>
			<c:choose>
				<c:when test="${login}">
					<a href="/ahzitUser/logout">로그아웃</a>
					<a href="/ahzitUser/mypage">마이페이지</a>
				</c:when>
				<c:otherwise>
					<a href="/ahzitUser/login">로그인</a>
					<a href="/ahzitUser/join">회원가입</a>
				</c:otherwise>
			</c:choose>
		</div>
	</div>
	<div class = "row">
		<div class = "col">
			<a href = "/ahzit_in/84">게시글</a>
			<!-- <a href = "/ahzit_in/${ahzitDto.ahzitNo}">게시글</a> -->
		</div>
		<div class = "col">
			<a href = "/ahzit_in/84/album">사진첩</a>
		</div>
		<div class = "col">
			<a href = "/ahzit_in/84/calendar">일정</a>
		</div>
		<div class = "col">
			<a href = "/ahzit_in/84/attachment">첨부</a>
		</div>
		<div class = "col">
			<a href = "/ahzit_in/84/member">멤버</a>
		</div>
	</div>
</div>

<hr>