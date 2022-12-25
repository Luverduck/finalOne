<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%-- header.jsp 불러오기 --%>
<jsp:include page="/WEB-INF/views/template/header.jsp">
	<jsp:param value="메인페이지" name="title"/>
</jsp:include>

<style>
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
</style>

<div class = "container-fluid mt-3">
	<div class = "row">
		<div class = "col-8 offset-2">

			<div class="row mt-4 mb-4">
				<div class="col-lg-4 offset-lg-4 col-md-6 offset-md-3 col-sm-8 offset-sm-2 div-search-plast" data-plast = "${pLast}">
					<div class="p-4 rounded">
						<h1 class="text-center">아지트</h1>	
					</div>
				</div>
			</div>
			
			<div class = "row mt-4">
				<div class = "col">
					<div class = "d-flex justify-content-top align-items-center flex-column div-search-keyword" onclick="location.href='search';" data-keyword = "">
						<img src="/images/search.png" class="sort-img mb-1">
						<p class="text-center">전체</p>
					</div>
				</div>
				<div class = "col">
					<div class = "d-flex justify-content-top align-items-center flex-column div-search-keyword" onclick="location.href='search?keyword=취미';" data-keyword="취미">
						<img src="${pageContext.request.contextPath}/images/hobbies.png" class="sort-img mb-1">
						<p class="text-center">취미</p>
					</div>
				</div>
			
				<div class = "col">
					<div class = "d-flex justify-content-top align-items-center flex-column div-search-keyword" onclick="location.href='search?keyword=스터디';" data-keyword="스터디">
						<img src="${pageContext.request.contextPath}/images/study.png" class="sort-img mb-1">
						<p class="text-center">스터디</p>
					</div>
				</div>
				
				<div class = "col">
					<div class = "d-flex justify-content-top align-items-center flex-column div-search-keyword" onclick="location.href='search?keyword=일상';" data-keyword="일상">
						<img src="${pageContext.request.contextPath}/images/life-smile.png" class="sort-img mb-1">
						<p class="text-center">일상</p>
					</div>
				</div>
				
				<div class = "col">
					<div class = "d-flex justify-content-top align-items-center flex-column div-search-keyword" onclick="location.href='search?keyword=팬클럽';" data-keyword="팬클럽">
						<img src="${pageContext.request.contextPath}/images/fanclub.png" class="sort-img mb-1">
						<p class="text-center">팬클럽</p>
					</div>
				</div>
				
				<div class = "col">
					<div class = "d-flex justify-content-top align-items-center flex-column div-search-keyword" onclick="location.href='search?keyword=음악';" data-keyword="음악">
						<img src="${pageContext.request.contextPath}/images/music.png" class="sort-img mb-1">
						<p class="text-center">음악</p>
					</div>
				</div>
				
				<div class = "col">
					<div class = "d-flex justify-content-top align-items-center flex-column div-search-keyword" onclick="location.href='search?keyword=스포츠';" data-keyword="스포츠">
						<img src="${pageContext.request.contextPath}/images/sports.png" class="sort-img mb-1">
						<p class="text-center">스포츠</p>
					</div>
				</div>
				
				<div class = "col">
					<div class = "d-flex justify-content-top align-items-center flex-column div-search-keyword" onclick="location.href='search?keyword=여행';" data-keyword="여행">
						<img src="${pageContext.request.contextPath}/images/travel.png" class="sort-img mb-1">
						<p class="text-center">여행</p>
					</div>
				</div>
				
				<div class = "col">
					<div class = "d-flex justify-content-top align-items-center flex-column div-search-keyword" onclick="location.href='search?keyword=맛집';" data-keyword="맛집">
						<img src="${pageContext.request.contextPath}/images/eat.png" class="sort-img mb-1">
						<p class="text-center">맛집</p>
					</div>
				</div>
				
				<div class = "col">
					<div class = "d-flex justify-content-top align-items-center flex-column div-search-keyword" onclick="location.href='search?keyword=영화';" data-keyword="영화">
						<img src="${pageContext.request.contextPath}/images/movie.png" class="sort-img mb-1">
						<p class="text-center">영화</p>
					</div>	
				</div>	
			</div>
				
					
	
			 <div class="row div-ahzit-list"> <%-- 태그 붙이는 타겟 --%>
				<c:forEach var="searchSortAhzit" items="${searchSortAhzit}"> <!-- 반복문 시작 -->
				<div class="mt-4 col-xl-4 col-lg-6 col-md-6 col-sm-6" id="div-ahzit-info">
		        	<div class="card-sl">
		            	<div class="card-image">  <%--아지트 이미지 --%>
		                	<img src = "${pageContext.request.contextPath}/attachment/download/ahzit?attachmentNo=${searchSortAhzit.ahzitAttachmentNo}" onerror="this.onerror=null; this.src='/images/bg_default.jpg';" class="ahzit-img">
		               	</div>
		                <a class="card-action" href="${pageContext.request.contextPath}/ahzit/detail/${searchSortAhzit.ahzitNo}">
		                <%--아지트 종류에 따른 아이콘 --%>
		                <c:if test="${searchSortAhzit.ahzitSort == '취미'}"><img src="${pageContext.request.contextPath}/images/hobbies.png"  class="sort-img"></c:if>
		                <c:if test="${searchSortAhzit.ahzitSort == '스터디'}"><img src="${pageContext.request.contextPath}/images/study.png"  class="sort-img"></c:if>
		                <c:if test="${searchSortAhzit.ahzitSort == '일상'}"><img src="${pageContext.request.contextPath}/images/life-smile.png"  class="sort-img"></c:if>
		                <c:if test="${searchSortAhzit.ahzitSort == '팬클럽'}"><img src="${pageContext.request.contextPath}/images/fanclub.png"  class="sort-img"></c:if>
		                <c:if test="${searchSortAhzit.ahzitSort == '음악'}"><img src="${pageContext.request.contextPath}/images/music.png"  class="sort-img"></c:if>
		                <c:if test="${searchSortAhzit.ahzitSort == '스포츠'}"><img src="${pageContext.request.contextPath}/images/sports.png"  class="sort-img"></c:if>
		                <c:if test="${searchSortAhzit.ahzitSort == '여행'}"><img src="${pageContext.request.contextPath}/images/travel.png"  class="sort-img"></c:if>
		                <c:if test="${searchSortAhzit.ahzitSort == '맛집'}"><img src="${pageContext.request.contextPath}/images/eat.png"  class="sort-img"></c:if>
		                <c:if test="${searchSortAhzit.ahzitSort == '영화'}"><img src="${pageContext.request.contextPath}/images/movie.png"  class="sort-img"></c:if>
		                </a>
		                <div class="card-heading"> <%--아지트 이름 --%>
		                    ${searchSortAhzit.ahzitName} 
		                </div>
		                <div class="card-text-1">  <%--아지트 멤버 수 , 종류 --%>
		                    <span class = "span-ahzit-head">${searchSortAhzit.ahzitHead}</span> 
		                    /
		                    <span class = "span-ahzit-headmax">${searchSortAhzit.ahzitHeadmax}</span>
		                    &nbsp; 
		                    <span class = "span-ahzit-sort">#${searchSortAhzit.ahzitSort}</span>
		                </div>
		            	<div class="card-text-2"> <%--아지트 지역 --%>
		                  	<i class="fa-solid fa-location-dot"></i> 
		                  	<span class = "span-ahzit-location">${searchSortAhzit.ahzitRegionHigh} ${searchSortAhzit.ahzitRegionLow}</span>
		            	</div>
		        	</div>
	            </div>
				</c:forEach> <!-- 반복문 끝 -->
			</div>
		</div>
	</div>
