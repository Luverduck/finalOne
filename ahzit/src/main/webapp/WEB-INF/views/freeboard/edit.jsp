<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%-- header --%>
<jsp:include page="/WEB-INF/views/template/header.jsp">
	<jsp:param value="자유게시판 - 게시글 수정" name="title"/>
</jsp:include>

<div class = "container">
	<form action = "edit" method = "post">
		<input type = "hidden" name = "freeboardNo" value = "${freeboardDto.freeboardNo}">
		<div class = "row">
			제목 : <input type = "text" name = "freeboardTitle" value = "${freeboardDto.freeboardTitle}">
		</div>
		<div class = "row">
			내용 : <input type = "text" name = "freeboardContent" value = "${freeboardDto.freeboardContent}">
		</div>
		<div class = "row">
			<button type = "submit">수정</button>
		</div>
	</form>
	<div class = "row">
		<a href = "list">목록</a>		
	</div>
</div>

<%-- footer --%>
<jsp:include page="/WEB-INF/views/template/footer.jsp"></jsp:include>