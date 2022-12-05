<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%-- header --%>
<jsp:include page="/WEB-INF/views/template/header.jsp">
	<jsp:param value="자유게시판 - 게시글 작성" name="title"/>
</jsp:include>

<h1>자유 게시판 - 게시글 작성</h1>

<div class = "container">
	<form action = "write" method = "post" enctype = "multipart/form-data">
		<div class = "row">
			제목 : <input type = "text" name = "freeboardTitle">
		</div>
		<div class = "row">
			내용 : <input type = "text" name = "freeboardContent">
		</div>
		<div class = "row">
			첨부파일 : <input type = "file" name = "freeboardAttachment" multiple>
		</div>
		<button type = "submit">작성</button>
	</form>
</div>

<%-- footer --%>
<jsp:include page="/WEB-INF/views/template/footer.jsp"></jsp:include>