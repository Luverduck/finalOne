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
	<jsp:param value="faq - 수정" name="title" />
</jsp:include>


<form action="edit" method="post">

<!-- input[type=hidden]은 form 안에 위치해야 한다 -->
<input type="hidden" name="faqNo" value="${faqDto.faqNo}">

<div class="container">
	<div class="row center">
		<h1>게시글 보기</h1>
	</div>

	<!-- 목록 버튼 -->
	<div class="row">
		<a class="btn btn-neutral" href="list">목록으로</a>
	</div>


	<div class="row center">
	
		<div class="row left">
			<label>제목</label>
		<input class="input" type="text" name="faqTitle" required value="${faqDto.faqTitle}" autocomplete="off">
		</div>
	
		<div class="row left">
			<label>내용</label>
			<textarea class="input" name="faqContent" rows="10" required>${faqDto.faqContent}</textarea>
		</div>
	
		<div class="row right">
			<a class="btn btn-neutral" href="list">목록으로</a>
			<button class="btn btn-positive" type="submit">수정하기</button>
		</div>
	</div>


</div>
</form>
<%-- footer --%>
<jsp:include page="/WEB-INF/views/template/footer.jsp"></jsp:include>