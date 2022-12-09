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
				<tr>
				<th>첨부파일</th>
				<td>
					<c:forEach var = "list" items = "${attachmentList}">
						<img src = "/attachment/download/inquire?attachmentNo=${list.attachmentNo}" width="300">
					</c:forEach>
				</td>
				</tr>
			</tbody>

			<tfoot>
				<tr>
					<td>
						<c:if test = "${loginId == inquireDto.inquireId}">
							<a href = "edit?inquireNo=${inquireDto.inquireNo}">수정</a>
							<a href = "delete?inquireNo=${inquireDto.inquireNo}">삭제</a>
							<a href = "list?inquireId=${inquireDto.inquireId}">목록</a>
						</c:if>
					</td>
				</tr>
			</tfoot>
		</table>
	</div>
</div>

<hr>

<div>
	<c:if test = "${loginGrade == '관리자'}">
	<h3>답변 작성</h3>
		<div>
			<form class="reply-insert-form" action = "/inquireReply/insert" method = "post">
				<input type = "hidden" name = "inquireOriginNo" value = "${inquireDto.inquireNo}">
				<input type = "text" name = "inquireReplyContent">
				<button type = "submit">작성</button>
			</form>
		</div>
	</c:if>
</div>

<hr>

<table class="table-reply-list">
	<c:forEach var = "inquireReplyList" items = "${inquireReplyList}">
	<tbody>
		<tr class="view">
			<td>
				답변자 :  (${inquireReplyList.inquireReplyWriter})
				<br>
				<pre>${inquireReplyList.inquireReplyContent}</pre>
				<br>
				답변일 : <fmt:formatDate value="${inquireReplyList.inquireReplyWritedate}" pattern="yyyy-MM-dd HH:mm"/>
				
				<c:if test = "${loginGrade == '관리자'}">
				<a  class="edit-btn"><button>수정</button></a>
				<a class="delete-btn" data-reply-origin ="${inquireReplyList.inquireOriginNo}" data-reply-no ="${inquireReplyList.inquireReplyNo}" ><button>삭제</button></a>
				</c:if>
				<hr>
			</td>
		</tr>
		
	
		<c:if test = "${loginGrade == '관리자'}">
			<tr class="editor">
				<th colspan="2">
					<form action="/inquireReply/edit"  method="post">
						<input type = "hidden" name = "inquireReplyNo" value = "${inquireReplyList.inquireReplyNo}">
						<input type = "hidden" name = "inquireOriginNo" value = "${inquireDto.inquireNo}">
						<input type = "text" class = "w-100" name = "inquireReplyContent" value = "${inquireReplyList.inquireReplyContent}">
						<button type="submit">변경</button>
						<a class="cancel-btn">취소</a>
					</form>
				</th>
			</tr>
		</c:if>
	</c:forEach>
	</tbody>
</table>

<%-- 페이지 네비게이터 --%>
<ul class="pagination">
	<c:choose>
		<c:when test = "${inquireReplyListSearchVO.isFirst()}">
			<li class="page-item">
				<a class="page-link" href = "">&laquo;</a>
			</li>
		</c:when>
		<c:otherwise>
			<li class="page-item">
				<a class="page-link" href = "list?p=${inquireReplyListSearchVO.firstBlock()}">&laquo;</a>
			</li>
		</c:otherwise>
	</c:choose>
	
	<c:choose>
		<c:when test = "${inquireReplyListSearchVO.hasPrev()}">
			<li class="page-item">
				<a class="page-link" href = "list?p=${inquireReplyListSearchVO.prevBlock()}">&lt;</a>
			</li>
		</c:when>
		<c:otherwise>
			<li class="page-item">
				<a class="page-link" href = "">&lt;</a>
			</li>
		</c:otherwise>
	</c:choose>
	
	<c:forEach var = "i" begin = "${inquireReplyListSearchVO.startBlock()}" end = "${inquireReplyListSearchVO.endBlock()}" step = "1">
		<li class="page-item">
			<a class="page-link" href = "list?p=${i}">${i}</a>
		</li>
	</c:forEach>
	
	<c:choose>
		<c:when test = "${inquireReplyListSearchVO.hasNext()}">
			<li class="page-item">
				<a class="page-link" href = "list?p=${inquireReplyListSearchVO.nextBlock()}">&gt;</a>
			</li>
		</c:when>
		<c:otherwise>
			<li class="page-item">
				<a class="page-link" href = "">&gt;</a>
			</li>
		</c:otherwise>
	</c:choose>
	
	<c:choose>
		<c:when test = "${inquireReplyListSearchVO.isLast()}">
			<li class="page-item">
				<a class="page-link" href = "">&raquo;</a>
			</li>
		</c:when>
		<c:otherwise>
			<li class="page-item">
				<a class="page-link" href = "list?p=${inquireReplyListSearchVO.lastBlock()}">&raquo;</a>
			</li>
		</c:otherwise>
	</c:choose>
</ul>

<script>
	$(function(){
		//목표 : 
		//1. edit-btn을 누르면 view를 숨기고 editor를 보여준다
		//2. cancel-btn을 누르면 editor를 숨기고 view를 보여준다
		//3. 처음에는 view만 보여준다
		//1
		$(".edit-btn").click(function(){
			$(this).parents(".view").hide();
			$(this).parents(".view").next(".editor").show();
		});
		//2
		$(".cancel-btn").click(function(){
			$(this).parents(".editor").hide();
			$(this).parents(".editor").prev(".view").show();
		});
		//3
		$(".editor").hide();
	});
	
	
	//댓글 등록 처리
	$(function(){
		$(".reply-insert-form").submit(function(e){
			//기본 이벤트를 차단한다(form을 사용하지 않을 예정)
			e.preventDefault();
			
			//댓글 입력값을 가져와서 검사 후 전송
			var text = $(this).find("[name=inquireReplyContent]").val();
			if(!text){
				alert("내용을 작성해주세요");
				return;
			}
			
			var form = this;
			var inquireReplyNo =$(this).find("[name=inquireOriginNo]").val();
			//정상적으로 입력되었다면 비동기 통신으로 등록 요청
			$.ajax({
				url:"http://localhost:8888/inquireReply/insert",
				method:"post",
				//data:{
				//	replyOrigin:$(this).find("[name=replyOrigin]").val(),
				//	replyContent:text
				//},
				data:$(form).serialize(),//form을 전송 가능한 형태의 문자로 변환한다
				success:function(resp){
				     location.replace("detail?inquireNo=" +inquireReplyNo);
					//입력창 초기화(= 폼 초기화) - 자바스크립트로 처리
					form.reset();
				}
			});
		});
		
		//댓글 삭제버튼을 누르면 삭제
		$(".delete-btn").click(deleteHandler);
	
		function deleteHandler(e){
			e.preventDefault();
			
			var inquireOriginNo = $(this).data("reply-origin");
			var inquireReplyNo= $(this).data("reply-no")
			
			$.ajax({
				url:"http://localhost:8888/inquireReply/delete",
				method:"get",
				data:{
					inquireOriginNo:inquireOriginNo,
					inquireReplyNo:inquireReplyNo
				},
				success:function(resp){
					  location.replace("detail?inquireNo=" +inquireOriginNo);
				}
			});
		}
	});
</script>

<%-- footer --%>
<jsp:include page="/WEB-INF/views/template/footer.jsp"></jsp:include>