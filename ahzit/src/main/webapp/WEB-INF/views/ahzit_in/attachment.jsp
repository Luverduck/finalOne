<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    
<%-- header --%>
<jsp:include page="/WEB-INF/views/template/ahzit_header.jsp">
	<jsp:param value="소모임 첨부파일" name="title"/>
</jsp:include>

<style>
	body {
		background-color: rgba(230, 230, 230, 100);
	}
	a {
	 text-decoration : none;
	}
</style>

<div class = "container-fluid mt-3">
	<div class = "row">
		
		<div class = "col-8 offset-2 main">
			
			<div class = "row">
			
				<%-- 왼쪽 사이드바 --%>
				<div class = "col col-3" style="background-color: #EDEEF0;">
					<h1>왼쪽 사이드바</h1> 
				
					<br>
					
					<div class = "row">
						<%-- 아지트 정보 --%>
						<%--아지트 프로필 사진 --%>
						<c:if test="${attachmentList.isEmpty()}"> <%--미설정시 기본 프로필 --%>
							 <img src = "/images/bg_default.jpg" class="ahzit-img">
						</c:if>
						<c:forEach var = "list" items = "${attachmentList}">  <%--설정한 프로필--%>
			              <img src = "/attachment/download/ahzit?attachmentNo=${list.attachmentNo}" class="ahzit-img"  > 					
			             </c:forEach>
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
						<h2>첨부 모아보기</h2>
						<div>
							<form action="attachment" method="post" enctype="multipart/form-data">
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
							<!-- <i class="fa-solid fa-file fa-3x" ></i> -->
							<li>${attachmentDto.attachmentName} <br>
							(${attachmentDto.attachmentSize} bytes) &nbsp; · &nbsp;
							 ${attachmentDto.attachmentDate} &nbsp; · &nbsp; ${ahzitMemberDto.memberId}
							</li>
						</a>
					</ul>
				</c:forEach>
				</c:if>
				
				</div>
				
				<%-- 오른쪽 사이드바 --%>
				<div class = "col-3" style="background-color: #EDEEF0;">
					
					오른쪽
				</div>
			</div>
		</div>
	</div>
</div>


<%-- footer --%>
<jsp:include page="/WEB-INF/views/template/footer.jsp"></jsp:include>