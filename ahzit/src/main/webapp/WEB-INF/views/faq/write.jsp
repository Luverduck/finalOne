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
	<jsp:param value="faq - 등록" name="title" />
</jsp:include>

<form action="write" method="post">
	<div class="container">
		<div class="row center">
			<h1>FAQ 등록</h1>
		</div>

		<div class="row left">
			<label>제목</label> <input class="input w-100" type="text"
				name="faqTitle" required>
		</div>

		<div class="row left">
			<label>내용</label>
			<textarea class="input w-100" name="faqContent" rows="10"
				cols="80" required></textarea>
		</div>


		<div class="row right">
			<a class="btn btn-neutral" href="list">목록으로</a>
			<button class="btn btn-positive" type="submit">등록하기</button>
		</div>
	</div>
</form>



<script>
$(function(){
    $("[name=faqContent]").summernote({
        height : 300, // 높이 지정
        minHeight : 300, // 최소 높이
        maxHeight : 300, // 최대 높이
        placeholder : "내용을 작성하세요", // 도움말
        lang : "ko-KR" // 도움말 한글로 번역, 스크립트 추가해야함
    })
});
</script>

<%-- footer --%>
<jsp:include page="/WEB-INF/views/template/footer.jsp"></jsp:include>
