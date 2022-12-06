<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
    
<%-- header --%>
<jsp:include page="/WEB-INF/views/template/ahzit_header.jsp">
	<jsp:param value="소모임 게시글" name="title"/>
</jsp:include>

<div class = "container">
	<div class = "row">
	
		<%-- 왼쪽 사이드바 --%>
		<div class = "col-3" style="background-color: green;">
		사이드1
		</div>
		
		<%-- 가운데 내용 --%>
		<div class = "col-6">
		
			<h1>게시판</h1>
			
			<%-- 검색창 --%>
			<div class = "row">
				<h3>검색창</h3>
				<div class = "col-9">
					<input type = "text" class = "w-100" placeholder = "검색어 입력">
				</div>
				<div class = "col-3">
					<button type = "button" id = "btn-search">검색</button>
				</div>
			</div>
			
			<%-- 게시글 작성창 --%>
			<div class = "row">
				<h3>게시글 작성창</h3>
				<div class = "col-9">
					<input type = "text" class = "w-100" placeholder = "내용 입력">
				</div>
				<div class = "col-3">
					<button type = "button" id = "btn-write">작성</button>
				</div>
			</div>
			
			<%-- 게시글 목록 --%>
			<div>
				<h3>게시글 목록창</h3>
			</div>
			<c:forEach var = "ahzitBoardList" items = "${ahzitBoardList}">
				<div class = "row mt-3">
					<div class = "col">
						<div class = "row">게시글 번호 : ${ahzitBoardList.boardNo}</div>
						<div class = "row">게시글 내용 : ${ahzitBoardList.boardContent}</div>
						<div class = "row">게시글 좋아요 : ${ahzitBoardList.boardLike}</div>
						<div class = "row">게시글 작성일 : ${ahzitBoardList.boardWritedate}</div>
						<div class = "row">작성자 번호 : ${ahzitBoardList.memberNo}</div>
						<div class = "row">작성자 닉네임 : ${ahzitBoardList.memberNick}</div>
						<div class = "row">작성자 등급 : ${ahzitBoardList.memberGrade}</div>
					</div>
				</div>
			</c:forEach>
		</div>
		
		<%-- 오른쪽 사이드바 --%>
		<div class = "col-3" style="background-color: green;">
			<div class = "row">${ahzitMemberDto.memberNo}</div>
			<div class = "row">${ahzitMemberDto.memberAhzitNo}</div>
			<div class = "row">${ahzitMemberDto.memberId}</div>
			<div class = "row">${ahzitMemberDto.memberNick}</div>
			<div class = "row">${ahzitMemberDto.memberGrade}</div>
			<div class = "row">${ahzitMemberDto.memberScore}</div>
			<div class = "row">${ahzitMemberDto.memberJoindate}</div>
		</div>
		
	</div>
</div>

<script type="text/javascript">
	
	$(function(){
		
		$("#btn-write").click(function(){
			
		});
	});
	
</script>


<%-- footer --%>
<jsp:include page="/WEB-INF/views/template/footer.jsp"></jsp:include>