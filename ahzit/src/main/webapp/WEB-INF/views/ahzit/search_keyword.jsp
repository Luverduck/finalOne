<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%-- header.jsp 불러오기 --%>
<jsp:include page="/WEB-INF/views/template/header.jsp">
	<jsp:param value="메인페이지" name="title"/>
</jsp:include>

<style>
	* {
		border: 1px dotted gray;
		font-family: font-family: 'Gothic A1', sans-serif;
	}
	.ahzit-img {
		width: 250px;
		height: 250px;
	}
	
</style>

<div class = "container-fluid mt-5 mb-5">
	<div class = "row">
		<div class = "col-8 offset-2">			
		
			<div class = "row">
				<%-- 가운데 내용 --%>
				<div class = "col-6-center">
				
					<div class="mt-3 mb-3">검색 결과 : ${keyword}</div>
					
					<c:forEach var = "ahzitList" items = "${ahzitList}">
					<div class = "row">
					
						<div class="mt-4 mb-4">
						
						<%-- 프로필 번호 : ${ahzitList.ahzitAttachmentNo} /  --%>
						아지트 번호 : ${ahzitList.ahzitNo} / 
						리더 : ${ahzitList.ahzitLeader} / 
						아지트 이름 : ${ahzitList.ahzitName} / 
						설명 : ${ahzitList.ahzitInfo} / 
						멤버 : ${ahzitList.ahzitHead} / 
<%-- 						${ahzitList.ahzitHeadmax} /  --%>
						지역 : ${ahzitList.ahzitRegionHigh} ${ahzitList.ahzitRegionLow} /
						좋아요 ${ahzitList.ahzitLike} /  
						점수 ${ahzitList.ahzitScore} /  
						<c:if  test=""></c:if>
						<%-- ${ahzitList.ahzitIspublic} /
						${ahzitList.ahzitState} /  --%>
						
						등급 : ${ahzitList.ahzitGrade} / 
						카테고리 : ${ahzitList.ahzitSort}
						
						
						
						</div>
				
						
						
					</div>      
					</c:forEach>	
				</div>
			</div>
			
			
			
			<%-- <div class = "row">
				가운데 내용
				<div class = "col-6">
					<h1>검색 결과</h1>
					<c:forEach var = "ahzitList" items = "${ahzitList}">
					<div class = "row">
						프로필 번호 : ${ahzitList.ahzitAttachmentNo} / 
						${ahzitList.ahzitNo} / 
						${ahzitList.ahzitLeader} / 
						${ahzitList.ahzitName} / 
						${ahzitList.ahzitInfo} / 
						${ahzitList.ahzitHead} / 
						${ahzitList.ahzitHeadmax} / 
						${ahzitList.ahzitRegionHigh} / 
						${ahzitList.ahzitRegionLow} /
						${ahzitList.ahzitLike} /  
						${ahzitList.ahzitScore} /  
						${ahzitList.ahzitIspublic} /
						${ahzitList.ahzitState} / 
						${ahzitList.ahzitGrade} / 
						${ahzitList.ahzitSort} /
					</div>      
					</c:forEach>	
				</div>
			</div> --%>
			
					
		</div>
	</div>
</div>

<link rel="preconnect" href="https://fonts.googleapis.com"><link rel="preconnect" href="https://fonts.gstatic.com" crossorigin><link href="https://fonts.googleapis.com/css2?family=Gothic+A1:wght@500&display=swap" rel="stylesheet">

<%-- footer --%>
<jsp:include page="/WEB-INF/views/template/footer.jsp"></jsp:include>