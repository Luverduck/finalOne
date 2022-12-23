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
    
    <!-- Summer Note CDN -->
	<script src="https://cdn.jsdelivr.net/npm/summernote@0.8.20/dist/summernote-bs5.min.js"></script>
	
	<!-- Summer Note CSS -->
	<link href="https://cdn.jsdelivr.net/npm/summernote@0.8.20/dist/summernote-bs5.min.css" rel="stylesheet">
  	

  	<!-- 폰트(이사만루체) CDN -->
  	 <link href="https://webfontworld.github.io/gonggames/EsaManru.css" rel="stylesheet">
  	
  	<!-- AXIOS CDN -->
	<script src="https://unpkg.com/axios/dist/axios.min.js"></script>

  	<!-- Lodash CDN -->
    <script src="https://cdnjs.cloudflare.com/ajax/libs/lodash.js/4.17.21/lodash.min.js" integrity="sha512-WFN04846sdKMIP5LKNphMaWzU7YpMyCU245etK3g/2ARYbPK9Ub18eG+ljU96qKRCWh+quCY7yefSmlkQw1ANQ==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>
   

    <style>
        * {
            font-family: 'EsaManru';
            color :#3E4684;
        }
        a {
			text-decoration: none;
		}
		a:link { color: #3E4684; }
		a:visited { color: #3E4684; }
		a:hover { color:  #3E4684; }
		a:active { color: #3E4684; } 
		.logo-img {
			width : 100%;
		}
		.header-style {
			 color :#3E4684;
		}
 		input::placeholder {
			color:#3E4684;
		}
		input:focus {
		    outline: 1px solid #3E4684;
		    border-radius : 2em;
		} 
		.search-bar {
			display: flex;
			flex-direction: row;
			position: relative;
		}
		.search-box {
			position : relative;
			border:2px solid #3E4684;
			border-radius: 2em; 
			width: 100%;
			height: 30px;
 			font-size: 16px;
			padding: 15px; 
		}
		.search-box > select > input{
			display: flex;
			flex-direction: row;
			flex-grow: 1;
			color :#3E4684;
		}
		.header-btn {
			position: absolute;
			margin:0.5em;
			padding:0;
			right: 0;     
			border : 0;
			background-color : white; 
		}
		.header-style {
		 	background-color : #EDEEF0; 
		}
		 .fixed {
            position: fixed;
            bottom:40px;
            right:40px;
        }
         .btn-create {
            width: 80px;
            height: 80px;
            border-radius : 50%;
            background-color: #3E4684;
            z-index : 99999;
        }
        .create-img {
        	 width:40px;
        	 margin : 0.9em 0.7em;
        }
		.create {
			color : white;
			font-size : 12px;
			margin:-1em;
			padding:0;
		}
    </style>
</head>
<body>

<c:set var="login" value="${loginId != null}"></c:set>

<div class = "container-fluid py-2 header-style"> <!-- container 시작 -->
	<div class = "row mt-1"> <!-- row mt-1 시작 -->
	
		<div class = "col-1 offset-2 d-flex justify-content-center">
			<a href="${pageContext.request.contextPath}/" class = "d-flex align-items-center"><img src="${pageContext.request.contextPath}/images/logo.png" class="logo-img"></a>
		</div>
		
		<div class = "col-4 offset-1 d-flex">
		
			<div class = "col d-flex justify-content-center align-items-center">
				<a href = "${pageContext.request.contextPath}/admin/" class = "d-flex align-items-center header-style">관리자홈</a>
			</div>
			
			<div class = "col d-flex justify-content-center align-items-center">
				<a href = "${pageContext.request.contextPath}/admin/ahzitUser" class = "d-flex align-items-center header-style">회원 관리</a>
			</div>		
			
			<div class = "col d-flex justify-content-center align-items-center">
				<a href = "${pageContext.request.contextPath}/admin/inquire" class = "d-flex align-items-center header-style">1:1문의 관리</a>
			</div>
			
			<div class = "col d-flex justify-content-center align-items-center">
				<a href = "${pageContext.request.contextPath}/admin/ahzit" class = "d-flex align-items-center header-style">아지트 관리</a>
			</div>
				
			<div class ="col d-flex justify-content-center align-items-center">
				<a href = "${pageContext.request.contextPath}/faq/list" class = "d-flex align-items-center header-style">FAQ 관리</a>
			</div>
			
			<div class = "col d-flex justify-content-center align-items-center">
				<a href = "${pageContext.request.contextPath}/notice/list" class = "d-flex align-items-center header-style">공지사항 관리</a>
			</div>
		</div>
			
	</div>
</div> <!-- row mt-1 끝 -->
