<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<%-- header --%>
<jsp:include page="/WEB-INF/views/template/header.jsp">
	<jsp:param value="1:1 문의 목록" name="title"/>
</jsp:include>

<div>

	<div>
		<h1>내 문의 목록</h1>
	</div>
	
	
	<div>
		<table class="table table-border table-hover">
			<thead>
				<tr>

					<th>번호</th>
					<th width="45%">제목</th>
					<th>작성자</th>
					<th>작성일</th>
				</tr>
			</thead>
			
			<tbody>
				<c:forEach var="inquireDto" items="${inquireList}">
				<tr>
				
				<td>${inquireDto.inquireNo}</td>
					<td align="left">
					<!-- 제목을 누르면 상세 페이지로 이동하도록 처리 -->
						<a href="detail?inquireNo=${inquireDto.inquireNo}">
							${inquireDto.inquireTitle}
						</a>
					</td>
					
					<td>${inquireDto.inquireId}</td>
					
					<td>
					<c:set var="current">
						<fmt:formatDate value="${inquireDto.inquireWritedate}" pattern="yyyy-MM-dd"/>
					</c:set>
					<c:choose>
						<c:when test="${today == current}">
							<fmt:formatDate value="${inquireDto.inquireWritedate}" pattern="HH:mm"/>
						</c:when>
						<c:otherwise>
							<fmt:formatDate value="${inquireDto.inquireWritedate}" pattern="yyyy-MM-dd"/>
						</c:otherwise>
					</c:choose>
					</td>
				</tr>
				</c:forEach>
			</tbody>
			
	<tfoot>
		<tr class = "right" >
			<td colspan="6">
				<a href = "insert">글쓰기</a>
			</td>
		</tr>
	</tfoot>
</table>

	</div>
	
<%-- 검색창 --%>
<form action = "list" method = "get">
	<select name = "type" required>
		<option value = "inquire_title">제목</option>
		<option value = "inquire_content">내용</option>
	</select>
	<input name = "keyword" placeholder = "검색어" value = "${inquireListSearchVO.keyword}">
	<button type = "submit">검색</button>
</form>

<%-- 페이지 네비게이터 --%>
<ul class="pagination">
	<c:choose>
		<c:when test = "${inquireListSearchVO.isFirst()}">
			<li class="page-item">
				<a class="page-link" href = "">&laquo;</a>
			</li>
		</c:when>
		<c:otherwise>
			<li class="page-item">
				<a class="page-link" href = "list?p=${inquireListSearchVO.firstBlock()}&${inquireListSearchVO.parameter()}">&laquo;</a>
			</li>
		</c:otherwise>
	</c:choose>
	
	<c:choose>
		<c:when test = "${inquireListSearchVO.hasPrev()}">
			<li class="page-item">
				<a class="page-link" href = "list?p=${inquireListSearchVO.prevBlock()}&${inquireListSearchVO.parameter()}">&lt;</a>
			</li>
		</c:when>
		<c:otherwise>
			<li class="page-item">
				<a class="page-link" href = "">&lt;</a>
			</li>
		</c:otherwise>
	</c:choose>
	
	<c:forEach var = "i" begin = "${inquireListSearchVO.startBlock()}" end = "${inquireListSearchVO.endBlock()}" step = "1">
		<li class="page-item">
			<a class="page-link" href = "list?p=${i}&${inquireListSearchVO.parameter()}">${i}</a>
		</li>
	</c:forEach>
	
	<c:choose>
		<c:when test = "${inquireListSearchVO.hasNext()}">
			<li class="page-item">
				<a class="page-link" href = "list?p=${inquireListSearchVO.nextBlock()}&${inquireListSearchVO.parameter()}">&gt;</a>
			</li>
		</c:when>
		<c:otherwise>
			<li class="page-item">
				<a class="page-link" href = "">&gt;</a>
			</li>
		</c:otherwise>
	</c:choose>
	
	<c:choose>
		<c:when test = "${inquireListSearchVO.isLast()}">
			<li class="page-item">
				<a class="page-link" href = "">&raquo;</a>
			</li>
		</c:when>
		<c:otherwise>
			<li class="page-item">
				<a class="page-link" href = "list?p=${inquireListSearchVO.lastBlock()}&${inquireListSearchVO.parameter()}">&raquo;</a>
			</li>
		</c:otherwise>
	</c:choose>
</ul>

<%-- footer --%>
<jsp:include page="/WEB-INF/views/template/footer.jsp"></jsp:include>
		