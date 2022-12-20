<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%-- header --%>
<jsp:include page="/WEB-INF/views/template/adminHeader.jsp">
	<jsp:param value="회원 관리" name="title"/>
</jsp:include>

<form action="change" method="post">
<input name="userId"  type="hidden"  value="${ahzitUserDto.userId}">

<div class="row mt-4">
	<div class="col-lg-4 offset-lg-4 col-md-6 offset-md-3 col-sm-8 offset-sm-2">
		<div class="p-4 text-dark bg-Light rounded">
			<h1 class="text-center">관리자 등급 변경</h1>
		</div>
	</div>
</div>

	<div class="row mt-4">
		<div class="col-lg-4 offset-lg-4 col-md-6 offset-md-3 col-sm-8 offset-sm-2">
			<div class="p-4 text-dark bg-Light rounded">
			현재 등급
			<input class="input w-100"  value="${ahzitUserDto.userGrade}" readonly>
			</div>
		</div>
	</div>
	
<div class="row mt-4">
	<div class="col-lg-4 offset-lg-4 col-md-6 offset-md-3 col-sm-8 offset-sm-2">
		<div class="p-4 text-dark bg-Light rounded">
		등급변경
			<select class="input w-100" name="userGrade" required>
				<option value="">선택</option>
				<option disabled>------</option>
				<option value="관리자">관리자</option>
			     <option value="운영자">운영자</option>
			</select>
		</div>
	</div>
</div>
	
	
	<div class="row mt-4">
		<div class="col-lg-4 offset-lg-4 col-md-6 offset-md-3 col-sm-8 offset-sm-2">
			<button class="btn btn-outline-warning rounded-pill w-100 btn-lg" type="submit">변경</button>
		 </div>
	</div>
              
</form>

<%-- footer --%>
<jsp:include page="/WEB-INF/views/template/footer.jsp"></jsp:include>