<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!-- 현재 시간 구하기 -->
<jsp:useBean id="now" class="java.util.Date"></jsp:useBean>
<c:set var="today">
	<fmt:formatDate value="${now}" pattern="yyyy-MM-dd"/>
</c:set>




<div class="container-900 mt-40 mb-40">
	<div class="row center">
		<h1>공지 게시판</h1>
	</div>
	

	
	<div class="row center">
		<table class="table table-border table-hover">
			<thead>
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
						
						<!-- 제목을 누르면 상세 페이지로 이동하도록 처리 -->
						<a href="detail?boardNo=${noticeDto.noticeNo}">
							${noticeDto.noticeTitle}
						</a>
						
						
						
					</td>
					<td>${noticeDto.noticeWriter}</td>
					<td>
						<c:set var="current">
							<fmt:formatDate value="${noticeDto.noticeWritedate}" pattern="yyyy-MM-dd"/>
						</c:set>
						<c:choose>
							<c:when test="${today == current}">
								<fmt:formatDate value="${noticeDto.noticeWritedate}" 
															pattern="HH:mm"/>
							</c:when>
							<c:otherwise>
								<fmt:formatDate value="${noticeDto.noticeWritedate}" 
															pattern="yyyy-MM-dd"/>
							</c:otherwise>
						</c:choose>
					</td>
					<td>${noticeDto.noticeRead}</td>
					
				</tr>
				</c:forEach>
			</tbody>
 		</table>
	</div>
	

	
	
	
	<!-- 검색창 -->
	
</div>

