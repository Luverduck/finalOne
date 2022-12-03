<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
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

</form>
