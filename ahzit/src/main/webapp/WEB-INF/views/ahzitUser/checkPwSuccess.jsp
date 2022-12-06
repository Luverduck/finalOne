<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>


<%-- header --%>
<jsp:include page="/WEB-INF/views/template/header.jsp">
	<jsp:param value="비밀번호 확인" name="title"/>
</jsp:include>



 <form action="checkPwSuccess" method="post">
	<div>
		<div>
			<h1>비밀번호 변경</h1>
		</div>
		<input type="text" name="userId" value="${userId}" >
		<div>
			새로운 비밀번호 : <input name="checkPwSuccess" type="password" required placeholder="변경할비밀번호">
		</div>
		
		<div>
			<button type="submit">변경</button>
		</div>
		
	</div>
</form>

       

<%-- footer --%>
<jsp:include page="/WEB-INF/views/template/footer.jsp"></jsp:include>