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

   .div-editor-opener,
   .div-editor-input {
      border-radius: 10px;
      border-color : rgba(210, 210, 210);
      background-color: rgba(240, 240, 240, 50);
      padding-left: 2%;
      color: rgba(140, 140, 140, 140);
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
   
   .ahzit-img {
      width : 400px;
      height : 400px;      
   }
   
   @keyframes heart-on {
        from {color:black;}
        to {color:#FF8681;}

        0% {transform: translate(0, 0%);}
        25% {transform: translate(0, 5%)}
        50% {transform: translate(0, -5%)}
        75% {transform: translate(0, 5%)}
        100% {transform: translate(0, 0%)}
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

        0% {transform: translate(0, 0%);}
        25% {transform: translate(0, -5%)}
        50% {transform: translate(0, 5%)}
        75% {transform: translate(0, -5%)}
        100% {transform: translate(0, 0%)}
    }
  
    .icon-board-like-off {
       animation-name: heart-off;
        animation-fill-mode: forwards;
        animation-delay: 0s;
        animation-duration: 1s;
        animation-iteration-count: 1;
   }

</style>


<div class = "container-fluid mt-3">
   
   <div class = "row">
         
      <%-- 왼쪽 사이드바 --%>
      <div class = "col col-3" style="background-color: green;">
         <h1>왼쪽 사이드바</h1> 
      
         <br>
         
         <div class = "row">
           <%--아지트 프로필 사진 --%>
			<c:if test="${attachmentList.isEmpty()}"> <%--미설정시 기본 프로필 --%>
				 <img src = "/images/bg_default.jpg" class="ahzit-img">
			</c:if>
            <c:forEach var = "list" items = "${attachmentList}">  <%--설정한 프로필 --%>
              <img src = "/attachment/download/ahzit?attachmentNo=${list.attachmentNo}" class="ahzit-img"  > 					
             </c:forEach>	
            아지트 이름 : ${ahzitVO.getAhzitName()} <br>
            아지트 소개 : ${ahzitVO.getAhzitInfo()}<br>
            아지트 멤버 : ${ahzitVO.getAhzitHead()} 명<br>
            아지트 종류 : ${ahzitVO.getAhzitSort()}<br>
            아지트 리더 : ${ahzitVO.getAhzitLeader()}<br>
                  
            <%-- 아지트 가입 버튼 --%>
            <c:choose>
			<c:when test="${ahzitMemberDto.getMemberId() == null}"><%-- 소모임 회원이 아니면 --%>
			<button type="button" onclick="location.href='${pageContext.request.contextPath}/ahzit_in/${ahzitNo}/insert'">아지트 가입</button>
			</c:when>
			<c:otherwise>
			<button type="button"  disabled>아지트 가입</button><%-- 소모임 회원이라면 --%>
			</c:otherwise>
			</c:choose>
         </div>
               
         <div class = "row" id = "div-member-info" data-memberno = "${ahzitMemberDto.memberNo}" data-ahzitno = "${ahzitMemberDto.memberAhzitNo}" data-membergrade="${ahzitMemberDto.memberGrade}">
            로그인 중인 회원 번호 : ${ahzitMemberDto.memberNo}<br>
            회원이 가입한 아지트 번호 : ${ahzitMemberDto.memberAhzitNo}<br>
            로그인 중인 회원 아이디 : ${ahzitMemberDto.memberId}<br>
            로그인 중인 회원 닉네임 : ${ahzitMemberDto.memberNick}<br>
            로그인 중인 회원 등급 : ${ahzitMemberDto.memberGrade}<br>
            로그인 중인 회원 활동 점수 : ${ahzitMemberDto.memberGrade}<br>
            소모임 가입일 : ${ahzitMemberDto.memberJoindate}
         </div>
         
         <c:if test="${ahzitVO.getAhzitLeader() == sessionScope.loginId}">
			<a href="/ahzit/edit?ahzitNo= ${ahzitVO.getAhzitNo()}"><i class="fa-solid fa-gear"></i></i><span>아지트 수정</span></a><br>
		</c:if>
		
		<!-- 
		아지트 가입 회원 프로필 수정/이미지 파일 등록/수정 페이지로 이동기능 넣으려던 자리(만들다 계속 오류나서 지움)
		 -->
      </div>
            
      <%-- 가운데 내용 --%>
      <div class = "col col-6">
         <%-- 게시글 검색창 --%>
         <div class = "row">
            <div class = "col">
               <div class = "d-flex ps-3 py-3 bg-white div-editor-opener">
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
               <div class = "d-flex ps-3 py-3 bg-white div-editor-opener">
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
           <div class="modal fade" id="modal-insert" tabindex="-1" data-bs-backdrop="static">
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
         <div class="modal fade" id="modal-edit" tabindex="-1" data-bs-backdrop="static">
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
      <div class = "col-3" style="background-color: green;">

         <%-- 공지사항 목록 --%>
         <div>
               
         </div>
      </div>
   </div>
</div>

<script type="text/javascript">
   
   // 초기 1페이지
   var p = 1;
   
   // 초기 검색어
   var keyword = "";
   
   // 초기 게시글 목록 비동기 조회
   loadList();
   
   // 동적 태그에 대한 이벤트
   $(function(){
      
      // 게시글 좋아요 비동기 처리
      $(document).on("click", ".btn-board-like", function(){
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
            url : "http://localhost:8888/rest_board/is_like",
            method : "post",
            data : {
               memberNo : memberNo,
               boardNo : boardNo,
               boardLike : boardLike,
               isLike : isLike
            }
         })
         .then(function(response){
            $(btnThis).remove();
            
            var divbottom_label_like = $("<label>").attr("class", "btn-board-like col d-flex justify-content-center button-board").attr("data-boardno", response.data.boardNo).attr("data-boardlike", response.data.boardLike).attr("data-islike", response.data.isLike);
            
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
            var divtop_dropdown_a_edit = $("<a>").attr("class", "dropdown-item editor-open-edit").attr("data-bs-toggle", "modal").attr("data-bs-target", "#modal-edit").text("수정");
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
            var divbottom_label_reply = $("<label>").attr("class", "btn-reply-write col d-flex justify-content-center button-board");
            var divbottom_i_reply = $("<i>").attr("class", "fa-regular fa-comment-dots icon-board").attr("data-boardno", response.data.boardNo);
            var divbottom_i_reply_count = $("<div>").attr("class", "ps-1 align-middle").text(response.data.replyCount);
            var divbottom_label_like = $("<label>").attr("class", "btn-board-like col d-flex justify-content-center button-board").attr("data-boardno", response.data.boardNo).attr("data-boardlike", response.data.boardLike).attr("data-islike", response.data.isLike);
            var divbottom_i_like = $("<i>").attr("class", "fa-regular fa-heart icon-board");            
            var divbottom_i_like_count = $("<div>").attr("class", "ps-1 align-middle").text(response.data.boardLike);
            
            var divbottom_label_left = divbottom_label_reply.append(divbottom_i_reply).append(divbottom_i_reply_count);
            var divbottom_label_right = divbottom_label_like.append(divbottom_i_like).append(divbottom_i_like_count);
            
            var divbottom_flex = divbottom_div_flex.append(divbottom_label_left).append(divbottom_label_right);
            var divbottom = divbottom_outer.append(divbottom_flex);
            
            // 태그 재구성
            $("#div-board-list").prepend(divbottom);
            $("#div-board-list").prepend(divmid);
            $("#div-board-list").prepend(divtop);
            
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
            $(".modal-edit-submit").click(function(e){ // off()가 없으면 이상하게 클릭 이벤트가 2번 발생함(?)
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
         console.log(btnThis);
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
            url : "http://localhost:8888/rest_board/search",
            method : "post", 
            data : {
               ahzitNo : ahzitNo,
               memberNo : memberNo,
               keyword : keyword,
               p : p
            }
         })
         .then(function(response){
            console.log(response);
            // 게시글 작성 영역 삭제 (게시글 작성시 검색 목록이 아닌 전체 목록의 가장 상단에 붙여야 하지만 페이지를 갱신하지 않고는 어려운 것 같다)
            $(".div-editor-insert").remove();
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
               var divtop_dropdown_a_edit = $("<a>").attr("class", "dropdown-item editor-open-edit").attr("data-bs-toggle", "modal").attr("data-bs-target", "#modal-edit").text("수정");
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
               var divbottom_div_flex = $("<div>").attr("class", "d-flex px-3 pb-3");
               var divbottom_label_reply = $("<label>").attr("class", "btn-reply-write col d-flex justify-content-center button-board").attr("data-boardno", response.data.boardList[i].boardNo);
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
               var divbottom = divbottom_outer.append(divbottom_flex);
               
               // 태그 재구성
               $("#div-board-list").append(divtop);
               $("#div-board-list").append(divmid);
               $("#div-board-list").append(divbottom);
            }
            
            $(".input-search").val("");
         });
      });
   });
   
   // 무한 스크롤
   $(window).scroll(_.debounce(function(){
      var percentage = $(window).scrollTop() / ($(document).height() - $(window).height()) * 100;
      if(percentage > 80) {
         p = p + 1;
         var ahzitNo = $("#div-member-info").data("ahzitno");
         var memberNo = $("#div-member-info").data("memberno");
         //var p = 1;
         axios({
            url : "http://localhost:8888/rest_board/search",
            method : "post",
            data : {
               ahzitNo : ahzitNo,
               memberNo : memberNo,
               keyword : keyword,
               p : p
            }
         })
         .then(function(response){
            console.log(response);
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
               var divbottom_label_reply = $("<label>").attr("class", "btn-reply-write col d-flex justify-content-center button-board").attr("data-boardno", response.data.boardList[i].boardNo);
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
   
   // 게시글 목록 갱신 함수
   function loadList(){
      var ahzitNo = $("#div-member-info").data("ahzitno");
      var memberNo = $("#div-member-info").data("memberno");
      keyword = "";
      p = 1;
      axios({
         url : "http://localhost:8888/rest_board/search",
         method : "post",
         data : {
            ahzitNo : ahzitNo,
            memberNo : memberNo,
            keyword : keyword,
            p : p
         }
      })
      .then(function(response){
         $("#div-board-list").empty();
         for(var i = 0 ; i < response.data.boardList.length ; i ++){
            var divtop_outer = $("<div>").attr("class", "d-flex align-items-start px-3 pt-3 mt-3 div-board div-board-top");
            
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
            var divtop_dropdown_a_edit = $("<a>").attr("class", "dropdown-item editor-open-edit").attr("data-bs-toggle", "modal").attr("data-bs-target", "#modal-edit").text("수정");
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
            var divbottom_label_reply = $("<label>").attr("class", "btn-reply-write col d-flex justify-content-center button-board").attr("data-boardno", response.data.boardList[i].boardNo);
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
            var divbottom = divbottom_outer.append(divbottom_flex);
            
            // 태그 재구성
            $("#div-board-list").append(divtop);
            $("#div-board-list").append(divmid);
            $("#div-board-list").append(divbottom);
         }
      });
   };
</script>