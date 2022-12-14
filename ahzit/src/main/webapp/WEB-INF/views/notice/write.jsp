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
	<jsp:param value="공지사항 작성" name="title" />
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


				<form action="write" method="post" enctype="multipart/form-data">

					<!-- 게시판 이름 -->
					<div class="row mt-4">
						<div
							class="col-lg-4 offset-lg-4 col-md-6 offset-md-3 col-sm-8 offset-sm-2">
							<div class="p-4 text-dark bg-Light rounded">
								<h3>notice</h3>
							</div>
						</div>
					</div>

					<div class="row form-floating">
						<div class="form-floating">
							<input type="text" name="noticeTitle"
								class="form-control rounded" placeholder="제목" required>
							<label> 제목 </label>
						</div>
					</div>


					<div class="row mt-4">
						<div class="form-floating">
							<textarea name="noticeContent" required></textarea>
						</div>
					</div>

					<div class="row">
						<label>첨부파일(1개당 1MB. 최대 10MB 가능)</label> <input
							class="input w-100" type="file" name="attachment" multiple>
					</div>

					<div class="row justify-content-center mt-5 mb-5">
						<div class="col-3">
							<a class="btn" href="list">목록으로</a>
						</div>

						<div class="col-3">
							<button class="btn" type="submit">등록하기</button>
						</div>
					</div>
				</form>
			</div>
		</div>
	</div>
</div>


<%-- footer --%>
<jsp:include page="/WEB-INF/views/template/footer.jsp"></jsp:include>