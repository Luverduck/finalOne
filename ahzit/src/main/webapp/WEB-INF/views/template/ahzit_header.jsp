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
	
	<style>
        a {
			text-decoration: none;
		}
		.ahzit-header-style {
			background-color : #E4E4E4;
		}
    </style>
</head>
<body>

<c:set var="login" value="${loginId != null}"></c:set>
<%-- 
<div class = "container-fluid py-2" style="background-color:#FFA91C;">

	<div class = "row mt-1">
		<div class = "col-1 offset-2 d-flex justify-content-center">
			<a href="/" class = "d-flex align-items-center" style="color:white;" >홈(로고)</a>
		</div>
		
		<div class = "col-2 d-flex bg-white rounded py-1">

			<div class = "col-11 me-1" style="color: white;">
				<input class = "w-100 border-0 bg-white ps-3 input-allsearch" placeholder = "아지트 검색">
			</div>
			<div class = "col-1 bg-white">
				<button class = "fa-solid fa-magnifying-glass w-100 border-0 bg-white btn-allsearch-submit" style="color: #75758B;"></button>

			</div>
		</div>
	
		<div class = "col-3 offset-2 d-flex">
			<div class = "col d-flex justify-content-center align-items-center">

				<a href = "/search" class = "d-flex align-items-center" style="color:white;">찾기</a>

			</div>
			<c:choose>
			<c:when test="${login}">
				<div class = "col d-flex justify-content-center">
        
					<a href="/ahzitUser/logout" class = "d-flex align-items-center logout" style="color:white;">로그아웃</a>

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
	</div> --%>

<div class = "container-fluid">	
	<div class = "row mt-1 ahzit-header-style">
		<div class = "col-2 offset-2 d-flex justify-content-center">
			<a href = "/ahzit_in/${ahzitNo}" class = "p-2">게시글</a>
			<!-- <a href = "/ahzit_in/${ahzitDto.ahzitNo}">게시글</a> -->
		</div>
		<div class = "col-2 d-flex justify-content-center">
			<a href = "/ahzit_in/${ahzitNo}/calendar" class = "p-2">일정</a>
		</div>
		<div class = "col-2 d-flex justify-content-center">
			<a href = "/ahzit_in/${ahzitNo}/attachment" class = "p-2">첨부</a>
		</div>
		<div class = "col-2 d-flex justify-content-center">
			<a href = "/ahzit_in/${ahzitNo}/member" class = "p-2">멤버</a>
		</div>
	</div>
	
</div>



<script>

    //로그아웃 버튼 클릭 시 알람
	$(function(){
		
		// 로그아웃 시 경고창
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