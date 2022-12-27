<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
    
<%-- header --%>
<jsp:include page="/WEB-INF/views/template/header.jsp">
	<jsp:param value="${ahzitVO.getAhzitName()}" name="title"/>
</jsp:include>

<jsp:include page="/WEB-INF/views/template/ahzit_header.jsp"></jsp:include>

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
          			<jsp:include page="/WEB-INF/views/template/ahzit_left_side.jsp"></jsp:include>
				</div>
				
				<%-- 가운데 내용 --%>
				<div class = "col-6">
					<div class = "row">
						<div class = "col">
						
					<div class = "col col-6  shadow div-member-info-list w-100 p-3 bg-white">
						<h3>첨부 모아보기</h3>
						<div class="mt-4 mb-4">
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
						<a href="${pageContext.request.contextPath}/attachment/download?attachmentNo=${attachmentDto.attachmentNo}">
							<li>${attachmentDto.attachmentName} <br>
							(${attachmentDto.attachmentSize} bytes) &nbsp; · &nbsp;
							 ${attachmentDto.attachmentDate} &nbsp; · &nbsp; ${ahzitMemberDto.memberId}
							 <%--아지트 내 첨부파일 삭제 --%>
							<c:if test="${sessionScope.loginId == ahzitMemberDto.getMemberId()}">
								<a href="${pageContext.request.contextPath}/ahzit_in/ ${ahzitMemberDto.memberAhzitNo}/attachment/delete?attachmentNo=${attachmentDto.attachmentNo}&memberAhzitNo=${ahzitMemberDto.memberNo}" onclick="return checkout();"><i class="fa-solid fa-trash" style="color:red;"></i><span style="color:red">삭제</span></a>	
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
