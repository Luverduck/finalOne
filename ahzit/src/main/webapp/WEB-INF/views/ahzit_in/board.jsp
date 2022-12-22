<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
    
<%-- header --%>
<jsp:include page="/WEB-INF/views/template/header.jsp">
	<jsp:param value="소모임 회원" name="title"/>
</jsp:include>

<jsp:include page="/WEB-INF/views/template/ahzit_header.jsp">
	<jsp:param value="소모임 게시글" name="title"/>
</jsp:include>

<style>
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
	.div-editor-opener,
	.div-editor-input {
		border-radius: 10px;
		border-color : rgba(210, 210, 210);
		background-color: rgba(240, 240, 240, 50);
		padding-left: 2%;
		color: rgba(140, 140, 140, 140);
	}
  	.div-board-container{
    	border-radius: 10px 10px;  
  	}
	
	.div-board {
		background-color: white;
	}
	
	.div-board-top {
		border-top-left-radius: 10px;
		border-top-right-radius: 10px;
	}
	
	.div-board-bottom,
  	.div-reply-bottom {
		border-bottom-left-radius: 10px;
		border-bottom-right-radius: 10px;
	}
	
	.p-writer-info {
		font-weight: 1000;
	}
	
	.div-icon-dropdown {
		width : 20px;
	}
	
	.button-board,
  	.btn-reply-more {
		cursor: pointer;
		align-content: center;
	}
	
	.icon-board, 
	.icon-editor-opener {
		color: black;
		font-size: 20px;
	}
	
	.ahzit-img {
      	width : 250px;
      	height : 250px;      
   	}
   	
  	.shadow rounded-3{
    	border-radius: 50px 50px;
  	}
	
	@keyframes heart-on {
        from {color:black;}
        to {color:#FF8681;}
        0% {transform: rotate(10deg);}
        5% {transform: rotate(-10deg);}
        10% {transform: rotate(10deg);}
        15% {transform: rotate(-10deg);}
        20% {transform: rotate(10deg);}
        25% {transform: rotate(-10deg);}
        30% {transform: rotate(10deg);}
        35% {transform: rotate(-10deg);}
        40% {transform: rotate(10deg);}
        45% {transform: rotate(-10deg);}
        50% {transform: rotate(0deg);}
    }
  
 	.icon-board-like-on {
 		animation-name: heart-on;
        animation-fill-mode: forwards;
        animation-delay: 0s;
        animation-duration: 1s;
        animation-iteration-count: 1;
	}
	
	@keyframes heart-off {
        from {color:#FF8681;}
        to {color:black;}
        0% {transform: rotate(10deg);}
        5% {transform: rotate(-10deg);}
        10% {transform: rotate(10deg);}
        15% {transform: rotate(-10deg);}
        20% {transform: rotate(10deg);}
        25% {transform: rotate(-10deg);}
        30% {transform: rotate(10deg);}
        35% {transform: rotate(-10deg);}
        40% {transform: rotate(10deg);}
        45% {transform: rotate(-10deg);}
        50% {transform: rotate(0deg);}
    }
  
 	.icon-board-like-off {
 		animation-name: heart-off;
        animation-fill-mode: forwards;
        animation-delay: 0s;
        animation-duration: 1s;
        animation-iteration-count: 1;
	}
	.div-reply,
	.btn-reply-edit-submit,
	.btn-reply-edit-cancel
	.div-reply-more, .btn-reply-more {
	  	background-color: rgba(250, 250, 250, 100);
	}
	
	.div-reply-member-profile {
	  	width: 60px;
	  	height : 60px;
	}
	
	.span-reply-writer-profile {
	  	width: 40px;
	  	height: 40px;
	}
	
	.div-reply-text {
	  	font-size: 14px;
	}
	
	/* 수정, 수정 취소 버튼 */
	.btn-reply-edit-submit,
	.btn-reply-edit-cancel {
	  	color: #FEC260; 
	}
	/* 멤버 프로필 포인터 표시*/
	.member-profile {
		cursor: pointer;
	}
	
	.ahzit-container-radius {
		border-radius : 15px;
	}
	/*사이드바 관련*/
	 body {
		background-color: #F5F5F5;	
	}
	.div-ahzit-info,
	.div-member-info-list,
	.div-right-side,
	.div-search-member-input {
		border-radius : 15px;
	}
	.ahzit-profile {
		width : 100px;
		height : 300px;
		border-radius : 15px;
	}
	#crown {
		width:20px;
	}
	.member-search {
		margin-right : 1.8em;
		background-color:transparent;
	}
	.btn-join {
		display : none;
	}
	.profile-img {
		width : 60px;
		border-radius : 50%;
	}
	.img-member-profile {
		width : 50px;
		height : 50px;
		margin-left : 10px;
	}
	.reply-profile {
		width : 40px;
		height : 40px;
	}
</style>


<div class = "container-fluid mt-2 mb-2">
	
	<div class = "row">
			
		<div class = "col-8 offset-2">
			
			<div class = "row">
				
				<!-- 왼쪽 사이드바 -->
				<div class = "col-3">
				
					<jsp:include page="/WEB-INF/views/template/ahzit_left_side.jsp"></jsp:include>
					
				</div>
				
				<%-- 가운데 내용 --%>
				<div class = "col-6">
					<%-- 게시글 검색창 --%>
					<div class = "row">
						<div class = "col">
							<div class = "d-flex ps-3 py-3 bg-white div-editor-opener shadow">
								<input type = "text" class = "input-search col-11 d-flex flex-fill div-editor-input py-1 px-2" placeholder = "검색어 입력">
								<button class="col-1 d-flex align-items-center justify-content-center border-0 bg-white icon-editor-opener btn-search-submit">
									<i class="fa-solid fa-magnifying-glass w-100"></i>
								</button>
							</div>
						</div>
					</div>
						
					<%-- 게시글 작성창 --%>
					<div class = "row mt-3 div-editor-insert">
						<div class = "col">
							<div class = "d-flex ps-3 py-3 bg-white div-editor-opener shadow">
								<button class="col-11 d-flex flex-fill div-editor-opener editor-open-insert py-1 px-2" data-bs-toggle="modal" data-bs-target="#modal-insert">새 소식을 남겨보세요</button>
								<button class="col-1 d-flex align-items-center justify-content-center border-0 bg-white icon-editor-opener editor-open-insert" data-bs-toggle="modal-insert" data-bs-target="#modal-insert">
									<i class = "fa-solid fa-pen-to-square w-100"></i>
								</button>
							</div>
						</div>
					</div>
							
					<%-- 게시글 목록 --%>
					<div class = "row">
						<div class = "col" id = "div-board-list"> <%-- 게시글 목록이 표시될 영역 --%>
							
						</div>		
					</div>
							
					<%-- 게시글 작성 Modal --%>
			        <div class="modal fade" id="modal-insert" tabindex="-1" data-bs-backdrop-insert="static">
			            <div class="modal-dialog modal-dialog-centered modal-lg">
			                <div class="modal-content">
			                    <!-- 모달 헤더 : 제목 영역 -->
			                    <div class="modal-header">
			                        <h5 class="modal-title">게시글 작성</h5>
			                        <!-- X 버튼 -->
			                        <button type="button" class="btn-close modal-insert-close" aria-label="Close"></button>
			                    </div>
			                    <!-- 모달 바디 -->
			                    <div class="modal-body">
			                        <!-- Summer Note 영역 - 게시글 작성 영역 -->
			                        <textarea id = "summernote-insert"></textarea>
			                    </div>
			                    <!-- 모달 푸터 -->
			                    <div class="modal-footer">
			                        <button type="button" class="btn modal-insert-submit">작성</button>
			                        <button type="button" class="btn modal-insert-close">닫기</button>
			                    </div>
			                </div>
			            </div>
			        </div>
					        
			        <%-- 게시글 수정 Modal --%>
					<div class="modal fade" id="modal-edit" tabindex="-1" data-bs-backdrop-edit="static">
			            <div class="modal-dialog modal-dialog-centered modal-lg">
			                <div class="modal-content">
			                    <!-- 모달 헤더 : 제목 영역 -->
			                    <div class="modal-header">
			                        <h5 class="modal-title">게시글 수정</h5>
			                        <!-- X 버튼 -->
			                        <button type="button" class="btn-close modal-edit-close" aria-label="Close"></button>
			                    </div>
			                    <!-- 모달 바디 -->
			                    <div class="modal-body">
			                        <!-- Summer Note 영역 - 게시글 수정 영역-->
			                        <textarea id = "summernote-edit"></textarea>
			                    </div>
			                    <!-- 모달 푸터 -->
			                    <div class="modal-footer">
			                        <button type="button" class="btn modal-edit-submit">수정</button>
			                        <button type="button" class="btn modal-edit-close">닫기</button>
					        	</div>
					    	</div>
						</div>
					</div>
				</div>
				
				<%-- 오른쪽 사이드바 --%>
				<div class = "col-3">
					<div class = "row">
						<div class = "div-right-side p-3 shadow bg-white" >
						 	<div style="height:43px;">
								다가오는 일정
								<hr />
							</div>
							<div>
								<c:forEach var="scheduleListRownum" items="${scheduleListRownum}">	
									<div style="margin-bottom: 10px;">	
										<span style="font-size:20px;">${scheduleListRownum.scheduleTitle}</span>
										<br>
										<span style="font-size:12px;">${fn:substring(scheduleListRownum.scheduleStart, 2, 4)}년 ${fn:substring(scheduleListRownum.scheduleStart, 5, 7)}월 ${fn:substring(scheduleListRownum.scheduleStart, 8, 10)}일 ${fn:substring(scheduleListRownum.scheduleStart, 11, 16)}</span>
									</div>	
								</c:forEach>
							</div>
						</div>
					</div>
				</div>
			
			</div>
		</div>
	</div>
</div>

<%-- 댓글 관련 script --%>
<script type="text/javascript">
	var memberNo = $("#div-member-info").data("memberno"); // 로그인 중인 회원 번호
	var memberAttachmentNo = $("#div-member-info").data("memberattachmentno");
	var rp = 1; // 댓글 페이지 번호
	
	$(function(){
		
		// 댓글 삭제
		$(document).on("click", ".li-reply-delete", function(){
			// 삭제할 태그
			var target = $(this).parents(".div-reply-container");
			// 댓글 번호
			var replyNo = $(this).data("replyno");
			// 댓글 삭제 DB 처리
			axios({
				url : "http://localhost:8888/rest_reply/delete?replyNo=" + replyNo,
				method : "delete"
			})
			.then(function(response){
				//console.log("삭제 성공");
				target.remove();
			});
		});
		
		// 댓글 수정 - 댓글 수정창 표시
		$(document).on("click", ".li-reply-edit", function(){
			// 댓글 번호
			var replyNo = $(this).data("replyno");
			//console.log(replyNo);
			
			var content = $(this).parents(".div-icon-dropdown").prev().children(".div-reply-content").children();
			
			var reply_content = content.text();
			console.log(reply_content);
			
			var editor = $(this).parents(".div-icon-dropdown").prev().children(".div-reply-editor");
			
			var editor_input = editor.children(".input-reply-editor");
			
			editor_input.val(reply_content);
			
			editor.removeClass("d-none");
			content.addClass("d-none");
			
			// 댓글 수정 - 댓글 수정창 숨김
			$(document).on("click", ".btn-reply-edit-cancel", function(){
				editor_input.val("");
				editor.addClass("d-none");
				content.removeClass("d-none");
			});
			
			// 댓글 수정 - 댓글 수정 DB 처리
			$(document).on("click", ".btn-reply-edit-submit", function(){
				var replyContent = editor_input.val();
				//console.log(replyContent);
				axios({
					url : "http://localhost:8888/rest_reply/edit",
					method : "put",
					data : {
						replyNo : replyNo,
						replyContent : replyContent
					}
				})
				.then(function(response){
					// 화면에서 댓글 창 수정
					content.html(replyContent);
					editor.addClass("d-none");
					content.removeClass("d-none");
				});
			});
		});
		
		// 댓글 등록
		$(document).on("click", ".btn-reply-submit", function(){
			// 댓글 원본글 번호
			var replyOriginNo = $(this).data("boardno");
			
			// 댓글창(초기화를 위해 필요)
			var input = $(this).prev();
			
			// 댓글 내용
			var replyContent = $(this).prev().val();
			
			// 새 댓글을 추가할 위치 (div-reply-input의 뒤로 설정할 예정)
			var target = $(this).parents(".div-reply-input");
			
			axios({
				url : "http://localhost:8888/rest_reply/write",
				method : "post",
				data : {
					memberNo : memberNo,
					boardNo : replyOriginNo,
					replyContent : replyContent
				}
			})
			.then(function(response){
				//console.log(response);
				// 댓글 리스트
				// 1) 댓글 외부 컨테이너
				var div_reply_outer_container = $("<div>").attr("class", "d-flex flex-column align-items-start px-3 py-1 border-top div-board div-reply div-reply-container");
				// 2) 댓글 내부 컨테이너
				var div_reply_inner_container = $("<div>").attr("class", "col w-100 d-flex ps-1 py-2 border-3");
				
				// 2-1) span 태그
				var span_reply_member_img_container = $("<span>").attr("class", "div-reply-member-profile");
				var img_reply_member_img = $("<img>").attr("class", "img-member-profile member-profile").attr("src", "/attachment/download/ahzitMember?attachmentNo=" + response.data.memberAttachmentNo).attr("data-writerno", response.data.replyWriterNo);
				var span_reply_member_img = span_reply_member_img_container.append(img_reply_member_img);
				
				// 2-2) 
				var div_reply_writer_container = $("<div>").attr("class", "ms-3 w-100 d-flex flex-column");
				
				var p_reply_writer = $("<p>").attr("class", "mb-0 p-writer-info div-reply-text").text(response.data.memberNick + " [" + response.data.memberGrade + "]");
				
				var div_reply_content_outer_container = $("<div>").attr("class", "w-100 div-reply div-reply-text div-reply-content");
				var p_reply_content = $("<p>").attr("class", "px-1 py-2 div-reply-text mb-0").text(response.data.replyContent);
				var div_reply_content = div_reply_content_outer_container.append(p_reply_content);
				
				var div_reply_editor_container = $("<div>").attr("class", "d-none flex-wrap p-2 my-2 border border-2 div-reply-editor");
				var input_reply_editor = $("<input>").attr("class", "d-flex w-100 p-2 mb-1 input-reply-editor");
				var btn_reply_edit = $("<button>").attr("class", "border-0 btn-reply-edit-submit").text("수정");
				var btn_reply_cancel = $("<button>").attr("class", "border-0 btn-reply-edit-cancel").text("취소");
				var div_reply_editor = div_reply_editor_container.append(input_reply_editor).append(btn_reply_edit).append(btn_reply_cancel);
				
				var p_reply_writedate = $("<p>").attr("class", "mb-0 div-reply-text").text(response.data.replyWritedate);
				
				// 로그인 중인 회원이 작성자인지 여부에 따라 다른 태그 생성
				var div_reply_info
				if(memberNo == response.data.replyWriterNo) { // 로그인 중인 회원이 작성자라면 editor 포함
					div_reply_info = div_reply_writer_container.append(p_reply_writer).append(div_reply_content).append(div_reply_editor).append(p_reply_writedate);	
				} else { // 작성자가 아니라면 editor 제외
					div_reply_info = div_reply_writer_container.append(p_reply_writer).append(div_reply_content).append(p_reply_writedate);
				}
				
				// 2-3)
				var div_reply_dropdown_container = $("<div>").attr("class", "dropdown div-icon-dropdown");
				var a_reply_dropdown_trigger = $("<a>").attr("class", "fa-solid fa-ellipsis-vertical a-board-dropdown icon-board w-100").attr("data-bs-toggle", "dropdown");
				var ul_reply_dropdown_container = $("<ul>").attr("class", "dropdown-menu");
				var li_reply_dropdown_edit_container = $("<li>").attr("class", "li-reply-edit").attr("data-replyno", response.data.replyNo);
				var a_reply_dropdown_edit = $("<a>").attr("class", "dropdown-item btn-reply-edit").text("수정");
				var li_reply_dropdown_delete_container = $("<li>").attr("class", "li-reply-delete").attr("data-replyno", response.data.replyNo);
				var a_reply_dropdown_delete = $("<a>").attr("class", "dropdown-item btn-reply-delete").text("삭제");
				
				var li_reply_dropdown_edit = li_reply_dropdown_edit_container.append(a_reply_dropdown_edit);
				var li_reply_dropdown_delete = li_reply_dropdown_delete_container.append(a_reply_dropdown_delete);
				
				var ul_reply_dropdown;
				if($(".div-member-info").data("membergrade") == "개설자") { // 관리자일 경우
					ul_reply_dropdown = ul_reply_dropdown_container.append(li_reply_dropdown_delete); // 삭제 드롭다운
				} else { // 관리자가 아닐 경우
					ul_reply_dropdown = ul_reply_dropdown_container.append(li_reply_dropdown_edit).append(li_reply_dropdown_delete); // 삭제 + 수정 드롭다운
				}
				
				var div_reply_dropdown = div_reply_dropdown_container.append(a_reply_dropdown_trigger).append(ul_reply_dropdown);
				
				// 로그인 중인 회원이 작성자인지 여부에 따라 다른 태그 생성
				var div_reply_inner 
				if(memberNo == response.data.replyWriterNo){ // 로그인 중인 회원이 작성자라면 수정/삭제 드롭다운 포함
					div_reply_inner = div_reply_inner_container.append(span_reply_member_img).append(div_reply_info).append(div_reply_dropdown);
				} else { // 작성자가 아니라면 수정/삭제 드롭다운 제외
					div_reply_inner = div_reply_inner_container.append(span_reply_member_img).append(div_reply_info);
				}
				
				var div_reply_outer = div_reply_outer_container.append(div_reply_inner);
				
				target.before(div_reply_outer);
				
				input.val("");
			});
		});
		
		// 댓글 더보기
		$(document).on("click", ".btn-reply-more", function(){
			var targetMore = $(this);
			var target = $(this).parent().next();
			
			var boardNo = $(this).data("boardno");
			
			// 현재 댓글 페이지
			var thisRp = Number($(this).attr("data-rp"));
			
			// 총 댓글 페이지
			var rpLast = $(this).data("rplast");
			
			// 현재 댓글 페이지가 댓글 마지막 페이지와 같다면 비동기 조회 차단
			if(thisRp == rpLast) {
				return;
			} else {
				var nextRp = thisRp + 1;
				$(this).attr("data-rp", nextRp);
			}
			
			axios({
				url : "http://localhost:8888/rest_reply/list",
				method : "post",
				data : {
					boardNo : boardNo,
					rp : nextRp
				}
			})
			.then(function(response){
				//console.log(response);
				
				for(var i = 0 ; i < response.data.replyList.length ; i ++){
					// 댓글 리스트
					// 1) 댓글 외부 컨테이너
					var div_reply_outer_container = $("<div>").attr("class", "d-flex flex-column align-items-start px-3 py-1 border-top div-board div-reply div-reply-container");
					// 2) 댓글 내부 컨테이너
					var div_reply_inner_container = $("<div>").attr("class", "col w-100 d-flex ps-1 py-2 border-3");
					
					// 2-1) span 태그
					var span_reply_member_img_container = $("<span>").attr("class", "div-reply-member-profile");
					var img_reply_member_img = $("<img>").attr("class", "img-member-profile member-profile").attr("src", "/attachment/download/ahzitMember?attachmentNo=" + response.data.replyList[i].memberAttachmentNo).attr("data-writerno", response.data.replyList[i].replyWriterNo);
					var span_reply_member_img = span_reply_member_img_container.append(img_reply_member_img);
					
					// 2-2) 
					var div_reply_writer_container = $("<div>").attr("class", "ms-3 w-100 d-flex flex-column");
					
					var p_reply_writer = $("<p>").attr("class", "mb-0 p-writer-info div-reply-text").text(response.data.replyList[i].memberNick + " [" + response.data.replyList[i].memberGrade + "]");
					
					var div_reply_content_outer_container = $("<div>").attr("class", "w-100 div-reply div-reply-text div-reply-content");
					var p_reply_content = $("<p>").attr("class", "px-1 py-2 div-reply-text mb-0").text(response.data.replyList[i].replyContent);
					var div_reply_content = div_reply_content_outer_container.append(p_reply_content);
					
					var div_reply_editor_container = $("<div>").attr("class", "d-none flex-wrap p-2 my-2 border border-2 div-reply-editor");
					var input_reply_editor = $("<input>").attr("class", "d-flex w-100 p-2 mb-1 input-reply-editor");
					var btn_reply_edit = $("<button>").attr("class", "border-0 btn-reply-edit-submit").text("수정");
					var btn_reply_cancel = $("<button>").attr("class", "border-0 btn-reply-edit-cancel").text("취소");
					var div_reply_editor = div_reply_editor_container.append(input_reply_editor).append(btn_reply_edit).append(btn_reply_cancel);
					
					var p_reply_writedate = $("<p>").attr("class", "mb-0 div-reply-text").text(response.data.replyList[i].replyWritedate);
					
					// 로그인 중인 회원이 작성자인지 여부에 따라 다른 태그 생성
					var div_reply_info
					if(memberNo == response.data.replyList[i].replyWriterNo) { // 로그인 중인 회원이 작성자라면 editor 포함
						div_reply_info = div_reply_writer_container.append(p_reply_writer).append(div_reply_content).append(div_reply_editor).append(p_reply_writedate);	
					} else { // 작성자가 아니라면 editor 제외
						div_reply_info = div_reply_writer_container.append(p_reply_writer).append(div_reply_content).append(p_reply_writedate);
					}
					
					// 2-3)
					var div_reply_dropdown_container = $("<div>").attr("class", "dropdown div-icon-dropdown");
					var a_reply_dropdown_trigger = $("<a>").attr("class", "fa-solid fa-ellipsis-vertical a-board-dropdown icon-board w-100").attr("data-bs-toggle", "dropdown");
					var ul_reply_dropdown_container = $("<ul>").attr("class", "dropdown-menu");
					var li_reply_dropdown_edit_container = $("<li>").attr("class", "li-reply-edit").attr("data-replyno", response.data.replyList[i].replyNo);
					var a_reply_dropdown_edit = $("<a>").attr("class", "dropdown-item btn-reply-edit").text("수정");
					var li_reply_dropdown_delete_container = $("<li>").attr("class", "li-reply-delete").attr("data-replyno", response.data.replyList[i].replyNo);
					var a_reply_dropdown_delete = $("<a>").attr("class", "dropdown-item btn-reply-delete").text("삭제");
					
					var li_reply_dropdown_edit = li_reply_dropdown_edit_container.append(a_reply_dropdown_edit);
					var li_reply_dropdown_delete = li_reply_dropdown_delete_container.append(a_reply_dropdown_delete);
					
					var ul_reply_dropdown;
					if($(".div-member-info").data("membergrade") == "개설자") { // 관리자일 경우
						ul_reply_dropdown = ul_reply_dropdown_container.append(li_reply_dropdown_delete); // 삭제 드롭다운
					} else { // 관리자가 아닐 경우
						ul_reply_dropdown = ul_reply_dropdown_container.append(li_reply_dropdown_edit).append(li_reply_dropdown_delete); // 삭제 + 수정 드롭다운
					}
					
					var div_reply_dropdown = div_reply_dropdown_container.append(a_reply_dropdown_trigger).append(ul_reply_dropdown);
					
					// 로그인 중인 회원이 작성자인지 여부에 따라 다른 태그 생성
					var div_reply_inner 
					if(memberNo == response.data.replyList[i].replyWriterNo){ // 로그인 중인 회원이 작성자라면 수정/삭제 드롭다운 포함
						div_reply_inner = div_reply_inner_container.append(span_reply_member_img).append(div_reply_info).append(div_reply_dropdown);
					} else { // 작성자가 아니라면 수정/삭제 드롭다운 제외
						div_reply_inner = div_reply_inner_container.append(span_reply_member_img).append(div_reply_info);
					}
					
					var div_reply_outer = div_reply_outer_container.append(div_reply_inner);
					
					target.prepend(div_reply_outer);
				};
				
				if(nextRp == rpLast) { // 마지막 댓글 페이지일 경우 더보기 삭제
					targetMore.remove();
				}
			})
			
		});
		
		var replyCount;
		// 댓글 목록 조회
		$(document).on("click", ".btn-reply-write", function(event){
			event.stopPropagation();
			// 태그 생성
			var boardNo = $(this).data("boardno"); // 댓글 원본 번호
			
			//var targetMore = $(this).parents(".div-reply-button").nextAll(".div-reply-more");
			//console.log("1 = " + targetMore);
			
			//var targetMore = $(this).parents(".div-reply-button");
			var target = $(this).parents(".div-reply-button").nextAll(".div-reply-list");
			//console.log("2 = " + target);
			
			var fold_state = $(this).attr("data-fold");
			var reply_list_state = $(this).attr("data-replylist");
			
			//console.log("현재 상태 = " + fold_state);
			
			if(fold_state == "1") { // 펼친 상태이면(1)
				$(this).attr("data-fold", "0"); // 접힌 상태로 바꾸기(0)
				// 접기 (hide)
				if(replyCount <= 5) {
					target.children().addClass("d-none");
				} else {
					target.prev().addClass("d-none");
					target.children().addClass("d-none");
				}
			} else { // 접힌 상태이면(0)
				$(this).attr("data-fold", "1"); // 펼친 상태로 바꾸기(1)
				if(reply_list_state == "1") { // 이미 조회한 상태라면
					// 펴기 (hide)
					target.prev().removeClass("d-none");
					target.children().removeClass("d-none");
				} else { // 최초 조회 상태라면
					$(this).attr("data-replylist", "1"); // 조회한 상태로 변경
					
					axios({
						url : "http://localhost:8888/rest_reply/list",
						method : "post",
						data : {
							boardNo : boardNo,
							rp : rp
						}
					})
					.then(function(response){
						
						//console.log(response);
						//rpLast = response.data.rpLast;
						
						if(response.data.length != 0) {
							// 더보기 버튼
							console.log("replyLenght = " + response.data.replyList.length)
							console.log("replyCount = " + response.data.replyCount)
							replyCount = response.data.replyCount;
							if(response.data.replyList.length < response.data.replyCount) {
								var div_reply_more_container = $("<div>").attr("class", "d-flex justify-content-center align-items-center border-top border-bottom div-reply-more");
								var div_reply_more_button = $("<button>").attr("class", "col d-flex justify-content-center align-items-center border-0 btn-reply-more").attr("data-boardno", boardNo).attr("data-rp", 1).attr("data-rplast", response.data.rpLast).text("더보기");
								
								var div_reply_more = div_reply_more_container.append(div_reply_more_button);
								target.before(div_reply_more);
							}
							
							// 댓글 입력창
							var div_reply_insert_outer_container = $("<div>").attr("class", "d-flex px-3 py-3 bg-white div-reply-bottom div-reply-input");
							
							var div_reply_insert_inner_container = $("<div>").attr("class", "d-flex justify-content-center align-items-center px-2 py-2 w-100 rounded-pill bg-white border border-1");
							
							var span_reply_insert_container = $("<span>").attr("class", "me-3 ms-1 span-reply-writer-profile");
							var img_reply_insert = $("<img>").attr("class", "img-member-profile member-profile reply-profile").attr("src", "/attachment/download/ahzitMember?attachmentNo=" + memberAttachmentNo);
							var span_reply_insert = span_reply_insert_container.append(img_reply_insert);
							
							var input_reply_insert = $("<input>").attr("class", "d-flex flex-fill me-3 ps-2 py-1 border-0 rounded align-self-center btn-reply-input").attr("placeholder", "댓글을 남겨주세요");
							var button_reply_insert_submit = $("<button>").attr("class", "align-self-center border border-1 rounded-pill bg-white px-2 py-2 btn-reply-submit").attr("data-boardno", boardNo).attr("data-memberno", memberNo).text("보내기");
							
							var div_reply_insert_inner = div_reply_insert_inner_container.append(span_reply_insert).append(input_reply_insert).append(button_reply_insert_submit);
							var div_reply_insert_outer = div_reply_insert_outer_container.append(div_reply_insert_inner);
							
							target.append(div_reply_insert_outer);
							
							for(var i = 0 ; i < response.data.replyList.length ; i ++){
								// 댓글 리스트
								// 1) 댓글 외부 컨테이너
								var div_reply_outer_container = $("<div>").attr("class", "d-flex flex-column align-items-start px-3 py-1 border-top div-board div-reply div-reply-container");
								// 2) 댓글 내부 컨테이너
								var div_reply_inner_container = $("<div>").attr("class", "col w-100 d-flex ps-1 py-2 border-3");
								
								// 2-1) span 태그
								var span_reply_member_img_container = $("<span>").attr("class", "div-reply-member-profile");
								var img_reply_member_img = $("<img>").attr("class", "img-member-profile member-profile").attr("src", "/attachment/download/ahzitMember?attachmentNo=" + response.data.replyList[i].memberAttachmentNo).attr("data-writerno", response.data.replyList[i].replyWriterNo);
								var span_reply_member_img = span_reply_member_img_container.append(img_reply_member_img);
								
								// 2-2) 
								var div_reply_writer_container = $("<div>").attr("class", "ms-3 w-100 d-flex flex-column");
								
								var p_reply_writer = $("<p>").attr("class", "mb-0 p-writer-info div-reply-text").text(response.data.replyList[i].memberNick+ " [" + response.data.replyList[i].memberGrade + "]");
								
								var div_reply_content_outer_container = $("<div>").attr("class", "w-100 div-reply div-reply-text div-reply-content");
								var p_reply_content = $("<p>").attr("class", "px-1 py-2 div-reply-text mb-0").text(response.data.replyList[i].replyContent);
								var div_reply_content = div_reply_content_outer_container.append(p_reply_content);
								
								var div_reply_editor_container = $("<div>").attr("class", "d-none flex-wrap p-2 my-2 border border-2 div-reply-editor");
								var input_reply_editor = $("<input>").attr("class", "d-flex w-100 p-2 mb-1 input-reply-editor");
								var btn_reply_edit = $("<button>").attr("class", "border-0 btn-reply-edit-submit").text("수정");
								var btn_reply_cancel = $("<button>").attr("class", "border-0 btn-reply-edit-cancel").text("취소");
								var div_reply_editor = div_reply_editor_container.append(input_reply_editor).append(btn_reply_edit).append(btn_reply_cancel);
								
								var p_reply_writedate = $("<p>").attr("class", "mb-0 div-reply-text").text(response.data.replyList[i].replyWritedate);
								
								// 로그인 중인 회원이 작성자인지 여부에 따라 다른 태그 생성
								var div_reply_info;
								if(memberNo == response.data.replyList[i].replyWriterNo) { // 로그인 중인 회원이 작성자라면 editor 포함
									div_reply_info = div_reply_writer_container.append(p_reply_writer).append(div_reply_content).append(div_reply_editor).append(p_reply_writedate);	
								} else { // 작성자가 아니라면 editor 제외
									div_reply_info = div_reply_writer_container.append(p_reply_writer).append(div_reply_content).append(p_reply_writedate);
								}
								
								// 2-3)
								var div_reply_dropdown_container = $("<div>").attr("class", "dropdown div-icon-dropdown");
								var a_reply_dropdown_trigger = $("<a>").attr("class", "fa-solid fa-ellipsis-vertical a-board-dropdown icon-board w-100").attr("data-bs-toggle", "dropdown");
								var ul_reply_dropdown_container = $("<ul>").attr("class", "dropdown-menu");
								var li_reply_dropdown_edit_container = $("<li>").attr("class", "li-reply-edit").attr("data-replyno", response.data.replyList[i].replyNo);
								var a_reply_dropdown_edit = $("<a>").attr("class", "dropdown-item btn-reply-edit").text("수정");
								var li_reply_dropdown_delete_container = $("<li>").attr("class", "li-reply-delete").attr("data-replyno", response.data.replyList[i].replyNo);
								var a_reply_dropdown_delete = $("<a>").attr("class", "dropdown-item btn-reply-delete").text("삭제");
								
								var li_reply_dropdown_edit = li_reply_dropdown_edit_container.append(a_reply_dropdown_edit);
								var li_reply_dropdown_delete = li_reply_dropdown_delete_container.append(a_reply_dropdown_delete);
								
								// 로그인 중인 회원이 댓글의 작성자인지 여부에 따라 다른 태그 생성
								var ul_reply_dropdown;
								if($("#div-member-info").data("memberno") == response.data.replyList[i].replyWriterNo) { // 로그인 중인 회원이 댓글의 작성자라면
									ul_reply_dropdown = ul_reply_dropdown_container.append(li_reply_dropdown_edit).append(li_reply_dropdown_delete);
								} else {
									ul_reply_dropdown = ul_reply_dropdown_container.append(li_reply_dropdown_delete);
								}
								var div_reply_dropdown = div_reply_dropdown_container.append(a_reply_dropdown_trigger).append(ul_reply_dropdown);
								
								// 로그인 중인 회원이 개설자이거나 댓글의 작성자인지 여부에 따라 다른 태그 생성
								var div_reply_inner;
								if($("#div-member-info").data("memberno") == response.data.replyList[i].replyWriterNo || $("#div-member-info").data("membergrade") == "개설자") {
									div_reply_inner = div_reply_inner_container.append(span_reply_member_img).append(div_reply_info).append(div_reply_dropdown);
								} else {
									div_reply_inner = div_reply_inner_container.append(span_reply_member_img).append(div_reply_info);
								}
								
								var div_reply_outer = div_reply_outer_container.append(div_reply_inner);
								
								target.prepend(div_reply_outer);
							};
						}
						
						
					}); 
				}
			}
		});
	});
</script>

<%-- 게시글 관련 script --%>
<script type="text/javascript">
	
	// 초기 1페이지
	var p = 1;
	
	// 초기 검색어
	var keyword = "";
	
	// 총 게시글 수
	var pLast;
	
	// 초기 게시글 목록 비동기 조회
	loadList();
	
	// 동적 태그에 대한 이벤트
	$(function(){
		
		//소모임프로필이 없으면 기본이미지로 대체
	    $(".ahzit-img").on("error", function() {
	    	$(this).attr("src", "/images/bg_default.jpg");
	 	});
		
		// 게시글 좋아요 비동기 처리
		$(document).on("click", ".btn-board-like", function(event){
			event.stopPropagation();
			var btnThis = $(this);
			var target = $(this).parent();
			// 로그인 중인 회원의 회원 번호
			var memberNo = $("#div-member-info").data("memberno");
			// 좋아요를 누른 게시글 번호
			var boardNo = $(this).data("boardno");
			// 좋아요를 누른 게시글의 좋아요 갯수
			var boardLike = $(this).data("boardlike");
			// 좋아요를 누른 게시글의 이전 좋아요 여부
			var isLike = $(this).data("islike");
			axios({
				url : "http://localhost:8888/rest_board/is_like?memberNo=" + memberNo + "&boardNo=" + boardNo + "&boardLike=" + boardLike + "&isLike=" + isLike,
				method : "get"
				/* data : {
					memberNo : memberNo,
					boardNo : boardNo,
					boardLike : boardLike,
					isLike : isLike
				} */
			})
			.then(function(response){
				
				$(btnThis).remove();
				
				var divbottom_label_like = $("<label>").attr("class", "btn-board-like col d-flex justify-content-center align-items-center button-board").attr("data-boardno", response.data.boardNo).attr("data-boardlike", response.data.boardLike).attr("data-islike", response.data.isLike);
				
				var divbottom_i_like;
				if(response.data.isLike == 1) {
					divbottom_i_like = $("<i>").attr("class", "fa-regular fa-heart icon-board icon-board-like-on");
				} else {
					divbottom_i_like = $("<i>").attr("class", "fa-regular fa-heart icon-board icon-board-like-off");
				}
				
				var divbottom_i_like_count = $("<div>").attr("class", "ps-1 align-middle").text(response.data.boardLike);
				
				var divbottom_label_right = divbottom_label_like.append(divbottom_i_like).append(divbottom_i_like_count);
				target.append(divbottom_label_right);
			}); 
		});
		// 게시글 작성 비동기 처리
		// - 게시글 작성 영역 클릭시 게시글 작성 Modal 열기
		$(".editor-open-insert").click(function(){
        	// 게시글 작성 Modal 열기
            $("#modal-insert").modal("show");
            // Summer Note 불러오기
            $("#summernote-insert").summernote({
                height:500,
                minHeight:500,
                maxHeight:500
            });
         	// Summer Note 초기화
        	$("#summernote-insert").summernote("reset");
        	// 게시글 등록과 연관이 없는 모든 요소 숨김
            $(".note-insert").hide();
        });
		
		// - 확인 버튼 클릭시 비동기로 게시글 등록 요청 전송
	 	$(document).on("click", ".modal-insert-submit", function(e){
	    	// 확인 메시지 출력
	    	var choice = window.confirm("글을 작성하시겠습니까?");
	    	// 취소시 return
	    	if(choice == false) return;
	    	// 로그인 중인 회원의 회원 번호
			var memberNo = $("#div-member-info").data("memberno");
			// 현재 접속중인 소모임 페이지의 소모임 번호
			var ahzitNo = $("#div-member-info").data("ahzitno");
	        // 태그를 포함하여 내용 지정
	        var boardContent = $(".note-editable").html();
	     	// 비동기 통신을 이용한 게시글 등록
			axios({
				url : "http://localhost:8888/rest_board/write",
				method : "post",
				data : {
					memberNo : memberNo,
					ahzitNo : ahzitNo,
					boardContent : boardContent
				}
			})
			.then(function(response){
				
				/* p = 1;
				loadList(); */
				
				// 태그 요소 생성
				// - 상단
				var div_container = $("<div>").attr("class", "shadow div-board-container"); // 그림자를 위한 컨테이너 태그
				
				var divtop_outer = $("<div>").attr("class", "d-flex align-items-start px-3 pt-3 mt-3 div-board div-board-top")
				
				var divtop_span = $("<span>").attr("class", "div-member-profile");
				var divtop_img_member = $("<img>").attr("class", "img-member-profile member-profile").attr("src", "/attachment/download/ahzitMember?attachmentNo=" + response.data.memberAttachmentNo).attr("data-writerno", response.data.boardWriterNo); // 임시 주소
				var divtop_img = divtop_span.append(divtop_img_member);
				
				var divtop_writer_outer = $("<div>").attr("class", "ms-3 w-100");
				var divtop_writer_info = $("<p>").attr("class", "mb-0 p-writer-info").text(response.data.memberNick + " [" + response.data.memberGrade +"]");
				var divtop_writedate = $("<p>").attr("class", "mb-0").text(response.data.boardWritedate);
				var divtop_writer = divtop_writer_outer.append(divtop_writer_info).append(divtop_writedate);
				
				var divtop_dropdown_outer = $("<div>").attr("class", "dropdown div-icon-dropdown");
				var divtop_dropdown_a = $("<a>").attr("class", "fa-solid fa-ellipsis-vertical a-board-dropdown icon-board w-100").attr("data-bs-toggle", "dropdown").attr("data-boardwriterno", response.data.boardWriterNo).attr("data-boardwritergrade", response.data.memberGrade);
				var divtop_dropdown_ul = $("<ul>").attr("class", "dropdown-menu");
				var divtop_dropdown_li_edit = $("<li>").attr("class", "li-edit");
				var divtop_dropdown_a_edit = $("<a>").attr("class", "dropdown-item editor-open-edit").attr("data-bs-toggle", "modal").attr("data-bs-target", "#modal-edit").attr("data-boardno", response.data.boardNo).text("수정");
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
	            var divbottom_div_flex = $("<div>").attr("class", "d-flex px-3 pb-3 div-reply-button");
	            var divbottom_label_reply = $("<label>").attr("class", "btn-reply-write col-6 d-flex justify-content-center align-items-center button-board").attr("data-boardno", response.data.boardNo).attr("data-fold", 0).attr("data-replylist", 0);
	            var divbottom_i_reply = $("<i>").attr("class", "fa-regular fa-comment-dots icon-board align-middle").attr("data-boardno", response.data.boardNo);
	            var divbottom_i_reply_count = $("<div>").attr("class", "ps-1 align-middle").text(response.data.replyCount);
	            var divbottom_label_like = $("<label>").attr("class", "btn-board-like col-6 d-flex justify-content-center align-items-center button-board").attr("data-boardno", response.data.boardNo).attr("data-boardlike", response.data.boardLike).attr("data-islike", response.data.isLike);
	            var divbottom_i_like = $("<i>").attr("class", "fa-regular fa-heart icon-board align-middle");            
	            var divbottom_i_like_count = $("<div>").attr("class", "ps-1 align-middle").text(response.data.boardLike);
	            
	            var divbottom_label_left = divbottom_label_reply.append(divbottom_i_reply).append(divbottom_i_reply_count);
	            var divbottom_label_right = divbottom_label_like.append(divbottom_i_like).append(divbottom_i_like_count);
	            
	            var divbottom_flex = divbottom_div_flex.append(divbottom_label_left).append(divbottom_label_right);
	            
	            var divbottom_reply_list = $("<div>").attr("class", "div-reply-list");
	            var divbottom = divbottom_outer.append(divbottom_flex).append(divbottom_reply_list);
	            
	            div_container.append(divtop).append(divmid).append(divbottom);
	            
	            // 태그 재구성
	            $("#div-board-list").prepend(div_container);
				// 게시글 입력창 닫기
				$("#modal-insert").modal("hide");
			});
		});
		
	 	// - 게시글 작성의 닫기 버튼을 클릭할 경우 confirm 메시지
        $(document).on("click", ".modal-insert-close", function(e){
            var choice = window.confirm("글 작성을 취소하시겠습니까?");
            if(choice == false) return;
            $("#summernote-insert").summernote("undo");
            $("#modal-insert").modal("hide");
        });
	
		// 게시글 수정 비동기 처리
        // - 게시글 수정 클릭시 게시글 수정 Modal 열기
        $(document).on("click", ".editor-open-edit", function(e){
        	console.log($(this));
        	// 게시글 수정 Modal 열기
            $("#modal-edit").modal("show");
        	// - 클릭한 게시글 수정 버튼의 data 값을 Modal의 data 값으로 설정
        	$(".modal-edit-submit").attr("data-boardno", $(this).data("boardno"));
            // Summer Note 불러오기
            $("#summernote-edit").summernote({
                height:500,
                minHeight:500,
                maxHeight:500
            });
         	// Summer Note 초기화
        	$("#summernote-edit").summernote("reset");
        	// 게시글 수정과 연관이 없는 모든 요소 숨김
            $(".note-insert").hide();
        	// 수정 전 게시글 지정
         	var boardContent = $(this).parents(".div-board-top").next();
        	var boardContentValue = boardContent.html();
         	// 게시글 내용을 Summer Note의 내용으로 설정
        	$(".note-editable").html(boardContentValue);
         	
        	// - 확인 버튼 클릭시 비동기로 게시글 수정 요청 전송
            $(".modal-edit-submit").off().click(function(e){ // off()가 없으면 이상하게 클릭 이벤트가 2번 발생함(?)
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
                var editorContent = $(this).parent().prev().children(".note-editor").children(".note-editing-area").children(".note-editable").html();
                //var editorContent = $(".note-editable").html();
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
    				console.log(response);
    				console.log(boardContent);
    				// 새로운 내용으로 교체
    				boardContent.html(editorContent);
    				console.log(boardContent.html());
    	         	// 게시글 수정 Modal 닫기
    	            $("#modal-edit").modal("hide");
    			});
            });
        });
        
     	// - 게시글 수정의 닫기 버튼을 클릭할 경우 confirm 메시지
     	$(document).on("click", ".modal-edit-close", function(e){
            var choice = window.confirm("글 수정을 취소하시겠습니까?");
            if(choice == false) return;
            $("#summernote-edit").summernote("undo");
            $("#modal-edit").modal("hide");
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
	});
	
	// 정적 태그에 대한 이벤트 - 하나의 function 안에 정적 이벤트와 동적 이벤트가 같이 있으면 동작하지 않는지?
	$(function(){
		// 게시글 검색 비동기 처리
    	$(".btn-search-submit").click(function(){
			var ahzitNo = $("#div-member-info").data("ahzitno");
			var memberNo = $("#div-member-info").data("memberno");
			keyword = $(".input-search").val();
			axios({
				url : "http://localhost:8888/rest_board/search?ahzitNo=" + ahzitNo + "&memberNo=" + memberNo + "&keyword=" + keyword + "&p=" + p,
				method : "get"
				/*data : {
					ahzitNo : ahzitNo,
					memberNo : memberNo,
					keyword : keyword,
					p : p
				}*/
			})
			.then(function(response){
				console.log(response);
				// 게시글 작성 영역 삭제 (게시글 작성시 검색 목록이 아닌 전체 목록의 가장 상단에 붙여야 하지만 페이지를 갱신하지 않고는 어려운 것 같다)
				$(".div-editor-insert").remove();
				$("#div-board-list").empty();
				for(var i = 0 ; i < response.data.boardList.length ; i ++){
					var div_container = $("<div>").attr("class", "shadow div-board-container"); // 그림자를 위한 컨테이너 태그
					
					var divtop_outer = $("<div>").attr("class", "d-flex align-items-start px-3 pt-3 mt-3 div-board div-board-top")
					
					var divtop_span = $("<span>").attr("class", "div-member-profile");
					var divtop_img_member = $("<img>").attr("class", "img-member-profile member-profile").attr("src", "/attachment/download/ahzitMember?attachmentNo=" + response.data.boardList[i].memberAttachmentNo).attr("data-writerno", response.data.boardList[i].boardWriterNo); // 임시 주소
					var divtop_img = divtop_span.append(divtop_img_member);
					
					var divtop_writer_outer = $("<div>").attr("class", "ms-3 w-100");
					var divtop_writer_info = $("<p>").attr("class", "mb-0 p-writer-info").text(response.data.boardList[i].memberNick + " [" + response.data.boardList[i].memberGrade +"]");
					var divtop_writedate = $("<p>").attr("class", "mb-0").text(response.data.boardList[i].boardWritedate);
					var divtop_writer = divtop_writer_outer.append(divtop_writer_info).append(divtop_writedate);
					
					var divtop_dropdown_outer = $("<div>").attr("class", "dropdown div-icon-dropdown");
					var divtop_dropdown_a = $("<a>").attr("class", "fa-solid fa-ellipsis-vertical a-board-dropdown icon-board w-100").attr("data-bs-toggle", "dropdown").attr("data-boardwriterno", response.data.boardList[i].boardWriterNo).attr("data-boardwritergrade", response.data.boardList[i].memberGrade);
					var divtop_dropdown_ul = $("<ul>").attr("class", "dropdown-menu");
					var divtop_dropdown_li_edit = $("<li>").attr("class", "li-edit");
					var divtop_dropdown_a_edit = $("<a>").attr("class", "dropdown-item editor-open-edit").attr("data-bs-toggle", "modal").attr("data-bs-target", "#modal-edit").attr("data-boardno", response.data.boardList[i].boardNo).text("수정");
					var divtop_dropdown_li_delete = $("<li>").attr("class", "li-delete");
					var divtop_dropdown_a_delete = $("<a>").attr("class", "dropdown-item btn-delete").attr("data-boardno", response.data.boardList[i].boardNo).attr("data-boardwriterno", response.data.boardList[i].boardWriterNo).text("삭제");
					var divtop_dropdown_li_report = $("<li>").attr("class", "li-report");
					var divtop_dropdown_a_report = $("<a>").attr("class", "dropdown-item btn-report").attr("data-boardno", response.data.boardList[i].boardNo).text("신고");
					
					var divtop_li_edit = divtop_dropdown_li_edit.append(divtop_dropdown_a_edit);
					var divtop_li_delete = divtop_dropdown_li_delete.append(divtop_dropdown_a_delete);
					var divtop_li_report = divtop_dropdown_li_report.append(divtop_dropdown_a_report);
					
					// 개설자, 작성자 여부에 따라 서로 다른 드롭다운 생성
					// 로그인 중인 회원의 회원 번호
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
					var divbottom_div_flex = $("<div>").attr("class", "d-flex px-3 pb-3 div-reply-button");
					var divbottom_label_reply = $("<label>").attr("class", "btn-reply-write col-6 d-flex justify-content-center align-items-center button-board").attr("data-boardno", response.data.boardList[i].boardNo).attr("data-fold", 0).attr("data-replylist", 0);
					var divbottom_i_reply = $("<i>").attr("class", "fa-regular fa-comment-dots icon-board align-middle");
					var divbottom_i_reply_count = $("<div>").attr("class", "ps-1 align-middle").text(response.data.boardList[i].replyCount);
					var divbottom_label_like = $("<label>").attr("class", "btn-board-like col-6 d-flex justify-content-center align-items-center button-board").attr("data-boardno", response.data.boardList[i].boardNo).attr("data-boardlike", response.data.boardList[i].boardLike).attr("data-islike", response.data.boardList[i].isLike);
					
					var divbottom_i_like;
					if(response.data.boardList[i].isLike == 1) {
						divbottom_i_like = $("<i>").attr("class", "fa-regular fa-heart icon-board icon-board-like-on align-middle");
					} else {
						divbottom_i_like = $("<i>").attr("class", "fa-regular fa-heart icon-board align-middle");
					}
					
					var divbottom_i_like_count = $("<div>").attr("class", "ps-1 align-middle").text(response.data.boardList[i].boardLike);
					
					var divbottom_label_left = divbottom_label_reply.append(divbottom_i_reply).append(divbottom_i_reply_count);
					var divbottom_label_right = divbottom_label_like.append(divbottom_i_like).append(divbottom_i_like_count);
					
					var divbottom_flex = divbottom_div_flex.append(divbottom_label_left).append(divbottom_label_right);
					
					var divbottom_reply_list = $("<div>").attr("class", "div-reply-list");
		            var divbottom = divbottom_outer.append(divbottom_flex).append(divbottom_reply_list);
					
					div_container.append(divtop).append(divmid).append(divbottom);
		            
		            // 태그 재구성
		            $("#div-board-list").append(div_container);
				}
				
				$(".input-search").val("");
			});
		});
	});
	
	// 무한 스크롤
	$(window).scroll(_.debounce(function(){
		var percentage = $(window).scrollTop() / ($(document).height() - $(window).height()) * 100;
		
		if(p == pLast) return; // 페이지 끝 번호에 도달하면 비동기 조회 요청을 보내지 않도록 설정
		
		if(percentage > 80) {
			p = p + 1;
			var ahzitNo = $("#div-member-info").data("ahzitno");
			var memberNo = $("#div-member-info").data("memberno");
			
			axios({
				url : "http://localhost:8888/rest_board/search?ahzitNo=" + ahzitNo + "&memberNo=" + memberNo + "&keyword=" + keyword + "&p=" + p,
				method : "get"
				/* data : {
					ahzitNo : ahzitNo,
					memberNo : memberNo,
					keyword : keyword,
					p : p
				} */
			})
			.then(function(response){
				
				for(var i = 0 ; i < response.data.boardList.length ; i ++){
					var divtop_outer = $("<div>").attr("class", "d-flex align-items-start px-3 pt-3 mt-3 div-board div-board-top");
					
					var divtop_span = $("<span>").attr("class", "div-member-profile");
					var divtop_img_member = $("<img>").attr("class", "img-member-profile member-profile").attr("src", "/attachment/download/ahzitMember?attachmentNo=" + response.data.boardList[i].memberAttachmentNo).attr("data-writerno", response.data.boardList[i].boardWriterNo); // 임시 주소
					var divtop_img = divtop_span.append(divtop_img_member);
					
					var divtop_writer_outer = $("<div>").attr("class", "ms-3 w-100");
					var divtop_writer_info = $("<p>").attr("class", "mb-0 p-writer-info").text(response.data.boardList[i].memberNick + " [" + response.data.boardList[i].memberGrade +"]");
					var divtop_writedate = $("<p>").attr("class", "mb-0").text(response.data.boardList[i].boardWritedate);
					var divtop_writer = divtop_writer_outer.append(divtop_writer_info).append(divtop_writedate);
					
					var divtop_dropdown_outer = $("<div>").attr("class", "dropdown div-icon-dropdown");
					var divtop_dropdown_a = $("<a>").attr("class", "fa-solid fa-ellipsis-vertical a-board-dropdown icon-board w-100").attr("data-bs-toggle", "dropdown").attr("data-boardwriterno", response.data.boardList[i].boardWriterNo).attr("data-boardwritergrade", response.data.boardList[i].memberGrade);
					var divtop_dropdown_ul = $("<ul>").attr("class", "dropdown-menu");
					var divtop_dropdown_li_edit = $("<li>").attr("class", "li-edit");
					var divtop_dropdown_a_edit = $("<a>").attr("class", "dropdown-item editor-open-edit").attr("data-bs-toggle", "modal").attr("data-bs-target", "#modal-edit").attr("data-boardno", response.data.boardList[i].boardNo).text("수정");
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
					var divbottom_div_flex = $("<div>").attr("class", "d-flex px-3 pb-3 div-reply-button");
					var divbottom_label_reply = $("<label>").attr("class", "btn-reply-write col d-flex justify-content-center button-board").attr("data-boardno", response.data.boardList[i].boardNo).attr("data-fold", 0).attr("data-replylist", 0);
					var divbottom_i_reply = $("<i>").attr("class", "fa-regular fa-comment-dots icon-board");
					var divbottom_i_reply_count = $("<div>").attr("class", "ps-1 align-middle").text(response.data.boardList[i].replyCount);
					var divbottom_label_like = $("<label>").attr("class", "btn-board-like col d-flex justify-content-center button-board").attr("data-boardno", response.data.boardList[i].boardNo).attr("data-boardlike", response.data.boardList[i].boardLike).attr("data-islike", response.data.boardList[i].isLike);
					
					var divbottom_i_like;
					if(response.data.boardList[i].isLike == 1) {
						divbottom_i_like = $("<i>").attr("class", "fa-regular fa-heart icon-board icon-board-like-on");
					} else {
						divbottom_i_like = $("<i>").attr("class", "fa-regular fa-heart icon-board");
					}
					
					var divbottom_i_like_count = $("<div>").attr("class", "ps-1 align-middle").text(response.data.boardList[i].boardLike);
					
					var divbottom_label_left = divbottom_label_reply.append(divbottom_i_reply).append(divbottom_i_reply_count);
					var divbottom_label_right = divbottom_label_like.append(divbottom_i_like).append(divbottom_i_like_count);
					
					var divbottom_flex = divbottom_div_flex.append(divbottom_label_left).append(divbottom_label_right);
					
					var divbottom_reply_list = $("<div>").attr("class", "div-reply-list");
		            var divbottom = divbottom_outer.append(divbottom_flex).append(divbottom_reply_list);
					
					// 태그 재구성
					$("#div-board-list").append(divtop);
					$("#div-board-list").append(divmid);
					$("#div-board-list").append(divbottom);
				}
			});
		}
	}, 100));
	
	// 게시글 목록 갱신 함수
	function loadList(){
		var ahzitNo = $("#div-member-info").data("ahzitno");
		var memberNo = $("#div-member-info").data("memberno");
		keyword = "";
		p = 1;
		axios({
			url : "http://localhost:8888/rest_board/search?ahzitNo=" + ahzitNo + "&memberNo=" + memberNo + "&keyword=" + keyword + "&p=" + p,
			method : "get"
			/* data : {
				ahzitNo : ahzitNo,
				memberNo : memberNo,
				keyword : keyword,
				p : p
			} */
		})
		.then(function(response){
			console.log(response);
			if(response.data.boardList[0] == null) return;
			pLast = response.data.plast; // 끝 페이지에 도달하면 비동기 조회를 막기 위해 페이지 끝 번호 설정
			//console.log(pLast);
			
			$("#div-board-list").empty();
			for(var i = 0 ; i < response.data.boardList.length ; i ++){
				var div_container = $("<div>").attr("class", "shadow div-board-container"); // 그림자를 위한 컨테이너 태그
				
				var divtop_outer = $("<div>").attr("class", "d-flex align-items-start px-3 pt-3 mt-3 div-board div-board-top");
				
				var divtop_span = $("<span>").attr("class", "div-member-profile");
				var divtop_img_member = $("<img>").attr("class", "img-member-profile member-profile").attr("src", "/attachment/download/ahzitMember?attachmentNo=" + response.data.boardList[i].memberAttachmentNo).attr("data-writerno", response.data.boardList[i].boardWriterNo); // 임시 주소
				var divtop_img = divtop_span.append(divtop_img_member);
				
				var divtop_writer_outer = $("<div>").attr("class", "ms-3 w-100");
				var divtop_writer_info = $("<p>").attr("class", "mb-0 p-writer-info").text(response.data.boardList[i].memberNick + " [" + response.data.boardList[i].memberGrade +"]");
				var divtop_writedate = $("<p>").attr("class", "mb-0").text(response.data.boardList[i].boardWritedate);
				var divtop_writer = divtop_writer_outer.append(divtop_writer_info).append(divtop_writedate);
				
				var divtop_dropdown_outer = $("<div>").attr("class", "dropdown div-icon-dropdown");
				var divtop_dropdown_a = $("<a>").attr("class", "fa-solid fa-ellipsis-vertical a-board-dropdown icon-board w-100").attr("data-bs-toggle", "dropdown").attr("data-boardwriterno", response.data.boardList[i].boardWriterNo).attr("data-boardwritergrade", response.data.boardList[i].memberGrade);
				var divtop_dropdown_ul = $("<ul>").attr("class", "dropdown-menu");
				var divtop_dropdown_li_edit = $("<li>").attr("class", "li-edit");
				var divtop_dropdown_a_edit = $("<a>").attr("class", "dropdown-item editor-open-edit").attr("data-bs-toggle", "modal").attr("data-bs-target", "#modal-edit").attr("data-boardno", response.data.boardList[i].boardNo).text("수정");
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
				var divbottom_div_flex = $("<div>").attr("class", "d-flex px-3 pb-3 div-reply-button");
				var divbottom_label_reply = $("<label>").attr("class", "btn-reply-write col d-flex justify-content-center button-board").attr("data-boardno", response.data.boardList[i].boardNo).attr("data-fold", 0).attr("data-replylist", 0);
				var divbottom_i_reply = $("<i>").attr("class", "fa-regular fa-comment-dots icon-board");
				var divbottom_i_reply_count = $("<div>").attr("class", "ps-1 align-middle").text(response.data.boardList[i].replyCount)
				var divbottom_label_like = $("<label>").attr("class", "btn-board-like col d-flex justify-content-center button-board").attr("data-boardno", response.data.boardList[i].boardNo).attr("data-boardlike", response.data.boardList[i].boardLike).attr("data-islike", response.data.boardList[i].isLike);
				
				var divbottom_i_like;
				if(response.data.boardList[i].isLike == 1) {
					divbottom_i_like = $("<i>").attr("class", "fa-regular fa-heart icon-board icon-board-like-on");
				} else {
					divbottom_i_like = $("<i>").attr("class", "fa-regular fa-heart icon-board");
				}
				
				var divbottom_i_like_count = $("<div>").attr("class", "ps-1 align-middle").text(response.data.boardList[i].boardLike);
				
				var divbottom_label_left = divbottom_label_reply.append(divbottom_i_reply).append(divbottom_i_reply_count);
				var divbottom_label_right = divbottom_label_like.append(divbottom_i_like).append(divbottom_i_like_count);
				
				var divbottom_flex = divbottom_div_flex.append(divbottom_label_left).append(divbottom_label_right);
				
				var divbottom_reply_list = $("<div>").attr("class", "div-reply-list");
	            var divbottom = divbottom_outer.append(divbottom_flex).append(divbottom_reply_list);
				
				div_container.append(divtop).append(divmid).append(divbottom);
	            
	            // 태그 재구성
	            $("#div-board-list").append(div_container);
			}
		});
	};
</script>
