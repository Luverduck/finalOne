<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
    
<%-- header --%>
<jsp:include page="/WEB-INF/views/template/ahzit_header.jsp">
	<jsp:param value="소모임 게시글" name="title"/>
</jsp:include>

<style>
	.row, .col {
		border: gray dotted;
	}
	
	.input-group-text {
		background-color: #FED164;
		border-radius: 10px;
	}
	
	#ahzit-background {
		background-color: rgba(230, 230, 230, 100);
	}
	
	#ahzit-board-outer {
		background-color: rgba(230, 230, 230, 100);
		border-radius: 10px;
	}
	
	#ahzit-board-content {
		background-color: rgba(230, 230, 230, 100);
		border-radius: 10px;
	}
	
	#profile-member {
		border-radius: 50%;
	}
</style>

<div class = "container">
	<div class = "row">
	
		<%-- 왼쪽 사이드바 --%>
		<div class = "col col-3" style="background-color: green;">
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
		
		<%-- 가운데 내용 --%>
		<div class = "col-6">
			
			<%-- 게시글 작성창 --%>
			<div class = "row">
				<label class = "input-group editor-open-insert" data-bs-toggle="modal" data-bs-target="#modal-insert">
				 	<span class="form-control"></span>
				 	<button class="input-group-text"><i class="fa-solid fa-pen-to-square fa-2x"></i></button>
				</label>	
			</div>
			
			<%-- 게시글 목록 --%>
			<div class = "row" id = "ahzit-board-list">
				<div class = "col ps-4 pe-4">
					<%-- 반복문 시작 --%>
					<c:forEach var = "ahzitBoardList" items = "${ahzitBoardList}">
					<%-- 게시글 한 개 --%>
					<div class = "row mt-3 ps-2 pe-2 pt-3 pb-3 d-flex align-items-center" id = "ahzit-board-outer">
						<div class = "col" id = "ahzit-board" data-boardno = "${ahzitBoardList.boardNo}" data-memberno = "${ahzitBoardList.memberNo}">
							<div class = "row">
								<div class = "col col-2 pe-2">
									<img id = "profile-member" src = "https://placeimg.com/65/65/any">
								</div>
								<div class = "col col-10">
									<div class = "row">
										<div class = "col col-11">
											<p id = "p-member-name">${ahzitBoardList.memberNick} [${ahzitBoardList.memberGrade}]</p>
										</div>
										<div class = "col col-1">
											<div class="dropdown">
												<i class="dropdown-toggle" id="ahzitBoardDropDown" data-bs-toggle="dropdown" aria-expanded="false"></i>
										        <ul class="dropdown-menu" aria-labelledby="ahzitBoardDropDown">
										            <li>
										            	<%-- 게시글 수정 입력창 열기 --%>
										            	<a class="dropdown-item editor-open-edit" data-bs-toggle="modal" data-bs-target="#modal-editor">수정</a>
										            </li>
										            <li>
										            	<a class="dropdown-item">삭제</a>
										            </li>
										        </ul>
								    		</div>
										</div>
									</div>
									<div class = "row">
										<div class = "col">
											${ahzitBoardList.boardWritedate}
										</div>
									</div>
								</div>
							</div>
							<div class = "row mt-4 mb-3 ms-1 me-1" id = "ahzit-board-content">
								${ahzitBoardList.boardContent}
							</div>
							<div class = "row">
								<div class = "col">
									<a href = "#">댓글 작성</a>
								</div>
								<div class = "col">
									<label>
										<i class="fa-solid fa-heart"></i>
										<i class="fa-regular fa-heart"></i>
									</label>
								</div>
							</div>
						</div>
					</div>
					</c:forEach>
					<%-- 반복문 끝 --%>
				</div>
			</div> <!-- col -->
		</div>
		
		<%-- 게시글 입력창 Modal --%>
        <div class="modal fade" id="modal-editor" tabindex="-1" data-bs-backdrop="static">
            <div class="modal-dialog modal-dialog-centered modal-lg">
                <div class="modal-content">
                    <!-- 모달 헤더 : 제목 영역 -->
                    <div class="modal-header">
                        <h5 class="modal-title-insert">게시글 작성</h5>
                        <h5 class="modal-title-edit">게시글 수정</h5>
                        <!-- X 버튼 -->
                        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                    </div>
                    <!-- 모달 바디 -->
                    <div class="modal-body">
                        <!-- Summer Note 영역 -->
                        <textarea class = "input-content"></textarea>
                    </div>
                    <!-- 모달 푸터 -->
                    <div class="modal-footer">
                        <button type="button" class="btn editor-close-insert" data-bs-dismiss="modal">닫기</button>
                        <button type="button" class="btn editor-confirm-insert">작성</button>
                        <button type="button" class="btn editor-close-edit" data-bs-dismiss="modal">닫기</button>
                        <button type="button" class="btn editor-confirm-edit">수정</button>
                    </div>
                </div>
            </div>
        </div>
		
		
		<%-- 오른쪽 사이드바 --%>
		<div class = "col col-3" style="background-color: green;">
			
			<%-- 검색창 --%>
			<div class = "row mt-3">
				<div class = "col-9">
					<input type = "text" id = "input-search" class = "w-100" placeholder = "검색어 입력">
				</div>
				<div class = "col-3">
					<button type = "button" id = "btn-search">검색</button>
				</div>
			</div>
			
			<%-- 공지사항 목록 --%>
			<div>
			
			</div>
		</div>
		
	</div>
</div>

