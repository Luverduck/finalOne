<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<%-- header.jsp 불러오기 --%>
<jsp:include page="/WEB-INF/views/template/header.jsp">
	<jsp:param value="메인페이지" name="title" />
</jsp:include>

<style>
	body {
		 background-color: #F5F5F5;	 
	}
	* {
		ont-family: font-family : 'Gothic A1', sans-serif;
	}
	.pagination{
	justify-content : center
	}
	.ahzit-img {
		width: 200px;
		height: 200px;
		border-radius : 15px;
	}
	.div-thumnail-size {
		width : 220px;
	}
	.div-search-shape {
		border-redius : 15px;
	}
</style>

<div class="container-fluid mt-5 mb-5">
	<div>
		<div class="col-8 offset-2">
			<div >
				<%-- 가운데 내용 --%>
				<div class="col-6-center">
					<div class="fs-3 mt-3 mb-3">검색 결과 : ${keyword}</div>
		
					<div class="mt-1 mb-1 bg-white">
					
							<c:forEach var="ahzitList" items="${ahzitList}">
								
									<div>
										<div class="cover">
										
									<div class="container mt-3 md-3">
										<div class="row align-items-center shadow ">
											<div class="col-3 div-thumnail-size p-3">
												<img src="/attachment/download/ahzit?attachmentNo=${ahzitList.ahzitAttachmentNo}"class="ahzit-img">
											</div>
										
										<div class="col-9">
										
										<div>
											<div class="fs-4 mb-3">
												<a href="ahzit_in/${ahzitList.ahzitNo}">
													<span>${ahzitList.ahzitName}</span>
												</a>
											</div>
										</div>
												
										<div class="info mb-3">${ahzitList.ahzitInfo}</div>
										
										<div class="row">
												<span class="leader"> 리더 <strong class="leaderName">${ahzitList.ahzitLeader}&nbsp;
												</strong>
												</span> <span class="total mb-2"> 멤버 <strong class="totalNumber">${ahzitList.ahzitHead}&nbsp;</strong>&nbsp;&nbsp;
												 <i class="fa-solid fa-heart" style="color:red;"></i> ${ahzitList.ahzitLike}</span>
										</div>		
												<%-- 등급 : ${ahzitList.ahzitGrade}&nbsp;&#183;&nbsp; --%>
												#${ahzitList.ahzitSort}								
										</div>														
									</div>
								</div>
										
							</div>
						</div>
						
					</c:forEach>
						
					</div>
				</div>
			</div>
		</div>
	</div>
	
	
		<div class=" mt-3 mb-4">
			<%-- 페이지 네비게이터 --%>
			<ul class="pagination">
				<c:choose>
					<c:when test = "${ahzitSearchListRequestVO.isFirst()}">
						<li class="page-item">
							<a class="page-link" href = "">&laquo;</a>
						</li>
					</c:when>
					<c:otherwise>
						<li class="page-item">
							<a class="page-link" href = "search_keyword?p=${ahzitSearchListRequestVO.blockFirst()}&${ahzitSearchListRequestVO.queryString()}">&laquo;</a>
						</li>
					</c:otherwise>
				</c:choose>
				
				<c:choose>
					<c:when test = "${ahzitSearchListRequestVO.hasPrev()}">
						<li class="page-item">
							<a class="page-link" href = "search_keyword?&p=${ahzitSearchListRequestVO.blockPrev()}&${ahzitSearchListRequestVO.queryString()}">&lt;</a>
						</li>
					</c:when>
					<c:otherwise>
						<li class="page-item">
							<a class="page-link" href = "">&lt;</a>
						</li>
					</c:otherwise>
				</c:choose>
				
				<c:forEach var = "i" begin = "${ahzitSearchListRequestVO.blockStart()}" end = "${ahzitSearchListRequestVO.blockEnd()}" step = "1">
					<li class="page-item">
						<a class="page-link" href = "search_keyword?p=${i}&${ahzitSearchListRequestVO.queryString()}">${i}</a>
					</li>
				</c:forEach>
				
				<c:choose>
					<c:when test = "${ahzitSearchListRequestVO.hasNext()}">
						<li class="page-item">
							<a class="page-link" href = "search_keyword?p=${ahzitSearchListRequestVO.blockNext()}&${ahzitSearchListRequestVO.queryString()}">&gt;</a>
						</li>
					</c:when>
					<c:otherwise>
						<li class="page-item">
							<a class="page-link" href = "">&gt;</a>
						</li>
					</c:otherwise>
				</c:choose>
				
				<c:choose>
					<c:when test = "${ahzitSearchListRequestVO.isLast()}">
						<li class="page-item">
							<a class="page-link" href = "">&raquo;</a>
						</li>
					</c:when>
					<c:otherwise>
						<li class="page-item">
							<a class="page-link" href = "search_keyword?p=${ahzitSearchListRequestVO.blockLast()}&${ahzitSearchListRequestVO.queryString()}">&raquo;</a>
						</li>
					</c:otherwise>
				</c:choose>
			</ul>
		</div>
	
</div>

<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link
	href="https://fonts.googleapis.com/css2?family=Gothic+A1:wght@500&display=swap"
	rel="stylesheet">

<%-- footer --%>
<jsp:include page="/WEB-INF/views/template/footer.jsp"></jsp:include>