<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:include page="/WEB-INF/views/template/header.jsp">
	<jsp:param value="${param.title}" name="title"/>
</jsp:include>

<div class = "container-fluid mt-3">
	<div class = "row">
		<div class = "col-8 offset-2 main">
			<div class = "row">
				<div class = "row mt-3">
					<div class = "col-2 offset-1 d-flex justify-content-center">
						<a href = "${pageContext.request.contextPath}/ahzitUser/edit?userId=${loginId}" class = "p-2 btn w-100"  style="background-color : #E6E6E6; color:#3E4684;" role=button>개인정보 수정</a>
					</div>
					<div class = "col-2 d-flex justify-content-center">
						<a href = "${pageContext.request.contextPath}/ahzitUser/password?userId=${loginId}" class = "p-2 btn w-100" style="background-color : #E6E6E6; color:#3E4684;" role=button>비밀번호 변경</a>
					</div>
					<div class = "col-2 d-flex justify-content-center">
						<a href = "${pageContext.request.contextPath}/ahzitUser/goodbye?userId=${loginId}" class = "p-2 btn w-100" style="background-color : #E6E6E6; color:#3E4684;" role=button>회원탈퇴</a>
					</div>
					<div class = "col-2 d-flex justify-content-center">
						<a href = "${pageContext.request.contextPath}/inquire/list?inquireId=${loginId}" class = "p-2 btn w-100" style="background-color : #E6E6E6; color:#3E4684;" role=button>1:1 문의</a>
					</div>
					<div class = "col-2 d-flex justify-content-center">
						<a href = "${pageContext.request.contextPath}/ahzitUser/myAhzit" class = "p-2 btn w-100" style="background-color : #E6E6E6; color:#3E4684;"  role=button>내 아지트</a>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>