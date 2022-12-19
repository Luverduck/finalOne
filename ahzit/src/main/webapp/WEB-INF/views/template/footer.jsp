<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>


<hr>

<%-- 하단 정보 --%>
<div align = "center">
	<h2>Session에 대한 정보</h2>
	로그인 아이디 : ${sessionScope.loginId}<br>
	로그인 등급 : ${sessionScope.loginGrade}<br>
	로그인 여부 : ${sessionScope.loginId != null}<br>

</div>

</body>
</html>