<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<%-- header --%>
<jsp:include page="/WEB-INF/views/template/header.jsp">
	<jsp:param value="회원 탈퇴" name="title"/>
</jsp:include>

<form action="goodbye" method="post">

<div>
	<div class="row center">
		<h1>비밀번호 확인</h1>
		<hr>
	</div>
	
	<div >
		<input type="password" name="userPw"  required>
	</div>
	
	<div >
		<a href="mypage">취소하기</a>
		<button type="submit">탈퇴하기</button>
	</div>
</div>

</form>

<%-- footer --%>
<jsp:include page="/WEB-INF/views/template/footer.jsp"></jsp:include>