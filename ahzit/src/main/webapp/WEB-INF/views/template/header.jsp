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
  	
  	<!-- 폰트(이사만루체) CDN -->
  	 <link href="https://webfontworld.github.io/gonggames/EsaManru.css" rel="stylesheet">

    <style>
        * {
        	 /* border : 1px dotted gray;   */
            font-family: 'EsaManru';
            color :#3E4684;
            /* font-size : 16px !important; */
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
			<a href="/" class = "d-flex align-items-center"><img src="${pageContext.request.contextPath}/images/logo.png" class="logo-img"></a>
		</div>
		
	<div class = "col-2">
			<div class = "col search-bar">
				<input class = "w-100 input-allsearch search-box" placeholder = "아지트 검색" type = "text" >
				<button type="submit"  class ="fa-solid fa-magnifying-glass btn-allsearch-submit header-btn"></button>
			</div>
		</div>
	
		<div class = "col-4 offset-1 d-flex">
			<c:if test = "${loginGrade == '관리자' || loginGrade == '운영자'}">
			<div class = "col d-flex justify-content-center align-items-center">
				<a href = "${pageContext.request.contextPath}/admin/" class = "d-flex align-items-center header-style">관리자홈</a>
			</div>
			</c:if>
			<div class = "col d-flex justify-content-center align-items-center">
				<a href = "/search" class = "d-flex align-items-center header-style">찾기</a>
			</div>
			<c:choose>
			<c:when test="${login}">
				<div class = "col d-flex justify-content-center">
					<a href="/ahzitUser/logout" class = "d-flex align-items-center logout header-style">로그아웃</a>
				</div>
				<div class = "col d-flex justify-content-center">
					<a href="${pageContext.request.contextPath}/ahzitUser/mypage" class = "d-flex align-items-center header-style">마이페이지</a>
				</div>
			</c:when>
			<c:otherwise>
				<div class = "col d-flex justify-content-center">
					<a href="${pageContext.request.contextPath}/ahzitUser/login" class = "d-flex align-items-center header-style">로그인</a>
				</div>
				<div class = "col d-flex justify-content-center">
					<a href="${pageContext.request.contextPath}/ahzitUser/join" class = "d-flex align-items-center header-style">회원가입</a>
				</div>
			</c:otherwise>
			</c:choose>
		</div>
	</div> <!-- row mt-1 끝 -->
	
	<!-- 백엔드 작업 끝나면 지울 영역 -->
<%-- 	<div class = "row mt-3">
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
	</div> --%>
	
	<%--개설 하기 버튼 --%>
	 <div class="row" >
		<a href="${pageContext.request.contextPath}/ahzit/create" class="hover-text">
	           <div class="btn-create fixed text-center"><img src="/images/create.png" class="create-img"><p class="create">개설</p></div>
	     </a>
      </div>
        
</div> <!-- container 끝 -->



<script>

	$(function(){
		
		// header 검색창의 검색 버튼을 누를 때
		$(".btn-allsearch-submit").click(function(){
			// 검색 입력창의 값을 변수로 설정
			var keyword = $(".input-allsearch").val();
			// form을 생성하여 조회
			var form = $("<form>").attr("action", "/search_keyword").attr("method", "get");
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