<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<%-- header --%>
<jsp:include page="/WEB-INF/views/template/header.jsp">
	<jsp:param value="자유게시판 - 게시글 상세" name="title"/>
</jsp:include>

<div class = "container">
	<div class = "row">
		게시글 번호 : ${freeboardDto.freeboardNo}
	</div>
	<div class = "row">
		게시글 작성자 : ${freeboardDto.freeboardWriter}
	</div>
	<div class = "row">
		게시글 제목 : ${freeboardDto.freeboardTitle}
	</div>
	<div class = "row">
		게시글 내용 : ${freeboardDto.freeboardContent}
	</div>
	<div class = "row">
		게시글 조회수 : ${freeboardDto.freeboardRead}
	</div>
	<div class = "row">
		게시글 좋아요 : ${freeboardDto.freeboardLike}
		<c:if test = "${isLike == null}">
			<a href = "like?freeboardNo=${freeboardDto.freeboardNo}"><i class="fa-regular fa-heart"></i></a>
		</c:if>
		<c:if test = "${isLike == true}">
			<a href = "like?freeboardNo=${freeboardDto.freeboardNo}"><i class="fa-solid fa-heart"></i></a>
		</c:if>
		<c:if test = "${isLike == false}">
			<a href = "like?freeboardNo=${freeboardDto.freeboardNo}"><i class="fa-regular fa-heart"></i></a>
		</c:if>
	</div>
	<div>
		<c:if test = "${loginId == freeboardDto.freeboardWriter}">
			<a href = "edit?freeboardNo=${freeboardDto.freeboardNo}">수정</a>
			<a href = "inactive?freeboardNo=${freeboardDto.freeboardNo}">삭제</a>
		</c:if>
		<a href = "list">목록</a>
	</div>
	<div class = "row">
		<c:forEach var = "list" items = "${attachmentList}">
			<img src = "${pageContext.request.contextPath}/attachment/download/freeboard?attachmentNo=${list.attachmentNo}">
		</c:forEach>
	</div>
</div>

<br><br>
<hr>

<div class = "container mt-10">
	<h3>댓글 목록</h3>
	<c:forEach var = "freeboardReplyList" items = "${freeboardReplyList}">
	<div class = "row">
		<div class = "col">
			댓글 번호 : ${freeboardReplyList.freeboardReplyNo}
		</div>
		<div class = "col">
			댓글 작성자 : ${freeboardReplyList.freeboardReplyWriter}
		</div>
		<div class = "col">
			댓글 내용 : ${freeboardReplyList.freeboardReplyContent}
		</div>
		<div class = "col">
			댓글 작성일 : ${freeboardReplyList.freeboardReplyWritedate}
		</div>
		<c:if test = "${loginId == freeboardReplyList.freeboardReplyWriter}">
			<div class = "col">
				<button type = "button" name = "btn-edit-on">수정</button>
			</div>
			<div class = "col">
				<button type = "button">삭제</button>
			</div>
		</c:if>
	</div>
	<c:if test = "${loginId == freeboardReplyList.freeboardReplyWriter}">
	<div class = "row div-input">
		<form action = "${pageContext.request.contextPath}/freeboard_reply/edit" method = "post">
			<div class = "col-9">
				<input type = "hidden" name = "freeboardReplyNo" value = "${freeboardReplyList.freeboardReplyNo}">
				<input type = "hidden" name = "freeboardOriginNo" value = "${freeboardDto.freeboardNo}">
				<input type = "text" class = "w-100" name = "freeboardReplyContent" value = "${freeboardReplyList.freeboardReplyContent}">
			</div>
			<div class = "col-3">
				<button type = "submit">수정</button>
				<button type = "button" name = "btn-edit-off">취소</button>
			</div>
		</form>
	</div>
	</c:if>
	</c:forEach>
</div>

<%-- 페이지 네비게이터 --%>
<ul class="pagination">
	<c:choose>
		<c:when test = "${freeboardReplyListVO.isFirst()}">
			<li class="page-item">
				<a class="page-link" href = "">&laquo;</a>
			</li>
		</c:when>
		<c:otherwise>
			<li class="page-item">
				<a class="page-link" href = "detail?freeboardNo=${freeboardDto.freeboardNo}&p=${freeboardReplyListVO.blockFirst()}">&laquo;</a>
			</li>
		</c:otherwise>
	</c:choose>
	
	<c:choose>
		<c:when test = "${freeboardReplyListVO.hasPrev()}">
			<li class="page-item">
				<a class="page-link" href = "detail?freeboardNo=${freeboardDto.freeboardNo}&p=${freeboardReplyListVO.blockPrev()}">&lt;</a>
			</li>
		</c:when>
		<c:otherwise>
			<li class="page-item">
				<a class="page-link" href = "">&lt;</a>
			</li>
		</c:otherwise>
	</c:choose>
	
	<c:forEach var = "i" begin = "${freeboardReplyListVO.blockStart()}" end = "${freeboardReplyListVO.blockEnd()}" step = "1">
		<li class="page-item">
			<a class="page-link" href = "detail?freeboardNo=${freeboardDto.freeboardNo}&p=${i}">${i}</a>
		</li>
	</c:forEach>
	
	<c:choose>
		<c:when test = "${freeboardReplyListVO.hasNext()}">
			<li class="page-item">
				<a class="page-link" href = "detail?freeboardNo=${freeboardDto.freeboardNo}&p=${freeboardReplyListVO.blockNext()}">&gt;</a>
			</li>
		</c:when>
		<c:otherwise>
			<li class="page-item">
				<a class="page-link" href = "">&gt;</a>
			</li>
		</c:otherwise>
	</c:choose>
	
	<c:choose>
		<c:when test = "${freeboardReplyListVO.isLast()}">
			<li class="page-item">
				<a class="page-link" href = "">&raquo;</a>
			</li>
		</c:when>
		<c:otherwise>
			<li class="page-item">
				<a class="page-link" href = "detail?freeboardNo=${freeboardDto.freeboardNo}&p=${freeboardReplyListVO.blockLast()}">&raquo;</a>
			</li>
		</c:otherwise>
	</c:choose>
</ul>


<%-- 댓글 작성창 --%>
<div class = "container">
	<h3>댓글 작성</h3>
	<form action = "${pageContext.request.contextPath}/freeboard_reply/write" method = "post">
		<input type = "hidden" name = "freeboardOriginNo" value = "${freeboardDto.freeboardNo}">
		<input type = "text" name = "freeboardReplyContent">
		<button type = "submit">작성</button>
	</form>
</div>


<script type = "text/javascript">
	//댓글 수정 입력창 제어
	$(function(){
		// 초기에 댓글 수정 입력창 숨김
		$(".div-input").hide();
		// 특정 댓글의 수정 버튼을 누를 때 
	    $("[name=btn-edit-on]").click(function(){
	    	// 해당 수정 버튼과 묶여있는 수정 입력창 표시/숨김(토글)
            $(this).parent().parent().next().toggle();
	    });
	
		// 댓글 수정창의 취소 버튼을 누를 때
	    $("[name=btn-edit-off]").click(function(){
	    	// 해당 수정 입력창 숨김
            $(this).parent().parent().next().hide();
	    });
	});
	
	// Form 생성 및 값 전송 제어
	$(function(){
		
	})
</script>

<%-- footer --%>
<jsp:include page="/WEB-INF/views/template/footer.jsp"></jsp:include>