<script type="text/javascript">
	
	$(function(){
		
		// 게시글 작성 비동기 처리
		// - 게시글 작성 영역 클릭시 게시글 작성 입력창 열기
        $(".editor-open-insert").click(function(){
        	// 게시글 등록 입력창 열기
            $("#modal-editor").modal("show");
         	// Modal에서 게시글 작성 요소 표시 및 수정 요소 숨김 처리
        	// - 게시글 작성 제목 표시
        	$(".modal-title-insert").show();
        	// - 게시글 작성 버튼 표시
        	$(".editor-confirm-insert").show();
        	// - 게시글 작성의 닫기 버튼 표시
        	$(".editor-close-insert").show();
        	// - 게시글 수정 제목 숨김
        	$(".modal-title-edit").hide();
        	// - 게시글 수정 버튼 숨김
        	$(".editor-confirm-edit").hide();
        	// - 게시글 수정의 닫기 버튼 숨김
        	$(".editor-close-edit").hide();
            // Summer Note 불러오기
            $(".input-content").summernote({
                height:500,
                minHeight:500,
                maxHeight:500,
                placeholder:"새로운 소식을 남겨보세요",
            });
        });

        // - 확인 버튼 클릭시 비동기로 게시글 등록 요청 전송
        $(".btn-editor-confirm").click(function(){
        	// 로그인 중인 회원의 회원 번호
			var boardWriterNo = $("#div-member-info").data("memberno");
			// 현재 접속중인 소모임 페이지의 소모임 번호
			var boardAhzitNo = $("#div-member-info").data("ahzitno");
            // 태그를 포함하여 내용 지정
            var boardContent = $(".note-editable").html();
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
				// 게시글 목록 갱신
				loadList();
				// 게시글 등록 입력창 비우기
				$(".note-editable").html("");
				// 게시글 등록창 닫기
				$("#modal-editor").modal("hide");
			});
        });	
		
     	// 게시글 수정 비동기 처리
        // - 게시글 수정 클릭시 게시글 등록 입력창 열기
        $(".editor-open-edit").click(function(){
        	// 게시글 수정 입력창 열기
            $("#modal-editor").modal("show");
        	// Modal에서 게시글 수정 요소 표시 및 작성 요소 숨김 처리
        	// - 게시글 수정 제목 표시
        	$(".modal-title-edit").show();
        	// - 게시글 수정 버튼 표시
        	$(".editor-confirm-edit").show();
        	// - 게시글 수정의 닫기 버튼 표시
        	$(".editor-close-edit").show();
        	// - 게시글 작성 제목 숨김
        	$(".modal-title-insert").hide();
        	// - 게시글 작성 버튼 숨김
        	$(".editor-confirm-insert").hide();
        	// - 게시글 작성의 닫기 버튼 표시
        	$(".editor-close-insert").hide();
            // Summer Note 불러오기
            $(".input-content").summernote({
                height:500,
                minHeight:500,
                maxHeight:500,
                placeholder:"새로운 소식을 남겨보세요",
            });
        });

        // - 확인 버튼 클릭시 비동기로 게시글 수정 요청 전송
        $(".btn-editor-confirm").click(function(){
            // 태그를 포함하여 내용 지정
            var content = $(".note-editable").html();
            // 비동기 통신을 이용한 게시글 수정
            
         	// 게시글 수정 입력창 비우기
            $(".note-editable").html("");
         	// 게시글 수정 입력창 닫기
            $("#modal-editor").modal("hide");
         	// 게시글 목록 갱신
			loadList();
        });

        // - 게시글 작성의 닫기 버튼을 클릭할 경우 confirm 메시지
        $(".editor-close-insert").click(function(e){
            var choice = window.confirm("글 작성을 취소하시겠습니까?");
            if(choice == false) return;
            $("#modal-editor").modal("hide");
            $(".note-editable").html("");
        });
        
     	// - 게시글 수정의 닫기 버튼을 클릭할 경우 confirm 메시지
        $(".editor-close-edit").click(function(e){
            var choice = window.confirm("글 수정을 취소하시겠습니까?");
            if(choice == false) return;
            $("#modal-editor").modal("hide");
            $(".note-editable").html("");
        });
		
		// 게시글 검색 비동기 처리
		$("#btn-search").click(function(){
			var ahzitNo = $("#div-member-info").data("ahzitno");
			var keyword = $("#input-search").val();
			axios({
				url : "http://localhost:8888/rest_board/search?ahzitNo=" + ahzitNo + "&keyword=" + keyword,
				method : "get"
			})
			.then(function(response){
				$("#ahzit-board-list").empty();
				for(var i = 0 ; i < response.data.length ; i ++){
					var outer = $("<div>").attr("class", "row mt-3");
					var inner = $("<div>").attr("class", "col");
					var boardNo = $("<div>").attr("class", "row").text("게시글 번호 : " + response.data[i].boardNo);
					var boardContent = $("<div>").attr("class", "row").html("게시글 내용 : " + response.data[i].boardContent);
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
					var boardContent = $("<div>").attr("class", "row").html("게시글 내용 : " + response.data[i].boardContent);
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

<!-- Summer Note CDN -->
<script src="https://cdn.jsdelivr.net/npm/summernote@0.8.20/dist/summernote-bs5.min.js"></script>

<!-- Summer Note CSS -->
<link href="https://cdn.jsdelivr.net/npm/summernote@0.8.20/dist/summernote-bs5.min.css" rel="stylesheet">


<%-- footer --%>
<jsp:include page="/WEB-INF/views/template/footer.jsp"></jsp:include>