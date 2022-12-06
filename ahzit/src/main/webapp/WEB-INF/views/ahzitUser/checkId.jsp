<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<%-- header --%>
<jsp:include page="/WEB-INF/views/template/header.jsp">
	<jsp:param value="아이디 찾기" name="title"/>
</jsp:include>

<form action="checkId" method="post" autocomplete="off">

	<div>

		<div>
			<h1>아이디 찾기</h1>
		</div>


		<div class="row">
			<label>Email : 
				<input name="userEmail" type="text" required placeholder="이메일">
			</label>
		</div>

			<button type="submit">확인</button>
		</div>

		<div>
			내 아이디 : ${checkId}
		</div>
		
		
		<c:if test="${param.error != null}">
			<div class="row center mt-30">
				<span style="color: darkred;">가입된 이메일이 아닙니다.</span>
			</div>
		</c:if>
	</div>
</form>

	<div>
		<a href="/">홈으로 이동</a>
		<a href="checkPw">비밀번호 찾기</a>
	</div>

<%-- footer --%>
<jsp:include page="/WEB-INF/views/template/footer.jsp"></jsp:include>