<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">	
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
	
	<!-- Font CDN - Noto Sans Korean -->
	<link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com">
    <link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR&display=swap" rel="stylesheet">

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
	
	<!-- Lodash CDN -->
    <script src="https://cdnjs.cloudflare.com/ajax/libs/lodash.js/4.17.21/lodash.min.js" integrity="sha512-WFN04846sdKMIP5LKNphMaWzU7YpMyCU245etK3g/2ARYbPK9Ub18eG+ljU96qKRCWh+quCY7yefSmlkQw1ANQ==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>
	
	<!-- Summer Note CDN -->
	<script src="https://cdn.jsdelivr.net/npm/summernote@0.8.20/dist/summernote-bs5.min.js"></script>
	
	<!-- Summer Note CSS -->
	<link href="https://cdn.jsdelivr.net/npm/summernote@0.8.20/dist/summernote-bs5.min.css" rel="stylesheet">
	
	<style>
        * {
            font-family: 'Noto Sans KR', sans-serif;
           	font-size : 16px !important;
        }
        a {
			text-decoration: none;
		}
    </style>
</head>
<body>

<c:set var="login" value="${loginId != null}"></c:set>

<div class = "container-fluid py-2" style="background-color:#FFA91C;">

	<div class = "row mt-1">
		<div class = "col-1 offset-2 d-flex justify-content-center">
			<a href="/" class = "d-flex align-items-center" style="color:white;" >홈(로고)</a>
		</div>
		
		<div class = "col-2 d-flex bg-white rounded py-1">
			<div class = "col-11 me-1" style="color: white;">
				<input class = "w-100 border-0 bg-white ps-3" placeholder = "아지트, 게시글 검색">
			</div>
			<div class = "col-1 bg-white">
				<button class = "fa-solid fa-magnifying-glass w-100 btn-allsearch-submit border-0 bg-white" style="color: #75758B;"></button>
			</div>
		</div>
	
		<div class = "col-3 offset-2 d-flex">
			<div class = "col d-flex justify-content-center align-items-center">
				<a href = "" class = "d-flex align-items-center" style="color:white;">찾기</a>
			</div>
			<c:choose>
			<c:when test="${login}">
				<div class = "col d-flex justify-content-center">
					<a href="/ahzitUser/logout" class = "d-flex align-items-center" style="color:white;">로그아웃</a>
				</div>
				<div class = "col d-flex justify-content-center">
					<a href="/ahzitUser/mypage" class = "d-flex align-items-center" style="color:white;">마이페이지</a>
				</div>
			</c:when>
			<c:otherwise>
				<div class = "col d-flex justify-content-center">
					<a href="/ahzitUser/login" class = "d-flex align-items-center" style="color:white;">로그인</a>
				</div>
				<div class = "col d-flex justify-content-center">
					<a href="/ahzitUser/join" class = "d-flex align-items-center" style="color:white;">회원가입</a>
				</div>
			</c:otherwise>
			</c:choose>
		</div>
	</div>
	
	<div class = "row mt-3">
		<div class = "col-2 offset-2 d-flex justify-content-center">
			<a href = "/ahzit_in/84" class = "p-2">게시글</a>
			<!-- <a href = "/ahzit_in/${ahzitDto.ahzitNo}">게시글</a> -->
		</div>
		<div class = "col-2 d-flex justify-content-center">
			<a href = "/ahzit_in/84/calendar" class = "p-2">일정</a>
		</div>
		<div class = "col-2 d-flex justify-content-center">
			<a href = "/ahzit_in/84/attachment" class = "p-2">첨부</a>
		</div>
		<div class = "col-2 d-flex justify-content-center">
			<a href = "/ahzit_in/84/member" class = "p-2">멤버</a>
		</div>
	</div>
	
</div>