<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
    
<%-- header --%>
<jsp:include page="/WEB-INF/views/template/header.jsp">
	<jsp:param value="소모임 첨부파일" name="title"/>
</jsp:include>

<jsp:include page="/WEB-INF/views/template/ahzit_header.jsp">
	<jsp:param value="소모임 첨부파일" name="title"/>
</jsp:include>

<style>
	a {
	 text-decoration : none;
	}
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
</style>

<div class = "container-fluid mt-3">
	<div class = "row">
		
		<div class = "col-8 offset-2 main">
			
			<div class = "row">
			
				<%-- 왼쪽 사이드바 --%>

				<div class = "col-3">
					<%--아지트 프로필 사진 --%>
					<div class = "row">
						<div class = "div-ahzit-info shadow p-3" style="background-color: white;">
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
								 	<c:if test="${ahzitVO.getAhzitLeader() == sessionScope.loginId}">
										<a href="/ahzit/edit?ahzitNo= ${ahzitVO.getAhzitNo()}"><i class="fa-solid fa-gear"></i><span>아지트 수정</span></a>					
									</c:if>
									
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
						
					<div class = "col col-6  shadow div-member-info-list w-100 p-3 bg-white">
						<h3>첨부 모아보기</h3>
						<div>
							<form action="attachment" method="post" enctype="multipart/form-data">
								<input type="hidden" name="ahzitNo" value="${ahzitMemberDto.memberAhzitNo}">
 								<input type="hidden" name="ahzitInMemberNo" value=" ${ahzitMemberDto.memberNo}">
								<input type="file" name="attachment" >
								<button type="submit">업로드</button>
							</form>
						</div>
				<%--첨부파일 목록 --%>
				<c:if test="${not InAttachmentList.isEmpty()}">
				<c:forEach var="attachmentDto" items="${InAttachmentList}">
					<ul>
						<a href="/attachment/download?attachmentNo=${attachmentDto.attachmentNo}">
							<li>${attachmentDto.attachmentName} <br>
							(${attachmentDto.attachmentSize} bytes) &nbsp; · &nbsp;
							 ${attachmentDto.attachmentDate} &nbsp; · &nbsp; ${ahzitMemberDto.memberId}
							 <%--아지트 내 첨부파일 삭제 --%>
							<c:if test="${sessionScope.loginId == ahzitMemberDto.getMemberId()}">
								<a href="/ahzit_in/ ${ahzitMemberDto.memberAhzitNo}/attachment/delete?attachmentNo=${attachmentDto.attachmentNo}&memberAhzitNo=${ahzitMemberDto.memberNo}" onclick="return checkout();"><i class="fa-solid fa-trash" style="color:red;"></i><span style="color:red">삭제</span></a>	
							</c:if>
							</li>
						</a>
					</ul>
				</c:forEach>
				</c:if>

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

<script src="https://code.jquery.com/jquery-3.6.1.js"></script>
<script type="text/javascript">
	//소모임 삭제 확인창(javascript)
	function checkout(){
	    var choice = confirm("정말 첨부파일을 삭제하시겠습니까?");
	    return choice;
	}
</script>

<%-- footer --%>
<jsp:include page="/WEB-INF/views/template/footer.jsp"></jsp:include>