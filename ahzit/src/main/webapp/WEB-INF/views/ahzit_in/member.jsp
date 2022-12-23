<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
    
<%-- header --%>
<jsp:include page="/WEB-INF/views/template/header.jsp">
	<jsp:param value="소모임 회원" name="title"/>
</jsp:include>

<jsp:include page="/WEB-INF/views/template/ahzit_header.jsp">
	<jsp:param value="소모임 회원" name="title"/>
</jsp:include>

<style>
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
	.pagination{
	justify-content : center
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
		height : 60px;
		border-radius : 50%;
	}
</style>

<div class = "container-fluid mt-2 mb-2">
	<div class = "row">
		
		<div class = "col-8 offset-2">
			
			<div class = "row">
			
				<%-- 왼쪽 사이드바 --%>
				<div class = "col-3">
          <jsp:include page="/WEB-INF/views/template/ahzit_left_side.jsp"></jsp:include>
				</div>
				
				<%-- 가운데 내용 --%>
				<div class = "col-6">
					<div class = "row">
						<div class = "col">
							<div class = "d-flex px-3 py-2 mb-2 shadow div-search-member-input search-bar bg-white">
								<input class = "flex-fill input-search-member search-box" type = "text" placeholder= "회원 검색">
								<button class = "btn-search-member-submit header-btn member-search" type = "button"><i class="fa-solid fa-magnifying-glass" ></i></button>
							</div>
							<div class = "shadow div-member-info-list p-3" style="background-color:white;">
							<div style="font-size:20px;" class="mb-2">총 멤버 : ${ahzitVO.getAhzitHead()}</div>
							<c:forEach var = "ahzitMemberList" items = "${ahzitMemberList}">
								<div class = "mb-2 div-member-info">
										<img src = "/attachment/download/ahzitMember?attachmentNo=${ahzitMemberList.memberAttachmentNo}" onerror=" this.onerror=null; this.src='/images/user.png';" class="member-profile profile-img me-2" data-writerno = "${ahzitMemberList.memberNo}">
										${ahzitMemberList.memberNick}  (${ahzitMemberList.memberGrade})
										
<%-- 									(첨부파일 표시 확인 완료)<br>
									회원 번호 : ${ahzitMemberList.memberNo} <br>
									소모임 번호 : ${ahzitMemberList.memberAhzitNo} <br>
									회원 아이디 : ${ahzitMemberList.memberId} <br>
									회원 등급 : ${ahzitMemberList.memberGrade} <br>
									회원 활동점수 : ${ahzitMemberList.memberScore} <br>
									회원 가입일 : ${ahzitMemberList.memberJoindate} <br>
									회원 닉네임 : ${ahzitMemberList.memberNick} <br>
									회원 프로필 번호 : ${ahzitMemberList.memberAttachmentNo} <br> --%>
									<hr>	
								</div> 
							</c:forEach>
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

<!-- 지우지마세요!! -->
<%-- <c:forEach var = "ahzitMemberList" items = "${ahzitMemberList}"> --%>
<!-- 	<div class = "mb-2 div-member-info"> -->
<%-- 		회원 번호 : ${ahzitMemberList.memberNo} <br> --%>
<%-- 		소모임 번호 : ${ahzitMemberList.memberAhzitNo} <br> --%>
<%-- 		회원 아이디 : ${ahzitMemberList.memberId} <br> --%>
<%-- 		회원 등급 : ${ahzitMemberList.memberGrade} <br> --%>
<%-- 		회원 활동점수 : ${ahzitMemberList.memberScore} <br> --%>
<%-- 		회원 가입일 : ${ahzitMemberList.memberJoindate} <br> --%>
<%-- 		회원 닉네임 : ${ahzitMemberList.memberNick} <br> --%>
<%-- 		회원 프로필 번호 : ${ahzitMemberList.memberAttachmentNo} <br> --%>
<!-- 		<hr>	 -->
<!-- 	</div>  -->
<%-- </c:forEach> --%>

	<%-- 페이지 네비게이터 --%>
	<div class=" mt-3 mb-4">
	<ul class="pagination">
		<c:choose>
			<c:when test = "${ahzitMemberInfoRequestVO.isFirst()}">
				<li class="page-item">
					<a class="page-link" href = "">&laquo;</a>
				</li>
			</c:when>
			<c:otherwise>
				<li class="page-item">
					<a class="page-link" href = "member?p=${ahzitMemberInfoRequestVO.firstBlock()}&${ahzitMemberInfoRequestVO.parameter()}">&laquo;</a>
				</li>
			</c:otherwise>
		</c:choose>
		
		<c:choose>
			<c:when test = "${ahzitMemberInfoRequestVO.hasPrev()}">
				<li class="page-item">
					<a class="page-link" href = "member?p=${ahzitMemberInfoRequestVO.prevBlock()}&${ahzitMemberInfoRequestVO.parameter()}">&lt;</a>
				</li>
			</c:when>
			<c:otherwise>
				<li class="page-item">
					<a class="page-link" href = "">&lt;</a>
				</li>
			</c:otherwise>
		</c:choose>
		
		<c:forEach var = "i" begin = "${ahzitMemberInfoRequestVO.startBlock()}" end = "${ahzitMemberInfoRequestVO.endBlock()}" step = "1">
			<li class="page-item">
				<a class="page-link" href = "member?p=${i}&${ahzitMemberInfoRequestVO.parameter()}">${i}</a>
			</li>
		</c:forEach>
		
		<c:choose>
			<c:when test = "${ahzitMemberInfoRequestVO.hasNext()}">
				<li class="page-item">
					<a class="page-link" href = "member?p=${ahzitMemberInfoRequestVO.nextBlock()}&${ahzitMemberInfoRequestVO.parameter()}">&gt;</a>
				</li>
			</c:when>
			<c:otherwise>
				<li class="page-item">
					<a class="page-link" href = "">&gt;</a>
				</li>
			</c:otherwise>
		</c:choose>
		
		<c:choose>
			<c:when test = "${ahzitMemberInfoRequestVO.isLast()}">
				<li class="page-item">
					<a class="page-link" href = "">&raquo;</a>
				</li>
			</c:when>
			<c:otherwise>
				<li class="page-item">
					<a class="page-link" href = "member?p=${ahzitMemberInfoRequestVO.lastBlock()}&${ahzitMemberInfoRequestVO.parameter()}">&raquo;</a>
				</li>
			</c:otherwise>
		</c:choose>
	</ul>
	</div>
</div>
<script>
var ahzitNo = $(".div-member-info").data("data-ahzitno");
   // 초기 검색시 조회되는 페이지를 1페이지로
   var p = 1;
   
   // 검색 버튼을 누를 때 검색 실행
   $(function(){
      $(".btn-search-member-submit").click(function(){
         // 검색창의 문자열을 변수로 지정
         var keyword = $(".input-search-member").val();
         console.log(keyword);
         var form = $("<form>").attr("method", "get").attr("action", "member");
         var input_keyword = $("<input>").attr("type", "hidden").attr("name", "keyword").attr("value", keyword);
         var input_p = $("<input>").attr("type", "hidden").attr("name", "p").attr("value", p);
         form.append(input_keyword).append(input_p);
         $("body").append(form);
         form.submit();
      });
   });
 </script>