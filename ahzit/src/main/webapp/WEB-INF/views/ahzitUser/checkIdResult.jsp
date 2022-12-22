<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<style>
.id1{
	font-size: 0.9em;
	font-weight: 600;
}
.id2{
	font-size: 1.3em;
	font-weight: 900;
	color: #3E4684;
}
</style>

<%-- header --%>
<jsp:include page="/WEB-INF/views/template/header.jsp">
	<jsp:param value="아이디 찾기 완료" name="title"/>
</jsp:include>

 <div class="row mt-4">
	<div class="col-lg-4 offset-lg-4 col-md-6 offset-md-3 col-sm-8 offset-sm-2">
		<div class="p-4 rounded text-center">
			<h1 class="text-center">아이디 찾기</h1>
			<i class="fa-solid fa-circle-exclamation"></i>
			입력하신 정보와 일치하는 아이디입니다.
		</div>
	</div>
</div>
	
	<div class="col-md-8 offset-md-2 my-4 mb-4">
		<div class="text-center id1">
			회원님의 아이디는  &nbsp;&nbsp; 
			<span class="id2">${checkId}</span>
			 &nbsp;&nbsp; 입니다.
		</div>
	</div>		

<div class="col-lg-4 offset-lg-4 col-md-6 offset-md-3 col-sm-8 offset-sm-2 mt-5">
	<div class="row text-center mb-2">
		<a href="login" class="btn w-100" style="background-color : #E6E6E6; color:#3E4684;" role="button">로그인 하기</a>
	</div>
	<div class="row text-center mb-4 mt-1">
		<a href="checkPw" class="btn w-100 " style="background-color : #E6E6E6; color:#3E4684;" role="button">비밀번호 찾기</a>
	</div>
</div>

<%-- footer --%>
<jsp:include page="/WEB-INF/views/template/footer.jsp"></jsp:include>