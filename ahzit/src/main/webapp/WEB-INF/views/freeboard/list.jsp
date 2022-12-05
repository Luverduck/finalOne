<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<%-- header --%>
<jsp:include page="/WEB-INF/views/template/header.jsp">
	<jsp:param value="자유게시판 - 게시글 목록" name="title"/>
</jsp:include>

<table>
	<thead>
		<tr>
			<th>번호</th>
			<th>작성자</th>
			<th>제목</th>
			<th>조회수</th>
			<th>좋아요</th>
			<th>작성일</th>
		</tr>
	</thead>
	<tbody>
		<c:forEach var = "list" items = "${freeboardList}">
			<tr>
				<td>${list.freeboardNo}</td>
				<td>${list.freeboardWriter}</td>
				<td>
					<a href = "detail?freeboardNo=${list.freeboardNo}">${list.freeboardTitle}</a>
				</td>
				<td>${list.freeboardRead}</td>
				<td>${list.freeboardLike}</td>
				<td>${list.freeboardWritedate}</td>
			</tr>
		</c:forEach>
	</tbody>
	<tfoot>
		<tr class = "right" >
			<td colspan="6">
				<a href = "write">게시글 작성</a>
			</td>
		</tr>
	</tfoot>
</table>

<%-- 검색창 --%>
<form action = "list" method = "get">
	<select name = "type" required>
		<option value = "freeboard_title">제목</option>
		<option value = "freeboard_content">내용</option>
	</select>
	<input name = "keyword" placeholder = "검색어" value = "${freeboardListSeachVO.keyword}">
	<button type = "submit">검색</button>
</form>

<%-- 페이지 네비게이터 --%>
<ul class="pagination">
	<c:choose>
		<c:when test = "${freeboardListSeachVO.isFirst()}">
			<li class="page-item">
				<a class="page-link" href = "">&laquo;</a>
			</li>
		</c:when>
		<c:otherwise>
			<li class="page-item">
				<a class="page-link" href = "list?p=${freeboardListSeachVO.blockFirst()}&${freeboardListSeachVO.queryString()}">&laquo;</a>
			</li>
		</c:otherwise>
	</c:choose>
	
	<c:choose>
		<c:when test = "${freeboardListSeachVO.hasPrev()}">
			<li class="page-item">
				<a class="page-link" href = "list?p=${freeboardListSeachVO.blockPrev()}&${freeboardListSeachVO.queryString()}">&lt;</a>
			</li>
		</c:when>
		<c:otherwise>
			<li class="page-item">
				<a class="page-link" href = "">&lt;</a>
			</li>
		</c:otherwise>
	</c:choose>
	
	<c:forEach var = "i" begin = "${freeboardListSeachVO.blockStart()}" end = "${freeboardListSeachVO.blockEnd()}" step = "1">
		<li class="page-item">
			<a class="page-link" href = "list?p=${i}&${freeboardListSeachVO.queryString()}">${i}</a>
		</li>
	</c:forEach>
	
	<c:choose>
		<c:when test = "${freeboardListSeachVO.hasNext()}">
			<li class="page-item">
				<a class="page-link" href = "list?p=${freeboardListSeachVO.blockNext()}&${freeboardListSeachVO.queryString()}">&gt;</a>
			</li>
		</c:when>
		<c:otherwise>
			<li class="page-item">
				<a class="page-link" href = "">&gt;</a>
			</li>
		</c:otherwise>
	</c:choose>
	
	<c:choose>
		<c:when test = "${freeboardListSeachVO.isLast()}">
			<li class="page-item">
				<a class="page-link" href = "">&raquo;</a>
			</li>
		</c:when>
		<c:otherwise>
			<li class="page-item">
				<a class="page-link" href = "list?p=${freeboardListSeachVO.blockLast()}&${freeboardListSeachVO.queryString()}">&raquo;</a>
			</li>
		</c:otherwise>
	</c:choose>
</ul>

&laquo; &lt; 1 2 3 4 5 6 7 8 9 10 &gt; &raquo;

<%-- footer --%>
<jsp:include page="/WEB-INF/views/template/footer.jsp"></jsp:include>