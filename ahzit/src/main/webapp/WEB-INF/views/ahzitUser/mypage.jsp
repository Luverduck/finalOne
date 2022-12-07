<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
    
<%-- header --%>
<jsp:include page="/WEB-INF/views/template/header.jsp">
	<jsp:param value="my page" name="title"/>
</jsp:include>


	<div>
		<h1>${ahzitUserDto.userId} 회원 정보</h1>
		<table border="1" width="400">
			<tbody>

				<tr>
					<th>아이디</th>
					<td>${ahzitUserDto.userId}</td>
				</tr>
				<tr>
					<th>닉네임</th>
					<td>${ahzitUserDto.userNick}</td>
				</tr>
				<tr>
					<th>이메일</th>
					<td>${ahzitUserDto.userEmail}</td>
				</tr>
				<tr>
					<th>가입일시</th>
					<td>
						<fmt:formatDate value="${ahzitUserDto.userJoinDate}" pattern="y년 M월 d일 E a h시 m분 s초"/>
					</td>
				</tr>
				<tr>
					<th>로그인일시</th>
					<td>
						<fmt:formatDate value="${ahzitUserDto.userLoginDate}" pattern="y년 M월 d일 E a h시 m분 s초"/>
					</td>
				</tr>
			</tbody>
		</table>
		
	
	<a href="edit?userId=${loginId}">내 정보 수정</a>
	<a href="password?userId=${loginId}">비밀번호 변경</a>
	<a href="goodbye?userId=${loginId}">회원 탈퇴</a>
	<a href="/inquire/list?inquireId=${loginId}">1:1 문의</a>
	
	<a href="/">메인페이지로 이동</a>
	</div>

<%-- footer --%>
<jsp:include page="/WEB-INF/views/template/footer.jsp"></jsp:include>
