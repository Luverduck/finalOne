<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<%-- header --%>
<jsp:include page="/WEB-INF/views/template/header.jsp">
	<jsp:param value="회원 탈퇴 완료" name="title"/>
</jsp:include>

<div class="container-600 mt-50 mb-50">
	<div class="row center mb-30">
		<h1>그동안 AHZIT를 이용해주셔서 감사합니다</h1>
	</div>
	
	<div>
		<a href="/">홈으로 이동</a>
	</div>
</div>

<%-- footer --%>
<jsp:include page="/WEB-INF/views/template/footer.jsp"></jsp:include>