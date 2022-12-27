<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!-- 현재 시간 구하기 -->
<jsp:useBean id="now" class="java.util.Date"></jsp:useBean>
<c:set var="today">
	<fmt:formatDate value="${now}" pattern="yyyy-MM-dd" />
</c:set>

<style>
.faqContent {
	display: none;
}
</style>

<script src="https://code.jquery.com/jquery-3.6.1.js"></script>
<script type="text/javascript">
	$(function() {

		$(".toggle").click(function() {
			$(this).next().slideToggle();
		});
	})
</script>

<jsp:include page="/WEB-INF/views/template/header.jsp">
	<jsp:param value="FAQ 게시판" name="title" />
</jsp:include>




<div class="container-fluid mt-3">
	<div class="">
		<div class="col-8 offset-2 main">
			<div class="">

				<div class="row mt-4">
					<div
						class="col-lg-4 offset-lg-4 col-md-6 offset-md-3 col-sm-8 offset-sm-2">
						<div class="p-4 text-dark rounded">
							<h1 class="text-center">FAQ</h1>
						</div>
					</div>
				</div>

				<div>
					<c:forEach var="faqDto" items="${list}">

						<div class="toggle fs-4">
							<i class="fa-solid fa-plus"></i> ${faqDto.faqTitle}
						</div>


						<div class="faqContent">
							${faqDto.faqContent}


					<div class="row justify-content-start mt-3 mb-3">
								<c:if test="${loginId != null}">
									<c:if test="${loginGrade == '관리자' || loginGrade == '운영자'}">
										<a class="col-1 text-center" href="edit?faqNo=${faqDto.faqNo}"><i class="fa-solid fa-pen-to-square"></i></a>
										<a class="col-1 text-center" href="delete?faqNo=${faqDto.faqNo}"><i class="fa-solid fa-delete-left"></i></a>

									</c:if>
								</c:if>
							</div>

						</div>

						<hr>

					</c:forEach>
				</div>



				<div class="row justify-content-end">
					<div class="col-3">
						<c:if test="${loginGrade == '관리자' || loginGrade == '운영자'}">
							<div class="row right">
								<a class="btn btn-neutral" href="write">글쓰기</a>
							</div>
						</c:if>
					</div>
				</div>





				<!-- 페이징 -->
				<div class="row align-items-center mt-2">

					<nav aria-label="Search results pages">


						<ul class="pagination justify-content-center">
							<!-- 이전 -->
							<c:choose>
								<c:when test="${not vo.isFirst()}">
									<li class="page-item"><a class="page-link"
										href="list?p=${vo.firstBlock()}&${vo.parameter()}">&laquo;</a></li>
								</c:when>
								<c:otherwise>
									<li class="page-item"><a class="page-link" href="#">&laquo;</a></li>
								</c:otherwise>
							</c:choose>

							<c:choose>
								<c:when test="${vo.hasPrev()}">
									<li class="page-item"><a class="page-link"
										href="list?p=${vo.prevBlock()}&${vo.parameter()}">&lt;</a></li>
								</c:when>
								<c:otherwise>
									<li class="page-item"><a class="page-link" href="#">&lt;</a></li>
								</c:otherwise>
							</c:choose>

							<!-- 숫자 -->
							<c:forEach var="i" begin="${vo.startBlock()}"
								end="${vo.endBlock()}" step="1">
								<c:choose>
									<c:when test="${vo.p == i}">
										<li class="page-item on"><a class="page-link" href="#">${i}</a></li>
									</c:when>
									<c:otherwise>
										<li class="page-item"><a class="page-link"
											href="list?p=${i}&${vo.parameter()}">${i}</a></li>
									</c:otherwise>
								</c:choose>
							</c:forEach>

							<!-- 다음을 누르면 다음 구간의 첫 페이지로 안내 -->
							<c:choose>
								<c:when test="${vo.hasNext()}">
									<li class="page-item"><a class="page-link"
										href="list?p=${vo.nextBlock()}&${vo.parameter()}">&gt;</a></li>
								</c:when>
								<c:otherwise>
									<li class="page-item"><a class="page-link" href="#">&gt;</a></li>
								</c:otherwise>
							</c:choose>

							<c:choose>
								<c:when test="${not vo.isLast()}">
									<li class="page-item"><a class="page-link"
										href="list?p=${vo.lastBlock()}&${vo.parameter()}">&raquo;</a></li>
								</c:when>
								<c:otherwise>
									<li class="page-item"><a class="page-link" href="#">&raquo;</a></li>
								</c:otherwise>
							</c:choose>
						</ul>
					</nav>
				</div>

				<!-- 검색창 -->
				<div class="justify-content-center input-group mt-2 mb-5">
					<form class="row gy-2 gx-3 align-items-center" action="list"
						method="get">
						<div class="col-auto">
							<select class="form-select" name="type" required>
								<option value="faq_title"
									<c:if test="${vo.type=='faq_title'}">selected</c:if>>제목</option>
								<option value="faq_content"
									<c:if test="${vo.type=='faq_content'}">selected</c:if>>내용</option>
							</select>

						</div>

						<div class="col-auto">
							<input class="form-control" type="search" name="keyword"
								placeholder="검색어" required value="${vo.keyword}">
						</div>
						<div class="col-auto">
							<button class="btn btn-outline-secondary" type="submit">검색</button>
						</div>


					</form>
				</div>



			</div>
		</div>
	</div>
</div>






<jsp:include page="/WEB-INF/views/template/footer.jsp"></jsp:include>