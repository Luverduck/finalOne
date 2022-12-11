<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
    
<%-- header --%>
<jsp:include page="/WEB-INF/views/template/ahzit_header.jsp">
	<jsp:param value="소모임 게시글" name="title"/>
</jsp:include>

<style>
	* {
		border: gray 1px dotted;
	}
	
	a {
		text-decoration: none;
		
	}
	
	body {
		background-color: rgba(230, 230, 230, 100);
	}
	
	.div-member-profile {
		width: 70px;
		height: 70px;
	}
	
	.img-member-profile {
		border-radius: 50%;
		width: 100%;
	}

	.div-editor-opener {
		border-radius: 10px;
	}

	.div-board {
		background-color: white;
	}
	
	.div-board-top {
		border-top-left-radius: 10px;
		border-top-right-radius: 10px;
	}
	
	.div-board-bottom {
		border-bottom-left-radius: 10px;
		border-bottom-right-radius: 10px;
	}
	
	.p-writer-info {
		font-weight: 1000;
	}
	
	.div-icon-dropdown {
		width : 20px;
	}
	
	.button-board {
		cursor: pointer;
		align-content: center;
	}
	
	.icon-board, 
	.icon-editor-opener {
		color: black;
		font-size: 20px;
	}
	
	.icon-board-like-on {
		color: #FF8681;
	}

</style>

<%-- 아지트 가입을 위한 폼 --%>

<div class = "container-fluid">
	<div class = "row">
		
		<div class = "col-10 offset-1 main">
			
			<div class = "row">
			
				<%-- 왼쪽 사이드바 --%>
				<div class = "col col-3" style="background-color: green;">
					<h1>왼쪽 사이드바</h1> 
				
					<br>
					
					<div class = "row">
						<%-- 아지트 정보 --%>
						아지트 이름 : ${ahzitVO.getAhzitName()} <br>
						아지트 소개 : ${ahzitVO.getAhzitInfo()}<br>
						아지트 멤버 : ${ahzitVO.getAhzitHead()} 명<br>
						아지트 종류 : ${ahzitVO.getAhzitSort()}<br>
						아지트 리더 : ${ahzitVO.getAhzitLeader()}<br>
						
						<%-- 아지트 가입 폼 --%>
						<form action="insert" method="post">	
							<input type="hidden" name="ahzitNo"  value="${ahzitVO.getAhzitNo()}">
							<%-- 아지트 가입버튼 --%>
							<c:choose>
							<c:when test="${ahzitMemberDto.getMemberId() == null}"><%-- 소모임 회원이 아니면 --%>
							<button type="submit">아지트 가입</button>
							</c:when>
							<c:otherwise>
							<button type="submit"  disabled>아지트 가입</button><%-- 소모임 회원이라면 --%>
							</c:otherwise>
							</c:choose>
						</form>
					</div>
					
					<div class = "row" id = "div-member-info" data-memberno = "${ahzitMemberDto.memberNo}" data-ahzitno = "${ahzitMemberDto.memberAhzitNo}" data-membergrade="${ahzitMemberDto.memberGrade}">
						로그인 중인 회원 번호 : ${ahzitMemberDto.memberNo}<br>
						회원이 가입한 아지트 번호 : ${ahzitMemberDto.memberAhzitNo}<br>
						로그인 중인 회원 아이디 : ${ahzitMemberDto.memberId}<br>
						로그인 중인 회원 닉네임 : ${ahzitMemberDto.memberId}<br>
						로그인 중인 회원 등급 : ${ahzitMemberDto.memberGrade}<br>
						로그인 중인 회원 활동 점수 : ${ahzitMemberDto.memberGrade}<br>
						소모임 가입일 : ${ahzitMemberDto.memberJoindate}
					</div>
				</div>
				
				<%-- 가운데 내용 --%>
				<div class = "col col-6">
				
					<%-- 게시글 작성창 --%>
					<div class = "row">
						<div class = "col">
							<div class = "d-flex px-3 py-2 bg-white div-editor-opener editor-open-insert">
								<input class="d-flex flex-fill div-editor-opener"></input>
								<span class="d-flex align-items-center fa-solid fa-pen-to-square border-0 bg-white px-3 icon-editor-opener"></span>
								<span class="d-flex align-items-center fa-regular fa-image border-0 bg-white icon-editor-opener"></span>
							</div>
						</div>
					</div>
					
					<%-- 게시글 검색창 --%>
					<div class = "row mt-3">
						<div class = "col-9">
							<input type = "text" class = "input-search" class = "w-100" placeholder = "검색어 입력">
						</div>
						<div class = "col-3">
							<button type = "button" class = "btn-search-submit">검색</button>
						</div>
					</div>
					
					<%-- 게시글 목록 --%>
					<div class = "row">
						<div class = "col" id = "div-board-list">
							
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
			                        <button type="button" class="btn-close editor-close-insert" data-bs-dismiss="modal" aria-label="Close"></button>
			                        <button type="button" class="btn-close editor-close-edit" data-bs-dismiss="modal" aria-label="Close"></button>
			                    </div>
			                    <!-- 모달 바디 -->
			                    <div class="modal-body">
			                        <!-- Summer Note 영역 -->
			                        <textarea id = "summernote"></textarea>
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
				</div>
				
				<%-- 오른쪽 사이드바 --%>
				<div class = "col-3" style="background-color: green;">
					
					
					<%-- 공지사항 목록 --%>
					<div>
					
					</div>
				</div>
			</div>
		</div>
	</div>
