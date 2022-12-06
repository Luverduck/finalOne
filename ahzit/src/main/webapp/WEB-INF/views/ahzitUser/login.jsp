<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    
<%-- header --%>
<jsp:include page="/WEB-INF/views/template/header.jsp">
	<jsp:param value="로그인" name="title"/>
</jsp:include>

<form action="login" method="post">

	<div>
		<h1>LOGIN</h1>
	</div>
	
	<div>
		<input type="text" name="userId" placeholder="아이디" required>
	</div>
	<div >
		<input  type="password" name="userPw" placeholder="비밀번호" required>
	</div>
	
	<div>
		<button type="submit">로그인</button>
	</div>

	<div class="row">
		<a href="checkId">
			<span>아이디 찾기</span>
		</a>
	</div>
	
		<div class="row">
		<a href="checkPw">
			<span>비밀번호 찾기</span>
		</a>
	</div>

	<c:if test="${param.error != null}">
		<div class="row center mt-20">
			<span style="color:darkred;">아이디 / 비밀번호를 잘못 입력했습니다.</span>
		</div>
	</c:if>
</form>

<%-- footer --%>
<jsp:include page="/WEB-INF/views/template/footer.jsp"></jsp:include>