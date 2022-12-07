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
					<input type = "text" id = "input-search" class = "w-100" placeholder = "검색어 입력">
				</div>
				<div class = "col-3">
					<button type = "button" id = "btn-search">검색</button>
				</div>
			</div>
			
			<%-- 게시글 작성창 --%>
			<div class = "row">
				<h3>게시글 작성창</h3>
				<div class = "col-9">
					<input type = "text" id = "input-write" class = "w-100" placeholder = "내용 입력">
				</div>
				<div class = "col-3">
					<button type = "button" id = "btn-write">작성</button>
				</div>
			</div>
			
			<%-- 게시글 목록 --%>
			<div class = "row">
				<h3>게시글 목록창</h3>
			</div>
			<div class = "row" id = "ahzit-board-list">
				<div class = "col">
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
			</div>
		</div>
		
		<%-- 오른쪽 사이드바 --%>
		<div class = "col-3" style="background-color: green;">
			<div class = "row" id = "div-member-info" data-memberno = "${ahzitMemberDto.memberNo}" data-ahzitno = "${ahzitNo}">
				<div class = "col">
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
		
	</div>
</div>

<script type="text/javascript">
	
	$(function(){
		
		// 게시글 작성 비동기 처리
		$("#btn-write").click(function(){
			// 로그인 중인 회원의 회원 번호
			var boardWriterNo = $("#div-member-info").data("memberno");
			// 현재 접속중인 소모임 페이지의 소모임 번호
			var boardAhzitNo = $("#div-member-info").data("ahzitno");
			// 게시글 작성창에 입력한 내용
			var boardContent = $("#input-write").val();
			// 비동기 통신을 이용한 게시글 등록
			axios({
				url : "http://localhost:8888/rest_board/write",
				method : "post",
				data : {
					boardWriterNo : boardWriterNo,
					boardAhzitNo : boardAhzitNo,
					boardContent : boardContent
				}
			})
			.then(function(response){
				loadList();
				$("#input-write").val("");
			});
		});
		
		// 게시글 검색 비동기 처리
		$("#btn-search").click(function(){
			var memberAhzitNo = $("#div-member-info").data("ahzitno");
			var keyword = $("#input-search").val();
			axios({
				url : "http://localhost:8888/rest_board/search?memberAhzitNo=" + memberAhzitNo + "&keyword=" + keyword,
				method : "get"
			})
			.then(function(response){
				$("#ahzit-board-list").empty();
				for(var i = 0 ; i < response.data.length ; i ++){
					var outer = $("<div>").attr("class", "row mt-3");
					var inner = $("<div>").attr("class", "col");
					var boardNo = $("<div>").attr("class", "row").text("게시글 번호 : " + response.data[i].boardNo);
					var boardContent = $("<div>").attr("class", "row").text("게시글 내용 : " + response.data[i].boardContent);
					var boardLike = $("<div>").attr("class", "row").text("게시글 좋아요 : " + response.data[i].boardLike);
					var boardWritedate = $("<div>").attr("class", "row").text("게시글 작성일 : " + response.data[i].boardWritedate);
					var memberNo = $("<div>").attr("class", "row").text("작성자 번호 : " + response.data[i].memberNo);
					var memberNick = $("<div>").attr("class", "row").text("작성자 닉네임 : " + response.data[i].memberNick);
					var memberGrade = $("<div>").attr("class", "row").text("작성자 등급 : " + response.data[i].memberGrade);
					
					inner.append(boardNo).append(boardContent).append(boardLike).append(boardWritedate).append(memberNo).append(memberNick).append(memberGrade);

					outer.append(inner);
					$("#ahzit-board-list").append(outer);
				}
				
				$("#input-search").val("");
			});
		});
		
		// 게시글 목록 갱신 함수
		function loadList(){
			var ahzitNo = $("#div-member-info").data("ahzitno");
			axios({
				url : "http://localhost:8888/rest_board/list?ahzitNo=" + ahzitNo,
				method : "get"
			})
			.then(function(response){
				$("#ahzit-board-list").empty();
				
				for(var i = 0 ; i < response.data.length ; i ++){
					var outer = $("<div>").attr("class", "row mt-3");
					var inner = $("<div>").attr("class", "col");
					var boardNo = $("<div>").attr("class", "row").text("게시글 번호 : " + response.data[i].boardNo);
					var boardContent = $("<div>").attr("class", "row").text("게시글 내용 : " + response.data[i].boardContent);
					var boardLike = $("<div>").attr("class", "row").text("게시글 좋아요 : " + response.data[i].boardLike);
					var boardWritedate = $("<div>").attr("class", "row").text("게시글 작성일 : " + response.data[i].boardWritedate);
					var memberNo = $("<div>").attr("class", "row").text("작성자 번호 : " + response.data[i].memberNo);
					var memberNick = $("<div>").attr("class", "row").text("작성자 닉네임 : " + response.data[i].memberNick);
					var memberGrade = $("<div>").attr("class", "row").text("작성자 등급 : " + response.data[i].memberGrade);
					
					inner.append(boardNo).append(boardContent).append(boardLike).append(boardWritedate).append(memberNo).append(memberNick).append(memberGrade);

					outer.append(inner);
					$("#ahzit-board-list").append(outer);
				}
			});
		};
	});
	
</script>


<%-- footer --%>
<jsp:include page="/WEB-INF/views/template/footer.jsp"></jsp:include>