</div>

<script type="text/javascript">

	// 초기 게시글 목록 비동기 조회
	loadList();
	
	// 초기 1페이지
	var p = 1;
	$(window).scroll(_.debounce(function(){
		var percentage = $(window).scrollTop() / ($(document).height() - $(window).height()) * 100;
		if(percentage > 80) {
			p = p + 1;
			var ahzitNo = $("#div-member-info").data("ahzitno");
			//var p = 1;
			axios({
				url : "http://localhost:8888/rest_board/list",
				method : "post",
				data : {
					ahzitNo : ahzitNo,
					p : p
				}
			})
			.then(function(response){
				for(var i = 0 ; i < response.data.boardList.length ; i ++){
					var divtop_outer = $("<div>").attr("class", "d-flex align-items-start px-3 pt-3 mt-3 div-board div-board-top")
					
					var divtop_span = $("<span>").attr("class", "div-member-profile");
					var divtop_img_member = $("<img>").attr("class", "img-member-profile").attr("src", "https://placeimg.com/65/65/any"); // 임시 주소
					var divtop_img = divtop_span.append(divtop_img_member);
					
					var divtop_writer_outer = $("<div>").attr("class", "ms-3 w-100");
					var divtop_writer_info = $("<p>").attr("class", "mb-0 p-writer-info").text(response.data.boardList[i].memberNick + " [" + response.data.boardList[i].memberGrade +"]");
					var divtop_writedate = $("<p>").attr("class", "mb-0").text(response.data.boardList[i].boardWritedate);
					var divtop_writer = divtop_writer_outer.append(divtop_writer_info).append(divtop_writedate);
					
					var divtop_dropdown_outer = $("<div>").attr("class", "dropdown div-icon-dropdown");
					var divtop_dropdown_a = $("<a>").attr("class", "fa-solid fa-ellipsis-vertical a-board-dropdown icon-board w-100").attr("data-bs-toggle", "dropdown").attr("data-boardwriterno", response.data.boardList[i].boardWriterNo).attr("data-boardwritergrade", response.data.boardList[i].memberGrade);
					var divtop_dropdown_ul = $("<ul>").attr("class", "dropdown-menu");
					var divtop_dropdown_li_edit = $("<li>").attr("class", "li-edit");
					var divtop_dropdown_a_edit = $("<a>").attr("class", "dropdown-item editor-open-edit").attr("data-bs-toggle", "modal").attr("data-bs-target", "#modal-editor").text("수정");
					var divtop_dropdown_li_delete = $("<li>").attr("class", "li-delete");
					var divtop_dropdown_a_delete = $("<a>").attr("class", "dropdown-item btn-delete").attr("data-boardno", response.data.boardList[i].boardNo).attr("data-boardwriterno", response.data.boardList[i].boardWriterNo).text("삭제");
					var divtop_dropdown_li_report = $("<li>").attr("class", "li-report");
					var divtop_dropdown_a_report = $("<a>").attr("class", "dropdown-item btn-report").attr("data-boardno", response.data.boardList[i].boardNo).text("신고");
					
					var divtop_li_edit = divtop_dropdown_li_edit.append(divtop_dropdown_a_edit);
					var divtop_li_delete = divtop_dropdown_li_delete.append(divtop_dropdown_a_delete);
					var divtop_li_report = divtop_dropdown_li_report.append(divtop_dropdown_a_report);
					
					// 개설자, 작성자 여부에 따라 서로 다른 드롭다운 생성
					// 로그인 중인 회원의 회원 번호
					var memberNo = $("#div-member-info").data("memberno");
					var memberGrade = $("#div-member-info").data("memberGrade");
					var boardWriterNo = response.data.boardList[i].memberNo;
					var boardWriterGrade = response.data.boardList[i].memberGrade;
					
					var divtop_ul;
					if(boardWriterGrade == '개설자' || memberNo == boardWriterNo) {
						divtop_ul = divtop_dropdown_ul.append(divtop_li_edit).append(divtop_li_delete);
					} else {
						divtop_ul = divtop_dropdown_ul.append(divtop_li_report);
					}
					
					var divtop_dropdown = divtop_dropdown_outer.append(divtop_dropdown_a).append(divtop_ul);
					
					var divtop = divtop_outer.append(divtop_span).append(divtop_writer).append(divtop_dropdown);
					
					// - 중단
					var divmid = $("<div>").attr("class", "p-3 div-board div-board-content").html(response.data.boardList[i].boardContent);
					
					// - 하단
					var divbottom_outer = $("<div>").attr("class", "div-board div-board-bottom");
					var divbottom_div_flex = $("<div>").attr("class", "d-flex px-3 pb-3");
					var divbottom_label_reply = $("<label>").attr("class", "col d-flex justify-content-center button-board");
					var divbottom_i_reply = $("<i>").attr("class", "fa-regular fa-comment-dots icon-board").attr("data-boardno", response.data.boardList[i].boardNo);
					var divbottom_label_like = $("<label>").attr("class", "col d-flex justify-content-center button-board");
					var divbottom_i_like = $("<i>").attr("class", "fa-regular fa-heart icon-board");
					
					var divbottom_label_left = divbottom_label_reply.append(divbottom_i_reply);
					var divbottom_label_right = divbottom_label_like.append(divbottom_i_like);
					
					var divbottom_flex = divbottom_div_flex.append(divbottom_label_left).append(divbottom_label_right);
					var divbottom = divbottom_outer.append(divbottom_flex);
					
					// 태그 재구성
					$("#div-board-list").append(divtop);
					$("#div-board-list").append(divmid);
					$("#div-board-list").append(divbottom);
				}
			});
		}
		if(percentage == 100) return;
	}, 100));
	
	$(function(){
		// 게시글 작성 비동기 처리
		// - 게시글 작성 영역 클릭시 게시글 입력창 열기
		$(".editor-open-insert").click(function(){
        	// 게시글 입력창 열기
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
            $("#summernote").summernote({
                height:500,
                minHeight:500,
                maxHeight:500
            });
         	// Summer Note 초기화
        	$("#summernote").summernote("reset");
        	// 게시글 등록과 연관이 없는 모든 요소 숨김
            $(".note-insert").hide();
            });	
        });
		
		// - 확인 버튼 클릭시 비동기로 게시글 등록 요청 전송
	 	$(document).on("click", ".editor-confirm-insert", function(e){
	    	// 확인 메시지 출력
	    	var choice = window.confirm("글을 작성하시겠습니까?");
	    	// 취소시 return
	    	if(choice == false) return;
	    	// 로그인 중인 회원의 회원 번호
			var memberNo = $("#div-member-info").data("memberno");
			// 현재 접속중인 소모임 페이지의 소모임 번호
			var boardAhzitNo = $("#div-member-info").data("ahzitno");
	        // 태그를 포함하여 내용 지정
	        var boardContent = $(".note-editable").html();
	     	// 비동기 통신을 이용한 게시글 등록
			axios({
				url : "http://localhost:8888/rest_board/write",
				method : "post",
				data : {
					boardWriterNo : memberNo,
					boardAhzitNo : boardAhzitNo,
					boardContent : boardContent
				}
			})
			.then(function(response){
				// 태그 요소 생성
				// - 상단
				var divtop_outer = $("<div>").attr("class", "d-flex align-items-start px-3 pt-3 mt-3 div-board div-board-top")
				
				var divtop_span = $("<span>").attr("class", "div-member-profile");
				var divtop_img_member = $("<img>").attr("class", "img-member-profile").attr("src", "https://placeimg.com/65/65/any"); // 임시 주소
				var divtop_img = divtop_span.append(divtop_img_member);
				
				var divtop_writer_outer = $("<div>").attr("class", "ms-3 w-100");
				var divtop_writer_info = $("<p>").attr("class", "mb-0 p-writer-info").text(response.data.memberNick + " [" + response.data.memberGrade +"]");
				var divtop_writedate = $("<p>").attr("class", "mb-0").text(response.data.boardWritedate);
				var divtop_writer = divtop_writer_outer.append(divtop_writer_info).append(divtop_writedate);
				
				var divtop_dropdown_outer = $("<div>").attr("class", "dropdown div-icon-dropdown");
				var divtop_dropdown_a = $("<a>").attr("class", "fa-solid fa-ellipsis-vertical a-board-dropdown icon-board w-100").attr("data-bs-toggle", "dropdown").attr("data-boardwriterno", response.data.boardWriterNo).attr("data-boardwritergrade", response.data.memberGrade);
				var divtop_dropdown_ul = $("<ul>").attr("class", "dropdown-menu");
				var divtop_dropdown_li_edit = $("<li>").attr("class", "li-edit");
				var divtop_dropdown_a_edit = $("<a>").attr("class", "dropdown-item editor-open-edit").attr("data-bs-toggle", "modal").attr("data-bs-target", "#modal-editor").text("수정");
				var divtop_dropdown_li_delete = $("<li>").attr("class", "li-delete");
				var divtop_dropdown_a_delete = $("<a>").attr("class", "dropdown-item btn-delete").attr("data-boardno", response.data.boardNo).attr("data-boardwriterno", response.data.boardWriterNo).text("삭제");
				var divtop_dropdown_li_report = $("<li>").attr("class", "li-report");
				var divtop_dropdown_a_report = $("<a>").attr("class", "dropdown-item btn-report").attr("data-boardno", response.data.boardNo).text("신고");
				
				var divtop_li_edit = divtop_dropdown_li_edit.append(divtop_dropdown_a_edit);
				var divtop_li_delete = divtop_dropdown_li_delete.append(divtop_dropdown_a_delete);
				var divtop_li_report = divtop_dropdown_li_report.append(divtop_dropdown_a_report);
				
				// 개설자, 작성자 여부에 따라 서로 다른 드롭다운 생성
				// 로그인 중인 회원의 회원 번호
				var memberNo = $("#div-member-info").data("memberno");
				var memberGrade = $("#div-member-info").data("memberGrade");
				var boardWriterNo = response.data.memberNo;
				var boardWriterGrade = response.data.memberGrade;
				
				var divtop_ul;
				if(boardWriterGrade == '개설자' || memberNo == boardWriterNo) {
					divtop_ul = divtop_dropdown_ul.append(divtop_li_edit).append(divtop_li_delete);
				} else {
					divtop_ul = divtop_dropdown_ul.append(divtop_li_report);
				}
				
				var divtop_dropdown = divtop_dropdown_outer.append(divtop_dropdown_a).append(divtop_ul);
				
				var divtop = divtop_outer.append(divtop_span).append(divtop_writer).append(divtop_dropdown);
				
				// - 중단
				var divmid = $("<div>").attr("class", "p-3 div-board div-board-content").html(response.data.boardContent);
				
				// - 하단
				var divbottom_outer = $("<div>").attr("class", "div-board div-board-bottom");
				var divbottom_div_flex = $("<div>").attr("class", "d-flex px-3 pb-3");
				var divbottom_label_reply = $("<label>").attr("class", "col d-flex justify-content-center button-board");
				var divbottom_i_reply = $("<i>").attr("class", "fa-regular fa-comment-dots icon-board").attr("data-boardno", response.data.boardNo);
				var divbottom_label_like = $("<label>").attr("class", "col d-flex justify-content-center button-board");
				var divbottom_i_like = $("<i>").attr("class", "fa-regular fa-heart icon-board");
				
				var divbottom_label_left = divbottom_label_reply.append(divbottom_i_reply);
				var divbottom_label_right = divbottom_label_like.append(divbottom_i_like);
				
				var divbottom_flex = divbottom_div_flex.append(divbottom_label_left).append(divbottom_label_right);
				var divbottom = divbottom_outer.append(divbottom_flex);
				
				// 태그 재구성
				$("#div-board-list").prepend(divbottom);
				$("#div-board-list").prepend(divmid);
				$("#div-board-list").prepend(divtop);
				
				// 게시글 입력창 닫기
				$("#modal-editor").modal("hide");
			});
		
     	// 게시글 수정 비동기 처리
        // - 게시글 수정 클릭시 게시글 입력창 열기
        $(document).on("click", ".editor-open-edit", function(e){
        	// 게시글 입력창 열기
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
        	// - 클릭한 게시글 수정 버튼의 data 값을 Modal의 data 값으로 설정
        	$(".editor-confirm-edit").attr("data-boardno", $(this).data("boardno"));
            // Summer Note 불러오기
            $("#summernote").summernote({
                height:500,
                minHeight:500,
                maxHeight:500
            });
         	// Summer Note 초기화
        	$("#summernote").summernote("reset");
        	// 게시글 등록과 연관이 없는 모든 요소 숨김
            $(".note-insert").hide();
        	// 수정 전 게시글 지정
         	var boardContent = $(this).parents(".div-board-top").next();
        	var boardContentValue = boardContent.html();
         	// 게시글 내용을 Summer Note의 내용으로 설정
        	$(".note-editable").html(boardContentValue);
         	
        	// - 확인 버튼 클릭시 비동기로 게시글 수정 요청 전송
            $(".editor-confirm-edit").off("click").click(function(e){ // off()가 없으면 이상하게 클릭 이벤트가 2번 발생함(?)
            	// 확인 메시지 출력
            	var choice = window.confirm("글을 수정하시겠습니까?");
            	// 취소시 return
            	if(choice == false) return;
            	// 수정하려는 게시글 번호
    			var boardNo = $(this).data("boardno");
            	// 로그인 중인 회원의 회원 번호
    			var boardWriterNo = $("#div-member-info").data("memberno");
    			// 현재 접속중인 소모임 페이지의 소모임 번호
    			var boardAhzitNo = $("#div-member-info").data("ahzitno");
                // 태그를 포함하여 내용 지정
                var editorContent = $(".note-editable").html();
                // 비동기 통신을 이용한 게시글 수정
                axios({
    				url : "http://localhost:8888/rest_board/edit",
    				method : "put",
    				data : {
    					boardNo : boardNo,
    					boardWriterNo : boardWriterNo,
    					boardAhzitNo : boardAhzitNo,
    					boardContent : editorContent
    				}
    			})
    			.then(function(response){
    				// 새로운 내용으로 교체
    				boardContent.html(editorContent);
    	         	// 게시글 입력창 닫기
    	            $("#modal-editor").modal("hide");
    			});
            });
        });

        // - 게시글 작성의 닫기 버튼을 클릭할 경우 confirm 메시지
        $(document).on("click", ".editor-close-insert", function(e){
            var choice = window.confirm("글 작성을 취소하시겠습니까?");
            if(choice == false) return;
            $("#summernote").summernote("undo");
            $("#modal-editor").modal("hide");
        });
        
     	// - 게시글 수정의 닫기 버튼을 클릭할 경우 confirm 메시지
     	$(document).on("click", ".editor-close-edit", function(e){
            var choice = window.confirm("글 수정을 취소하시겠습니까?");
            if(choice == false) return;
            $("#summernote").summernote("undo");
            $("#modal-editor").modal("hide");
        });
     	
    	// 게시글 삭제 비동기 처리
		$(document).on("click", ".btn-delete", function(e){
			var btnThis = $(this);
			var choice = window.confirm("글을 삭제하시겠습니까?");
			if(choice == false) return;
			// 삭제하려는 게시글 번호
			var boardNo = $(this).data("boardno");
        	// 로그인 중인 회원의 회원 번호
			var boardWriterNo = $(this).data("boardwriterno");
			// 비동기 통신을 이용한 게시글 삭제
			axios({
				url : "http://localhost:8888/rest_board/delete?boardNo=" + boardNo + "&boardWriterNo=" + boardWriterNo,
				method : "delete"
			})
			.then(function(response){
				// 삭제된 게시글의 태그 삭제
				var top = btnThis.parents(".div-board-top");
				var mid = top.next();
				var bottom = mid.next();
				top.remove();
				mid.remove();
				bottom.remove();
			});
		});
		
    	// 게시글 검색 비동기 처리
		$(document).on("click", ".btn-search-submit", function(e){
			console.log(this);
			var ahzitNo = $("#div-member-info").data("ahzitno");
			var keyword = $(".input-search").val();
			//var p = 1;
			axios({
				url : "http://localhost:8888/rest_board/search",
				method : "post", 
				data : {
					ahzitNo : ahzitNo,
					keyword : keyword,
					p : p
				}
			})
			.then(function(response){
				$("#div-board-list").empty();
				for(var i = 0 ; i < response.data.boardList.length ; i ++){
					var divtop_outer = $("<div>").attr("class", "d-flex align-items-start px-3 pt-3 mt-3 div-board div-board-top")
					
					var divtop_span = $("<span>").attr("class", "div-member-profile");
					var divtop_img_member = $("<img>").attr("class", "img-member-profile").attr("src", "https://placeimg.com/65/65/any"); // 임시 주소
					var divtop_img = divtop_span.append(divtop_img_member);
					
					var divtop_writer_outer = $("<div>").attr("class", "ms-3 w-100");
					var divtop_writer_info = $("<p>").attr("class", "mb-0 p-writer-info").text(response.data.boardList[i].memberNick + " [" + response.data.boardList[i].memberGrade +"]");
					var divtop_writedate = $("<p>").attr("class", "mb-0").text(response.data.boardList[i].boardWritedate);
					var divtop_writer = divtop_writer_outer.append(divtop_writer_info).append(divtop_writedate);
					
					var divtop_dropdown_outer = $("<div>").attr("class", "dropdown div-icon-dropdown");
					var divtop_dropdown_a = $("<a>").attr("class", "fa-solid fa-ellipsis-vertical a-board-dropdown icon-board w-100").attr("data-bs-toggle", "dropdown").attr("data-boardwriterno", response.data.boardList[i].boardWriterNo).attr("data-boardwritergrade", response.data.boardList[i].memberGrade);
					var divtop_dropdown_ul = $("<ul>").attr("class", "dropdown-menu");
					var divtop_dropdown_li_edit = $("<li>").attr("class", "li-edit");
					var divtop_dropdown_a_edit = $("<a>").attr("class", "dropdown-item editor-open-edit").attr("data-bs-toggle", "modal").attr("data-bs-target", "#modal-editor").text("수정");
					var divtop_dropdown_li_delete = $("<li>").attr("class", "li-delete");
					var divtop_dropdown_a_delete = $("<a>").attr("class", "dropdown-item btn-delete").attr("data-boardno", response.data.boardList[i].boardNo).attr("data-boardwriterno", response.data.boardList[i].boardWriterNo).text("삭제");
					var divtop_dropdown_li_report = $("<li>").attr("class", "li-report");
					var divtop_dropdown_a_report = $("<a>").attr("class", "dropdown-item btn-report").attr("data-boardno", response.data.boardList[i].boardNo).text("신고");
					
					var divtop_li_edit = divtop_dropdown_li_edit.append(divtop_dropdown_a_edit);
					var divtop_li_delete = divtop_dropdown_li_delete.append(divtop_dropdown_a_delete);
					var divtop_li_report = divtop_dropdown_li_report.append(divtop_dropdown_a_report);
					
					// 개설자, 작성자 여부에 따라 서로 다른 드롭다운 생성
					// 로그인 중인 회원의 회원 번호
					var memberNo = $("#div-member-info").data("memberno");
					var memberGrade = $("#div-member-info").data("memberGrade");
					var boardWriterNo = response.data.boardList[i].memberNo;
					var boardWriterGrade = response.data.boardList[i].memberGrade;
					
					var divtop_ul;
					if(boardWriterGrade == '개설자' || memberNo == boardWriterNo) {
						divtop_ul = divtop_dropdown_ul.append(divtop_li_edit).append(divtop_li_delete);
					} else {
						divtop_ul = divtop_dropdown_ul.append(divtop_li_report);
					}
					
					var divtop_dropdown = divtop_dropdown_outer.append(divtop_dropdown_a).append(divtop_ul);
					
					var divtop = divtop_outer.append(divtop_span).append(divtop_writer).append(divtop_dropdown);
					
					// - 중단
					var divmid = $("<div>").attr("class", "p-3 div-board div-board-content").html(response.data.boardList[i].boardContent);
					
					// - 하단
					var divbottom_outer = $("<div>").attr("class", "div-board div-board-bottom");
					var divbottom_div_flex = $("<div>").attr("class", "d-flex px-3 pb-3");
					var divbottom_label_reply = $("<label>").attr("class", "col d-flex justify-content-center button-board");
					var divbottom_i_reply = $("<i>").attr("class", "fa-regular fa-comment-dots icon-board").attr("data-boardno", response.data.boardList[i].boardNo);
					var divbottom_label_like = $("<label>").attr("class", "col d-flex justify-content-center button-board");
					var divbottom_i_like = $("<i>").attr("class", "fa-regular fa-heart icon-board");
					
					var divbottom_label_left = divbottom_label_reply.append(divbottom_i_reply);
					var divbottom_label_right = divbottom_label_like.append(divbottom_i_like);
					
					var divbottom_flex = divbottom_div_flex.append(divbottom_label_left).append(divbottom_label_right);
					var divbottom = divbottom_outer.append(divbottom_flex);
					
					// 태그 재구성
					$("#div-board-list").append(divtop);
					$("#div-board-list").append(divmid);
					$("#div-board-list").append(divbottom);
				}
				
				$("#input-search").val("");
			});
		});
	});
	
	// 게시글 목록 갱신 함수
	function loadList(){
		var ahzitNo = $("#div-member-info").data("ahzitno");
		//var p = 1;
		axios({
			url : "http://localhost:8888/rest_board/list",
			method : "post",
			data : {
				ahzitNo : ahzitNo,
				p : p
			}
		})
		.then(function(response){
			$("#div-board-list").empty();
			for(var i = 0 ; i < response.data.boardList.length ; i ++){
				var divtop_outer = $("<div>").attr("class", "d-flex align-items-start px-3 pt-3 mt-3 div-board div-board-top")
				
				var divtop_span = $("<span>").attr("class", "div-member-profile");
				var divtop_img_member = $("<img>").attr("class", "img-member-profile").attr("src", "https://placeimg.com/65/65/any"); // 임시 주소
				var divtop_img = divtop_span.append(divtop_img_member);
				
				var divtop_writer_outer = $("<div>").attr("class", "ms-3 w-100");
				var divtop_writer_info = $("<p>").attr("class", "mb-0 p-writer-info").text(response.data.boardList[i].memberNick + " [" + response.data.boardList[i].memberGrade +"]");
				var divtop_writedate = $("<p>").attr("class", "mb-0").text(response.data.boardList[i].boardWritedate);
				var divtop_writer = divtop_writer_outer.append(divtop_writer_info).append(divtop_writedate);
				
				var divtop_dropdown_outer = $("<div>").attr("class", "dropdown div-icon-dropdown");
				var divtop_dropdown_a = $("<a>").attr("class", "fa-solid fa-ellipsis-vertical a-board-dropdown icon-board w-100").attr("data-bs-toggle", "dropdown").attr("data-boardwriterno", response.data.boardList[i].boardWriterNo).attr("data-boardwritergrade", response.data.boardList[i].memberGrade);
				var divtop_dropdown_ul = $("<ul>").attr("class", "dropdown-menu");
				var divtop_dropdown_li_edit = $("<li>").attr("class", "li-edit");
				var divtop_dropdown_a_edit = $("<a>").attr("class", "dropdown-item editor-open-edit").attr("data-bs-toggle", "modal").attr("data-bs-target", "#modal-editor").text("수정");
				var divtop_dropdown_li_delete = $("<li>").attr("class", "li-delete");
				var divtop_dropdown_a_delete = $("<a>").attr("class", "dropdown-item btn-delete").attr("data-boardno", response.data.boardList[i].boardNo).attr("data-boardwriterno", response.data.boardList[i].boardWriterNo).text("삭제");
				var divtop_dropdown_li_report = $("<li>").attr("class", "li-report");
				var divtop_dropdown_a_report = $("<a>").attr("class", "dropdown-item btn-report").attr("data-boardno", response.data.boardList[i].boardNo).text("신고");
				
				var divtop_li_edit = divtop_dropdown_li_edit.append(divtop_dropdown_a_edit);
				var divtop_li_delete = divtop_dropdown_li_delete.append(divtop_dropdown_a_delete);
				var divtop_li_report = divtop_dropdown_li_report.append(divtop_dropdown_a_report);
				
				// 개설자, 작성자 여부에 따라 서로 다른 드롭다운 생성
				// 로그인 중인 회원의 회원 번호
				var memberNo = $("#div-member-info").data("memberno");
				var memberGrade = $("#div-member-info").data("memberGrade");
				var boardWriterNo = response.data.boardList[i].memberNo;
				var boardWriterGrade = response.data.boardList[i].memberGrade;
				
				var divtop_ul;
				if(boardWriterGrade == '개설자' || memberNo == boardWriterNo) {
					divtop_ul = divtop_dropdown_ul.append(divtop_li_edit).append(divtop_li_delete);
				} else {
					divtop_ul = divtop_dropdown_ul.append(divtop_li_report);
				}
				
				var divtop_dropdown = divtop_dropdown_outer.append(divtop_dropdown_a).append(divtop_ul);
				
				var divtop = divtop_outer.append(divtop_span).append(divtop_writer).append(divtop_dropdown);
				
				// - 중단
				var divmid = $("<div>").attr("class", "p-3 div-board div-board-content").html(response.data.boardList[i].boardContent);
				
				// - 하단
				var divbottom_outer = $("<div>").attr("class", "div-board div-board-bottom");
				var divbottom_div_flex = $("<div>").attr("class", "d-flex px-3 pb-3");
				var divbottom_label_reply = $("<label>").attr("class", "col d-flex justify-content-center button-board");
				var divbottom_i_reply = $("<i>").attr("class", "fa-regular fa-comment-dots icon-board").attr("data-boardno", response.data.boardList[i].boardNo);
				var divbottom_label_like = $("<label>").attr("class", "col d-flex justify-content-center button-board");
				var divbottom_i_like = $("<i>").attr("class", "fa-regular fa-heart icon-board");
				
				var divbottom_label_left = divbottom_label_reply.append(divbottom_i_reply);
				var divbottom_label_right = divbottom_label_like.append(divbottom_i_like);
				
				var divbottom_flex = divbottom_div_flex.append(divbottom_label_left).append(divbottom_label_right);
				var divbottom = divbottom_outer.append(divbottom_flex);
				
				// 태그 재구성
				$("#div-board-list").append(divtop);
				$("#div-board-list").append(divmid);
				$("#div-board-list").append(divbottom);
			}
		});
	};
</script>

<!-- Summer Note CDN -->
<script src="https://cdn.jsdelivr.net/npm/summernote@0.8.20/dist/summernote-bs5.min.js"></script>

<!-- Summer Note CSS -->
<link href="https://cdn.jsdelivr.net/npm/summernote@0.8.20/dist/summernote-bs5.min.css" rel="stylesheet">
