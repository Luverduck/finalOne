<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<jsp:include page="/WEB-INF/views/template/header.jsp">
	<jsp:param value="${param.title}" name="title"/>
</jsp:include>

<div class = "container-fluid mt-3">
	<div >
		<div class = "col-8 offset-2 main">
			<div >
				<div class = "row mt-3">
					<div class = "col-2 offset-1 d-flex justify-content-center">
						<a href = "${pageContext.request.contextPath}/admin/ahzitUser" class = "p-2 btn btn-outline-warning w-100" role=button>회원 관리</a>
				</div>
				<div class = "col-2 d-flex justify-content-center">
					<a href = "${pageContext.request.contextPath}/admin/inquire" class = "p-2 btn btn-outline-warning w-100" role=button>1:1문의 관리</a>
				</div>
				<div class = "col-2 d-flex justify-content-center">
					<a href = "${pageContext.request.contextPath}/admin/ahzit" class = "p-2 btn btn-outline-warning w-100" role=button>소모임 관리</a>
				</div>
				<div class = "col-2 d-flex justify-content-center">
					<a href = "${pageContext.request.contextPath}/faq/list" class = "p-2 btn btn-outline-warning w-100" role=button>FAQ 관리</a>
				</div>
					<div class = "col-2 d-flex justify-content-center">
					<a href = "${pageContext.request.contextPath}/notice/list" class = "p-2 btn btn-outline-warning w-100" role=button>공지사항 관리</a>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>