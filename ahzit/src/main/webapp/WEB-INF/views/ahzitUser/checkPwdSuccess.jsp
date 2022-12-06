<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<%-- header --%>
<jsp:include page="/WEB-INF/views/template/header.jsp">
	<jsp:param value="비밀번호 변경 완료" name="title"/>
</jsp:include>

<div>
	<div>
		<h1>비밀번호 변경이 완료 되었습니다.</h1>
	</div>
	
	<div>
		<a href="/">홈으로 이동</a>
		<a href="login">홈으로 이동</a>
	</div>
</div>

<%-- footer --%>
<jsp:include page="/WEB-INF/views/template/footer.jsp"></jsp:include>