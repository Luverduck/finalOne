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
    	width : 250px;
    	height :150px;      
	}
   
</style>
		
<c:set var="login" value="${loginId != null}"></c:set>


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
				</div>
				
				<%-- 오른쪽 사이드바 --%>
				<div class = "col" style="background-color: #dff9fb;">
					<h1>오른쪽 사이드바</h1>
				</div>
			
			</div>
					
		</div>
	</div>
</div>




<h2>내가 가입한 아지트</h2>
<c:forEach var="myAhzitTopN" items="${myAhzitTopN}">
  		<div class="inner-box float-left">
  		<img src = "/attachment/download/ahzit?attachmentNo=${myAhzitTopN.ahzitAttachmentNo}"  onerror=" this.onerror=null; this.src='/images/bg_default.jpg';" class="ahzit-img">  
		<div class="text-box">
		<a href="${pageContext.request.contextPath}/ahzit_in/${myAhzitTopN.ahzitNo}">
			<span>${myAhzitTopN.ahzitNo}</span>
			<span>${myAhzitTopN.ahzitName}</span> <%--아지트 이름 --%>
			<span>${myAhzitTopN.ahzitSort}</span> <%--아지트 종류 --%>
			<span>${myAhzitTopN.ahzitHead}</span> <%--아지트 멤버 수 --%>
		</a>
		<a href="ahzitUser/myAhzit"><span>가입한 소모임 전부보기</span><i class="fa-solid fa-angles-right"></i></a>
		</div>
		</div>
	</c:forEach>

<script>

	$(function(){
	  //이미지가 없으면 기본 이미지로 대체
	  $(".ahzit-img").on("error", function(){
	    $(this).attr("src", "/images/bg_default.jpg");
	  });
	});
	
</script>

<%-- footer --%>
<jsp:include page="/WEB-INF/views/template/footer.jsp"></jsp:include>
