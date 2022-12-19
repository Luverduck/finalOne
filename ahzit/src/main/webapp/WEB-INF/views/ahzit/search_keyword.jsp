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
	}
	.ahzit-img {
		width: 250px;
		height: 250px;
	}
	
</style>

<div class = "container-fluid mt-3">
	<div class = "row">
		<div class = "col-8 offset-2">			
		
			<div class = "row">

				<%-- 왼쪽 사이드바 --%>
				<div class = "col-3" style="background-color: #dff9fb;">
					<h1>왼쪽 사이드바</h1> 
					
				</div>
				
				<%-- 가운데 내용 --%>
				<div class = "col-6">
					<h1>가운데 내용</h1>
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
					
					<div class = "container-ahzit-list">
						<div class = "col-1">
							
						</div>
						<div class = "col-11">
						
						</div>
					</div>
				</div>
				
				<%-- 오른쪽 사이드바 --%>
				<div class = "col" style="background-color: #dff9fb;">
					<h1>오른쪽 사이드바</h1>
				</div>
			
			</div>
			
			<div class = "row">
				ㅎㅇㅎㅇ
			</div>
					
		</div>
	</div>
</div>

<%-- footer --%>
<jsp:include page="/WEB-INF/views/template/footer.jsp"></jsp:include>