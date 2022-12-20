<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<%-- header --%>
<jsp:include page="/WEB-INF/views/template/adminHeader.jsp">
	<jsp:param value="아지트 관리" name="title"/>
</jsp:include>

<style>
.pagination{
justify-content : center
}
</style>

	<div class="row mt-4">
		<div class="col-lg-4 offset-lg-4 col-md-6 offset-md-3 col-sm-8 offset-sm-2">
			<div class="p-4 text-dark bg-Light rounded">
				<h1 class="text-center">아지트 관리</h1>	
			</div>
		</div>
	</div>
	
	<%-- 검색창 --%>
	<div class="text-center mt-3 mb-4">
		<form action = "ahzit" method = "get">
			<select name = "type" required>
				<option value = "ahzit_name">소모임명</option>
				<option value = "ahzit_sort">소모임주제</option>
			</select>
			<input name = "keyword" placeholder = "검색어" value = "${adminAhzitListSearchVO.keyword}" required>
			<button type = "submit">검색</button>
		</form>
	</div>
	
	<div class="text-center mt-3 mb-4">

<div class="row mt-4">
			            <div class="col-md-10 offset-md-1">
			                <table class="table table-hover">
			                    <thead class="text-center">
			                        <tr class="bg-dark text-light">
										<th>소모임 번호</th>
										<th width="35%">소모임명</th>
										<th>소모임 주제</th>
										<th>소모임 등급</th>
			                        </tr>
			                    </thead>
			                    <tbody class="text-center" >
			                        <c:forEach var="ahzit" items="${ahzit}">
										<tr>
											<td>${ahzit.ahzitNo}</td>
											<td>
			 									<a href="${pageContext.request.contextPath}/admin/ahzitSelect?ahzitNo=${ahzit.ahzitNo}">
													${ahzit.ahzitName}
												</a>
											</td>
											<td>${ahzit.ahzitSort}</td>
											<td>${ahzit.ahzitGrade}</td>
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
			<c:when test = "${adminAhzitListSearchVO.isFirst()}">
				<li class="page-item">
					<a class="page-link" href = "">&laquo;</a>
				</li>
			</c:when>
			<c:otherwise>
				<li class="page-item">
					<a class="page-link" href = "ahzit?p=${adminAhzitListSearchVO.firstBlock()}&${adminAhzitListSearchVO.parameter()}">&laquo;</a>
				</li>
			</c:otherwise>
		</c:choose>
		
		<c:choose>
			<c:when test = "${adminAhzitListSearchVO.hasPrev()}">
				<li class="page-item">
					<a class="page-link" href = "ahzit?p=${adminAhzitListSearchVO.prevBlock()}&${adminAhzitListSearchVO.parameter()}">&lt;</a>
				</li>
			</c:when>
			<c:otherwise>
				<li class="page-item">
					<a class="page-link" href = "">&lt;</a>
				</li>
			</c:otherwise>
		</c:choose>
		
		<c:forEach var = "i" begin = "${adminAhzitListSearchVO.startBlock()}" end = "${adminAhzitListSearchVO.endBlock()}" step = "1">
			<li class="page-item">
				<a class="page-link" href = "ahzit?p=${i}&${adminAhzitListSearchVO.parameter()}">${i}</a>
			</li>
		</c:forEach>
		
		<c:choose>
			<c:when test = "${adminAhzitListSearchVO.hasNext()}">
				<li class="page-item">
					<a class="page-link" href = "ahzit?p=${adminAhzitListSearchVO.nextBlock()}&${adminAhzitListSearchVO.parameter()}">&gt;</a>
				</li>
			</c:when>
			<c:otherwise>
				<li class="page-item">
					<a class="page-link" href = "">&gt;</a>
				</li>
			</c:otherwise>
		</c:choose>
		
		<c:choose>
			<c:when test = "${adminAhzitListSearchVO.isLast()}">
				<li class="page-item">
					<a class="page-link" href = "">&raquo;</a>
				</li>
			</c:when>
			<c:otherwise>
				<li class="page-item">
					<a class="page-link" href = "ahzit?p=${adminAhzitListSearchVO.lastBlock()}&${adminAhzitListSearchVO.parameter()}">&raquo;</a>
				</li>
			</c:otherwise>
		</c:choose>
	</ul>
	</div>
</div>
			      
<%-- footer --%>
<jsp:include page="/WEB-INF/views/template/footer.jsp"></jsp:include>