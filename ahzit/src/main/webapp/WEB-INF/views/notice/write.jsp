<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!-- 현재 시간 구하기 -->
<jsp:useBean id="now" class="java.util.Date"></jsp:useBean>
<c:set var="today">
	<fmt:formatDate value="${now}" pattern="yyyy-MM-dd" />
</c:set>

<%-- header --%>
<jsp:include page="/WEB-INF/views/template/header.jsp">
	<jsp:param value="공지게시판 - 등록" name="title" />
</jsp:include>

<form action="write" method="post">
	<div class="container">
		<div class="row center">
			<h1>게시글 쓰기</h1>
		</div>

		<div class="row left">
			<label>제목</label> <input class="input w-100" type="text" name="noticeTitle" required>
		</div>

		<div class="row left">
			<label>내용</label>
			<textarea class="input w-100" name="noticeContent" rows="10" cols="80"required></textarea>
		</div>

		<div class="row right">
			<a class="btn btn-neutral" href="list">목록으로</a>
			<button class="btn btn-positive" type="submit">등록하기</button>
		</div>
	</div>
</form>





<%-- footer --%>
<jsp:include page="/WEB-INF/views/template/footer.jsp"></jsp:include>
