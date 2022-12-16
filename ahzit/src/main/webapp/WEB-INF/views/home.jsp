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
<style>
 .ahzit-img {
      width : 50px;
      height : 50px;      
   }
</style>
<div>
	<c:choose>
		<c:when test="${login}">
			<a href="/ahzit/create">아지트 개설</a>
		</c:when>
		<c:otherwise>
		</c:otherwise>
	</c:choose>
</div>

<h2>내가 가입한 아지트</h2>
	<div class="row">

	   	<c:forEach var="myAhzitTopN" items="${myAhzitTopN}">
		<c:if test="${myAhzitTopN.ahzitAttachmentNo == 0}">
				<img src = "/images/bg_default.jpg" class="ahzit-img">
		</c:if>
	   <!-- 	<img src = "/images/bg_default.jpg" class="ahzit-img"> -->
	   	<img src = "/attachment/download/ahzit?attachmentNo=${myAhzitTopN.ahzitAttachmentNo}" class="ahzit-img"> 
			<a href="${pageContext.request.contextPath}/ahzit_in/${myAhzitTopN.ahzitNo}">
				${myAhzitTopN.ahzitNo}
				${myAhzitTopN.ahzitName} &nbsp; <%--아지트 이름 --%>
				${myAhzitTopN.ahzitSort} &nbsp; <%--아지트 종류 --%>
				${myAhzitTopN.ahzitHead} &nbsp;
			</a>
		</c:forEach>
			<a href="ahzitUser/myAhzit">가입한 소모임 전부보기<i class="fa-solid fa-angles-right"></i></a>
	</div>

<%-- footer --%>
<jsp:include page="/WEB-INF/views/template/footer.jsp"></jsp:include>
