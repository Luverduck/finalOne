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
	a {
		text-decoration-line : none;
	}
	 .ahzit-img {
      	width : 120px;
		height :100px;      
   }
   
   /* 이미지 슬라이더 */
     .swiper {
         width: 600px;
         height: 300px;
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
    .swiper-button-prev::after {/* 이미지 슬라이더  버튼 숨기기*/
        display: none;
    }
</style>

<c:set var="login" value="${loginId != null}"></c:set>

<div class = "container-fulid mt-3">
	<div class = "row">

		<div class = "col-8 offset-2">
			<h1>홈 화면 내용 영역</h1>

			<div class="swiper">
                <div class="swiper-wrapper">
                	<div class="swiper-slide"><img src="https://placeimg.com/600/300/any"></div>
                	<div class="swiper-slide"><img src="https://placeimg.com/600/300/animal"></div>
                	<div class="swiper-slide"><img src="https://placeimg.com/600/300/tech"></div>
                </div>
                <div class="swiper-pagination"></div>
                <div class="swiper-button-prev"></div>
                <div class="swiper-button-next"></div>
            </div>

		<h2>내가 가입한 아지트</h2>
			<div class="row">
			   	<c:forEach var="myAhzitTopN" items="${myAhzitTopN}">
			  		<img src = "/attachment/download/ahzit?attachmentNo=${myAhzitTopN.ahzitAttachmentNo}"  onerror=" this.onerror=null; this.src='/images/bg_default.jpg';" class="ahzit-img">  
					<a href="${pageContext.request.contextPath}/ahzit_in/${myAhzitTopN.ahzitNo}">
						${myAhzitTopN.ahzitNo}
						${myAhzitTopN.ahzitName} &nbsp; <%--아지트 이름 --%>
						${myAhzitTopN.ahzitSort} &nbsp; <%--아지트 종류 --%>
						${myAhzitTopN.ahzitHead} &nbsp; <%--아지트 멤버 수 --%>
					</a>
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