<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<%-- header --%>
<jsp:include page="/WEB-INF/views/template/ahzitUserHeader.jsp">
	<jsp:param value="회원 탈퇴" name="title"/>
</jsp:include>

<style>
.check-size{
font-size: 0.85rem;
}
</style>

<form action="goodbye" method="post">

	<div class="mt-4">
		<div class="col-lg-4 offset-lg-4 col-md-6 offset-md-3 col-sm-8 offset-sm-2">
			<div class="p-4 rounded text-center">
				<h1 class="text-center">회원 탈퇴</h1>
				<i class="fa-solid fa-circle-exclamation"></i>
				탈퇴를 원하시면 기존 비밀번호를 입력하세요
			</div>
		</div>
	</div>
	
	<div class="mt-4">
		<div class="col-lg-4 offset-lg-4 col-md-6 offset-md-3 col-sm-8 offset-sm-2">
			<div class="form-floating">
				<input type="password" name="userPw" class="form-control rounded" placeholder="비밀번호" required>
				<label>
				비밀번호
				</label>
			</div>
		</div>
	</div>

	<div class="mt-4 mb-4">
		<div class="row mt-4 col-lg-4 offset-lg-4 col-md-6 offset-md-3 col-sm-8 offset-sm-2">
			<div class=" col">
				<a href="mypage" class="btn rounded w-100 " style="background-color : #E6E6E6; color:#3E4684;"  role=button>취소하기</a>
			</div>
			<div class=" col" >
			<button class="btn w-100 rounded" style="background-color : #E6E6E6; color:#3E4684;"  type="submit">탈퇴하기</button>
			</div>
		</div>
	</div>
	
<%-- 	<c:if test="<%=request.getParameter("error") != null %>"> --%>
	<c:if test="${param.error != null}">
		<div class="row text-center mt-4">
			<span style="color:red;">기존 비밀번호를 다시 확인해주세요</span>
		</div>
	</c:if>

</form>

<%-- footer --%>
<jsp:include page="/WEB-INF/views/template/footer.jsp"></jsp:include>