<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<%-- header --%>
<jsp:include page="/WEB-INF/views/template/header.jsp">
	<jsp:param value="마이페이지 비밀번호 변경" name="title"/>
</jsp:include>

 <form action="password" method="post">
	<div>
		<div>
			<h1>마이페이지 비밀번호 변경</h1>
		</div>
		<input type = "hidden" name = "userId" value = "${userId}">
		
		<div>
			기존 비밀번호 : <input name="beforePw" type="password" required placeholder="기존비밀번호">
		</div>
		
		<div>
			새로운 비밀번호 : <input name="afterPw" type="password" required placeholder="변경할비밀번호">
		</div>
		
		<div>
			<button type="submit">변경</button>
		</div>
		
	</div>
	
<c:if test="${param.error != null}">
	<h3>기존 비밀번호를 확인해주세요</h3>
</c:if>
       
</form>


<%-- footer --%>
<jsp:include page="/WEB-INF/views/template/footer.jsp"></jsp:include>