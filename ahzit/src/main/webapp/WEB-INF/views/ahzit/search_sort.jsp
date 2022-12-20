<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%-- header.jsp 불러오기 --%>
<jsp:include page="/WEB-INF/views/template/header.jsp">
	<jsp:param value="메인페이지" name="title"/>
</jsp:include>

<style>
/*    * { 
   		font-family: 'NanumSquareAc', sans-serif ;
   	}  */
   	.ahzit-img {
   		width:100%;
   		height:300px;
   	}
   /* 이미지 슬라이더 */
   .main-img {
    	height: 100%;
   }
    .swiper {
        width: 800px;
        height: 400px;
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
        font-family: Varela Round;
        background: #f1f1f1;
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
        background: #FFA91C;
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
</style>


<div class = "container-fluid mt-3">
	<div class = "row">
		<div class = "col-8 offset-2">

			<div class="row mt-4">
				<div class="col-lg-4 offset-lg-4 col-md-6 offset-md-3 col-sm-8 offset-sm-2">
					<div class="p-4 rounded">
						<h1 class="text-center">아지트</h1>	
					</div>
				</div>
			</div>
			
			<div class = "row mt-4">
		
				<div class = "col-1">
					<a href="search_sort?keyword=취미"><img src="/images/hobby.png"  class="sort-img">취미</a>
				</div>
			
				<div class = "col-1">
					<a href="search_sort?keyword=스터디"> <img src="/images/study.png"  class="sort-img">스터디</a>
				</div>
				
				<div class = "col-1">
					<a href="search_sort?keyword=일상"><img src="/images/life-smile.png"  class="sort-img">일상</a>
				</div>
				
				<div class = "col-1">
					<a href="search_sort?keyword=팬클럽"><img src="/images/fanclub.png"  class="sort-img">팬클럽</a>
				</div>
				
				<div class = "col-1">
					<a href="search_sort?keyword=음악"><img src="/images/music.png"  class="sort-img">음악</a>
				</div>
				
				<div class = "col-1">
					<a href="search_sort?keyword=스포츠"><img src="/images/sports.png"  class="sort-img">스포츠</a>
				</div>
				
				<div class = "col-1">
					<a href="search_sort?keyword=여행"><img src="/images/travel.png"  class="sort-img">여행</a>
				</div>
				
				<div class = "col-1">
					<a href="search_sort?keyword=맛집"><img src="/images/eat.png"  class="sort-img">맛집</a>
				</div>
				
				<div class = "col-1">
					<a href="search_sort?keyword=영화">영화</a>
				</div>
				
			</div>
	
		 <div class="row">
		<c:forEach var="searchSortAhzit" items="${searchSortAhzit}">
		 <div class="mt-4 col-xl-4 col-lg-6 col-md-6 col-sm-6">
              <div class="card-sl">
                  <div class="card-image">  <%--아지트 이미지 --%>
                      <img src = "/attachment/download/ahzit?attachmentNo=${searchSortAhzit.ahzitAttachmentNo}"  onerror=" this.onerror=null; this.src='/images/bg_default.jpg';" class="ahzit-img">
                  </div>
                  <a class="card-action" href="${pageContext.request.contextPath}/ahzit_in/${searchSortAhzit.ahzitNo}">
                  <%--아지트 종류에 따른 아이콘 --%>
                  <c:if test="${searchSortAhzit.ahzitSort == '취미'}"><img src="/images/hobby.png"  class="sort-img"></c:if>
                  <c:if test="${searchSortAhzit.ahzitSort == '스터디'}"><img src="/images/study.png"  class="sort-img"></c:if>
                  <c:if test="${searchSortAhzit.ahzitSort == '일상'}"><img src="/images/life-smile.png"  class="sort-img"></c:if>
                  <c:if test="${searchSortAhzit.ahzitSort == '팬클럽'}"><img src="/images/fanclub.png"  class="sort-img"></c:if>
                  <c:if test="${searchSortAhzit.ahzitSort == '음악'}"><img src="/images/music.png"  class="sort-img"></c:if>
                  <c:if test="${searchSortAhzit.ahzitSort == '스포츠'}"><img src="/images/sports.png"  class="sort-img"></c:if>
                  <c:if test="${searchSortAhzit.ahzitSort == '여행'}"><img src="/images/travel.png"  class="sort-img"></c:if>
                  <c:if test="${searchSortAhzit.ahzitSort == '맛집'}"><img src="/images/eat.png"  class="sort-img"></c:if>
                  </a>
                  <div class="card-heading"> <%--아지트 이름 --%>
                      ${searchSortAhzit.ahzitName} 
                  </div>
                  <div class="card-text-1">  <%--아지트 멤버 수 , 종류 --%>
                      멤버${searchSortAhzit.ahzitHead} &nbsp;${searchSortAhzit.ahzitSort}
                  </div>
                  <div class="card-text-2"> <%--아지트 지역 --%>
                    <i class="fa-solid fa-location-dot"></i> ${searchSortAhzit.ahzitRegionHigh} ${allAhzitList.ahzitRegionLow} 
                  </div>
              </div>
             </div>
		 </c:forEach>
					
		</div>
	</div>
</div>

<%-- footer --%>
<jsp:include page="/WEB-INF/views/template/footer.jsp"></jsp:include>