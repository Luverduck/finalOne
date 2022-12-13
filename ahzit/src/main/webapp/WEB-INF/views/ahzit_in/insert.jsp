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
         
         <c:if test="${ahzitVO.getAhzitLeader() == sessionScope.loginId}">
			<a href="/ahzit/edit?ahzitNo= ${ahzitVO.getAhzitNo()}"><i class="fa-solid fa-gear"></i></i><span>아지트 수정</span></a><br>
		</c:if>
      </div>
            
      <%-- 가운데 내용 --%>
      <div class = "col col-6">
      	<div class="row">
      		<form name="ahzitJoin" action="${pageContext.request.contextPath}/ahzit_in/${ahzitNo}/insert" method="post">
      		<input type="hidden" name="memberAhzitNo" value="${ahzitNo}">
      		<input type="hidden" name="memberId" value="${loginId}">
      		<input type="text" name="memberNick">
      		<div class="valid-feedback">사용할 수 있는 닉네임입니다</div>
            <div class="invalid-feedback">닉네임은 한글 3~10글자로 작성하세요</div>
      		<div name="duplicate" class="NNNNN">이미 사용 중인 닉네임입니다</div>
      		<button type="submit">소모임 가입</button>
      		</form>
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
   

   
</script>