<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%-- header --%>
<jsp:include page="/WEB-INF/views/template/header.jsp">
	<jsp:param value="회원 가입 완료" name="title"/>
</jsp:include>

	<div> 
		<h1>WELCOME</h1>
	</div>
	<div>
		<h3>회원가입을 축하드립니다.</h3>
	</div>
	
	<div class="row">
		<a href="login">로그인 하러 가기</a>
	</div>

<%-- footer --%>
<jsp:include page="/WEB-INF/views/template/footer.jsp"></jsp:include>