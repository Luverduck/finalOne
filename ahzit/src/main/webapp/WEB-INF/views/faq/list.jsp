<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!-- 현재 시간 구하기 -->
<jsp:useBean id="now" class="java.util.Date"></jsp:useBean>
<c:set var="today">
	<fmt:formatDate value="${now}" pattern="yyyy-MM-dd" />
</c:set>

<style>
.faqContent{
display: none;
}
</style>

<script src="https://code.jquery.com/jquery-3.6.1.js"></script>
<script type = "text/javascript">
    $(function(){

        $(".toggle").click(function(){
        	  $(this).next().slideToggle();
        	  });
        })
   
    
</script>

<jsp:include page="/WEB-INF/views/template/header.jsp">
	<jsp:param value="faq" name="title" />
</jsp:include>


	<c:if test="${loginId != null}">
		<div class="row right">
			<%-- 관리자일 경우만 삭제버튼을 추가 --%>
			<c:if test="${loginGrade == '관리자'}">
				<a class="btn btn-neutral" href="write">글쓰기</a>
			</c:if>

			<a class="btn btn-neutral" href="write">글쓰기</a>

		</div>
	</c:if>

<div class = "container-fluid mt-3">
	<div class = "row">
		<div class = "col-8 offset-2 main">
			<div class = "row">

				<div class="row mt-4">
					<div class="col-lg-4 offset-lg-4 col-md-6 offset-md-3 col-sm-8 offset-sm-2">
						<div class="p-4 text-dark bg-Light rounded">
							<h1 class="text-center">FAQ</h1>	
						</div>
					</div>
				</div>
				
				<div>
					<c:forEach var="faqDto" items="${list}">
						<div class="toggle">	
						<i class="fa-solid fa-plus"></i>
						  ${faqDto.faqTitle}
						</div>
						
						<div class="faqContent">
						내용 : ${faqDto.faqContent}
						</div>
						<hr>
					</c:forEach>
				</div>

				<!-- 페이징 -->
				<div class="row center">
					<ul class="pagination">
						<!-- 이전 -->
						<c:choose>
							<c:when test="${not vo.isFirst()}">
								<li><a href="list?p=${vo.firstBlock()}&${vo.parameter()}">&laquo;</a></li>
							</c:when>
							<c:otherwise>
								<li><a href="#">&laquo;</a></li>
							</c:otherwise>
						</c:choose>
			
						<c:choose>
							<c:when test="${vo.hasPrev()}">
								<li><a href="list?p=${vo.prevBlock()}&${vo.parameter()}">&lt;</a></li>
							</c:when>
							<c:otherwise>
								<li><a href="#">&lt;</a></li>
							</c:otherwise>
						</c:choose>
			
						<!-- 숫자 -->
						<c:forEach var="i" begin="${vo.startBlock()}" end="${vo.endBlock()}"
							step="1">
							<c:choose>
								<c:when test="${vo.p == i}">
									<li class="on"><a href="#">${i}</a></li>
								</c:when>
								<c:otherwise>
									<li><a href="list?p=${i}&${vo.parameter()}">${i}</a></li>
								</c:otherwise>
							</c:choose>
						</c:forEach>
			
						<!-- 다음을 누르면 다음 구간의 첫 페이지로 안내 -->
						<c:choose>
							<c:when test="${vo.hasNext()}">
								<li><a href="list?p=${vo.nextBlock()}&${vo.parameter()}">&gt;</a></li>
							</c:when>
							<c:otherwise>
								<li><a href="#">&gt;</a></li>
							</c:otherwise>
						</c:choose>
			
						<c:choose>
							<c:when test="${not vo.isLast()}">
								<li><a href="list?p=${vo.lastBlock()}&${vo.parameter()}">&raquo;</a></li>
							</c:when>
							<c:otherwise>
								<li><a href="#">&raquo;</a></li>
							</c:otherwise>
						</c:choose>
					</ul>
				</div>

				<!-- 검색창 -->
				<form action="list" method="get">
					<select name="type" required>
						<option value="faq_title"
							<c:if test="${vo.type=='faq_title'}">selected</c:if>>제목</option>
						<option value="faq_content"
							<c:if test="${vo.type=='faq_content'}">selected</c:if>>내용</option>
			
					</select> <input type="search" name="keyword" placeholder="검색어" required
						value="${vo.keyword}">
					<button type="submit">검색</button>
				</form>
			</div>
		</div>
	</div>
</div>







<jsp:include page="/WEB-INF/views/template/footer.jsp"></jsp:include>