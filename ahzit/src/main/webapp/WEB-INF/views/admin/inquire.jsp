<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<%-- header --%>
<jsp:include page="/WEB-INF/views/template/adminHeader.jsp">
	<jsp:param value="1:1 문의 관리" name="title"/>
</jsp:include>

<style>
.pagination{
justify-content : center
}
</style>

	<div class="row mt-4">
		<div class="col-lg-4 offset-lg-4 col-md-6 offset-md-3 col-sm-8 offset-sm-2">
			<div class="p-4 text-dark bg-Light rounded">
				<h1 class="text-center">1:1 문의 글 관리</h1>	
			</div>
		</div>
	</div>
	
	<%-- 검색창 --%>
	<div class="text-center mt-3 mb-4">
		<form action = "inquire" method = "get">
			<select name = "type" required>
				<option value = "inquire_id">아이디</option>
				<option value = "inquire_title">제목</option>
			</select>
			<input name = "keyword" placeholder = "검색어" value = "${adminInquireListSearchVO.keyword}" required>
			<button type = "submit">검색</button>
		</form>
	</div>
	
	<div class="text-center mt-3 mb-4">

<div class="row mt-4">
			            <div class="col-md-10 offset-md-1">
			                <table class="table table-hover">
			                    <thead class="text-center">
			                        <tr class="bg-dark text-light">
										<th>글번호</th>
										<th width="35%">제목</th>
										<th>작성자</th>
										<th>작성일</th>
			                        </tr>
			                    </thead>
			                    <tbody class="text-center" >
			                        <c:forEach var="inquireList" items="${inquireList}">
										<tr>
											<td>${inquireList.inquireNo}</td>
											<td>
			 									<a href="${pageContext.request.contextPath}/inquire/detail?inquireNo=${inquireList.inquireNo}">
													${inquireList.inquireTitle}
												</a>
											</td>
											<td>${inquireList.inquireId}</td>
											<td>${inquireList.inquireWritedate}</td>
										</tr>
									</c:forEach>
								</tbody>
			                </table>
			            </div>
			        </div>
        
	<%-- 페이지 네비게이터 --%>
	<div class=" mt-3 mb-4">
	<ul class="pagination">
		<c:choose>
			<c:when test = "${adminInquireListSearchVO.isFirst()}">
				<li class="page-item">
					<a class="page-link" href = "">&laquo;</a>
				</li>
			</c:when>
			<c:otherwise>
				<li class="page-item">
					<a class="page-link" href = "inquire?p=${adminInquireListSearchVO.firstBlock()}&${adminInquireListSearchVO.parameter()}">&laquo;</a>
				</li>
			</c:otherwise>
		</c:choose>
		
		<c:choose>
			<c:when test = "${adminInquireListSearchVO.hasPrev()}">
				<li class="page-item">
					<a class="page-link" href = "inquire?p=${adminInquireListSearchVO.prevBlock()}&${adminInquireListSearchVO.parameter()}">&lt;</a>
				</li>
			</c:when>
			<c:otherwise>
				<li class="page-item">
					<a class="page-link" href = "">&lt;</a>
				</li>
			</c:otherwise>
		</c:choose>
		
		<c:forEach var = "i" begin = "${adminInquireListSearchVO.startBlock()}" end = "${adminInquireListSearchVO.endBlock()}" step = "1">
			<li class="page-item">
				<a class="page-link" href = "inquire?p=${i}&${adminInquireListSearchVO.parameter()}">${i}</a>
			</li>
		</c:forEach>
		
		<c:choose>
			<c:when test = "${adminInquireListSearchVO.hasNext()}">
				<li class="page-item">
					<a class="page-link" href = "inquire?p=${adminInquireListSearchVO.nextBlock()}&${adminInquireListSearchVO.parameter()}">&gt;</a>
				</li>
			</c:when>
			<c:otherwise>
				<li class="page-item">
					<a class="page-link" href = "">&gt;</a>
				</li>
			</c:otherwise>
		</c:choose>
		
		<c:choose>
			<c:when test = "${adminInquireListSearchVO.isLast()}">
				<li class="page-item">
					<a class="page-link" href = "">&raquo;</a>
				</li>
			</c:when>
			<c:otherwise>
				<li class="page-item">
					<a class="page-link" href = "inquire?p=${adminInquireListSearchVO.lastBlock()}&${adminInquireListSearchVO.parameter()}">&raquo;</a>
				</li>
			</c:otherwise>
		</c:choose>
	</ul>
	</div>
</div>
			      
<%-- footer --%>
<jsp:include page="/WEB-INF/views/template/footer.jsp"></jsp:include>