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
	<jsp:param value="faq - 상세" name="title" />
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
					<td>${faqDto.faqNo}</td>
				</tr>
				<tr>
					<th>제목</th>
					<td>${faqDto.faqTitle}</td>
				</tr>
				<tr>
					<th>작성자</th>
					<td>${faqDto.faqWriter}</td>
				</tr>
				<tr height="200" valign="top">
					<th>내용</th>
					<td>${faqDto.faqContent}</td>
				</tr>

				<tr>
					<th>작성일</th>
					<td><fmt:formatDate value="${faqDto.faqWritedate}"
							pattern="y년 M월 d일 E요일 a h시 m분 s초" /></td>
				</tr>


				<c:if test="${faqDto.faqUpdatedate != null}">
					<tr>
						<th>수정일</th>
						<td><fmt:formatDate value="${faqDto.faqUpdatedate}"
								pattern="y년 M월 d일 E요일 a h시 m분 s초" /></td>
					</tr>
				</c:if>
			
				
				
				
			</tbody>

			<tfoot>
				<tr>
					<td>
						<c:if test="${loginId != null}">
							<a class="btn btn-positive" href="write">글쓰기</a>
						</c:if>
						<a href="edit?faqNo=${faqDto.faqNo}">수정하기</a>	
						<a href="delete?faqNo=${faqDto.faqNo}">삭제하기</a>
					</td>
				</tr>
			</tfoot>



		</table>
	</div>


</div>

<%-- footer --%>
<jsp:include page="/WEB-INF/views/template/footer.jsp"></jsp:include>