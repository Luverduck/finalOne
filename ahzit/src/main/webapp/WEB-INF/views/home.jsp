<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

  <%-- swiper CDN (이미지슬라이더)--%>
  <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/swiper@8/swiper-bundle.min.css"/>
  <script src="https://cdn.jsdelivr.net/npm/swiper@8/swiper-bundle.min.js"></script>
	
<%-- header.jsp 불러오기 --%>
<jsp:include page="/WEB-INF/views/template/header.jsp">
	<jsp:param value="메인페이지" name="title"/>
</jsp:include>

<style>
   /* 이미지 슬라이더 */
   .main-img {
    	height: 100%;
   }
    .swiper {
        width: 100%;
        height: 500px;
   }
    .swiper-slide { 
        text-align: center; 
        font-size: 18px; 
        display: flex; 
        justify-content: center; 
        align-items: center; 
    }
    .swiper-pagination-bullet { 
        width: 12px; 
        height: 12px; 
        background: 
        transparent; border: 
        1px solid white; 
        opacity: 1; 
    }
    .swiper-pagination-bullet-active { 
        width: 40px; 
        transition: width .5s; 
        border-radius: 5px; 
        background:white; 
        border: 1px solid transparent; 
    }
    .swiper-button-next, .swiper-button-prev {
        color : white;
    }
    
	.swiper-button-next::after,
    .swiper-button-prev::after {
        display: none;
    } 
    /*카드*/
     img {
       height:170px;
       width:100%;
   }
     div [class^="col-"]{
     	padding-left:5px;
     	padding-right:5px;
     }
     .card{
     	transition:0.5s;
     	cursor:pointer;
     	width : 220px;
     }
     .card-title{  
     	font-size:15px;
     	transition:1s;
     	cursor:pointer;
     }
     .card-title i{  /*지역 표시*/
     	font-size:15px;
     	cursor:pointer;
     }
     .card:hover{
     	transform: scale(1.05);
     	box-shadow: 10px 10px 15px rgba(0,0,0,0.3);
     }
     .card-text{
     	height:30px;  
     }
     .card::before, .card::after {
     	position: absolute;
     	top: 0;
     	right: 0;
    	bottom: 0;
     	left: 0;
     	transform: scale3d(0, 0, 1);
     	transition: transform .3s ease-out 0s;
     	background: rgba(255, 255, 255, 0.1);
     	pointer-events: none;
     }
     .card::before {
     	transform-origin: left top;
     }
     .card::after {
     	transform-origin: right bottom;
     }
     .card:hover::before, .card:hover::after, .card:focus::before, .card:focus::after {
     	transform: scale3d(1, 1, 1);
     }
</style>

<c:set var="login" value="${loginId != null}"></c:set>

<div class = "container-fulid mt-3">
	<div class = "row">

		<div class = "col-8 offset-2 ">
			<h1>홈 화면 내용 영역</h1>
		   <%--이미지 슬라이더 --%>
			<div class="swiper">
                <div class="swiper-wrapper">
                	<div class="swiper-slide"><img src="https://placeimg.com/600/300/any" class="main-img"></div>
                	<div class="swiper-slide"><img src="https://placeimg.com/600/300/animal" class="main-img"></div>
                	<div class="swiper-slide"><img src="https://placeimg.com/600/300/tech" class="main-img"></div>
                </div>
                <div class="swiper-pagination"></div>
                <div class="swiper-button-prev"></div>
                <div class="swiper-button-next"></div>
            </div>

		<h2>내가 가입한 아지트</h2>
		 <div class="row">
		 
		 	<c:forEach var="myAhzitTopN" items="${myAhzitTopN}">
            	<div class="mt-4 col-md-4 col-sm-6">
              		<div class="card card-block">
              			<a href="${pageContext.request.contextPath}/ahzit_in/${myAhzitTopN.ahzitNo}">
              			<h4 class="card-title text-right">&nbsp;<i class="fa-solid fa-location-dot">${myAhzitTopN.ahzitRegionHigh} &nbsp; ${myAhzitTopN.ahzitRegionLow}</i></h4>
             			<img src = "/attachment/download/ahzit?attachmentNo=${myAhzitTopN.ahzitAttachmentNo}"  onerror=" this.onerror=null; this.src='/images/bg_default.jpg';" class="ahzit-img">  
                		<h5 class="card-title  mt-3 mb-3">${myAhzitTopN.ahzitName}</h5> <%--아지트 이름 --%>
                		<p class="card-text">멤버 : ${myAhzitTopN.ahzitHead} &nbsp;${myAhzitTopN.ahzitSort}</p> <%--아지트 멤버 수 , 종류 --%>
						</a>                		
         			 </div>
            	</div>

  			</c:forEach>
  			<a href="ahzitUser/myAhzit">가입한 소모임 전부보기<i class="fa-solid fa-angles-right"></i></a>
          </div>
		<%--홈 내용영역 끝 --%>
		</div>
	</div>
</div>


<!-- jQuery CDN -->
<script src = "https://code.jquery.com/jquery-3.6.1.js"></script>
<script>
	$(function(){
	  //이미지가 없으면 기본 이미지로 대체
	  $(".ahzit-img").on("error", function(){
	    $(this).attr("src", "/images/bg_default.jpg");
	  });
	  
	  //이미지 슬라이더
	     var swiper = new Swiper('.swiper', {
	         loop: true,
	         
	         pagination: {
	             el: '.swiper-pagination',
	             clickable: true,
	         },
	         navigation: {
	             nextEl: '.swiper-button-next',
	             prevEl: '.swiper-button-prev',
	         },
	         autoplay: {
	             delay:2000 //2초마다 자동 넘김
	         }
	     });
	});
</script>

<%-- footer --%>
<jsp:include page="/WEB-INF/views/template/footer.jsp"></jsp:include>