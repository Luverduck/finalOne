<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<%-- header --%>
<jsp:include page="/WEB-INF/views/template/ahzitUserHeader.jsp">
	<jsp:param value="1:1 문의 목록" name="title"/>
</jsp:include>


<style>
.pagination{
justify-content : center
}
</style>

<div class="container-fluid mt-5 mb-5">
	<div class="row">
		<div class="col-8 offset-2">
			<div class="row">

				<div class="row mt-4">
					<div class="col-lg-4 offset-lg-4 col-md-6 offset-md-3 col-sm-8 offset-sm-2">
						<div class="p-4 text-dark bg-Light rounded">
							<h1 class="text-center">문의 게시판</h1>	
						</div>
					</div>
				</div>
				        
				<div class="text-center mt-3 mb-4">
				<%-- 검색창 --%>
				<form action = "list" method = "get">
					<select name = "type" required>
						<option value = "inquire_title">제목</option>
						<option value = "inquire_content">내용</option>
					</select>
					<input name = "inquireId" type="hidden" value = "${inquireListSearchVO.inquireId}">
					<input name = "keyword" placeholder = "검색어" value = "${inquireListSearchVO.keyword}" required>
					<button  type = "submit">검색</button>
				</form>
				</div>
			
				 <div class="row mt-4">
			            <div class="col-md-10 offset-md-1">
			                <table class="table table-hover">
			                    <thead class="text-center">
			                        <tr>
										<th>번호</th>
										<th width="45%">제목</th>
										<th>작성자</th>
										<th>작성일</th>
			                        </tr>
			                    </thead>
			                    <tbody class="text-center" >
			                        <c:forEach var="inquireDto" items="${inquireList}">
										<tr>
											<td>${inquireDto.inquireNo}</td>
											<td>
												<!-- 제목을 누르면 상세 페이지로 이동하도록 처리 -->
												<a href="detail?inquireNo=${inquireDto.inquireNo}">
													${inquireDto.inquireTitle}
												</a>
												<c:choose>
													<c:when test="${ inquireDto.inquireState  == 'Y'}">
													[답변 완료]
													</c:when>
													<c:otherwise>
													[답변 예정]
													</c:otherwise>
												</c:choose>
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
									<tr >
										<td colspan="6">
											<a class="btn" style="background-color : #E6E6E6; color:#3E4684;" href = "insert">글쓰기</a>
										</td>
									</tr>
								</tfoot>
			                </table>
			            </div>
			        </div>
			
		<div class=" mt-3 mb-4">
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
							<a class="page-link" href = "list?inquireId=${inquireListSearchVO.inquireId}&p=${inquireListSearchVO.firstBlock()}&${inquireListSearchVO.parameter()}">&laquo;</a>
						</li>
					</c:otherwise>
				</c:choose>
				
				<c:choose>
					<c:when test = "${inquireListSearchVO.hasPrev()}">
						<li class="page-item">
							<a class="page-link" href = "list?inquireId=${inquireListSearchVO.inquireId}&p=${inquireListSearchVO.prevBlock()}&${inquireListSearchVO.parameter()}">&lt;</a>
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
						<a class="page-link" href = "list?inquireId=${inquireListSearchVO.inquireId}&p=${i}&${inquireListSearchVO.parameter()}">${i}</a>
					</li>
				</c:forEach>
				
				<c:choose>
					<c:when test = "${inquireListSearchVO.hasNext()}">
						<li class="page-item">
							<a class="page-link" href = "list?inquireId=${inquireListSearchVO.inquireId}&p=${inquireListSearchVO.nextBlock()}&${inquireListSearchVO.parameter()}">&gt;</a>
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
							<a class="page-link" href = "list?inquireId=${inquireListSearchVO.inquireId}&p=${inquireListSearchVO.lastBlock()}&${inquireListSearchVO.parameter()}">&raquo;</a>
						</li>
					</c:otherwise>
				</c:choose>
			</ul>
		</div>
			
			</div>
		</div>
	</div>
</div>
<%-- footer --%>
<jsp:include page="/WEB-INF/views/template/footer.jsp"></jsp:include>