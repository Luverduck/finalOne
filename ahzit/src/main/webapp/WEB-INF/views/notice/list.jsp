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




<div class="container">

	<c:if test="${loginId != null}">
		<div class="row right">
			<%-- 관리자일 경우만 삭제버튼을 추가 --%>
			<c:if test="${loginGrade == '관리자'}">
				<a class="btn btn-neutral" href="write">글쓰기</a>
			</c:if>

			<a class="btn btn-neutral" href="write">글쓰기</a>

		</div>
	</c:if>

	<!-- 게시판 이름 -->
	<div class="row">
		<h1>공지 게시판</h1>
	</div>


	<div class="row center">
		<table class="table">

			<thead align="center">
				<tr>
					<th>번호</th>
					<th width="45%">제목</th>
					<th>작성자</th>
					<th>작성일</th>
					<th>조회수</th>

				</tr>
			</thead>


			<tbody align="center">
				<c:forEach var="noticeDto" items="${list}">
					<tr>


						<td>${noticeDto.noticeNo}</td>
						<td align="left">
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


	<!-- 페이징 -->
	<div class="row center">
		<ul class="pagination">
			<!-- 이전 -->
			<c:choose>
				<c:when test="${not vo.isFirst()}">
					<li><a href="list?p=${vo.firstBlock()}&${vo.parameter()}">&laquo;</a></li>
				</c:when>
				<c:otherwise>
					<li><a href="#">&laquo;</a></li>
				</c:otherwise>
			</c:choose>

			<c:choose>
				<c:when test="${vo.hasPrev()}">
					<li><a href="list?p=${vo.prevBlock()}&${vo.parameter()}">&lt;</a></li>
				</c:when>
				<c:otherwise>
					<li><a href="#">&lt;</a></li>
				</c:otherwise>
			</c:choose>

			<!-- 숫자 -->
			<c:forEach var="i" begin="${vo.startBlock()}" end="${vo.endBlock()}"
				step="1">
				<c:choose>
					<c:when test="${vo.p == i}">
						<li class="on"><a href="#">${i}</a></li>
					</c:when>
					<c:otherwise>
						<li><a href="list?p=${i}&${vo.parameter()}">${i}</a></li>
					</c:otherwise>
				</c:choose>
			</c:forEach>

			<!-- 다음을 누르면 다음 구간의 첫 페이지로 안내 -->
			<c:choose>
				<c:when test="${vo.hasNext()}">
					<li><a href="list?p=${vo.nextBlock()}&${vo.parameter()}">&gt;</a></li>
				</c:when>
				<c:otherwise>
					<li><a href="#">&gt;</a></li>
				</c:otherwise>
			</c:choose>

			<c:choose>
				<c:when test="${not vo.isLast()}">
					<li><a href="list?p=${vo.lastBlock()}&${vo.parameter()}">&raquo;</a></li>
				</c:when>
				<c:otherwise>
					<li><a href="#">&raquo;</a></li>
				</c:otherwise>
			</c:choose>
		</ul>
	</div>


	<!-- 검색창 -->
	<form action="list" method="get">
		<select name="type" required>
			<option value="notice_title"
				<c:if test="${vo.type=='notice_title'}">selected</c:if>>제목</option>
			<option value="notice_content"
				<c:if test="${vo.type=='notice_content'}">selected</c:if>>내용</option>

		</select> <input type="search" name="keyword" placeholder="검색어" required
			value="${vo.keyword}">
		<button type="submit">검색</button>
	</form>

</div>


<%-- footer --%>
<jsp:include page="/WEB-INF/views/template/footer.jsp"></jsp:include>