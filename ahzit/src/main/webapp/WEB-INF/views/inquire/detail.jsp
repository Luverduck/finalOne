<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<%-- header --%>
<jsp:include page="/WEB-INF/views/template/header.jsp">
	<jsp:param value="1:1 문의" name="title" />
</jsp:include>

<div>
	<div>
		<h1>내 문의 글</h1>
	</div>
	
	<div class="row center">
		<table class="table">
			<tbody>
				<tr>
					<th width="30%">번호</th>
					<td>${inquireDto.inquireNo}</td>
				</tr>
				<tr>
					<th>제목</th>
					<td>${inquireDto.inquireTitle}</td>
				</tr>
				<tr>
					<th>작성자</th>
					<td>${inquireDto.inquireId}</td>
				</tr>
				<tr height="200" valign="top">
					<th>내용</th>
					<td>${inquireDto.inquireContent}</td>
				</tr>
				<tr>
					<th>작성일</th>
					<td>
						<fmt:formatDate value="${inquireDto.inquireWritedate}" pattern="y년 M월 d일 E요일 a h시 m분 s초" />
					</td>
				</tr>
				<c:if test="${inquireDto.inquireUpdatedate != null}">
					<tr>
						<th>수정일</th>
						<td>
							<fmt:formatDate value="${inquireDto.inquireUpdatedate}" pattern="y년 M월 d일 E요일 a h시 m분 s초" />
						</td>
					</tr>
				</c:if>
			</tbody>

			<tfoot>
				<tr>
					<td>
						<c:if test = "${loginId == inquireDto.inquireId}">
							<a href = "edit?freeboardNo=${inquireDto.inquireNo}">수정</a>
							<a href = "delete?freeboardNo=${inquireDto.inquireNo}">삭제</a>
						</c:if>
					</td>
				</tr>
			</tfoot>
		</table>
	</div>
	
</div>

<%-- footer --%>
<jsp:include page="/WEB-INF/views/template/footer.jsp"></jsp:include>