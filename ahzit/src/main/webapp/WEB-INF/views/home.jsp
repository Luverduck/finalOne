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
div {
 	border : 1px dotted gray;
}
      .ahzit-img {
         width:100%;
         height:300px;
      }
   /* 이미지 슬라이더 */
   .main-img {
       height: 100%; 
       width: 100%;
   }
    .swiper {
        width: 100%;
        height: 750px;
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
    body {
        background: #F5F5F5;
    }
    .card-sl {
        border-radius: 15px;
        box-shadow: 0 4px 8px 0 rgba(0, 0, 0, 0.2), 0 6px 20px 0 rgba(0, 0, 0, 0.19);
    }
    .card-image img {
        max-height: 100%;
        max-width: 100%;
        border-radius: 15px 15px 0px 0;
    }
    .card-action {
        position: relative;
        float: right;
        margin-top: -30px;
        margin-right: 25px;
        z-index: 2;
        color: #FFA91C;
        background: #fff;
        border-radius: 100%;
        padding: 15px;
        font-size: 15px;
        box-shadow: 0 1px 2px 0 rgba(0, 0, 0, 0.2), 0 1px 2px 0 rgba(0, 0, 0, 0.19);
    }
    .card-action:hover {
        color: #fff;
        background: #3E4684;
        -webkit-animation: pulse 1.5s infinite;
    }
    .card-heading {
        font-size: 18px;
        font-weight: bold;
        background: #fff;
        padding: 10px 15px;
    }
    .card-text-1 {
        padding: 10px 15px;
        background: #fff;
        font-size: 14px;
        color: #636262;
        border-radius: 0 0 0px 0px;
    }
    .card-text-2 {
        padding: 10px 15px;
        background: #fff;
        font-size: 14px;
        color: #636262;
        border-radius: 0 0 15px 15px;
    }
    .card-button:hover {
        text-decoration: none;
        background-color: #1D3461;
        color: #fff;
    }
    @-webkit-keyframes pulse {
       0% {
           -moz-transform: scale(0.9);
           -ms-transform: scale(0.9);
           -webkit-transform: scale(0.9);
           transform: scale(0.9);
       }
    70% {
        -moz-transform: scale(1);
        -ms-transform: scale(1);
        -webkit-transform: scale(1);
        transform: scale(1);
        box-shadow: 0 0 0 50px rgba(90, 153, 212, 0);
    }
    100% {
        -moz-transform: scale(0.9);
        -ms-transform: scale(0.9);
        -webkit-transform: scale(0.9);
        transform: scale(0.9);
        box-shadow: 0 0 0 0 rgba(90, 153, 212, 0);
       }
   } 
    .sort-img {
      width:40px;
    }
    .joined-img {
      width:20px;
    }
    .ahzit-title-name {
      font-size : 40px;
      color : #3E4684;
    }
</style>

<c:set var="login" value="${loginId != null}"></c:set>

<div class = "container-fulid mt-3">

   <div class = "col-8 offset-2 ">
      <%-- 홈 화면 내용 영역 --%>
      <%--이미지 슬라이더 --%>
      <div class="swiper mb-3">
               <div class="swiper-wrapper">
                  <div class="swiper-slide"><img src="images/main-img-1.png" class="main-img"></div>
                  <div class="swiper-slide"><img src="images/main-img-2.png" class="main-img"></div>
                  <div class="swiper-slide"><img src="images/main-img-3.png" class="main-img"></div>
                  <div class="swiper-slide"><img src="images/main-img-4.png" class="main-img"></div>
               </div>
               <div class="swiper-pagination"></div>
               <div class="swiper-button-prev"></div>
               <div class="swiper-button-next"></div>
           </div>
           
    <div class="row mt-5">
      <p class="text-center ahzit-title-name">지금 HOT한 AHZIT <i class="fa-solid fa-fire"></i></p> <%--추후 바꾸기 --%>
   </div>
   

   <div class="row mb-3">
      <a href="${pageContext.request.contextPath}/search" class="text-end">AHZIT 전부보기<i class="fa-solid fa-angles-right"></i></a>

   <c:forEach var="ahzitHeadCount" items="${ahzitHeadCount}">
    <div class="mt-4 col-xl-4 col-lg-6 col-md-6 col-sm-6">
             <div class="card-sl">
                 <div class="card-image">  <%--아지트 이미지 --%>
                     <img src = "/attachment/download/ahzit?attachmentNo=${ahzitHeadCount.ahzitAttachmentNo}"  onerror=" this.onerror=null; this.src='/images/bg_default.jpg';" class="ahzit-img">
                 </div>
                 <a class="card-action" href="${pageContext.request.contextPath}/ahzit_in/${ahzitHeadCount.ahzitNo}">
                 <%--아지트 종류에 따른 아이콘 --%>
                 <c:if test="${ahzitHeadCount.ahzitSort == '취미'}"><img src="${pageContext.request.contextPath}/images/hobbies.png"  class="sort-img"></c:if>
                 <c:if test="${ahzitHeadCount.ahzitSort == '스터디'}"><img src="${pageContext.request.contextPath}/images/study.png"  class="sort-img"></c:if>
                 <c:if test="${ahzitHeadCount.ahzitSort == '일상'}"><img src="${pageContext.request.contextPath}/images/life-smile.png"  class="sort-img"></c:if>
                 <c:if test="${ahzitHeadCount.ahzitSort == '팬클럽'}"><img src="${pageContext.request.contextPath}/images/fanclub.png"  class="sort-img"></c:if>
                 <c:if test="${ahzitHeadCount.ahzitSort == '음악'}"><img src="${pageContext.request.contextPath}/images/music.png"  class="sort-img"></c:if>
                 <c:if test="${ahzitHeadCount.ahzitSort == '스포츠'}"><img src="${pageContext.request.contextPath}/images/sports.png"  class="sort-img"></c:if>
                 <c:if test="${ahzitHeadCount.ahzitSort == '여행'}"><img src="${pageContext.request.contextPath}/images/travel.png"  class="sort-img"></c:if>
                 <c:if test="${ahzitHeadCount.ahzitSort == '맛집'}"><img src="${pageContext.request.contextPath}/images/eat.png"  class="sort-img"></c:if>
                 <c:if test="${ahzitHeadCount.ahzitSort == '영화'}"><img src="${pageContext.request.contextPath}/images/movie.png"  class="sort-img"></c:if>
                 </a>
                 <div class="card-heading"> <%--아지트 이름 --%>
                     ${ahzitHeadCount.ahzitName} 
                 </div>
                 <div class="card-text-1">  <%--아지트 멤버 수 , 종류 --%>
                     멤버${ahzitHeadCount.ahzitHead} &nbsp;${ahzitHeadCount.ahzitSort}
                 </div>
                 <div class="card-text-2"> <%--아지트 지역 --%>
                   <i class="fa-solid fa-location-dot"></i> ${ahzitHeadCount.ahzitRegionHigh} ${ahzitHeadCount.ahzitRegionLow} 
                 </div>
             </div>
            </div>
    </c:forEach>
         </div>
           
            

   <c:if test="${login}">
   <div>
      <p class="text-center ahzit-title-name">내가 가입한 AHZIT <i class="fa-solid fa-house"></i></p> 
   </div>
   
    <div class="row mb-3">
   <%--card--%>
   <a href="ahzitUser/myAhzit" class="text-end">가입한 AHZIT 전부보기<i class="fa-solid fa-angles-right"></i></a>
   <c:forEach var="myAhzitTopN" items="${myAhzitTopN}">
    <div class="mt-4 col-xl-4 col-lg-6 col-md-6 col-sm-6">
             <div class="card-sl">
                 <div class="card-image">  <%--아지트 이미지 --%>
                     <img src = "/attachment/download/ahzit?attachmentNo=${myAhzitTopN.ahzitAttachmentNo}"  onerror=" this.onerror=null; this.src='/images/bg_default.jpg';" class="ahzit-img">
                 </div>
                 <a class="card-action" href="${pageContext.request.contextPath}/ahzit_in/${myAhzitTopN.ahzitNo}">
                 <%--아지트 종류에 따른 아이콘 --%>
                 <c:if test="${myAhzitTopN.ahzitSort == '취미'}"><img src="/images/hobbies.png"  class="sort-img"></c:if>
                 <c:if test="${myAhzitTopN.ahzitSort == '스터디'}"><img src="/images/study.png"  class="sort-img"></c:if>
                 <c:if test="${myAhzitTopN.ahzitSort == '일상'}"><img src="/images/life-smile.png"  class="sort-img"></c:if>
                 <c:if test="${myAhzitTopN.ahzitSort == '팬클럽'}"><img src="/images/fanclub.png"  class="sort-img"></c:if>
                 <c:if test="${myAhzitTopN.ahzitSort == '음악'}"><img src="/images/music.png"  class="sort-img"></c:if>
                 <c:if test="${myAhzitTopN.ahzitSort == '스포츠'}"><img src="/images/sports.png"  class="sort-img"></c:if>
                 <c:if test="${myAhzitTopN.ahzitSort == '여행'}"><img src="/images/travel.png"  class="sort-img"></c:if>
                 <c:if test="${myAhzitTopN.ahzitSort == '맛집'}"><img src="/images/eat.png"  class="sort-img"></c:if>
                 <c:if test="${myAhzitTopN.ahzitSort == '영화'}"><img src="/images/movie.png"  class="sort-img"></c:if>
                 </a>
                 <div class="card-heading"> <%--아지트 이름 --%>
                     ${myAhzitTopN.ahzitName} 
                 </div>
                 <div class="card-text-1">  <%--아지트 멤버 수 , 종류 --%>
                     멤버${myAhzitTopN.ahzitHead} &nbsp;${myAhzitTopN.ahzitSort}
                 </div>
                 <div class="card-text-2"> <%--아지트 지역 --%>
                   <i class="fa-solid fa-location-dot"></i> ${myAhzitTopN.ahzitRegionHigh} ${myAhzitTopN.ahzitRegionLow} 
                 </div>
             </div>
            </div>
    </c:forEach>
         </div>
         </c:if>
   <%--홈 내용영역 끝 --%>
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