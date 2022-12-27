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
	<jsp:param value="공지사항 수정" name="title" />
</jsp:include>


<script>
	$(function() {
		$("[name=noticeContent]").summernote({
			height : 300, // 높이 지정
			minHeight : 300, // 최소 높이
			maxHeight : 300, // 최대 높이
			placeholder : "내용을 작성하세요", // 도움말
			lang : "ko-KR" // 도움말 한글로 번역, 스크립트 추가해야함
		})
	});
</script>


<div class="container-fluid mt-5 mb-5">
	<div class="row">
		<div class="col-8 offset-2">
			<div class="row">


				<form action="edit" method="post">

					<!-- input[type=hidden]은 form 안에 위치해야 한다 -->
					<input type="hidden" name="noticeNo" value="${noticeDto.noticeNo}">

					<!-- 게시판 이름 -->
					<div class="row mt-4">
						<div
							class="col-lg-4 offset-lg-4 col-md-6 offset-md-3 col-sm-8 offset-sm-2">
							<div class="p-4 text-dark bg-Light rounded">
								<h3>notice</h3>
							</div>
						</div>
					</div>

					<div class="row mt-4">
						<input class="input" type="text" name="noticeTitle" required
							value="${noticeDto.noticeTitle}" autocomplete="off"
							placeholder="제목을 입력해주세요">
					</div>

					<div class="row">
						<textarea class="input" name="noticeContent" rows="10" required>${noticeDto.noticeContent}</textarea>
					</div>

					<div class="row justify-content-center mt-3 mb-5">
						<div class="col-3">
							<a class="btn btn-neutral" href="list">목록으로</a>
						</div>

						<div class="col-3">
							<button class="btn btn-positive" type="submit">수정하기</button>
						</div>
					</div>

				</form>
			</div>
		</div>
	</div>
</div>


<%-- footer --%>
<jsp:include page="/WEB-INF/views/template/footer.jsp"></jsp:include>