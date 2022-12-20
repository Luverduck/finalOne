<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    
<%-- header --%>
<jsp:include page="/WEB-INF/views/template/ahzit_header.jsp">
	<jsp:param value="소모임 회원" name="title"/>
</jsp:include>

<style>
	body {
		background-color: rgba(230, 230, 230, 100);
	}
   	.ahzit-img {
  		width:100%;
  		height:300px;
  	}
  	.ahzit-side {
  		border-radius : 15px;
  	}
  	.btn-join {
  		display : none;
  	}
  	.ahzit-name {
  		font-size : 50px;
  		font-weight : bold;
  	}
</style>

<div class = "container-fluid mt-3">
	<div class = "row">
		
		<div class = "col-8 offset-2 main">
			
			<div class = "row">
			
				<%-- 왼쪽 사이드바 --%>
				<div class = "col col-3 ahzit-side" >
					<%--아지트 프로필 사진 --%>
					<div class = "row ahzit-side mt-2 me-2 shadow" style="background-color: white;">
						<c:if test="${attachmentList.isEmpty()}"> <%--미설정시 기본 프로필 --%>
						    	<img src = "/images/bg_default.jpg" class="w-100 ahzit-img">
					    	</c:if>
				      		<c:forEach var = "list" items = "${attachmentList}"> <%--설정한 프로필 --%>
				        		<img src = "/attachment/download/ahzit?attachmentNo=${list.attachmentNo}" class="ahzit-img">  					
				      		</c:forEach>	
					</div>
          
		      		<%-- 아지트 정보 --%>     	
		      		<div class = "row">
		        		<div class="ahzit-side ahzit-name mt-3">${ahzitVO.getAhzitName()}</div><%--아지트 이름 --%>
						<div class="ahzit-side mt-3">멤버 ${ahzitVO.getAhzitHead()}  · ${ahzitVO.getAhzitSort()} </div>
						<div class="ahzit-side mt-3">${ahzitVO.getAhzitInfo()}<br> <%--아지트 소개 --%></div>

						<div class="ahzit-side mt-3">아지트 리더 : ${ahzitVO.getAhzitLeader()}</div>
		      		</div>
					
					<%-- <div class = "row" id = "div-member-info" data-memberno = "${ahzitMemberDto.memberNo}" data-ahzitno = "${ahzitMemberDto.memberAhzitNo}" data-membergrade="${ahzitMemberDto.memberGrade}">
						로그인 중인 회원 번호 : ${ahzitMemberDto.memberNo}<br>
						회원이 가입한 아지트 번호 : ${ahzitMemberDto.memberAhzitNo}<br>
						로그인 중인 회원 아이디 : ${ahzitMemberDto.memberId}<br>
						로그인 중인 회원 닉네임 : ${ahzitMemberDto.memberNick}<br>
						로그인 중인 회원 등급 : ${ahzitMemberDto.memberGrade}<br>
						로그인 중인 회원 활동 점수 : ${ahzitMemberDto.memberGrade}<br>
						소모임 가입일 : ${ahzitMemberDto.memberJoindate}
					</div> --%>
          
					<%-- 아지트 가입 버튼 --%>
		          	<c:choose>
				    <c:when test="${ahzitMemberDto.getMemberId() == null}"><%-- 소모임 회원이 아니면 --%>
				    	<button type="button" class="btn" onclick="location.href='${pageContext.request.contextPath}/ahzit_in/${ahzitNo}/insert'">아지트 가입</button>
				    </c:when>
				    <c:otherwise>
				    	<button type="button"  class="btn btn-join"  disabled>아지트 가입</button><%-- 소모임 회원이라면 --%>
				    </c:otherwise>
				    </c:choose>
			    
				    <c:if test="${ahzitMemberDto.memberId==sessionScope.loginId}">
						<a href="${pageContext.request.contextPath}/ahzit_in/${ahzitNo}/editMyInfo"><span>내 정보 수정</span></a>
				 	</c:if>
				 	<br>
				 	<%-- 소모임 수정 --%>
				 	<c:if test="${ahzitVO.getAhzitLeader() == sessionScope.loginId}">
						<a href="/ahzit/edit?ahzitNo= ${ahzitVO.getAhzitNo()}"><i class="fa-solid fa-gear"></i></i> <span>아지트 수정</span></a>					
					</c:if>
					
				</div>
				
				<%-- 가운데 내용 --%>
				<div class = "col col-6 ahzit-side shadow" style="background-color: white;">
					회원관리
				</div>
				
				<%-- 오른쪽 사이드바 --%>
				<div class = "col col-3  ahzit-side shadow" style="background-color: white;">
					
					오른쪽
				</div>
			</div>
		</div>
	</div>
</div>


<%-- footer --%>
<jsp:include page="/WEB-INF/views/template/footer.jsp"></jsp:include>