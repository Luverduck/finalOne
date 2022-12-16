<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%-- header.jsp 불러오기 --%>
<jsp:include page="/WEB-INF/views/template/header.jsp">
	<jsp:param value="메인페이지" name="title"/>
</jsp:include>

<style>
	a {
		text-decoration-line : none;
	}
</style>

<h1>홈 화면</h1>
<c:set var="login" value="${loginId != null}"></c:set>
<a href = "/ahzit_in/84">소모임 84번 - 개설자 : tester111 개설자 / 회원 : tester2222, tester3333</a>

<div>
	<c:choose>
		<c:when test="${login}">
			<a href="/ahzit/create">아지트 개설</a>
		</c:when>
		<c:otherwise>
		</c:otherwise>
	</c:choose>
</div>

<div class="container">
	<div class="row">
		<c:forEach var="ahzitDto" items="${list}">
			<a href="ahzit_in/${ahzitDto.ahzitNo}">
			<%--아지트 프로필 사진 --%>	
 			<c:if test="${attachmentList.isEmpty()}"> 
				 <img src = "/images/bg_default.jpg" class="ahzit-img">
			</c:if> 
			<c:forEach var = "attachmentList" items = "${attachmentList}">  
              <img src = "/attachment/download/ahzit?attachmentNo=${attachmentList.attachmentNo}" class="ahzit-img"  > 					
             </c:forEach>	
					<span>아지트 번호 : ${ahzitDto.ahzitNo}</span> &nbsp;
					<span>아지트 종류 : ${ahzitDto.ahzitSort}</span> &nbsp;
					<span>아지트 지역 : ${ahzitDto.ahzitRegionHigh} &nbsp; ${ahzitDto.ahzitRegionLow}</span> 				
					<span>아지트 이름 : ${ahzitDto.ahzitName}</span> &nbsp;			
					<span>아지트 소개 : ${ahzitDto.ahzitInfo}</span> &nbsp;&nbsp;
			</c:forEach>
		 </a>
	</div>
</div>

<%-- footer --%>
<jsp:include page="/WEB-INF/views/template/footer.jsp"></jsp:include>
