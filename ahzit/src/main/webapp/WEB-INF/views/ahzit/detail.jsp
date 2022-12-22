<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    
<%-- header --%>
<jsp:include page="/WEB-INF/views/template/header.jsp">
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
	.member-only {
		width : 160px;
		height : 160px;
	}

</style>

<div class = "container-fluid mt-4 mb-4">
	<div class = "row">
		
		<div class = "col-8 offset-2">
			
			<div class = "row">
			
				<%-- 왼쪽 사이드바 --%>

				<div class = "col-3">
					<%--아지트 프로필 사진 --%>
					<div class = "row">
						<div class = "div-ahzit-info shadow p-3 bg-white">
							<div class = "d-flex div-ahzit-img justify-content-center align-items-center">
							
							<c:if test="${attachmentList.isEmpty()}">
						    	<img src = "/images/bg_default.jpg" class="flex-fill ahzit-profile">
					    	</c:if>
				      		<c:forEach var = "list" items = "${attachmentList}"> <!-- 설정한 프로필 -->
				        		<img src = "/attachment/download/ahzit?attachmentNo=${list.attachmentNo}" class="flex-fill ahzit-profile">  					
				      		</c:forEach>
							</div>
						
			      		
				      		<%-- 아지트 정보 --%>  
				      		<div class = "row" id = "div-member-info" data-memberno = "${ahzitMemberDto.memberNo}" data-ahzitno = "${ahzitMemberDto.memberAhzitNo}" data-membergrade="${ahzitMemberDto.memberGrade}">
								<span class="ahzit-side ahzit-name mt-1">${ahzitVO.getAhzitName()}</span><%--아지트 이름 --%>
								<span class="ahzit-side mt-1">멤버 ${ahzitVO.getAhzitHead()}  · ${ahzitVO.getAhzitSort()} </span>
								<span class="ahzit-side mt-1 mb-1">${ahzitVO.getAhzitInfo()}<br> <%--아지트 소개 --%></span>
								<span class="ahzit-side mt-1">아지트 리더 : ${ahzitVO.getAhzitLeader()} <img src = "/images/crown.png"  id="crown"></span>
							</div>
							
							<div class = "row mt-1">
								<div class = "col">
									<c:choose>
								    <c:when test="${ahzitMemberDto.getMemberId() != loginId}"><%-- 소모임 회원이 아니면 --%>
								    	<button type="button" class="btn" onclick="location.href='${pageContext.request.contextPath}/ahzit_in/${ahzitNo}/insert'">아지트 가입</button>
								    </c:when>
								    <c:otherwise>
								    	<button type="button" class="btn btn-join" disabled>아지트 가입</button><%-- 소모임 회원이라면 --%>
								    </c:otherwise>
								    </c:choose>
								    <c:if test="${ahzitMemberDto.memberId==sessionScope.loginId}">
										<a href="${pageContext.request.contextPath}/ahzit_in/${ahzitNo}/editMyInfo"><span>내 정보 수정</span></a>
								 	</c:if>	
								</div>
								<div class = "col">
									<%-- 소모임 수정 --%>
<%-- 							<c:if test="${ahzitVO.getAhzitLeader() == sessionScope.loginId}">
										<a href="/ahzit/edit?ahzitNo= ${ahzitVO.getAhzitNo()}"><i class="fa-solid fa-gear"></i><span>아지트 수정</span></a>					
									</c:if> --%>
									
								</div>
							</div>
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
	       
					</div>
				</div>
				
				<%-- 가운데 내용 --%>
				<div class = "col-6">
				
					<div class = "row">
						<div class = "col">
							<div class = "shadow div-member-info-list p-3 bg-white">
								
								<h3>소모임 소개</h3>
									<span class="ahzit-side fs-5">멤버 ${ahzitVO.getAhzitHead()}  · ${ahzitVO.getAhzitSort()}<br> </span>
									<span class="ahzit-side  fs-6">${ahzitVO.getAhzitInfo()}<br> <%--아지트 소개 --%></span>
									
									<%--members-only icon --%>
									<div class="mt-4">
										 <img src = "/images/members-only.png" class="member-only mx-auto d-block">
									</div>
									
									<%--아지트 가입하기 버튼 --%>
									<div class="mt-4">
										<c:choose>
									    <c:when test="${ahzitMemberDto.getMemberId() == null}"><%-- 소모임 회원이 아니면 --%>
									    	<button type="button" class="btn mx-auto d-block" onclick="location.href='${pageContext.request.contextPath}/ahzit_in/${ahzitNo}/insert'" style="background-color : #E6E6E6; color:#3E4684;">아지트 가입하러가기 &nbsp;<i class="fa-solid fa-angles-right"></i> </button>
									    </c:when>
									    <c:otherwise>
									    	<button type="button" class="btn btn-join" disabled>아지트 가입하러 가기</button><%-- 소모임 회원이라면 --%>
									    </c:otherwise>
									    </c:choose>
								    </div>
			    
			    	<%--회원가입 버튼 --%>
<%-- 						<c:if test="${login == null}">
							<div class="mt-3 mb-3 fs-3">
								<a type="button" href="${pageContext.request.contextPath}/ahzitUser/login" >로그인하러 가기 <i class="fa-solid fa-angles-right"></i></a>
							</div>
						</c:if> --%>
									
						</div>
					</div>
				</div>
			</div>
				
				<%-- 오른쪽 사이드바 --%>
<!-- 				<div class = "col-3">
					<div class = "row">
						<div class = "div-right-side p-3 shadow bg-white">

						</div>
					</div>
				</div> -->
				
			</div>
		</div>
	</div>
</div>

<!-- 지우지마세요!! -->
<%-- <c:forEach var = "ahzitMemberList" items = "${ahzitMemberList}">
	<div class = "mb-2 div-member-info">
		회원 번호 : ${ahzitMemberList.memberNo} <br>
		소모임 번호 : ${ahzitMemberList.memberAhzitNo} <br>
		회원 아이디 : ${ahzitMemberList.memberId} <br>
		회원 등급 : ${ahzitMemberList.memberGrade} <br>
		회원 활동점수 : ${ahzitMemberList.memberScore} <br>
		회원 가입일 : ${ahzitMemberList.memberJoindate} <br>
		회원 닉네임 : ${ahzitMemberList.memberNick} <br>
		회원 프로필 번호 : ${ahzitMemberList.memberAttachmentNo} <br>
		<hr>	
	</div> 
</c:forEach> --%>

<script type="text/javascript">

</script>

<%-- footer --%>
<jsp:include page="/WEB-INF/views/template/footer.jsp"></jsp:include>