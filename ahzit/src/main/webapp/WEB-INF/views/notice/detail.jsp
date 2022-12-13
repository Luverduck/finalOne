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
	<jsp:param value="공지게시판 - 상세" name="title" />
</jsp:include>

<div class="container">
	<div class="row center">
		<h1>게시글 보기</h1>
	</div>

	<!-- 목록 버튼 -->
	<div class="row">
		<a class="btn btn-neutral" href="list">목록으로</a>
	</div>


	<div class="row center">
		<table class="table">
			<tbody>
				<tr>
					<th width="30%">번호</th>
					<td>${noticeDto.noticeNo}</td>
				</tr>
				<tr>
					<th>제목</th>
					<td>${noticeDto.noticeTitle}</td>
				</tr>
				<tr>
					<th>작성자</th>
					<td>${noticeDto.noticeWriter}</td>
				</tr>
				<tr height="200" valign="top">
					<th>내용</th>
					<td>${noticeDto.noticeContent}</td>
				</tr>

				<tr>
					<th>조회수</th>
					<td>${noticeDto.noticeRead}</td>
				</tr>


				<tr>
					<th>작성일</th>
					<td><fmt:formatDate value="${noticeDto.noticeWritedate}"
							pattern="y년 M월 d일 E요일 a h시 m분 s초" /></td>
				</tr>


				<c:if test="${noticeDto.noticeUpdatedate != null}">
					<tr>
						<th>수정일</th>
						<td><fmt:formatDate value="${noticeDto.noticeUpdatedate}"
								pattern="y년 M월 d일 E요일 a h시 m분 s초" /></td>
					</tr>
				</c:if>
				
				
				<c:if test="${attachmentList != null}">
				<tr>
					<th>첨부파일</th>
					<td>
						<ul class="attachment-list">
							<c:forEach var="attachmentDto" items="${attachmentList}">
							<li>
								${attachmentDto.attachmentName} 
								(${attachmentDto.attachmentSize} bytes) 
								- 
								[${attachmentDto.attachmentType}]
								<a href="/attachment/download/${attachmentDto.attachmentNo}">download</a>
							</li>
							</c:forEach>
						</ul>
					</td>
				</tr>
				</c:if>
				
				
				
			</tbody>

			<tfoot>
				<tr>
					<td>
						<c:if test="${loginId != null}">
							<a class="btn btn-positive" href="write">글쓰기</a>
						</c:if>
						<a href="edit?noticeNo=${noticeDto.noticeNo}">수정하기</a>	
						<a href="delete?noticeNo=${noticeDto.noticeNo}">삭제하기</a>
					</td>
				</tr>
			</tfoot>



		</table>
	</div>


</div>

<%-- footer --%>
<jsp:include page="/WEB-INF/views/template/footer.jsp"></jsp:include>