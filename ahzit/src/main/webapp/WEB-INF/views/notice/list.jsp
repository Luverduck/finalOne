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
	<jsp:param value="notice" name="title" />
</jsp:include>

<style>
* {
	font-family: font-family : 'Gothic A1', sans-serif;
}
</style>


<div class="container-fluid mt-5 mb-5">
	<div>
		<div class="col-8 offset-2">
			<div>
			
				<!-- 게시판 이름 -->
				<div class="mt-4">
					<div class="col-lg-4 offset-lg-4 col-md-6 offset-md-3 col-sm-8 offset-sm-2">
						<div class="p-4 rounded">
							<h1 class="text-center">NOTICE</h1>
						</div>
					</div>
				</div>

				<div class="row justify-content-end">
					<div class="col-2">
						<c:if test="${loginId != null}">
							<%-- 관리자일 경우만 삭제버튼을 추가 --%>
							<c:if test="${loginGrade == '관리자'}">
								<a class="btn text-end" href="write">글쓰기</a>
							</c:if>
						</c:if>
					</div>
				</div>

				<div class="mt-4">
					<div class="col-md-10 offset-md-1">
						<table class="table table-hover">
							 <thead class=text-center>
								<tr>
									<th>번호</th>
									<th width="45%">제목</th>
									<th>작성자</th>
									<th>작성일</th>
									<th>조회수</th>
								</tr>
							</thead>
							<tbody class="text-center" >
								<c:forEach var="noticeDto" items="${list}">
									<tr>
										<td>${noticeDto.noticeNo}</td>
										<td>
											<!-- 제목을 누르면 상세 페이지로 이동하도록 처리 --> <a
											href="detail?noticeNo=${noticeDto.noticeNo}">
												${noticeDto.noticeTitle} </a>
										</td>
										<td>${noticeDto.noticeWriter}</td>
										<td><c:set var="current">
												<fmt:formatDate value="${noticeDto.noticeWritedate}"
													pattern="yyyy-MM-dd" />
											</c:set> <c:choose>
												<c:when test="${today == current}">
													<fmt:formatDate value="${noticeDto.noticeWritedate}"
														pattern="HH:mm" />
												</c:when>
												<c:otherwise>
													<fmt:formatDate value="${noticeDto.noticeWritedate}"
														pattern="yyyy-MM-dd" />
												</c:otherwise>
											</c:choose></td>
										<td>${noticeDto.noticeRead}</td>
									</tr>
								</c:forEach>
							</tbody>
						</table>
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
									<li class="page-item"><a class="page-link href="#">&raquo;</a></li>
								</c:otherwise>
							</c:choose>
						</ul>

					</nav>
				</div>
				
				
				
				
				<div class="text-center mt-3">
					<!-- 검색창 -->
					<div class="justify-content-center input-group mt-2">
						<form class="row gy-2 gx-3 align-items-center" action="list"
							method="get">
							<div class="col-auto">
								<select class="form-select" name="type" required>
									<option value="notice_title"
										<c:if test="${vo.type=='notice_title'}">selected</c:if>>제목</option>
									<option value="notice_content"
										<c:if test="${vo.type=='notice_content'}">selected</c:if>>내용</option>
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
</div>
	<%-- footer --%>
	<jsp:include page="/WEB-INF/views/template/footer.jsp"></jsp:include>