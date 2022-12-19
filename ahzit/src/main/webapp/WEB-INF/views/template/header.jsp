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
  	
  	<!-- Lodash CDN -->
    <script src="https://cdnjs.cloudflare.com/ajax/libs/lodash.js/4.17.21/lodash.min.js" integrity="sha512-WFN04846sdKMIP5LKNphMaWzU7YpMyCU245etK3g/2ARYbPK9Ub18eG+ljU96qKRCWh+quCY7yefSmlkQw1ANQ==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>
   
    <style>
        * {
        	/* border : 1px dotted gray; */
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

<div class = "container-fluid py-2"> <!-- container 시작 -->
	<div class = "row mt-1"> <!-- row mt-1 시작 -->
		<div class = "col-1 offset-2 d-flex justify-content-center">
			<a href="/" class = "d-flex align-items-center">홈(로고)</a>
		</div>
		
		<div class = "col-2 d-flex bg-white rounded py-1">
			<div class = "col-11 me-1">
				<input class = "w-100 border-0 bg-white ps-3 input-allsearch" placeholder = "아지트 검색" type = "text" >
			</div>
			<div class = "col-1 bg-white">
				<button class = "fa-solid fa-magnifying-glass w-100 border-0 bg-white btn-allsearch-submit" type = "submit"></button>
			</div>
		</div>
	
		<div class = "col-3 offset-2 d-flex">
			<div class = "col d-flex justify-content-center align-items-center">
				<a href = "/search" class = "d-flex align-items-center">찾기</a>
			</div>
			<c:choose>
			<c:when test="${login}">
				<div class = "col d-flex justify-content-center">
					<a href="/ahzitUser/logout" class = "d-flex align-items-center logout">로그아웃</a>
				</div>
				<div class = "col d-flex justify-content-center">
					<a href="/ahzitUser/mypage" class = "d-flex align-items-center">마이페이지</a>
				</div>
			</c:when>
			<c:otherwise>
				<div class = "col d-flex justify-content-center">
					<a href="/ahzitUser/login" class = "d-flex align-items-center">로그인</a>
				</div>
				<div class = "col d-flex justify-content-center">
					<a href="/ahzitUser/join" class = "d-flex align-items-center">회원가입</a>
				</div>
			</c:otherwise>
			</c:choose>
		</div>
	</div> <!-- row mt-1 끝 -->
	
	<!-- 백엔드 작업 끝나면 지울 영역 -->
	<div class = "row mt-3">
		<div class = "col-8 offset-2 d-flex align-items-center justify-content-left">
			<div class = "col-3">
				<a href = "/freeboard/list">자유게시판</a>
			</div>
			<div class = "col-3">
				<a href = "/ahzit_in/84">소모임 84번 - tester111</a>
			</div>
			<c:if test="${login}">
			<div class = "col-3">
				<a href="/ahzit/create">아지트 개설</a>
			</div>
			</c:if>
		</div>
	</div>
</div> <!-- container 끝 -->



<script>

	$(function(){
		
		// header 검색창의 검색 버튼을 누를 때
		$(".btn-allsearch-submit").click(function(){
			// 검색 입력창의 값을 변수로 설정
			var keyword = $(".input-allsearch").val();
			// form을 생성하여 조회
			var form = $("<form>").attr("action", "search_keyword").attr("method", "get");
			var input = $("<input>").attr("type", "hidden").attr("name", "keyword").attr("value", keyword);
			form.append(input);
			$("body").append(form);
			form.submit();
		})
		
		 //로그아웃 버튼 클릭 시 알람
		$(".logout").click(function(e){
            var choice = confirm("로그아웃 하시겠습니까?");
            if(choice){
                return true;
                
            }
            else{
                return false;
            }
		});
	}); 
</script>