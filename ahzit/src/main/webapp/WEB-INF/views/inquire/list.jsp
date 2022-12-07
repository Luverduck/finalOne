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
	
	<div >
		<a href="insert">글쓰기</a>
	</div>
	
	<div class="row center">
		<table class="table table-border table-hover">
			<thead>
				<tr>

					<th>번호</th>
					<th width="45%">제목</th>
					<th>작성자</th>
					<th>작성일</th>
				</tr>
			</thead>
			
			<tbody align="center">
				<c:forEach var="inquireDto" items="${list}">
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
			
			</tfoot>

		</table>
	</div>
	
<%-- footer --%>
<jsp:include page="/WEB-INF/views/template/footer.jsp"></jsp:include>
		