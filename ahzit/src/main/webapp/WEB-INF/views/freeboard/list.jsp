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

<%-- footer --%>
<jsp:include page="/WEB-INF/views/template/footer.jsp"></jsp:include>