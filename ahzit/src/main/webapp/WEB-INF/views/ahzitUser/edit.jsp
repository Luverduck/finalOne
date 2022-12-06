<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<%-- header --%>
<jsp:include page="/WEB-INF/views/template/header.jsp">
	<jsp:param value="회원 정보 수정" name="title"/>
</jsp:include>

<div>
	<form action = "edit" method = "post">
		<input type = "hidden" name = "userId" value = "${ahzitUserDto.userId}">
		<div>
			닉네임 : <input type = "text" name = "userNick" value = "${ahzitUserDto.userNick}">
		</div>
		<div>
			이메일 : <input type = "text" name = "userEmail" value = "${ahzitUserDto.userEmail}">
		</div>
		<div>
			<button type = "submit">수정</button>
		</div>
	</form>
	
	<div class = "row">
		<a href = "mypage">My page</a>		
	</div>
</div>

<%-- footer --%>
<jsp:include page="/WEB-INF/views/template/footer.jsp"></jsp:include>