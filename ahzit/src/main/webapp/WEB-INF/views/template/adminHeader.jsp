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
			<a href = "${pageContext.request.contextPath}/admin/ahzitUser" class = "p-2 btn btn-outline-warning w-100" role=button>회원 관리</a>
		</div>
		<div class = "col-2 d-flex justify-content-center">
			<a href = "${pageContext.request.contextPath}/admin/join" class = "p-2 btn btn-outline-warning w-100" role=button>관리자 생성</a>
		</div>
		<div class = "col-2 d-flex justify-content-center">
			<a href = "${pageContext.request.contextPath}/admin/" class = "p-2 btn btn-outline-warning w-100" role=button>관리자 홈</a>
		</div>
	</div>
	
	</div>
	</div>
	</div>
	</div>