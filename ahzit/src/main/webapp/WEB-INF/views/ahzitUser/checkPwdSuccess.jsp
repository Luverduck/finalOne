<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<%-- header --%>
<jsp:include page="/WEB-INF/views/template/ahzitUserHeader.jsp">
	<jsp:param value="비밀번호 변경 완료" name="title"/>
</jsp:include>

 	<div class="row mt-4">
		<div class="col-lg-4 offset-lg-4 col-md-6 offset-md-3 col-sm-8 offset-sm-2">
			<div class="p-4 text-dark rounded">
				<h2 class="text-center">비밀번호 변경이 완료되었습니다</h2>
			</div>
		</div>
	</div>
	
	<div class="row mt-4 col-lg-4 offset-lg-4 col-md-6 offset-md-3 col-sm-8 offset-sm-2">
		<div class=" col">
			<a href="login" class="btn btn-outline-warning w-100" role=button>로그인 하기</a>
		</div>
		<div class=" col" >
			<a href="/"  class="btn btn-outline-warning w-100" role=button>메인화면으로 이동</a>
		</div>
	</div>	

<%-- footer --%>
<jsp:include page="/WEB-INF/views/template/footer.jsp"></jsp:include>