</div>


<script type="text/javascript">
	
	//현재 주소
	var url_href = window.location.href;
	var url = new URL(url_href);
	
	// 요청 파라미터 변수화
	var keyword = url.searchParams.get("keyword");
	console.log(keyword);
	
	// 초기 1페이지
	var p = 1;
	
	// 특정 카테고리의 총 소모임 수
	var pLast = $(".div-search-plast").data("plast");
	//console.log(pLast);
	
	// 무한스크롤 시 3개씩만 불러오기
	var cntRow = 6;
	
	$(function(){
		
		$(window).scroll(_.debounce(function(){
			// 전체 화면 중 현재 화면의 위치(%)
			var percentage = $(window).scrollTop() / ($(document).height() - $(window).height()) * 100;
			
			// 페이지 끝 번호에 도달하면 비동기 조회 요청을 보내지 않도록 설정
			if(p == pLast) return; 
			// 화면 총 길이의 80%에 도달했을 때
			if(percentage > 80) {
				
				// 페이지 수 증가
				p = p + 1;
				
				// 태그 붙일 타겟 지정
				var target = $(".div-ahzit-list");
				
				var param = keyword;
				console.log("param = " + param);
				var url;
				if(param != null) {
					url = "${pageContext.request.contextPath}/rest_ahzit/search?p=" + p + "&cntRow=" + cntRow + "&keyword=" + param;
				} else {
					url = "${pageContext.request.contextPath}/rest_ahzit/search?p=" + p + "&cntRow=" + cntRow;
				}
				
				axios({
					url : url,
					method : "get"
				})
				.then(function(response){
					console.log(response);
					for(var i = 0 ; i < response.data.ahzitInfoList.length ; i ++) {
						// 1
						var div_outer_container = $("<div>").attr("class", "mt-4 col-xl-4 col-lg-6 col-md-6 col-sm-6");
						// 2
						var div_inner_container = $("<div>").attr("class", "card-sl");
						
						var div_ahzit_img_container = $("<div>").attr("class", "card-image");
						
						var img_ahzit_img_img;
						if(response.data.ahzitInfoList[i].ahzitAttachmentNo != 0) {
							img_ahzit_img_img = $("<img>").attr("src", "${pageContext.request.contextPath}/attachment/download/ahzit?attachmentNo=" + response.data.ahzitInfoList[i].ahzitAttachmentNo).attr("class", "ahzit-img");
						} else {
							img_ahzit_img_img = $("<img>").attr("src", "${pageContext.request.contextPath}/images/bg_default.jpg").attr("class", "ahzit-img");
						}
						// 3-1)
						var div_ahzit_img = div_ahzit_img_container.append(img_ahzit_img_img);
						
						var a_ahzit_href_container = $("<a>").attr("class", "card-action").attr("href", "${pageContext.request.contextPath}/ahzit_in/" + response.data.ahzitInfoList[i].ahzitNo);
						
						var img_ahzit_category;
						if(response.data.ahzitInfoList[i].ahzitSort == "취미") {
							img_ahzit_category = $("<img>").attr("src", "${pageContext.request.contextPath}/images/hobbies.png").attr("class", "sort-img");
						} else if(response.data.ahzitInfoList[i].ahzitSort == "스터디") {
							img_ahzit_category = $("<img>").attr("src", "${pageContext.request.contextPath}/images/study.png").attr("class", "sort-img");
						} else if(response.data.ahzitInfoList[i].ahzitSort == "일상") {
							img_ahzit_category = $("<img>").attr("src", "${pageContext.request.contextPath}/images/life-smile.png").attr("class", "sort-img");
						} else if(response.data.ahzitInfoList[i].ahzitSort == "팬클럽") {
							img_ahzit_category = $("<img>").attr("src", "${pageContext.request.contextPath}/images/fanclub.png").attr("class", "sort-img");
						} else if(response.data.ahzitInfoList[i].ahzitSort == "음악") {
							img_ahzit_category = $("<img>").attr("src", "${pageContext.request.contextPath}/images/music.png").attr("class", "sort-img");
						} else if(response.data.ahzitInfoList[i].ahzitSort == "스포츠") {
							img_ahzit_category = $("<img>").attr("src", "${pageContext.request.contextPath}/images/sports.png").attr("class", "sort-img");
						} else if(response.data.ahzitInfoList[i].ahzitSort == "여행") {
							img_ahzit_category = $("<img>").attr("src", "${pageContext.request.contextPath}/images/eat.png").attr("class", "sort-img");
						}
						
						// 3-2)
						var a_ahzit_href = a_ahzit_href_container.append(img_ahzit_category);
						
						// 3-3)
						var div_card_heading = $("<div>").attr("class", "card-heading").text(response.data.ahzitInfoList[i].ahzitName);
						
						var div_card_text_1_container = $("<div>").attr("class", "card-text-1");
						var span_ahzit_head = $("<span>").attr("class", "ahzit-head").text(response.data.ahzitInfoList[i].ahzitHead + " / ");
						var span_ahzit_headmax = $("<span>").attr("class", "ahzit_headmax").text(response.data.ahzitInfoList[i].ahzitHeadmax + " ");
						var span_ahzit_sort = $("<span>").attr("class", "span-ahzit-sort").text("#" + response.data.ahzitInfoList[i].ahzitSort);
						// 3-3)
						var div_card_text_1 = div_card_text_1_container.append(span_ahzit_head).append(span_ahzit_headmax).append(span_ahzit_sort);
						
						var div_card_text_2_container = $("<div>").attr("class", "card-text-2");
						var i_ahzit_location = $("<i>").attr("class", "fa-solid fa-location-dot");
						var span_ahzit_location = $("<span>").attr("class", "span-ahzit-location").text(response.data.ahzitInfoList[i].ahzitRegionHigh + " " + response.data.ahzitInfoList[i].ahzitRegionLow);
						// 3-4) 
						var div_card_text_2 = div_card_text_2_container.append(i_ahzit_location).append(span_ahzit_location);
						
						var div_inner = div_inner_container.append(div_ahzit_img).append(a_ahzit_href).append(div_card_heading).append(div_card_text_1).append(div_card_text_2);
						
						var div_outer = div_outer_container.append(div_inner);
						
						div_outer.css({
							position:"relative",
							top:"50px",
							opacity:0
						});
						div_outer.animate({
							top:"0px",
							opacity:1
						}, 500);

						$(".div-ahzit-list").append(div_outer);
					}
				}); 
			}
		}, 100));
		
		
	});
	
</script>

<%-- footer --%>
<jsp:include page="/WEB-INF/views/template/footer.jsp"></jsp:include>