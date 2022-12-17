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
	 .ahzit-img {
      width : 120px;
      height :100px;      
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
			<a href="ahzitUser/myAhzit">가입한 소모임 전부보기<i class="fa-solid fa-angles-right"></i></a>
		</c:forEach>
	</div>
	
	<script src="https://code.jquery.com/jquery-3.6.1.js"></script>
<script>
  $(function(){
    //이미지가 없으면 기본 이미지로 대체
    $(".ahzit-img").on("error", function(){
      $(this).attr("src", "/images/bg_default.jpg");
    });
  });

<%-- footer --%>
<jsp:include page="/WEB-INF/views/template/footer.jsp"></jsp:include>
