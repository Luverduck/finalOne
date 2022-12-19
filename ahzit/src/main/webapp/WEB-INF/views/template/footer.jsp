<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%-- 하단 정보 --%>
<div class = "container-fluid mt-5">
	<div class = "row">
		<h2>Session에 대한 정보</h2>
	</div>
	<div class = "row">
		로그인 아이디 : ${sessionScope.loginId}<br>
	</div>
	<div class = "row">
		로그인 등급 : ${sessionScope.loginGrade}<br>
	</div>
	<div class = "row">
		로그인 여부 : ${sessionScope.loginId != null}<br>
	</div>
</div>

</body>
</html>