<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<h1>회원가입</h1>

<form action="join" method="post" >
	
		<div class="row center">
			아이디 : <input name="userId" placeholder="아이디" type="text" required>
		</div>
		<div class="row center">
			비밀번호 : <input name="userPw" placeholder="비밀번호"  type="password" required>
		</div>
		<div class="row center">
			닉네임 : <input name="userNick" placeholder="닉네임" type="text" required>
		</div>
		<div class="row center">
			이메일 : <input  name="userEmail" type="text" required>
		</div>
		
		<div class="row center">
			<button class="btn btn-positive" type="submit">가입하기</button>
		</div>
	</div>
</form>