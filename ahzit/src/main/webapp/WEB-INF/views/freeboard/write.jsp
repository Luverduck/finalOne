<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!-- header -->
<jsp:include page="/WEB-INF/views/template/header.jsp">
	<jsp:param value="자유게시판 - 게시글 작성" name="title"/>
</jsp:include>

<h1>자유 게시판 - 게시글 작성</h1>

<form action = "write" method = "post">
	제목 : <input type = "text" name = "freeboardTitle">
	<br>
	내용 : <textarea name = "freeboardContent"></textarea>
	<button type = "submit">작성</button>
</form>

<!-- footer -->
<jsp:include page="/WEB-INF/views/template/footer.jsp"></jsp:include>