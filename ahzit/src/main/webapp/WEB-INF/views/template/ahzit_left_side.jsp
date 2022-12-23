<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!-- 아지트 프로필 사진 -->
<div class = "row">
	<div class = "div-ahzit-info shadow p-3 bg-white" >
		<div class = "d-flex div-ahzit-img justify-content-center align-items-center">
		
		<c:if test="${attachmentList.isEmpty()}">
	    	<img src = "/images/bg_default.jpg" class="flex-fill ahzit-profile">
    	</c:if>
     		<c:forEach var = "list" items = "${attachmentList}"> <!-- 설정한 프로필 -->
       		<img src = "/attachment/download/ahzit?attachmentNo=${list.attachmentNo}" class="flex-fill ahzit-profile">  					
     		</c:forEach>
		</div>

   		<!-- 아지트 정보 -->
   		<div class = "row" id = "div-member-info" data-memberno = "${ahzitMemberDto.memberNo}" data-ahzitno = "${ahzitMemberDto.memberAhzitNo}" data-membergrade="${ahzitMemberDto.memberGrade}" data-memberattachmentno = "${ahzitMemberDto.memberAttachmentNo}">
			<span class="ahzit-side ahzit-name mt-1">${ahzitVO.getAhzitName()}</span><%--아지트 이름 --%>
			<span class="ahzit-side mt-1">멤버 ${ahzitVO.getAhzitHead()}  · ${ahzitVO.getAhzitSort()} </span>
			<span class="ahzit-side mt-1 mb-1">${ahzitVO.getAhzitInfo()}<br> <%--아지트 소개 --%></span>
			<span class="ahzit-side mt-1">아지트 리더 : ${ahzitVO.memberNick} <img src = "/images/crown.png"  id="crown"></span>
		</div>
		
		<div class = "row mt-1">
			<div class = "col">
			    <c:if test="${ahzitMemberDto.getMemberId() != loginId}"><%-- 소모임 회원이 아니면 --%>
			    	<button type="button" class="btn" onclick="location.href='${pageContext.request.contextPath}/ahzit_in/${ahzitNo}/insert'">아지트 가입</button>
			    </c:if>
			    <c:if test="${ahzitMemberDto.memberId==sessionScope.loginId}">
					<a href="${pageContext.request.contextPath}/ahzit_in/${ahzitNo}/editMyInfo"><span>내 정보 수정</span></a>
			 	</c:if>	
			</div>
			<div class = "col">
				<!-- 소모임 수정 -->
			 	<c:if test="${ahzitVO.getAhzitLeader() == sessionScope.loginId}">
					<a href="/ahzit/edit?ahzitNo=${ahzitVO.getAhzitNo()}"><i class="fa-solid fa-gear"></i><span>아지트 수정</span></a>					
				</c:if>
				
			</div>
		</div>
	</div>
	
	<!-- <div class = "row" id = "div-member-info" data-memberno = "${ahzitMemberDto.memberNo}" data-ahzitno = "${ahzitMemberDto.memberAhzitNo}" data-membergrade="${ahzitMemberDto.memberGrade}">
		로그인 중인 회원 번호 : ${ahzitMemberDto.memberNo}<br>
		회원이 가입한 아지트 번호 : ${ahzitMemberDto.memberAhzitNo}<br>
		로그인 중인 회원 아이디 : ${ahzitMemberDto.memberId}<br>
		로그인 중인 회원 닉네임 : ${ahzitMemberDto.memberNick}<br>
		로그인 중인 회원 등급 : ${ahzitMemberDto.memberGrade}<br>
		로그인 중인 회원 활동 점수 : ${ahzitMemberDto.memberGrade}<br>
		소모임 가입일 : ${ahzitMemberDto.memberJoindate}
	</div> -->
   
</div>