<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%-- header --%>
<jsp:include page="/WEB-INF/views/template/adminHeader.jsp">
	<jsp:param value="회원 관리" name="title"/>
</jsp:include>

<script type="text/javascript">
	$(function(){
		$(window).on("beforeunload", function(){
		    return false;
		});
		$(".btn-pass").click(function(){
		    $(window).off("beforeunload");
		    return true;
		});
	});
</script>

<form action="change" method="post">

<input name="adminId"  type="text"  value="${ahzitUserDto.userId}">

<div class="container-300 mt-50 mb-50">
	<div class="row center mb-30">
		<h1>ADMIN</h1>
		<hr>
	</div>

	<div class="row left ">
		현재등급
		<input class="input w-100"  value="${ahzitUserDto.userGrade}" readonly>
	</div>
	
	<div class="row left">
		등급변경
		<select class="input w-100" name="userGrade">
			<option value="">선택</option>
			<option disabled>------</option>
			<option value="관리자">관리자</option>
		     <option value="운영자">운영자</option>
		</select>
	</div>
	
	
	<div class="row right">
		<a href="list" class="btn btn-neutral">목록</a>
		<button type="submit" class="btn btn-positive btn-pass">수정</button>	
	</div>
</div>
</form>

<%-- footer --%>
<jsp:include page="/WEB-INF/views/template/footer.jsp"></jsp:include>