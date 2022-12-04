<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<%-- header --%>
<jsp:include page="/WEB-INF/views/template/header.jsp">
	<jsp:param value="자유게시판 - 게시글 상세" name="title"/>
</jsp:include>

<div class = "container">
	<div class = "row">
		게시글 번호 : ${freeboardDto.freeboardNo}
	</div>
	<div class = "row">
		게시글 작성자 : ${freeboardDto.freeboardWriter}
	</div>
	<div class = "row">
		게시글 제목 : ${freeboardDto.freeboardTitle}
	</div>
	<div class = "row">
		게시글 내용 : ${freeboardDto.freeboardContent}
	</div>
	<div class = "row">
		게시글 조회수 : ${freeboardDto.freeboardRead}
	</div>
	<div class = "row">
		게시글 좋아요 : ${freeboardDto.freeboardLike}
	</div>
	<div class = "row">
		<c:forEach var = "list" items = "${attachmentList}">
			<img src = "/attachment/download/freeboard?attachmentNo=${list.attachmentNo}">
		</c:forEach>
	</div>
	<div>
		<a href = "edit?freeboardNo=${freeboardDto.freeboardNo}">수정</a>
		<a href = "inactive?freeboardNo=${freeboardDto.freeboardNo}">삭제</a>
		<a href = "list">목록</a>
	</div>
</div>

<%-- footer --%>
<jsp:include page="/WEB-INF/views/template/footer.jsp"></jsp:include>